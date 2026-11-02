import 'dart:async';
import 'dart:convert';

import 'package:rocketchat_sdk/src/models/message/message.dart';
import 'package:rocketchat_sdk/src/models/subscription/subscription.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum UserPresenceStatus { offline, online, away, busy, unknown }

class SubscriptionChangeEvent {
  final String action; // 'updated', 'inserted', 'removed'
  final Map<String, dynamic> data;
  final RocketChatSubscription? subscription;

  SubscriptionChangeEvent({
    required this.action,
    required this.data,
    this.subscription,
  });

  String? get id => data['_id'] as String?;
  String? get rid => data['rid'] as String?;
  String? get name => data['name'] as String?;
  String? get fname => data['fname'] as String?;
  String? get roomType => data['t'] as String?;
  bool? get open => data['open'] as bool?;
  int? get unread => (data['unread'] as num?)?.toInt();
  bool? get alert => data['alert'] as bool?;
}

class UserPresenceEvent {
  final String userId;
  final String username;
  final UserPresenceStatus status;

  UserPresenceEvent(this.userId, this.username, this.status);
}

class RocketChatRealtimeApi {
  final String baseUrl;
  String? userId;
  final void Function(String)? logPrinter;

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  
  final _presenceController = StreamController<UserPresenceEvent>.broadcast();
  Stream<UserPresenceEvent> get presenceStream => _presenceController.stream;

  final _messageController = StreamController<RocketChatMessage>.broadcast();
  Stream<RocketChatMessage> get messageStream => _messageController.stream;

  final _subscriptionEventController = StreamController<SubscriptionChangeEvent>.broadcast();
  Stream<SubscriptionChangeEvent> get subscriptionEventStream => _subscriptionEventController.stream;

  bool _isConnected = false;
  bool get isConnected => _isConnected;
  bool _isConnecting = false;
  bool get isConnecting => _isConnecting;
  
  String? _pendingLoginToken;
  String? _resumeToken;
  Timer? _reconnectTimer;
  bool _isReconnecting = false;
  final _activeRoomSubs = <String>{};
  
  // Presence cache: userId -> UserPresenceStatus
  final Map<String, UserPresenceStatus> _presenceCache = {};
  final Map<String, UserPresenceStatus> _presenceCacheByUsername = {};
  bool _isPresenceSubscribed = false;
  bool _isUserNotificationsSubscribed = false;
  bool _isMyMessagesSubscribed = false;

  RocketChatRealtimeApi({required this.baseUrl, this.userId, this.logPrinter});

  void _log(String message) {
    logPrinter?.call('[Realtime] $message');
  }

  /// Connects to the Realtime API WebSocket
  Future<void> connect() async {
    if (_isConnected || _isConnecting) return;
    _isConnecting = true;
    
    _log('Connecting to Realtime API...');

    // Clean up any previous subscription/channel before creating a new one
    await _subscription?.cancel();
    _subscription = null;
    unawaited(_channel?.sink.close());
    _channel = null;

    final uri = Uri.parse(baseUrl);
    final scheme = uri.scheme == 'https' ? 'wss' : 'ws';
    final host = uri.host;
    final port = uri.port != 0 && uri.port != 80 && uri.port != 443 ? ':${uri.port}' : '';
    final path = uri.path.endsWith('/') ? uri.path.substring(0, uri.path.length - 1) : uri.path;
    
    final wsUrl = '$scheme://$host$port$path/websocket';
    _log('WebSocket URL: $wsUrl');
    
    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    
    _subscription = _channel?.stream.listen(
      (data) {
        if (data is String) {
          _handleMessage(data);
        }
      },
      onError: (dynamic error) {
        _log('WebSocket Error: $error');
        _isConnecting = false;
        _isConnected = false;
        _handleDisconnect();
      },
      onDone: () {
        _log('WebSocket Closed');
        _isConnecting = false;
        _isConnected = false;
        _handleDisconnect();
      },
    );

    // Send connect message
    _send({
      'msg': 'connect',
      'version': '1',
      'support': ['1']
    });
  }

  /// Logins using a resume token (REST auth token)
  void login(String resumeToken, {String? userId}) {
    _resumeToken = resumeToken;
    if (userId != null && userId.isNotEmpty) {
      this.userId = userId;
    }
    if (!_isConnected) {
      _pendingLoginToken = resumeToken;
      _log('Queued login until connected');
      return;
    }
    _pendingLoginToken = null;
    _send({
      'msg': 'method',
      'method': 'login',
      'params': [
        {'resume': resumeToken}
      ],
      'id': 'login-1'
    });
  }

  void _resetSubscriptionFlags() {
    _isUserNotificationsSubscribed = false;
    _isPresenceSubscribed = false;
    _isMyMessagesSubscribed = false;
  }

  void _handleDisconnect() {
    _resetSubscriptionFlags();
    if (_isReconnecting) return;
    if (_resumeToken == null) {
      _log('No login token saved, skipping auto-reconnect');
      return;
    }

    _isReconnecting = true;
    _log('Scheduling auto-reconnect in 3 seconds...');
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 3), () async {
      _isReconnecting = false;
      _log('Attempting to reconnect...');
      try {
        await connect();
        if (_resumeToken != null) {
          login(_resumeToken!, userId: userId);
        }
      } on Object catch (e) {
        _log('Reconnection attempt failed: $e');
        _handleDisconnect();
      }
    });
  }

  /// Subscribes to the user notification streams (subscriptions-changed, etc.)
  void subscribeToUserNotifications(String uid) {
    if (_isUserNotificationsSubscribed) return;
    _isUserNotificationsSubscribed = true;
    _log('Subscribing to user notifications for $uid');
    _send({
      'msg': 'sub',
      'id': 'sub-user-subscriptions',
      'name': 'stream-notify-user',
      'params': ['$uid/subscriptions-changed', false]
    });
    _send({
      'msg': 'sub',
      'id': 'sub-user-rooms',
      'name': 'stream-notify-user',
      'params': ['$uid/rooms-changed', false]
    });
  }

  /// Subscribes to the global user presence stream
  void subscribeToUserPresence() {
    if (_isPresenceSubscribed) return;
    _isPresenceSubscribed = true;
    _send({
      'msg': 'sub',
      'id': 'sub-presence',
      'name': 'stream-notify-logged',
      'params': ['user-status', false]
    });
  }

  /// Populate the presence cache from initial sync
  void syncInitialPresence(List<Map<String, dynamic>> usersPresence) {
    for (final user in usersPresence) {
      final userId = user['_id'] as String?;
      final username = user['username'] as String?;
      final statusStr = user['status'] as String?;
      if (userId != null && statusStr != null) {
        int statusInt = 0;
        final str = statusStr.toLowerCase();
        if (str == 'online') statusInt = 1;
        else if (str == 'away') statusInt = 2;
        else if (str == 'busy') statusInt = 3;
        else statusInt = 0;
        
        final status = _mapStatus(statusInt);
        _presenceCache[userId] = status;
        if (username != null) {
          _presenceCacheByUsername[username.toLowerCase()] = status;
          _presenceController.add(UserPresenceEvent(userId, username, status));
        }
      }
    }
  }

  /// Get synchronous presence for a user
  UserPresenceStatus getUserPresence(String userId) {
    return _presenceCache[userId] ?? UserPresenceStatus.offline;
  }

  /// Get synchronous presence for a user by username
  UserPresenceStatus getUserPresenceByUsername(String username) {
    return _presenceCacheByUsername[username.toLowerCase()] ?? UserPresenceStatus.offline;
  }

  /// Subscribes to the user's message stream globally
  void subscribeToMyMessages() {
    if (_isMyMessagesSubscribed) return;
    _isMyMessagesSubscribed = true;
    _send({
      'msg': 'sub',
      'id': 'sub-my-messages',
      'name': 'stream-room-messages',
      'params': ['__my_messages__', false]
    });
  }

  /// Subscribes to dynamic room messages
  void subscribeToRoomMessages(String roomId) {
    _activeRoomSubs.add(roomId);
    if (_isConnected) {
      _log('Subscribing to room messages: $roomId');
      _send({
        'msg': 'sub',
        'id': 'sub-msg-$roomId',
        'name': 'stream-room-messages',
        'params': [roomId, false]
      });
    }
  }

  /// Unsubscribes from dynamic room messages
  void unsubscribeFromRoomMessages(String roomId) {
    _activeRoomSubs.remove(roomId);
    if (_isConnected) {
      _log('Unsubscribing from room messages: $roomId');
      _send({
        'msg': 'unsub',
        'id': 'sub-msg-$roomId',
      });
    }
  }

  void _send(Map<String, dynamic> payload) {
    if (_channel != null) {
      final msg = jsonEncode(payload);
      _log('SEND: $msg');
      _channel!.sink.add(msg);
    }
  }

  Map<String, dynamic> _normalizeEjsonMap(Map<String, dynamic> json) {
    final copy = Map<String, dynamic>.from(json);
    for (final key in ['ts', 'ls', '_updatedAt']) {
      if (copy[key] is Map) {
        final dateMap = copy[key] as Map;
        if (dateMap.containsKey(r'$date')) {
          final ms = dateMap[r'$date'];
          if (ms is num) {
            copy[key] = DateTime.fromMillisecondsSinceEpoch(ms.toInt()).toIso8601String();
          }
        }
      }
    }
    return copy;
  }

  void _handleMessage(String message) {
    _log('RECV: $message');
    try {
      final decoded = jsonDecode(message);
      if (decoded is! Map<String, dynamic>) return;

      final msg = decoded['msg'];
      
      if (msg == 'connected') {
        _isConnecting = false;
        _isConnected = true;
        _log('Connected successfully!');
        if (_pendingLoginToken != null) {
          login(_pendingLoginToken!, userId: userId);
        }
      } else if (msg == 'ping') {
        _send({'msg': 'pong'});
      } else if (msg == 'result' && decoded['id'] == 'login-1') {
        if (decoded['error'] == null) {
          _log('Login successful! Subscribing to user presence, global messages, and active room subs...');
          subscribeToUserPresence();
          subscribeToMyMessages();
          if (userId != null && userId!.isNotEmpty) {
            subscribeToUserNotifications(userId!);
          }
          
          // Re-subscribe to all active room message streams
          for (final roomId in _activeRoomSubs) {
            _log('Re-subscribing to room messages for $roomId');
            _send({
              'msg': 'sub',
              'id': 'sub-msg-$roomId',
              'name': 'stream-room-messages',
              'params': [roomId, false]
            });
          }
        } else {
          _log('Login failed: ${decoded['error']}');
        }
      } else if (msg == 'changed') {
        final collection = decoded['collection'];
        if (collection == 'stream-notify-user') {
          final fields = decoded['fields'];
          if (fields != null) {
            final eventName = fields['eventName'] as String?;
            final args = fields['args'] as List?;
            if (eventName != null && args != null) {
              if (eventName.endsWith('/subscriptions-changed')) {
                _log('subscriptions-changed event: $args');
                final action = args.isNotEmpty ? args[0].toString() : 'updated';
                final rawData = args.length > 1 && args[1] is Map<String, dynamic>
                    ? args[1] as Map<String, dynamic>
                    : null;
                if (rawData != null) {
                  final normalized = _normalizeEjsonMap(rawData);
                  RocketChatSubscription? parsedSub;
                  try {
                    if (normalized.containsKey('_id') &&
                        normalized.containsKey('rid') &&
                        normalized.containsKey('name') &&
                        normalized.containsKey('t')) {
                      parsedSub = RocketChatSubscription.fromJson({
                        'open': true,
                        'alert': false,
                        'unread': 0,
                        ...normalized,
                      });
                    }
                  } on Object catch (e) {
                    _log('Error parsing subscription event model: $e');
                  }
                  if (!_subscriptionEventController.isClosed) {
                    _subscriptionEventController.add(SubscriptionChangeEvent(
                      action: action,
                      data: normalized,
                      subscription: parsedSub,
                    ));
                  }
                }
              }
            }
          }
        } else if (collection == 'stream-notify-logged') {
          final fields = decoded['fields'];
          if (fields != null && fields['eventName'] == 'user-status' && fields['args'] != null) {
            final args = fields['args'] as List;
            if (args.isNotEmpty) {
              _log('Presence event raw args: $args');
              String? userId;
              String? username;
              int statusInt = 0;
              
              if (args[0] is List) {
                final argData = args[0] as List;
                if (argData.length >= 3) {
                  userId = argData[0].toString();
                  username = argData[1].toString();
                  if (argData[2] is num) {
                    statusInt = (argData[2] as num).toInt();
                  } else if (argData[2] is String) {
                    final str = argData[2].toString().toLowerCase();
                    if (str == 'online') statusInt = 1;
                    else if (str == 'away') statusInt = 2;
                    else if (str == 'busy') statusInt = 3;
                    else statusInt = 0;
                  }
                }
              } else if (args.length >= 3) {
                userId = args[0].toString();
                username = args[1].toString();
                if (args[2] is num) {
                  statusInt = (args[2] as num).toInt();
                } else if (args[2] is String) {
                  final str = args[2].toString().toLowerCase();
                  if (str == 'online') statusInt = 1;
                  else if (str == 'away') statusInt = 2;
                  else if (str == 'busy') statusInt = 3;
                  else statusInt = 0;
                }
              }

              if (userId != null && username != null) {
                final status = _mapStatus(statusInt);
                _log('Parsed presence for $username ($userId): $statusInt');
                _presenceCache[userId] = status;
                _presenceCacheByUsername[username.toLowerCase()] = status;
                if (!_presenceController.isClosed) {
                  _presenceController.add(UserPresenceEvent(userId, username, status));
                }
              }
            }
          }
        } else if (collection == 'stream-room-messages') {
          final fields = decoded['fields'];
          if (fields != null && fields['args'] != null) {
            final args = fields['args'] as List;
            Map<String, dynamic>? roomMetadata;
            if (args.length > 1 && args[1] is Map<String, dynamic>) {
              roomMetadata = args[1] as Map<String, dynamic>;
            }

            for (final arg in args) {
              if (arg is Map<String, dynamic>) {
                if (!arg.containsKey('_id')) continue;
                try {
                  final normalized = _normalizeEjsonMap(arg);
                  if (roomMetadata != null) {
                    if (roomMetadata['roomName'] != null) {
                      normalized['roomName'] = roomMetadata['roomName'];
                    }
                    if (roomMetadata['roomType'] != null) {
                      normalized['roomType'] = roomMetadata['roomType'];
                    }
                  }
                  final msgObj = RocketChatMessage.fromJson(normalized);
                  if (!_messageController.isClosed) {
                    _messageController.add(msgObj);
                  }
                } on Object catch (e) {
                  _log('Error parsing room message: $e');
                }
              }
            }
          }
        }
      }
    } on Object catch (_) {
      // Ignore parsing errors for unknown/unexpected messages
    }
  }

  UserPresenceStatus _mapStatus(int status) {
    switch (status) {
      case 0: return UserPresenceStatus.offline;
      case 1: return UserPresenceStatus.online;
      case 2: return UserPresenceStatus.away;
      case 3: return UserPresenceStatus.busy;
      default: return UserPresenceStatus.unknown;
    }
  }

  void dispose() {
    _reconnectTimer?.cancel();
    unawaited(_subscription?.cancel());
    _subscription = null;
    unawaited(_channel?.sink.close());
    _channel = null;
    unawaited(_presenceController.close());
    unawaited(_messageController.close());
    unawaited(_subscriptionEventController.close());
    _isConnecting = false;
    _isConnected = false;
    _resetSubscriptionFlags();
    _presenceCache.clear();
    _presenceCacheByUsername.clear();
  }
}

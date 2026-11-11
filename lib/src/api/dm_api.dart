import 'package:dio/dio.dart';
import 'package:rocketchat_sdk/src/models/dm_room/dm_room.dart';
import 'package:rocketchat_sdk/src/models/message/message.dart';

class RocketChatDmApi {
  final Dio _dio;

  RocketChatDmApi(this._dio);

  /// Lists the direct message (DM) rooms of the authenticated user.
  /// Corresponds to `GET /api/v1/dm.list`
  Future<List<DmRoom>> list({int? offset, int? count}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'api/v1/dm.list',
        queryParameters: {
          if (offset != null) 'offset': offset,
          if (count != null) 'count': count,
        },
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        final imsList = (dataMap['ims'] as List<dynamic>?) ?? [];
        return imsList
            .map((json) => DmRoom.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to load DM list: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    }
  }

  /// Creates or opens a direct message (DM) room with the specified [username].
  /// Corresponds to `POST /api/v1/dm.create` (with fallback to `api/v1/im.create`).
  Future<DmRoom> create({required String username}) async {
    try {
      Response<Map<String, dynamic>> response;
      try {
        response = await _dio.post<Map<String, dynamic>>(
          'api/v1/dm.create',
          data: {
            'username': username,
          },
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
          response = await _dio.post<Map<String, dynamic>>(
            'api/v1/im.create',
            data: {
              'username': username,
            },
          );
        } else {
          rethrow;
        }
      }

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        final roomJson = dataMap['room'] as Map<String, dynamic>?;
        if (roomJson == null) {
          throw Exception('Room data was not returned in the response');
        }
        final roomId = (roomJson['_id'] ?? roomJson['rid']) as String?;
        if (roomId == null || roomId.isEmpty) {
          throw Exception('Room ID was not returned in the response');
        }

        return DmRoom(
          id: roomId,
          t: (roomJson['t'] as String?) ?? 'd',
          usernames: (roomJson['usernames'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [username],
          usersCount: (roomJson['usersCount'] as num?)?.toInt() ?? 2,
          msgs: (roomJson['msgs'] as num?)?.toInt() ?? 0,
          ts: (roomJson['ts'] as String?) ?? DateTime.now().toIso8601String(),
          uids: (roomJson['uids'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              const [],
          topic: roomJson['topic'] as String?,
          name: roomJson['name'] as String?,
          fname: roomJson['fname'] as String?,
          lastMessage: roomJson['lastMessage'] != null
              ? RocketChatMessage.fromJson(
                  roomJson['lastMessage'] as Map<String, dynamic>,
                )
              : null,
        );
      } else {
        throw Exception(
          'Failed to create DM room: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    }
  }

  /// Lists messages in a specific direct message (DM) room.
  /// Corresponds to `GET /api/v1/dm.messages`
  Future<List<RocketChatMessage>> messages({
    required String roomId,
    int? offset,
    int? count,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'api/v1/dm.messages',
        queryParameters: {
          'roomId': roomId,
          if (offset != null) 'offset': offset,
          if (count != null) 'count': count,
        },
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        final msgList = (dataMap['messages'] as List<dynamic>?) ?? [];
        return msgList
            .map(
              (json) =>
                  RocketChatMessage.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to load messages: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    }
  }

  /// Sends a message to a direct message (DM) room.
  /// Corresponds to `POST /api/v1/chat.postMessage`
  Future<RocketChatMessage> sendMessage({
    required String roomId,
    required String text,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'api/v1/chat.postMessage',
        data: {
          'roomId': roomId,
          'text': text,
        },
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        final messageJson = dataMap['message'] as Map<String, dynamic>?;
        if (messageJson != null) {
          return RocketChatMessage.fromJson(messageJson);
        } else {
          throw Exception('Message was not returned in the response');
        }
      } else {
        throw Exception(
          'Failed to send message: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    }
  }

  /// Deletes a message in a direct message (DM) room.
  /// Corresponds to `POST /api/v1/chat.delete`
  Future<bool> deleteMessage({
    required String roomId,
    required String msgId,
    bool asUser = false,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'api/v1/chat.delete',
        data: {
          'roomId': roomId,
          'msgId': msgId,
          'asUser': asUser,
        },
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        return true;
      } else {
        throw Exception(
          'Failed to delete message: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      final serverError = e.response?.data is Map
          ? (e.response?.data['error'] ?? e.message)
          : e.message;
      throw Exception('HTTP Error: $serverError');
    }
  }

  /// Closes (hides) a direct message (DM) room subscription for the current user.
  /// Corresponds to `POST /api/v1/dm.close` (with fallback to `api/v1/im.close`).
  Future<bool> close({required String roomId}) async {
    try {
      Response<Map<String, dynamic>> response;
      try {
        response = await _dio.post<Map<String, dynamic>>(
          'api/v1/dm.close',
          data: {
            'roomId': roomId,
          },
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          response = await _dio.post<Map<String, dynamic>>(
            'api/v1/im.close',
            data: {
              'roomId': roomId,
            },
          );
        } else {
          rethrow;
        }
      }

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        return true;
      } else {
        throw Exception(
          'Failed to close DM room: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      final serverError = e.response?.data is Map
          ? (e.response?.data['error'] ?? e.message)
          : e.message;
      throw Exception('HTTP Error: $serverError');
    }
  }

  /// Opens (unhides) a direct message (DM) room subscription for the current user.
  /// Corresponds to `POST /api/v1/dm.open` (with fallback to `api/v1/im.open`).
  Future<bool> open({required String roomId}) async {
    try {
      Response<Map<String, dynamic>> response;
      try {
        response = await _dio.post<Map<String, dynamic>>(
          'api/v1/dm.open',
          data: {
            'roomId': roomId,
          },
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          response = await _dio.post<Map<String, dynamic>>(
            'api/v1/im.open',
            data: {
              'roomId': roomId,
            },
          );
        } else {
          rethrow;
        }
      }

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        return true;
      } else {
        throw Exception(
          'Failed to open DM room: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      final serverError = e.response?.data is Map
          ? (e.response?.data['error'] ?? e.message)
          : e.message;
      throw Exception('HTTP Error: $serverError');
    }
  }

  /// Deletes a direct message (DM) room by [roomId] or [username].
  /// Corresponds to `POST /api/v1/dm.delete` (with fallback to `api/v1/im.delete`).
  /// If [fallbackToClose] is `true` and the server restricts `dm.delete` permissions
  /// (HTTP 400/403), automatically falls back to [close] when [roomId] is provided.
  Future<bool> delete({
    String? roomId,
    String? username,
    bool fallbackToClose = true,
  }) async {
    final hasRoomId = roomId != null && roomId.trim().isNotEmpty;
    final hasUsername = username != null && username.trim().isNotEmpty;
    if (!hasRoomId && !hasUsername) {
      throw ArgumentError('Either roomId or username must be provided');
    }

    final payload = <String, dynamic>{
      if (hasRoomId) 'roomId': roomId.trim(),
      if (hasUsername) 'username': username.trim(),
    };

    try {
      Response<Map<String, dynamic>> response;
      try {
        response = await _dio.post<Map<String, dynamic>>(
          'api/v1/dm.delete',
          data: payload,
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          response = await _dio.post<Map<String, dynamic>>(
            'api/v1/im.delete',
            data: payload,
          );
        } else if (fallbackToClose &&
            hasRoomId &&
            (e.response?.statusCode == 400 || e.response?.statusCode == 403)) {
          return await close(roomId: roomId.trim());
        } else {
          rethrow;
        }
      }

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        return true;
      } else {
        if (fallbackToClose && hasRoomId) {
          return await close(roomId: roomId.trim());
        }
        throw Exception(
          'Failed to delete DM room: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      if (fallbackToClose &&
          hasRoomId &&
          (e.response?.statusCode == 400 || e.response?.statusCode == 403)) {
        return await close(roomId: roomId.trim());
      }
      final serverError = e.response?.data is Map
          ? (e.response?.data['error'] ?? e.message)
          : e.message;
      throw Exception('HTTP Error: $serverError');
    }
  }

  /// Uploads and sends a media file (image or video) to a room.
  /// Supports both `POST /api/v1/rooms.upload/{roomId}` and
  /// `POST /api/v1/rooms.media/{roomId}` + `POST /api/v1/rooms.mediaConfirm/{roomId}/{fileId}`.
  Future<RocketChatMessage> sendMediaMessage({
    required String roomId,
    required String filePath,
    String? fileName,
    String? mimeType,
    String? description,
    String? msg,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    final resolvedFileName = (fileName != null && fileName.trim().isNotEmpty)
        ? fileName.trim()
        : filePath.split(RegExp(r'[/\\]')).last;
    final resolvedMimeType = (mimeType != null && mimeType.trim().isNotEmpty)
        ? mimeType.trim()
        : _inferMimeType(resolvedFileName);

    Future<MultipartFile> buildMultipartFile() {
      return MultipartFile.fromFile(
        filePath,
        filename: resolvedFileName,
        contentType: DioMediaType.parse(resolvedMimeType),
      );
    }

    try {
      // Primary: Rocket.Chat v6.5+ / v7.x / v8.x `rooms.media/{roomId}` + `rooms.mediaConfirm/{roomId}/{fileId}`
      try {
        final mediaFormData = FormData.fromMap({
          'file': await buildMultipartFile(),
        });

        final uploadResponse = await _dio.post<Map<String, dynamic>>(
          'api/v1/rooms.media/$roomId',
          data: mediaFormData,
          options: Options(contentType: 'multipart/form-data'),
          onSendProgress: onSendProgress,
        );

        final uploadData = uploadResponse.data;
        if (uploadResponse.statusCode == 200 &&
            uploadData != null &&
            uploadData['success'] == true) {
          if (uploadData['message'] is Map<String, dynamic>) {
            return RocketChatMessage.fromJson(
              uploadData['message'] as Map<String, dynamic>,
            );
          }

          final fileMap = uploadData['file'] as Map<String, dynamic>?;
          final fileId = fileMap?['_id'] as String?;
          if (fileId == null || fileId.isEmpty) {
            throw Exception('Uploaded file ID was not returned in the response');
          }

          final confirmResponse = await _dio.post<Map<String, dynamic>>(
            'api/v1/rooms.mediaConfirm/$roomId/$fileId',
            data: <String, dynamic>{
              if (msg != null && msg.trim().isNotEmpty) 'msg': msg.trim(),
              if (description != null && description.trim().isNotEmpty)
                'description': description.trim(),
            },
          );

          final confirmData = confirmResponse.data;
          if (confirmResponse.statusCode == 200 &&
              confirmData != null &&
              confirmData['success'] == true &&
              confirmData['message'] is Map<String, dynamic>) {
            return RocketChatMessage.fromJson(
              confirmData['message'] as Map<String, dynamic>,
            );
          } else {
            throw Exception(
              'Failed to confirm media message: ${confirmData?['error'] ?? 'Unknown error'}',
            );
          }
        }
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if (status != 404 && status != 405) {
          rethrow;
        }
      }

      // Legacy fallback: `rooms.upload/{roomId}` for older Rocket.Chat servers
      final formData = FormData.fromMap({
        'file': await buildMultipartFile(),
        if (description != null && description.trim().isNotEmpty)
          'description': description.trim(),
        if (msg != null && msg.trim().isNotEmpty) 'msg': msg.trim(),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        'api/v1/rooms.upload/$roomId',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress,
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true &&
          dataMap['message'] is Map<String, dynamic>) {
        return RocketChatMessage.fromJson(
          dataMap['message'] as Map<String, dynamic>,
        );
      } else {
        throw Exception(
          'Failed to upload media: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      final serverError = e.response?.data is Map
          ? (e.response?.data['error'] ?? e.message)
          : e.message;
      throw Exception('HTTP Error: $serverError');
    }
  }

  static String _inferMimeType(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.heic')) return 'image/heic';
    if (lower.endsWith('.heif')) return 'image/heif';
    if (lower.endsWith('.mp4') || lower.endsWith('.m4v')) return 'video/mp4';
    if (lower.endsWith('.mov')) return 'video/quicktime';
    if (lower.endsWith('.webm')) return 'video/webm';
    if (lower.endsWith('.avi')) return 'video/x-msvideo';
    if (lower.endsWith('.mkv')) return 'video/x-matroska';
    if (lower.endsWith('.3gp')) return 'video/3gpp';
    return 'application/octet-stream';
  }
}

import 'package:dio/dio.dart';
import 'package:rocketchat_sdk/rocketchat_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('Message and Chat Deletion tests', () {
    test('chat.deleteMessage sends POST to api/v1/chat.delete', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/chat.delete')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {
                    '_id': 'msg_123',
                    'ts': '2026-11-11T00:00:00.000Z',
                    'success': true,
                  },
                ),
              );
            }
          },
        ),
      );

      final chatApi = RocketChatChatApi(dio);
      final result = await chatApi.deleteMessage(
        roomId: 'room_123',
        msgId: 'msg_123',
      );

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/chat.delete'));
      expect(
        capturedOptions!.data,
        equals({
          'roomId': 'room_123',
          'msgId': 'msg_123',
          'asUser': false,
        }),
      );
    });

    test('dm.deleteMessage sends POST to api/v1/chat.delete', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/chat.delete')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {'success': true},
                ),
              );
            }
          },
        ),
      );

      final dmApi = RocketChatDmApi(dio);
      final result = await dmApi.deleteMessage(
        roomId: 'room_123',
        msgId: 'msg_456',
        asUser: true,
      );

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/chat.delete'));
      expect(
        capturedOptions!.data,
        equals({
          'roomId': 'room_123',
          'msgId': 'msg_456',
          'asUser': true,
        }),
      );
    });

    test('dm.delete sends POST to api/v1/dm.delete', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/dm.delete')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {'success': true},
                ),
              );
            }
          },
        ),
      );

      final dmApi = RocketChatDmApi(dio);
      final result = await dmApi.delete(roomId: 'dm_room_123');

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/dm.delete'));
      expect(capturedOptions!.data, equals({'roomId': 'dm_room_123'}));
    });

    test('dm.delete falls back to dm.close when server returns 403', () async {
      final dio = Dio();
      final calledPaths = <String>[];

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            calledPaths.add(options.path);
            if (options.path.contains('api/v1/dm.delete')) {
              handler.reject(
                DioException(
                  requestOptions: options,
                  response: Response(
                    requestOptions: options,
                    statusCode: 403,
                    data: {'success': false, 'error': 'error-not-allowed'},
                  ),
                ),
              );
            } else if (options.path.contains('api/v1/dm.close')) {
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {'success': true},
                ),
              );
            }
          },
        ),
      );

      final dmApi = RocketChatDmApi(dio);
      final result = await dmApi.delete(roomId: 'dm_room_123');

      expect(result, isTrue);
      expect(calledPaths, containsAll(['api/v1/dm.delete', 'api/v1/dm.close']));
    });

    test('dm.close and dm.open send POST to api/v1/dm.close and api/v1/dm.open', () async {
      final dio = Dio();
      final calledPaths = <String>[];

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            calledPaths.add(options.path);
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {'success': true},
              ),
            );
          },
        ),
      );

      final dmApi = RocketChatDmApi(dio);
      final closed = await dmApi.close(roomId: 'dm_room_123');
      final opened = await dmApi.open(roomId: 'dm_room_123');

      expect(closed, isTrue);
      expect(opened, isTrue);
      expect(calledPaths, equals(['api/v1/dm.close', 'api/v1/dm.open']));
    });

    test('channels.delete sends POST to api/v1/channels.delete', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/channels.delete')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {'success': true},
                ),
              );
            }
          },
        ),
      );

      final channelsApi = RocketChatChannelsApi(dio);
      final result = await channelsApi.delete(roomId: 'channel_123');

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/channels.delete'));
      expect(capturedOptions!.data, equals({'roomId': 'channel_123'}));
    });
  });
}

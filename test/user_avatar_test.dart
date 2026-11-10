import 'package:dio/dio.dart';
import 'package:rocketchat_sdk/rocketchat_sdk.dart';
import 'package:test/test.dart';
import 'test_helper.dart';

void main() {
  group('User Avatar tests', () {
    test('getAvatar calls api/v1/users.getAvatar with correct parameters and auth headers', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.getAvatar')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 302,
                  headers: Headers.fromMap({
                    'location': ['$testBaseUrl/avatar/bob'],
                  }),
                ),
              );
            } else {
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                ),
              );
            }
          },
        ),
      );

      final client = RocketChatClient(
        baseUrl: testBaseUrl,
        authToken: testAuthToken,
        userId: testUserId,
        dio: dio,
      );

      final url = await client.users.getAvatar(userId: 'bob');

      expect(url, equals('$testBaseUrl/avatar/bob'));
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.getAvatar'));
      expect(capturedOptions!.uri.queryParameters['userId'], equals('bob'));

      // Verify auth headers are preserved for this standard REST API
      expect(capturedOptions!.headers['X-Auth-Token'], equals(testAuthToken));
      expect(capturedOptions!.headers['X-User-Id'], equals(testUserId));
    });

    test('getAvatar can be called without userId parameter (fetch self avatar)', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.getAvatar')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 302,
                  headers: Headers.fromMap({
                    'location': ['$testBaseUrl/avatar/self'],
                  }),
                ),
              );
            } else {
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                ),
              );
            }
          },
        ),
      );

      final client = RocketChatClient(
        baseUrl: testBaseUrl,
        authToken: testAuthToken,
        userId: testUserId,
        dio: dio,
      );

      final url = await client.users.getAvatar();

      expect(url, equals('$testBaseUrl/avatar/self'));
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.getAvatar'));
      expect(capturedOptions!.uri.queryParameters['userId'], isNull);
    });

    test('getAvatar replaces localhost in redirect with actual client baseUrl host/port', () async {
      final dio = Dio();
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.getAvatar')) {
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 302,
                  headers: Headers.fromMap({
                    'location': ['http://localhost:3010/avatar/ayse.nur.kocaslan'],
                  }),
                ),
              );
            } else {
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                ),
              );
            }
          },
        ),
      );

      final client = RocketChatClient(
        baseUrl: 'http://192.168.2.127:3010',
        authToken: testAuthToken,
        userId: testUserId,
        dio: dio,
      );

      final url = await client.users.getAvatar(userId: 'ayse');

      expect(url, equals('http://192.168.2.127:3010/avatar/ayse.nur.kocaslan'));
    });

    test('setAvatar with avatarUrl sends POST to api/v1/users.setAvatar with json payload', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.setAvatar')) {
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

      final usersApi = RocketChatUsersApi(dio);
      final result = await usersApi.setAvatar(avatarUrl: 'https://example.com/avatar.png');

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.setAvatar'));
      expect(capturedOptions!.data, equals({'avatarUrl': 'https://example.com/avatar.png'}));
    });

    test('setAvatar with imageBytes sends multipart/form-data', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.setAvatar')) {
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

      final usersApi = RocketChatUsersApi(dio);
      final result = await usersApi.setAvatar(
        imageBytes: [1, 2, 3, 4],
        fileName: 'test.jpg',
      );

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.setAvatar'));
      expect(capturedOptions!.data, isA<FormData>());
      final formData = capturedOptions!.data as FormData;
      expect(formData.files.any((f) => f.key == 'image'), isTrue);
    });

    test('resetAvatar sends POST to api/v1/users.resetAvatar', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.resetAvatar')) {
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

      final usersApi = RocketChatUsersApi(dio);
      final result = await usersApi.resetAvatar();

      expect(result, isTrue);
      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.resetAvatar'));
    });
  });
}

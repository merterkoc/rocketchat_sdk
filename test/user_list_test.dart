import 'package:dio/dio.dart';
import 'package:rocketchat_sdk/rocketchat_sdk.dart';
import 'package:test/test.dart';
import 'test_helper.dart';

void main() {
  group('User List tests', () {
    test('get user list', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.list')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {
                    'users': [
                      {
                        '_id': 'user_id_bob',
                        'username': 'bob',
                        'name': 'Bob Smith',
                      },
                      {
                        '_id': 'user_id_alice',
                        'username': 'alice',
                        'name': 'Alice Jones',
                      }
                    ],
                    'success': true
                  },
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

      final users = await client.users.list(count: 5, offset: 1);

      expect(users, isNotEmpty);
      expect(users.length, equals(2));

      final firstUser = users.first;
      expect(firstUser.id, equals('user_id_bob'));
      expect(firstUser.username, equals('bob'));
      expect(firstUser.name, equals('Bob Smith'));

      final secondUser = users[1];
      expect(secondUser.id, equals('user_id_alice'));
      expect(secondUser.username, equals('alice'));
      expect(secondUser.name, equals('Alice Jones'));

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.list'));
      expect(capturedOptions!.uri.queryParameters['count'], equals('5'));
      expect(capturedOptions!.uri.queryParameters['offset'], equals('1'));
    });

    test('get users presence', () async {
      final dio = Dio();
      RequestOptions? capturedOptions;

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (options.path.contains('api/v1/users.presence')) {
              capturedOptions = options;
              handler.resolve(
                Response(
                  requestOptions: options,
                  statusCode: 200,
                  data: {
                    'users': [
                      {
                        '_id': 'user_id_bob',
                        'username': 'bob',
                        'name': 'Bob Smith',
                        'status': 'online',
                      },
                      {
                        '_id': 'user_id_alice',
                        'username': 'alice',
                        'name': 'Alice Jones',
                        'status': 'away',
                      }
                    ],
                    'full': true,
                    'success': true
                  },
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

      final usersPresence = await client.users.getUsersPresence();

      expect(usersPresence, isNotEmpty);
      expect(usersPresence.length, equals(2));

      final firstUser = usersPresence.first;
      expect(firstUser['_id'], equals('user_id_bob'));
      expect(firstUser['username'], equals('bob'));
      expect(firstUser['status'], equals('online'));

      final secondUser = usersPresence[1];
      expect(secondUser['_id'], equals('user_id_alice'));
      expect(secondUser['username'], equals('alice'));
      expect(secondUser['status'], equals('away'));

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, contains('api/v1/users.presence'));
    });
  });
}

import 'package:dio/dio.dart';

class RocketChatChatApi {
  final Dio _dio;

  RocketChatChatApi(this._dio);

  /// Reacts to a message with an emoji.
  /// Corresponds to `POST /api/v1/chat.react`
  Future<bool> react({
    required String messageId,
    required String emoji,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'api/v1/chat.react',
        data: {
          'messageId': messageId,
          'emoji': emoji,
        },
      );

      final dataMap = response.data;
      if (response.statusCode == 200 &&
          dataMap != null &&
          dataMap['success'] == true) {
        return true;
      } else {
        throw Exception(
          'Failed to react to message: ${dataMap?['error'] ?? 'Unknown error'}',
        );
      }
    } on DioException catch (e) {
      throw Exception('HTTP Error: ${e.message}');
    }
  }

  /// Deletes a chat message.
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

  /// Alias for [deleteMessage].
  /// Corresponds to `POST /api/v1/chat.delete`
  Future<bool> delete({
    required String roomId,
    required String msgId,
    bool asUser = false,
  }) =>
      deleteMessage(
        roomId: roomId,
        msgId: msgId,
        asUser: asUser,
      );
}

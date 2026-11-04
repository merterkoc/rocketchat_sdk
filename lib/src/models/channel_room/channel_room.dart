import 'package:freezed_annotation/freezed_annotation.dart';
import '../message/message.dart';
import '../user/user.dart';

part 'channel_room.freezed.dart';
part 'channel_room.g.dart';

Object? _readOnlyValue(Map<dynamic, dynamic> json, String key) =>
    json['ro'] ?? json['readOnly'] ?? false;

@freezed
@immutable
abstract class ChannelRoom with _$ChannelRoom {
  factory ChannelRoom({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String t, // "c" for public channel, "p" for private channel
    required int msgs,
    required int usersCount,
    required String ts,
    @JsonKey(name: 'u') required RocketChatUser creator,
    String? topic,
    String? description,
    RocketChatMessage? lastMessage,
    @JsonKey(name: 'ro', readValue: _readOnlyValue)
    @Default(false)
    bool readOnly,
  }) = _ChannelRoom;

  factory ChannelRoom.fromJson(Map<String, dynamic> json) =>
      _$ChannelRoomFromJson(json);
}

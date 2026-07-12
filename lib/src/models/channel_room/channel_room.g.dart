// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChannelRoom _$ChannelRoomFromJson(Map<String, dynamic> json) => _ChannelRoom(
  id: json['_id'] as String,
  name: json['name'] as String,
  t: json['t'] as String,
  msgs: (json['msgs'] as num).toInt(),
  usersCount: (json['usersCount'] as num).toInt(),
  ts: json['ts'] as String,
  creator: RocketChatUser.fromJson(json['u'] as Map<String, dynamic>),
  topic: json['topic'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ChannelRoomToJson(_ChannelRoom instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      't': instance.t,
      'msgs': instance.msgs,
      'usersCount': instance.usersCount,
      'ts': instance.ts,
      'u': instance.creator,
      'topic': instance.topic,
      'description': instance.description,
    };

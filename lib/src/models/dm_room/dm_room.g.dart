// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dm_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DmRoom _$DmRoomFromJson(Map<String, dynamic> json) => _DmRoom(
  id: json['_id'] as String,
  t: json['t'] as String,
  usernames: (json['usernames'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  usersCount: (json['usersCount'] as num).toInt(),
  msgs: (json['msgs'] as num).toInt(),
  ts: json['ts'] as String,
  uids: (json['uids'] as List<dynamic>).map((e) => e as String).toList(),
  topic: json['topic'] as String?,
  name: json['name'] as String?,
  fname: json['fname'] as String?,
  lastMessage: json['lastMessage'] == null
      ? null
      : RocketChatMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DmRoomToJson(_DmRoom instance) => <String, dynamic>{
  '_id': instance.id,
  't': instance.t,
  'usernames': instance.usernames,
  'usersCount': instance.usersCount,
  'msgs': instance.msgs,
  'ts': instance.ts,
  'uids': instance.uids,
  'topic': instance.topic,
  'name': instance.name,
  'fname': instance.fname,
  'lastMessage': instance.lastMessage,
};

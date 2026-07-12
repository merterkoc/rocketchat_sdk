// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RocketChatMessage _$RocketChatMessageFromJson(Map<String, dynamic> json) =>
    _RocketChatMessage(
      id: json['_id'] as String,
      rid: json['rid'] as String,
      msg: json['msg'] as String,
      ts: json['ts'] as String,
      sender: RocketChatUser.fromJson(json['u'] as Map<String, dynamic>),
      reactions: json['reactions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RocketChatMessageToJson(_RocketChatMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rid': instance.rid,
      'msg': instance.msg,
      'ts': instance.ts,
      'u': instance.sender,
      'reactions': instance.reactions,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RocketChatUser _$RocketChatUserFromJson(Map<String, dynamic> json) =>
    _RocketChatUser(
      id: json['_id'] as String,
      username: json['username'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RocketChatUserToJson(_RocketChatUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
    };

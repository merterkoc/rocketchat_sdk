// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RocketChatSubscription _$RocketChatSubscriptionFromJson(
  Map<String, dynamic> json,
) => _RocketChatSubscription(
  id: json['_id'] as String,
  rid: json['rid'] as String,
  name: json['name'] as String,
  fname: json['fname'] as String?,
  t: json['t'] as String,
  open: json['open'] as bool,
  alert: json['alert'] as bool,
  unread: (json['unread'] as num).toInt(),
  userMentions: (json['userMentions'] as num?)?.toInt(),
  groupMentions: (json['groupMentions'] as num?)?.toInt(),
  ts: json['ts'] as String?,
  ls: json['ls'] as String?,
  f: json['f'] as bool?,
);

Map<String, dynamic> _$RocketChatSubscriptionToJson(
  _RocketChatSubscription instance,
) => <String, dynamic>{
  '_id': instance.id,
  'rid': instance.rid,
  'name': instance.name,
  'fname': instance.fname,
  't': instance.t,
  'open': instance.open,
  'alert': instance.alert,
  'unread': instance.unread,
  'userMentions': instance.userMentions,
  'groupMentions': instance.groupMentions,
  'ts': instance.ts,
  'ls': instance.ls,
  'f': instance.f,
};

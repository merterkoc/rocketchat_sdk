import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

Object? _readOnlyValue(Map<dynamic, dynamic> json, String key) =>
    json['ro'] ?? json['readOnly'] ?? false;

@freezed
@immutable
abstract class RocketChatSubscription with _$RocketChatSubscription {
  factory RocketChatSubscription({
    @JsonKey(name: '_id') required String id,
    required String rid,
    required String name,
    String? fname,
    required String t, // "c" for channel, "d" for direct message, etc.
    required bool open,
    required bool alert,
    required int unread,
    int? userMentions,
    int? groupMentions,
    String? ts,
    String? ls,
    bool? f,
    @JsonKey(name: 'ro', readValue: _readOnlyValue)
    @Default(false)
    bool readOnly,
  }) = _RocketChatSubscription;

  factory RocketChatSubscription.fromJson(Map<String, dynamic> json) =>
      _$RocketChatSubscriptionFromJson(json);
}

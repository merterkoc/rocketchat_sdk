// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelRoom {

@JsonKey(name: '_id') String get id; String get name; String get t;// "c" for public channel, "p" for private channel
 int get msgs; int get usersCount; String get ts;@JsonKey(name: 'u') RocketChatUser get creator; String? get topic; String? get description;
/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelRoomCopyWith<ChannelRoom> get copyWith => _$ChannelRoomCopyWithImpl<ChannelRoom>(this as ChannelRoom, _$identity);

  /// Serializes this ChannelRoom to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelRoom&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.t, t) || other.t == t)&&(identical(other.msgs, msgs) || other.msgs == msgs)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,t,msgs,usersCount,ts,creator,topic,description);

@override
String toString() {
  return 'ChannelRoom(id: $id, name: $name, t: $t, msgs: $msgs, usersCount: $usersCount, ts: $ts, creator: $creator, topic: $topic, description: $description)';
}


}

/// @nodoc
abstract mixin class $ChannelRoomCopyWith<$Res>  {
  factory $ChannelRoomCopyWith(ChannelRoom value, $Res Function(ChannelRoom) _then) = _$ChannelRoomCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String t, int msgs, int usersCount, String ts,@JsonKey(name: 'u') RocketChatUser creator, String? topic, String? description
});


$RocketChatUserCopyWith<$Res> get creator;

}
/// @nodoc
class _$ChannelRoomCopyWithImpl<$Res>
    implements $ChannelRoomCopyWith<$Res> {
  _$ChannelRoomCopyWithImpl(this._self, this._then);

  final ChannelRoom _self;
  final $Res Function(ChannelRoom) _then;

/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? t = null,Object? msgs = null,Object? usersCount = null,Object? ts = null,Object? creator = null,Object? topic = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,msgs: null == msgs ? _self.msgs : msgs // ignore: cast_nullable_to_non_nullable
as int,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as RocketChatUser,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatUserCopyWith<$Res> get creator {
  
  return $RocketChatUserCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChannelRoom].
extension ChannelRoomPatterns on ChannelRoom {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelRoom value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelRoom() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelRoom value)  $default,){
final _that = this;
switch (_that) {
case _ChannelRoom():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelRoom value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelRoom() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String t,  int msgs,  int usersCount,  String ts, @JsonKey(name: 'u')  RocketChatUser creator,  String? topic,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelRoom() when $default != null:
return $default(_that.id,_that.name,_that.t,_that.msgs,_that.usersCount,_that.ts,_that.creator,_that.topic,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String t,  int msgs,  int usersCount,  String ts, @JsonKey(name: 'u')  RocketChatUser creator,  String? topic,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ChannelRoom():
return $default(_that.id,_that.name,_that.t,_that.msgs,_that.usersCount,_that.ts,_that.creator,_that.topic,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String name,  String t,  int msgs,  int usersCount,  String ts, @JsonKey(name: 'u')  RocketChatUser creator,  String? topic,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ChannelRoom() when $default != null:
return $default(_that.id,_that.name,_that.t,_that.msgs,_that.usersCount,_that.ts,_that.creator,_that.topic,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChannelRoom implements ChannelRoom {
   _ChannelRoom({@JsonKey(name: '_id') required this.id, required this.name, required this.t, required this.msgs, required this.usersCount, required this.ts, @JsonKey(name: 'u') required this.creator, this.topic, this.description});
  factory _ChannelRoom.fromJson(Map<String, dynamic> json) => _$ChannelRoomFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String t;
// "c" for public channel, "p" for private channel
@override final  int msgs;
@override final  int usersCount;
@override final  String ts;
@override@JsonKey(name: 'u') final  RocketChatUser creator;
@override final  String? topic;
@override final  String? description;

/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelRoomCopyWith<_ChannelRoom> get copyWith => __$ChannelRoomCopyWithImpl<_ChannelRoom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelRoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelRoom&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.t, t) || other.t == t)&&(identical(other.msgs, msgs) || other.msgs == msgs)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,t,msgs,usersCount,ts,creator,topic,description);

@override
String toString() {
  return 'ChannelRoom(id: $id, name: $name, t: $t, msgs: $msgs, usersCount: $usersCount, ts: $ts, creator: $creator, topic: $topic, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ChannelRoomCopyWith<$Res> implements $ChannelRoomCopyWith<$Res> {
  factory _$ChannelRoomCopyWith(_ChannelRoom value, $Res Function(_ChannelRoom) _then) = __$ChannelRoomCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String t, int msgs, int usersCount, String ts,@JsonKey(name: 'u') RocketChatUser creator, String? topic, String? description
});


@override $RocketChatUserCopyWith<$Res> get creator;

}
/// @nodoc
class __$ChannelRoomCopyWithImpl<$Res>
    implements _$ChannelRoomCopyWith<$Res> {
  __$ChannelRoomCopyWithImpl(this._self, this._then);

  final _ChannelRoom _self;
  final $Res Function(_ChannelRoom) _then;

/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? t = null,Object? msgs = null,Object? usersCount = null,Object? ts = null,Object? creator = null,Object? topic = freezed,Object? description = freezed,}) {
  return _then(_ChannelRoom(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,msgs: null == msgs ? _self.msgs : msgs // ignore: cast_nullable_to_non_nullable
as int,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as RocketChatUser,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChannelRoom
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatUserCopyWith<$Res> get creator {
  
  return $RocketChatUserCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}

// dart format on

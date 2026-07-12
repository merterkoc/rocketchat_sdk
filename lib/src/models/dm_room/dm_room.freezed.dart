// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dm_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DmRoom {

@JsonKey(name: '_id') String get id; String get t;// "d" for direct message
 List<String> get usernames; int get usersCount; int get msgs; String get ts; List<String> get uids; String? get topic; String? get name; String? get fname; RocketChatMessage? get lastMessage;
/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmRoomCopyWith<DmRoom> get copyWith => _$DmRoomCopyWithImpl<DmRoom>(this as DmRoom, _$identity);

  /// Serializes this DmRoom to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmRoom&&(identical(other.id, id) || other.id == id)&&(identical(other.t, t) || other.t == t)&&const DeepCollectionEquality().equals(other.usernames, usernames)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.msgs, msgs) || other.msgs == msgs)&&(identical(other.ts, ts) || other.ts == ts)&&const DeepCollectionEquality().equals(other.uids, uids)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.name, name) || other.name == name)&&(identical(other.fname, fname) || other.fname == fname)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,t,const DeepCollectionEquality().hash(usernames),usersCount,msgs,ts,const DeepCollectionEquality().hash(uids),topic,name,fname,lastMessage);

@override
String toString() {
  return 'DmRoom(id: $id, t: $t, usernames: $usernames, usersCount: $usersCount, msgs: $msgs, ts: $ts, uids: $uids, topic: $topic, name: $name, fname: $fname, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $DmRoomCopyWith<$Res>  {
  factory $DmRoomCopyWith(DmRoom value, $Res Function(DmRoom) _then) = _$DmRoomCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String t, List<String> usernames, int usersCount, int msgs, String ts, List<String> uids, String? topic, String? name, String? fname, RocketChatMessage? lastMessage
});


$RocketChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$DmRoomCopyWithImpl<$Res>
    implements $DmRoomCopyWith<$Res> {
  _$DmRoomCopyWithImpl(this._self, this._then);

  final DmRoom _self;
  final $Res Function(DmRoom) _then;

/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? t = null,Object? usernames = null,Object? usersCount = null,Object? msgs = null,Object? ts = null,Object? uids = null,Object? topic = freezed,Object? name = freezed,Object? fname = freezed,Object? lastMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,usernames: null == usernames ? _self.usernames : usernames // ignore: cast_nullable_to_non_nullable
as List<String>,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,msgs: null == msgs ? _self.msgs : msgs // ignore: cast_nullable_to_non_nullable
as int,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,uids: null == uids ? _self.uids : uids // ignore: cast_nullable_to_non_nullable
as List<String>,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fname: freezed == fname ? _self.fname : fname // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as RocketChatMessage?,
  ));
}
/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $RocketChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [DmRoom].
extension DmRoomPatterns on DmRoom {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmRoom value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmRoom() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmRoom value)  $default,){
final _that = this;
switch (_that) {
case _DmRoom():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmRoom value)?  $default,){
final _that = this;
switch (_that) {
case _DmRoom() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String t,  List<String> usernames,  int usersCount,  int msgs,  String ts,  List<String> uids,  String? topic,  String? name,  String? fname,  RocketChatMessage? lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmRoom() when $default != null:
return $default(_that.id,_that.t,_that.usernames,_that.usersCount,_that.msgs,_that.ts,_that.uids,_that.topic,_that.name,_that.fname,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String t,  List<String> usernames,  int usersCount,  int msgs,  String ts,  List<String> uids,  String? topic,  String? name,  String? fname,  RocketChatMessage? lastMessage)  $default,) {final _that = this;
switch (_that) {
case _DmRoom():
return $default(_that.id,_that.t,_that.usernames,_that.usersCount,_that.msgs,_that.ts,_that.uids,_that.topic,_that.name,_that.fname,_that.lastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String t,  List<String> usernames,  int usersCount,  int msgs,  String ts,  List<String> uids,  String? topic,  String? name,  String? fname,  RocketChatMessage? lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _DmRoom() when $default != null:
return $default(_that.id,_that.t,_that.usernames,_that.usersCount,_that.msgs,_that.ts,_that.uids,_that.topic,_that.name,_that.fname,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DmRoom implements DmRoom {
   _DmRoom({@JsonKey(name: '_id') required this.id, required this.t, required final  List<String> usernames, required this.usersCount, required this.msgs, required this.ts, required final  List<String> uids, this.topic, this.name, this.fname, this.lastMessage}): _usernames = usernames,_uids = uids;
  factory _DmRoom.fromJson(Map<String, dynamic> json) => _$DmRoomFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String t;
// "d" for direct message
 final  List<String> _usernames;
// "d" for direct message
@override List<String> get usernames {
  if (_usernames is EqualUnmodifiableListView) return _usernames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usernames);
}

@override final  int usersCount;
@override final  int msgs;
@override final  String ts;
 final  List<String> _uids;
@override List<String> get uids {
  if (_uids is EqualUnmodifiableListView) return _uids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uids);
}

@override final  String? topic;
@override final  String? name;
@override final  String? fname;
@override final  RocketChatMessage? lastMessage;

/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmRoomCopyWith<_DmRoom> get copyWith => __$DmRoomCopyWithImpl<_DmRoom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmRoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmRoom&&(identical(other.id, id) || other.id == id)&&(identical(other.t, t) || other.t == t)&&const DeepCollectionEquality().equals(other._usernames, _usernames)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.msgs, msgs) || other.msgs == msgs)&&(identical(other.ts, ts) || other.ts == ts)&&const DeepCollectionEquality().equals(other._uids, _uids)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.name, name) || other.name == name)&&(identical(other.fname, fname) || other.fname == fname)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,t,const DeepCollectionEquality().hash(_usernames),usersCount,msgs,ts,const DeepCollectionEquality().hash(_uids),topic,name,fname,lastMessage);

@override
String toString() {
  return 'DmRoom(id: $id, t: $t, usernames: $usernames, usersCount: $usersCount, msgs: $msgs, ts: $ts, uids: $uids, topic: $topic, name: $name, fname: $fname, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$DmRoomCopyWith<$Res> implements $DmRoomCopyWith<$Res> {
  factory _$DmRoomCopyWith(_DmRoom value, $Res Function(_DmRoom) _then) = __$DmRoomCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String t, List<String> usernames, int usersCount, int msgs, String ts, List<String> uids, String? topic, String? name, String? fname, RocketChatMessage? lastMessage
});


@override $RocketChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$DmRoomCopyWithImpl<$Res>
    implements _$DmRoomCopyWith<$Res> {
  __$DmRoomCopyWithImpl(this._self, this._then);

  final _DmRoom _self;
  final $Res Function(_DmRoom) _then;

/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? t = null,Object? usernames = null,Object? usersCount = null,Object? msgs = null,Object? ts = null,Object? uids = null,Object? topic = freezed,Object? name = freezed,Object? fname = freezed,Object? lastMessage = freezed,}) {
  return _then(_DmRoom(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,usernames: null == usernames ? _self._usernames : usernames // ignore: cast_nullable_to_non_nullable
as List<String>,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,msgs: null == msgs ? _self.msgs : msgs // ignore: cast_nullable_to_non_nullable
as int,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,uids: null == uids ? _self._uids : uids // ignore: cast_nullable_to_non_nullable
as List<String>,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fname: freezed == fname ? _self.fname : fname // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as RocketChatMessage?,
  ));
}

/// Create a copy of DmRoom
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $RocketChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on

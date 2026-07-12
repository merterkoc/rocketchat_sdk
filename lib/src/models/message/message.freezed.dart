// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RocketChatMessage {

@JsonKey(name: '_id') String get id; String get rid; String get msg; String get ts;@JsonKey(name: 'u') RocketChatUser get sender; Map<String, dynamic>? get reactions;
/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RocketChatMessageCopyWith<RocketChatMessage> get copyWith => _$RocketChatMessageCopyWithImpl<RocketChatMessage>(this as RocketChatMessage, _$identity);

  /// Serializes this RocketChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RocketChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.rid, rid) || other.rid == rid)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.sender, sender) || other.sender == sender)&&const DeepCollectionEquality().equals(other.reactions, reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rid,msg,ts,sender,const DeepCollectionEquality().hash(reactions));

@override
String toString() {
  return 'RocketChatMessage(id: $id, rid: $rid, msg: $msg, ts: $ts, sender: $sender, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class $RocketChatMessageCopyWith<$Res>  {
  factory $RocketChatMessageCopyWith(RocketChatMessage value, $Res Function(RocketChatMessage) _then) = _$RocketChatMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String rid, String msg, String ts,@JsonKey(name: 'u') RocketChatUser sender, Map<String, dynamic>? reactions
});


$RocketChatUserCopyWith<$Res> get sender;

}
/// @nodoc
class _$RocketChatMessageCopyWithImpl<$Res>
    implements $RocketChatMessageCopyWith<$Res> {
  _$RocketChatMessageCopyWithImpl(this._self, this._then);

  final RocketChatMessage _self;
  final $Res Function(RocketChatMessage) _then;

/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rid = null,Object? msg = null,Object? ts = null,Object? sender = null,Object? reactions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rid: null == rid ? _self.rid : rid // ignore: cast_nullable_to_non_nullable
as String,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as RocketChatUser,reactions: freezed == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatUserCopyWith<$Res> get sender {
  
  return $RocketChatUserCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}


/// Adds pattern-matching-related methods to [RocketChatMessage].
extension RocketChatMessagePatterns on RocketChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RocketChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RocketChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RocketChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _RocketChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RocketChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _RocketChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String rid,  String msg,  String ts, @JsonKey(name: 'u')  RocketChatUser sender,  Map<String, dynamic>? reactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RocketChatMessage() when $default != null:
return $default(_that.id,_that.rid,_that.msg,_that.ts,_that.sender,_that.reactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String rid,  String msg,  String ts, @JsonKey(name: 'u')  RocketChatUser sender,  Map<String, dynamic>? reactions)  $default,) {final _that = this;
switch (_that) {
case _RocketChatMessage():
return $default(_that.id,_that.rid,_that.msg,_that.ts,_that.sender,_that.reactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String rid,  String msg,  String ts, @JsonKey(name: 'u')  RocketChatUser sender,  Map<String, dynamic>? reactions)?  $default,) {final _that = this;
switch (_that) {
case _RocketChatMessage() when $default != null:
return $default(_that.id,_that.rid,_that.msg,_that.ts,_that.sender,_that.reactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RocketChatMessage implements RocketChatMessage {
   _RocketChatMessage({@JsonKey(name: '_id') required this.id, required this.rid, required this.msg, required this.ts, @JsonKey(name: 'u') required this.sender, final  Map<String, dynamic>? reactions}): _reactions = reactions;
  factory _RocketChatMessage.fromJson(Map<String, dynamic> json) => _$RocketChatMessageFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String rid;
@override final  String msg;
@override final  String ts;
@override@JsonKey(name: 'u') final  RocketChatUser sender;
 final  Map<String, dynamic>? _reactions;
@override Map<String, dynamic>? get reactions {
  final value = _reactions;
  if (value == null) return null;
  if (_reactions is EqualUnmodifiableMapView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RocketChatMessageCopyWith<_RocketChatMessage> get copyWith => __$RocketChatMessageCopyWithImpl<_RocketChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RocketChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RocketChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.rid, rid) || other.rid == rid)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.sender, sender) || other.sender == sender)&&const DeepCollectionEquality().equals(other._reactions, _reactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rid,msg,ts,sender,const DeepCollectionEquality().hash(_reactions));

@override
String toString() {
  return 'RocketChatMessage(id: $id, rid: $rid, msg: $msg, ts: $ts, sender: $sender, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class _$RocketChatMessageCopyWith<$Res> implements $RocketChatMessageCopyWith<$Res> {
  factory _$RocketChatMessageCopyWith(_RocketChatMessage value, $Res Function(_RocketChatMessage) _then) = __$RocketChatMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String rid, String msg, String ts,@JsonKey(name: 'u') RocketChatUser sender, Map<String, dynamic>? reactions
});


@override $RocketChatUserCopyWith<$Res> get sender;

}
/// @nodoc
class __$RocketChatMessageCopyWithImpl<$Res>
    implements _$RocketChatMessageCopyWith<$Res> {
  __$RocketChatMessageCopyWithImpl(this._self, this._then);

  final _RocketChatMessage _self;
  final $Res Function(_RocketChatMessage) _then;

/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rid = null,Object? msg = null,Object? ts = null,Object? sender = null,Object? reactions = freezed,}) {
  return _then(_RocketChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rid: null == rid ? _self.rid : rid // ignore: cast_nullable_to_non_nullable
as String,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as RocketChatUser,reactions: freezed == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of RocketChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RocketChatUserCopyWith<$Res> get sender {
  
  return $RocketChatUserCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}

// dart format on

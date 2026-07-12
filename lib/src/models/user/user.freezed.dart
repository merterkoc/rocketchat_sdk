// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RocketChatUser {

@JsonKey(name: '_id') String get id; String get username; String? get name;
/// Create a copy of RocketChatUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RocketChatUserCopyWith<RocketChatUser> get copyWith => _$RocketChatUserCopyWithImpl<RocketChatUser>(this as RocketChatUser, _$identity);

  /// Serializes this RocketChatUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RocketChatUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name);

@override
String toString() {
  return 'RocketChatUser(id: $id, username: $username, name: $name)';
}


}

/// @nodoc
abstract mixin class $RocketChatUserCopyWith<$Res>  {
  factory $RocketChatUserCopyWith(RocketChatUser value, $Res Function(RocketChatUser) _then) = _$RocketChatUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String username, String? name
});




}
/// @nodoc
class _$RocketChatUserCopyWithImpl<$Res>
    implements $RocketChatUserCopyWith<$Res> {
  _$RocketChatUserCopyWithImpl(this._self, this._then);

  final RocketChatUser _self;
  final $Res Function(RocketChatUser) _then;

/// Create a copy of RocketChatUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RocketChatUser].
extension RocketChatUserPatterns on RocketChatUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RocketChatUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RocketChatUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RocketChatUser value)  $default,){
final _that = this;
switch (_that) {
case _RocketChatUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RocketChatUser value)?  $default,){
final _that = this;
switch (_that) {
case _RocketChatUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String username,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RocketChatUser() when $default != null:
return $default(_that.id,_that.username,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String username,  String? name)  $default,) {final _that = this;
switch (_that) {
case _RocketChatUser():
return $default(_that.id,_that.username,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String username,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _RocketChatUser() when $default != null:
return $default(_that.id,_that.username,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RocketChatUser implements RocketChatUser {
   _RocketChatUser({@JsonKey(name: '_id') required this.id, required this.username, this.name});
  factory _RocketChatUser.fromJson(Map<String, dynamic> json) => _$RocketChatUserFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String username;
@override final  String? name;

/// Create a copy of RocketChatUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RocketChatUserCopyWith<_RocketChatUser> get copyWith => __$RocketChatUserCopyWithImpl<_RocketChatUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RocketChatUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RocketChatUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name);

@override
String toString() {
  return 'RocketChatUser(id: $id, username: $username, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RocketChatUserCopyWith<$Res> implements $RocketChatUserCopyWith<$Res> {
  factory _$RocketChatUserCopyWith(_RocketChatUser value, $Res Function(_RocketChatUser) _then) = __$RocketChatUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String username, String? name
});




}
/// @nodoc
class __$RocketChatUserCopyWithImpl<$Res>
    implements _$RocketChatUserCopyWith<$Res> {
  __$RocketChatUserCopyWithImpl(this._self, this._then);

  final _RocketChatUser _self;
  final $Res Function(_RocketChatUser) _then;

/// Create a copy of RocketChatUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? name = freezed,}) {
  return _then(_RocketChatUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

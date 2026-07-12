// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rocketchat_login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RocketChatLoginData {

 String get authToken; String get userId;
/// Create a copy of RocketChatLoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RocketChatLoginDataCopyWith<RocketChatLoginData> get copyWith => _$RocketChatLoginDataCopyWithImpl<RocketChatLoginData>(this as RocketChatLoginData, _$identity);

  /// Serializes this RocketChatLoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RocketChatLoginData&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authToken,userId);

@override
String toString() {
  return 'RocketChatLoginData(authToken: $authToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $RocketChatLoginDataCopyWith<$Res>  {
  factory $RocketChatLoginDataCopyWith(RocketChatLoginData value, $Res Function(RocketChatLoginData) _then) = _$RocketChatLoginDataCopyWithImpl;
@useResult
$Res call({
 String authToken, String userId
});




}
/// @nodoc
class _$RocketChatLoginDataCopyWithImpl<$Res>
    implements $RocketChatLoginDataCopyWith<$Res> {
  _$RocketChatLoginDataCopyWithImpl(this._self, this._then);

  final RocketChatLoginData _self;
  final $Res Function(RocketChatLoginData) _then;

/// Create a copy of RocketChatLoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authToken = null,Object? userId = null,}) {
  return _then(_self.copyWith(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RocketChatLoginData].
extension RocketChatLoginDataPatterns on RocketChatLoginData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RocketChatLoginData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RocketChatLoginData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RocketChatLoginData value)  $default,){
final _that = this;
switch (_that) {
case _RocketChatLoginData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RocketChatLoginData value)?  $default,){
final _that = this;
switch (_that) {
case _RocketChatLoginData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authToken,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RocketChatLoginData() when $default != null:
return $default(_that.authToken,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authToken,  String userId)  $default,) {final _that = this;
switch (_that) {
case _RocketChatLoginData():
return $default(_that.authToken,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authToken,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _RocketChatLoginData() when $default != null:
return $default(_that.authToken,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RocketChatLoginData implements RocketChatLoginData {
   _RocketChatLoginData({required this.authToken, required this.userId});
  factory _RocketChatLoginData.fromJson(Map<String, dynamic> json) => _$RocketChatLoginDataFromJson(json);

@override final  String authToken;
@override final  String userId;

/// Create a copy of RocketChatLoginData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RocketChatLoginDataCopyWith<_RocketChatLoginData> get copyWith => __$RocketChatLoginDataCopyWithImpl<_RocketChatLoginData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RocketChatLoginDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RocketChatLoginData&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authToken,userId);

@override
String toString() {
  return 'RocketChatLoginData(authToken: $authToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$RocketChatLoginDataCopyWith<$Res> implements $RocketChatLoginDataCopyWith<$Res> {
  factory _$RocketChatLoginDataCopyWith(_RocketChatLoginData value, $Res Function(_RocketChatLoginData) _then) = __$RocketChatLoginDataCopyWithImpl;
@override @useResult
$Res call({
 String authToken, String userId
});




}
/// @nodoc
class __$RocketChatLoginDataCopyWithImpl<$Res>
    implements _$RocketChatLoginDataCopyWith<$Res> {
  __$RocketChatLoginDataCopyWithImpl(this._self, this._then);

  final _RocketChatLoginData _self;
  final $Res Function(_RocketChatLoginData) _then;

/// Create a copy of RocketChatLoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authToken = null,Object? userId = null,}) {
  return _then(_RocketChatLoginData(
authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

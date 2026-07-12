// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RocketChatSubscription {

@JsonKey(name: '_id') String get id; String get rid; String get name; String? get fname; String get t;// "c" for channel, "d" for direct message, etc.
 bool get open; bool get alert; int get unread; int? get userMentions; int? get groupMentions; String? get ts; String? get ls; bool? get f;
/// Create a copy of RocketChatSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RocketChatSubscriptionCopyWith<RocketChatSubscription> get copyWith => _$RocketChatSubscriptionCopyWithImpl<RocketChatSubscription>(this as RocketChatSubscription, _$identity);

  /// Serializes this RocketChatSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RocketChatSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.rid, rid) || other.rid == rid)&&(identical(other.name, name) || other.name == name)&&(identical(other.fname, fname) || other.fname == fname)&&(identical(other.t, t) || other.t == t)&&(identical(other.open, open) || other.open == open)&&(identical(other.alert, alert) || other.alert == alert)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.userMentions, userMentions) || other.userMentions == userMentions)&&(identical(other.groupMentions, groupMentions) || other.groupMentions == groupMentions)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.ls, ls) || other.ls == ls)&&(identical(other.f, f) || other.f == f));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rid,name,fname,t,open,alert,unread,userMentions,groupMentions,ts,ls,f);

@override
String toString() {
  return 'RocketChatSubscription(id: $id, rid: $rid, name: $name, fname: $fname, t: $t, open: $open, alert: $alert, unread: $unread, userMentions: $userMentions, groupMentions: $groupMentions, ts: $ts, ls: $ls, f: $f)';
}


}

/// @nodoc
abstract mixin class $RocketChatSubscriptionCopyWith<$Res>  {
  factory $RocketChatSubscriptionCopyWith(RocketChatSubscription value, $Res Function(RocketChatSubscription) _then) = _$RocketChatSubscriptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String rid, String name, String? fname, String t, bool open, bool alert, int unread, int? userMentions, int? groupMentions, String? ts, String? ls, bool? f
});




}
/// @nodoc
class _$RocketChatSubscriptionCopyWithImpl<$Res>
    implements $RocketChatSubscriptionCopyWith<$Res> {
  _$RocketChatSubscriptionCopyWithImpl(this._self, this._then);

  final RocketChatSubscription _self;
  final $Res Function(RocketChatSubscription) _then;

/// Create a copy of RocketChatSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rid = null,Object? name = null,Object? fname = freezed,Object? t = null,Object? open = null,Object? alert = null,Object? unread = null,Object? userMentions = freezed,Object? groupMentions = freezed,Object? ts = freezed,Object? ls = freezed,Object? f = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rid: null == rid ? _self.rid : rid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fname: freezed == fname ? _self.fname : fname // ignore: cast_nullable_to_non_nullable
as String?,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,alert: null == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,userMentions: freezed == userMentions ? _self.userMentions : userMentions // ignore: cast_nullable_to_non_nullable
as int?,groupMentions: freezed == groupMentions ? _self.groupMentions : groupMentions // ignore: cast_nullable_to_non_nullable
as int?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String?,ls: freezed == ls ? _self.ls : ls // ignore: cast_nullable_to_non_nullable
as String?,f: freezed == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RocketChatSubscription].
extension RocketChatSubscriptionPatterns on RocketChatSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RocketChatSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RocketChatSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RocketChatSubscription value)  $default,){
final _that = this;
switch (_that) {
case _RocketChatSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RocketChatSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _RocketChatSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String rid,  String name,  String? fname,  String t,  bool open,  bool alert,  int unread,  int? userMentions,  int? groupMentions,  String? ts,  String? ls,  bool? f)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RocketChatSubscription() when $default != null:
return $default(_that.id,_that.rid,_that.name,_that.fname,_that.t,_that.open,_that.alert,_that.unread,_that.userMentions,_that.groupMentions,_that.ts,_that.ls,_that.f);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String rid,  String name,  String? fname,  String t,  bool open,  bool alert,  int unread,  int? userMentions,  int? groupMentions,  String? ts,  String? ls,  bool? f)  $default,) {final _that = this;
switch (_that) {
case _RocketChatSubscription():
return $default(_that.id,_that.rid,_that.name,_that.fname,_that.t,_that.open,_that.alert,_that.unread,_that.userMentions,_that.groupMentions,_that.ts,_that.ls,_that.f);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String rid,  String name,  String? fname,  String t,  bool open,  bool alert,  int unread,  int? userMentions,  int? groupMentions,  String? ts,  String? ls,  bool? f)?  $default,) {final _that = this;
switch (_that) {
case _RocketChatSubscription() when $default != null:
return $default(_that.id,_that.rid,_that.name,_that.fname,_that.t,_that.open,_that.alert,_that.unread,_that.userMentions,_that.groupMentions,_that.ts,_that.ls,_that.f);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RocketChatSubscription implements RocketChatSubscription {
   _RocketChatSubscription({@JsonKey(name: '_id') required this.id, required this.rid, required this.name, this.fname, required this.t, required this.open, required this.alert, required this.unread, this.userMentions, this.groupMentions, this.ts, this.ls, this.f});
  factory _RocketChatSubscription.fromJson(Map<String, dynamic> json) => _$RocketChatSubscriptionFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String rid;
@override final  String name;
@override final  String? fname;
@override final  String t;
// "c" for channel, "d" for direct message, etc.
@override final  bool open;
@override final  bool alert;
@override final  int unread;
@override final  int? userMentions;
@override final  int? groupMentions;
@override final  String? ts;
@override final  String? ls;
@override final  bool? f;

/// Create a copy of RocketChatSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RocketChatSubscriptionCopyWith<_RocketChatSubscription> get copyWith => __$RocketChatSubscriptionCopyWithImpl<_RocketChatSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RocketChatSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RocketChatSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.rid, rid) || other.rid == rid)&&(identical(other.name, name) || other.name == name)&&(identical(other.fname, fname) || other.fname == fname)&&(identical(other.t, t) || other.t == t)&&(identical(other.open, open) || other.open == open)&&(identical(other.alert, alert) || other.alert == alert)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.userMentions, userMentions) || other.userMentions == userMentions)&&(identical(other.groupMentions, groupMentions) || other.groupMentions == groupMentions)&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.ls, ls) || other.ls == ls)&&(identical(other.f, f) || other.f == f));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rid,name,fname,t,open,alert,unread,userMentions,groupMentions,ts,ls,f);

@override
String toString() {
  return 'RocketChatSubscription(id: $id, rid: $rid, name: $name, fname: $fname, t: $t, open: $open, alert: $alert, unread: $unread, userMentions: $userMentions, groupMentions: $groupMentions, ts: $ts, ls: $ls, f: $f)';
}


}

/// @nodoc
abstract mixin class _$RocketChatSubscriptionCopyWith<$Res> implements $RocketChatSubscriptionCopyWith<$Res> {
  factory _$RocketChatSubscriptionCopyWith(_RocketChatSubscription value, $Res Function(_RocketChatSubscription) _then) = __$RocketChatSubscriptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String rid, String name, String? fname, String t, bool open, bool alert, int unread, int? userMentions, int? groupMentions, String? ts, String? ls, bool? f
});




}
/// @nodoc
class __$RocketChatSubscriptionCopyWithImpl<$Res>
    implements _$RocketChatSubscriptionCopyWith<$Res> {
  __$RocketChatSubscriptionCopyWithImpl(this._self, this._then);

  final _RocketChatSubscription _self;
  final $Res Function(_RocketChatSubscription) _then;

/// Create a copy of RocketChatSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rid = null,Object? name = null,Object? fname = freezed,Object? t = null,Object? open = null,Object? alert = null,Object? unread = null,Object? userMentions = freezed,Object? groupMentions = freezed,Object? ts = freezed,Object? ls = freezed,Object? f = freezed,}) {
  return _then(_RocketChatSubscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rid: null == rid ? _self.rid : rid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fname: freezed == fname ? _self.fname : fname // ignore: cast_nullable_to_non_nullable
as String?,t: null == t ? _self.t : t // ignore: cast_nullable_to_non_nullable
as String,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,alert: null == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as bool,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,userMentions: freezed == userMentions ? _self.userMentions : userMentions // ignore: cast_nullable_to_non_nullable
as int?,groupMentions: freezed == groupMentions ? _self.groupMentions : groupMentions // ignore: cast_nullable_to_non_nullable
as int?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String?,ls: freezed == ls ? _self.ls : ls // ignore: cast_nullable_to_non_nullable
as String?,f: freezed == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on

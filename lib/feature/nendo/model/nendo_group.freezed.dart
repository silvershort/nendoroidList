// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoGroup {
  String get name;
  List<NendoData> get nendoList;

  /// Create a copy of NendoGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoGroupCopyWith<NendoGroup> get copyWith =>
      _$NendoGroupCopyWithImpl<NendoGroup>(this as NendoGroup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoGroup &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.nendoList, nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(nendoList));

  @override
  String toString() {
    return 'NendoGroup(name: $name, nendoList: $nendoList)';
  }
}

/// @nodoc
abstract mixin class $NendoGroupCopyWith<$Res> {
  factory $NendoGroupCopyWith(
          NendoGroup value, $Res Function(NendoGroup) _then) =
      _$NendoGroupCopyWithImpl;
  @useResult
  $Res call({String name, List<NendoData> nendoList});
}

/// @nodoc
class _$NendoGroupCopyWithImpl<$Res> implements $NendoGroupCopyWith<$Res> {
  _$NendoGroupCopyWithImpl(this._self, this._then);

  final NendoGroup _self;
  final $Res Function(NendoGroup) _then;

  /// Create a copy of NendoGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nendoList = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nendoList: null == nendoList
          ? _self.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoGroup].
extension NendoGroupPatterns on NendoGroup {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NendoGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoGroup() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NendoGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoGroup():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NendoGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoGroup() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, List<NendoData> nendoList)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoGroup() when $default != null:
        return $default(_that.name, _that.nendoList);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, List<NendoData> nendoList) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoGroup():
        return $default(_that.name, _that.nendoList);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, List<NendoData> nendoList)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoGroup() when $default != null:
        return $default(_that.name, _that.nendoList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoGroup implements NendoGroup {
  const _NendoGroup(
      {required this.name, required final List<NendoData> nendoList})
      : _nendoList = nendoList;

  @override
  final String name;
  final List<NendoData> _nendoList;
  @override
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  /// Create a copy of NendoGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoGroupCopyWith<_NendoGroup> get copyWith =>
      __$NendoGroupCopyWithImpl<_NendoGroup>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoGroup &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_nendoList));

  @override
  String toString() {
    return 'NendoGroup(name: $name, nendoList: $nendoList)';
  }
}

/// @nodoc
abstract mixin class _$NendoGroupCopyWith<$Res>
    implements $NendoGroupCopyWith<$Res> {
  factory _$NendoGroupCopyWith(
          _NendoGroup value, $Res Function(_NendoGroup) _then) =
      __$NendoGroupCopyWithImpl;
  @override
  @useResult
  $Res call({String name, List<NendoData> nendoList});
}

/// @nodoc
class __$NendoGroupCopyWithImpl<$Res> implements _$NendoGroupCopyWith<$Res> {
  __$NendoGroupCopyWithImpl(this._self, this._then);

  final _NendoGroup _self;
  final $Res Function(_NendoGroup) _then;

  /// Create a copy of NendoGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? nendoList = null,
  }) {
    return _then(_NendoGroup(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nendoList: null == nendoList
          ? _self._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

// dart format on

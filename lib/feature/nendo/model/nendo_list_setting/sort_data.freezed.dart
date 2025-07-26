// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SortData {
  SortingOrder get sortingOrder;
  SortingMethod get sortingMethod;

  /// Create a copy of SortData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SortDataCopyWith<SortData> get copyWith =>
      _$SortDataCopyWithImpl<SortData>(this as SortData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SortData &&
            (identical(other.sortingOrder, sortingOrder) ||
                other.sortingOrder == sortingOrder) &&
            (identical(other.sortingMethod, sortingMethod) ||
                other.sortingMethod == sortingMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortingOrder, sortingMethod);

  @override
  String toString() {
    return 'SortData(sortingOrder: $sortingOrder, sortingMethod: $sortingMethod)';
  }
}

/// @nodoc
abstract mixin class $SortDataCopyWith<$Res> {
  factory $SortDataCopyWith(SortData value, $Res Function(SortData) _then) =
      _$SortDataCopyWithImpl;
  @useResult
  $Res call({SortingOrder sortingOrder, SortingMethod sortingMethod});
}

/// @nodoc
class _$SortDataCopyWithImpl<$Res> implements $SortDataCopyWith<$Res> {
  _$SortDataCopyWithImpl(this._self, this._then);

  final SortData _self;
  final $Res Function(SortData) _then;

  /// Create a copy of SortData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortingOrder = null,
    Object? sortingMethod = null,
  }) {
    return _then(_self.copyWith(
      sortingOrder: null == sortingOrder
          ? _self.sortingOrder
          : sortingOrder // ignore: cast_nullable_to_non_nullable
              as SortingOrder,
      sortingMethod: null == sortingMethod
          ? _self.sortingMethod
          : sortingMethod // ignore: cast_nullable_to_non_nullable
              as SortingMethod,
    ));
  }
}

/// Adds pattern-matching-related methods to [SortData].
extension SortDataPatterns on SortData {
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
    TResult Function(_SortData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SortData() when $default != null:
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
    TResult Function(_SortData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortData():
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
    TResult? Function(_SortData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortData() when $default != null:
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
    TResult Function(SortingOrder sortingOrder, SortingMethod sortingMethod)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SortData() when $default != null:
        return $default(_that.sortingOrder, _that.sortingMethod);
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
    TResult Function(SortingOrder sortingOrder, SortingMethod sortingMethod)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortData():
        return $default(_that.sortingOrder, _that.sortingMethod);
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
    TResult? Function(SortingOrder sortingOrder, SortingMethod sortingMethod)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortData() when $default != null:
        return $default(_that.sortingOrder, _that.sortingMethod);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SortData extends SortData {
  const _SortData(
      {this.sortingOrder = const DESC(),
      this.sortingMethod = const SortingMethodNum()})
      : super._();

  @override
  @JsonKey()
  final SortingOrder sortingOrder;
  @override
  @JsonKey()
  final SortingMethod sortingMethod;

  /// Create a copy of SortData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SortDataCopyWith<_SortData> get copyWith =>
      __$SortDataCopyWithImpl<_SortData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SortData &&
            (identical(other.sortingOrder, sortingOrder) ||
                other.sortingOrder == sortingOrder) &&
            (identical(other.sortingMethod, sortingMethod) ||
                other.sortingMethod == sortingMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortingOrder, sortingMethod);

  @override
  String toString() {
    return 'SortData(sortingOrder: $sortingOrder, sortingMethod: $sortingMethod)';
  }
}

/// @nodoc
abstract mixin class _$SortDataCopyWith<$Res>
    implements $SortDataCopyWith<$Res> {
  factory _$SortDataCopyWith(_SortData value, $Res Function(_SortData) _then) =
      __$SortDataCopyWithImpl;
  @override
  @useResult
  $Res call({SortingOrder sortingOrder, SortingMethod sortingMethod});
}

/// @nodoc
class __$SortDataCopyWithImpl<$Res> implements _$SortDataCopyWith<$Res> {
  __$SortDataCopyWithImpl(this._self, this._then);

  final _SortData _self;
  final $Res Function(_SortData) _then;

  /// Create a copy of SortData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortingOrder = null,
    Object? sortingMethod = null,
  }) {
    return _then(_SortData(
      sortingOrder: null == sortingOrder
          ? _self.sortingOrder
          : sortingOrder // ignore: cast_nullable_to_non_nullable
              as SortingOrder,
      sortingMethod: null == sortingMethod
          ? _self.sortingMethod
          : sortingMethod // ignore: cast_nullable_to_non_nullable
              as SortingMethod,
    ));
  }
}

// dart format on

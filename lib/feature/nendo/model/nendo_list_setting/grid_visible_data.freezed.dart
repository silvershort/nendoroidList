// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_visible_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GridVisibleData {
  bool get number;
  bool get name;
  bool get have;
  bool get preOrder;
  bool get wish;
  Emphasize get emphasize;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GridVisibleDataCopyWith<GridVisibleData> get copyWith =>
      _$GridVisibleDataCopyWithImpl<GridVisibleData>(
          this as GridVisibleData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GridVisibleData &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.have, have) || other.have == have) &&
            (identical(other.preOrder, preOrder) ||
                other.preOrder == preOrder) &&
            (identical(other.wish, wish) || other.wish == wish) &&
            (identical(other.emphasize, emphasize) ||
                other.emphasize == emphasize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, have, preOrder, wish, emphasize);

  @override
  String toString() {
    return 'GridVisibleData(number: $number, name: $name, have: $have, preOrder: $preOrder, wish: $wish, emphasize: $emphasize)';
  }
}

/// @nodoc
abstract mixin class $GridVisibleDataCopyWith<$Res> {
  factory $GridVisibleDataCopyWith(
          GridVisibleData value, $Res Function(GridVisibleData) _then) =
      _$GridVisibleDataCopyWithImpl;
  @useResult
  $Res call(
      {bool number,
      bool name,
      bool have,
      bool preOrder,
      bool wish,
      Emphasize emphasize});
}

/// @nodoc
class _$GridVisibleDataCopyWithImpl<$Res>
    implements $GridVisibleDataCopyWith<$Res> {
  _$GridVisibleDataCopyWithImpl(this._self, this._then);

  final GridVisibleData _self;
  final $Res Function(GridVisibleData) _then;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? have = null,
    Object? preOrder = null,
    Object? wish = null,
    Object? emphasize = null,
  }) {
    return _then(_self.copyWith(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      have: null == have
          ? _self.have
          : have // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrder: null == preOrder
          ? _self.preOrder
          : preOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      wish: null == wish
          ? _self.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as bool,
      emphasize: null == emphasize
          ? _self.emphasize
          : emphasize // ignore: cast_nullable_to_non_nullable
              as Emphasize,
    ));
  }
}

/// Adds pattern-matching-related methods to [GridVisibleData].
extension GridVisibleDataPatterns on GridVisibleData {
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
    TResult Function(_GridVisibleData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData() when $default != null:
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
    TResult Function(_GridVisibleData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData():
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
    TResult? Function(_GridVisibleData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData() when $default != null:
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
    TResult Function(bool number, bool name, bool have, bool preOrder,
            bool wish, Emphasize emphasize)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData() when $default != null:
        return $default(_that.number, _that.name, _that.have, _that.preOrder,
            _that.wish, _that.emphasize);
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
    TResult Function(bool number, bool name, bool have, bool preOrder,
            bool wish, Emphasize emphasize)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData():
        return $default(_that.number, _that.name, _that.have, _that.preOrder,
            _that.wish, _that.emphasize);
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
    TResult? Function(bool number, bool name, bool have, bool preOrder,
            bool wish, Emphasize emphasize)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GridVisibleData() when $default != null:
        return $default(_that.number, _that.name, _that.have, _that.preOrder,
            _that.wish, _that.emphasize);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GridVisibleData implements GridVisibleData {
  const _GridVisibleData(
      {this.number = false,
      this.name = false,
      this.have = false,
      this.preOrder = false,
      this.wish = false,
      this.emphasize = const NonEmphasize()});

  @override
  @JsonKey()
  final bool number;
  @override
  @JsonKey()
  final bool name;
  @override
  @JsonKey()
  final bool have;
  @override
  @JsonKey()
  final bool preOrder;
  @override
  @JsonKey()
  final bool wish;
  @override
  @JsonKey()
  final Emphasize emphasize;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GridVisibleDataCopyWith<_GridVisibleData> get copyWith =>
      __$GridVisibleDataCopyWithImpl<_GridVisibleData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GridVisibleData &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.have, have) || other.have == have) &&
            (identical(other.preOrder, preOrder) ||
                other.preOrder == preOrder) &&
            (identical(other.wish, wish) || other.wish == wish) &&
            (identical(other.emphasize, emphasize) ||
                other.emphasize == emphasize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, have, preOrder, wish, emphasize);

  @override
  String toString() {
    return 'GridVisibleData(number: $number, name: $name, have: $have, preOrder: $preOrder, wish: $wish, emphasize: $emphasize)';
  }
}

/// @nodoc
abstract mixin class _$GridVisibleDataCopyWith<$Res>
    implements $GridVisibleDataCopyWith<$Res> {
  factory _$GridVisibleDataCopyWith(
          _GridVisibleData value, $Res Function(_GridVisibleData) _then) =
      __$GridVisibleDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool number,
      bool name,
      bool have,
      bool preOrder,
      bool wish,
      Emphasize emphasize});
}

/// @nodoc
class __$GridVisibleDataCopyWithImpl<$Res>
    implements _$GridVisibleDataCopyWith<$Res> {
  __$GridVisibleDataCopyWithImpl(this._self, this._then);

  final _GridVisibleData _self;
  final $Res Function(_GridVisibleData) _then;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? have = null,
    Object? preOrder = null,
    Object? wish = null,
    Object? emphasize = null,
  }) {
    return _then(_GridVisibleData(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      have: null == have
          ? _self.have
          : have // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrder: null == preOrder
          ? _self.preOrder
          : preOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      wish: null == wish
          ? _self.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as bool,
      emphasize: null == emphasize
          ? _self.emphasize
          : emphasize // ignore: cast_nullable_to_non_nullable
              as Emphasize,
    ));
  }
}

// dart format on

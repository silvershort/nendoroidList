// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterData {
  bool get haveFilter;
  bool get notHaveFilter;
  bool get wishFilter; // @Default(false) bool expectedFilter,
  bool get preOrderFilter;
  bool get femaleFilter;
  bool get maleFilter;
  bool get etcFilter;

  /// Create a copy of FilterData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterDataCopyWith<FilterData> get copyWith =>
      _$FilterDataCopyWithImpl<FilterData>(this as FilterData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterData &&
            (identical(other.haveFilter, haveFilter) ||
                other.haveFilter == haveFilter) &&
            (identical(other.notHaveFilter, notHaveFilter) ||
                other.notHaveFilter == notHaveFilter) &&
            (identical(other.wishFilter, wishFilter) ||
                other.wishFilter == wishFilter) &&
            (identical(other.preOrderFilter, preOrderFilter) ||
                other.preOrderFilter == preOrderFilter) &&
            (identical(other.femaleFilter, femaleFilter) ||
                other.femaleFilter == femaleFilter) &&
            (identical(other.maleFilter, maleFilter) ||
                other.maleFilter == maleFilter) &&
            (identical(other.etcFilter, etcFilter) ||
                other.etcFilter == etcFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, haveFilter, notHaveFilter,
      wishFilter, preOrderFilter, femaleFilter, maleFilter, etcFilter);

  @override
  String toString() {
    return 'FilterData(haveFilter: $haveFilter, notHaveFilter: $notHaveFilter, wishFilter: $wishFilter, preOrderFilter: $preOrderFilter, femaleFilter: $femaleFilter, maleFilter: $maleFilter, etcFilter: $etcFilter)';
  }
}

/// @nodoc
abstract mixin class $FilterDataCopyWith<$Res> {
  factory $FilterDataCopyWith(
          FilterData value, $Res Function(FilterData) _then) =
      _$FilterDataCopyWithImpl;
  @useResult
  $Res call(
      {bool haveFilter,
      bool notHaveFilter,
      bool wishFilter,
      bool preOrderFilter,
      bool femaleFilter,
      bool maleFilter,
      bool etcFilter});
}

/// @nodoc
class _$FilterDataCopyWithImpl<$Res> implements $FilterDataCopyWith<$Res> {
  _$FilterDataCopyWithImpl(this._self, this._then);

  final FilterData _self;
  final $Res Function(FilterData) _then;

  /// Create a copy of FilterData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? haveFilter = null,
    Object? notHaveFilter = null,
    Object? wishFilter = null,
    Object? preOrderFilter = null,
    Object? femaleFilter = null,
    Object? maleFilter = null,
    Object? etcFilter = null,
  }) {
    return _then(_self.copyWith(
      haveFilter: null == haveFilter
          ? _self.haveFilter
          : haveFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      notHaveFilter: null == notHaveFilter
          ? _self.notHaveFilter
          : notHaveFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      wishFilter: null == wishFilter
          ? _self.wishFilter
          : wishFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrderFilter: null == preOrderFilter
          ? _self.preOrderFilter
          : preOrderFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      femaleFilter: null == femaleFilter
          ? _self.femaleFilter
          : femaleFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      maleFilter: null == maleFilter
          ? _self.maleFilter
          : maleFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      etcFilter: null == etcFilter
          ? _self.etcFilter
          : etcFilter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FilterData].
extension FilterDataPatterns on FilterData {
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
    TResult Function(_FilterData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilterData() when $default != null:
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
    TResult Function(_FilterData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilterData():
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
    TResult? Function(_FilterData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilterData() when $default != null:
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
    TResult Function(
            bool haveFilter,
            bool notHaveFilter,
            bool wishFilter,
            bool preOrderFilter,
            bool femaleFilter,
            bool maleFilter,
            bool etcFilter)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilterData() when $default != null:
        return $default(
            _that.haveFilter,
            _that.notHaveFilter,
            _that.wishFilter,
            _that.preOrderFilter,
            _that.femaleFilter,
            _that.maleFilter,
            _that.etcFilter);
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
    TResult Function(
            bool haveFilter,
            bool notHaveFilter,
            bool wishFilter,
            bool preOrderFilter,
            bool femaleFilter,
            bool maleFilter,
            bool etcFilter)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilterData():
        return $default(
            _that.haveFilter,
            _that.notHaveFilter,
            _that.wishFilter,
            _that.preOrderFilter,
            _that.femaleFilter,
            _that.maleFilter,
            _that.etcFilter);
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
    TResult? Function(
            bool haveFilter,
            bool notHaveFilter,
            bool wishFilter,
            bool preOrderFilter,
            bool femaleFilter,
            bool maleFilter,
            bool etcFilter)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilterData() when $default != null:
        return $default(
            _that.haveFilter,
            _that.notHaveFilter,
            _that.wishFilter,
            _that.preOrderFilter,
            _that.femaleFilter,
            _that.maleFilter,
            _that.etcFilter);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FilterData extends FilterData {
  const _FilterData(
      {this.haveFilter = false,
      this.notHaveFilter = false,
      this.wishFilter = false,
      this.preOrderFilter = false,
      this.femaleFilter = false,
      this.maleFilter = false,
      this.etcFilter = false})
      : super._();

  @override
  @JsonKey()
  final bool haveFilter;
  @override
  @JsonKey()
  final bool notHaveFilter;
  @override
  @JsonKey()
  final bool wishFilter;
// @Default(false) bool expectedFilter,
  @override
  @JsonKey()
  final bool preOrderFilter;
  @override
  @JsonKey()
  final bool femaleFilter;
  @override
  @JsonKey()
  final bool maleFilter;
  @override
  @JsonKey()
  final bool etcFilter;

  /// Create a copy of FilterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterDataCopyWith<_FilterData> get copyWith =>
      __$FilterDataCopyWithImpl<_FilterData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterData &&
            (identical(other.haveFilter, haveFilter) ||
                other.haveFilter == haveFilter) &&
            (identical(other.notHaveFilter, notHaveFilter) ||
                other.notHaveFilter == notHaveFilter) &&
            (identical(other.wishFilter, wishFilter) ||
                other.wishFilter == wishFilter) &&
            (identical(other.preOrderFilter, preOrderFilter) ||
                other.preOrderFilter == preOrderFilter) &&
            (identical(other.femaleFilter, femaleFilter) ||
                other.femaleFilter == femaleFilter) &&
            (identical(other.maleFilter, maleFilter) ||
                other.maleFilter == maleFilter) &&
            (identical(other.etcFilter, etcFilter) ||
                other.etcFilter == etcFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, haveFilter, notHaveFilter,
      wishFilter, preOrderFilter, femaleFilter, maleFilter, etcFilter);

  @override
  String toString() {
    return 'FilterData(haveFilter: $haveFilter, notHaveFilter: $notHaveFilter, wishFilter: $wishFilter, preOrderFilter: $preOrderFilter, femaleFilter: $femaleFilter, maleFilter: $maleFilter, etcFilter: $etcFilter)';
  }
}

/// @nodoc
abstract mixin class _$FilterDataCopyWith<$Res>
    implements $FilterDataCopyWith<$Res> {
  factory _$FilterDataCopyWith(
          _FilterData value, $Res Function(_FilterData) _then) =
      __$FilterDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool haveFilter,
      bool notHaveFilter,
      bool wishFilter,
      bool preOrderFilter,
      bool femaleFilter,
      bool maleFilter,
      bool etcFilter});
}

/// @nodoc
class __$FilterDataCopyWithImpl<$Res> implements _$FilterDataCopyWith<$Res> {
  __$FilterDataCopyWithImpl(this._self, this._then);

  final _FilterData _self;
  final $Res Function(_FilterData) _then;

  /// Create a copy of FilterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? haveFilter = null,
    Object? notHaveFilter = null,
    Object? wishFilter = null,
    Object? preOrderFilter = null,
    Object? femaleFilter = null,
    Object? maleFilter = null,
    Object? etcFilter = null,
  }) {
    return _then(_FilterData(
      haveFilter: null == haveFilter
          ? _self.haveFilter
          : haveFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      notHaveFilter: null == notHaveFilter
          ? _self.notHaveFilter
          : notHaveFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      wishFilter: null == wishFilter
          ? _self.wishFilter
          : wishFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrderFilter: null == preOrderFilter
          ? _self.preOrderFilter
          : preOrderFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      femaleFilter: null == femaleFilter
          ? _self.femaleFilter
          : femaleFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      maleFilter: null == maleFilter
          ? _self.maleFilter
          : maleFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      etcFilter: null == etcFilter
          ? _self.etcFilter
          : etcFilter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

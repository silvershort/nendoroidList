// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_release_info_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoRelaseInfoData {
  DateTime get lastReleaseDate;
  List<MonthReleaseData> get monthReleaseList;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoRelaseInfoDataCopyWith<NendoRelaseInfoData> get copyWith =>
      _$NendoRelaseInfoDataCopyWithImpl<NendoRelaseInfoData>(
          this as NendoRelaseInfoData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoRelaseInfoData &&
            (identical(other.lastReleaseDate, lastReleaseDate) ||
                other.lastReleaseDate == lastReleaseDate) &&
            const DeepCollectionEquality()
                .equals(other.monthReleaseList, monthReleaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastReleaseDate,
      const DeepCollectionEquality().hash(monthReleaseList));

  @override
  String toString() {
    return 'NendoRelaseInfoData(lastReleaseDate: $lastReleaseDate, monthReleaseList: $monthReleaseList)';
  }
}

/// @nodoc
abstract mixin class $NendoRelaseInfoDataCopyWith<$Res> {
  factory $NendoRelaseInfoDataCopyWith(
          NendoRelaseInfoData value, $Res Function(NendoRelaseInfoData) _then) =
      _$NendoRelaseInfoDataCopyWithImpl;
  @useResult
  $Res call(
      {DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList});
}

/// @nodoc
class _$NendoRelaseInfoDataCopyWithImpl<$Res>
    implements $NendoRelaseInfoDataCopyWith<$Res> {
  _$NendoRelaseInfoDataCopyWithImpl(this._self, this._then);

  final NendoRelaseInfoData _self;
  final $Res Function(NendoRelaseInfoData) _then;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReleaseDate = null,
    Object? monthReleaseList = null,
  }) {
    return _then(_self.copyWith(
      lastReleaseDate: null == lastReleaseDate
          ? _self.lastReleaseDate
          : lastReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthReleaseList: null == monthReleaseList
          ? _self.monthReleaseList
          : monthReleaseList // ignore: cast_nullable_to_non_nullable
              as List<MonthReleaseData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoRelaseInfoData].
extension NendoRelaseInfoDataPatterns on NendoRelaseInfoData {
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
    TResult Function(_NendoRelaseInfoData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData() when $default != null:
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
    TResult Function(_NendoRelaseInfoData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData():
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
    TResult? Function(_NendoRelaseInfoData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData() when $default != null:
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
            DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData() when $default != null:
        return $default(_that.lastReleaseDate, _that.monthReleaseList);
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
            DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData():
        return $default(_that.lastReleaseDate, _that.monthReleaseList);
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
            DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoRelaseInfoData() when $default != null:
        return $default(_that.lastReleaseDate, _that.monthReleaseList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoRelaseInfoData implements NendoRelaseInfoData {
  const _NendoRelaseInfoData(
      {required this.lastReleaseDate,
      required final List<MonthReleaseData> monthReleaseList})
      : _monthReleaseList = monthReleaseList;

  @override
  final DateTime lastReleaseDate;
  final List<MonthReleaseData> _monthReleaseList;
  @override
  List<MonthReleaseData> get monthReleaseList {
    if (_monthReleaseList is EqualUnmodifiableListView)
      return _monthReleaseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthReleaseList);
  }

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoRelaseInfoDataCopyWith<_NendoRelaseInfoData> get copyWith =>
      __$NendoRelaseInfoDataCopyWithImpl<_NendoRelaseInfoData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoRelaseInfoData &&
            (identical(other.lastReleaseDate, lastReleaseDate) ||
                other.lastReleaseDate == lastReleaseDate) &&
            const DeepCollectionEquality()
                .equals(other._monthReleaseList, _monthReleaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastReleaseDate,
      const DeepCollectionEquality().hash(_monthReleaseList));

  @override
  String toString() {
    return 'NendoRelaseInfoData(lastReleaseDate: $lastReleaseDate, monthReleaseList: $monthReleaseList)';
  }
}

/// @nodoc
abstract mixin class _$NendoRelaseInfoDataCopyWith<$Res>
    implements $NendoRelaseInfoDataCopyWith<$Res> {
  factory _$NendoRelaseInfoDataCopyWith(_NendoRelaseInfoData value,
          $Res Function(_NendoRelaseInfoData) _then) =
      __$NendoRelaseInfoDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList});
}

/// @nodoc
class __$NendoRelaseInfoDataCopyWithImpl<$Res>
    implements _$NendoRelaseInfoDataCopyWith<$Res> {
  __$NendoRelaseInfoDataCopyWithImpl(this._self, this._then);

  final _NendoRelaseInfoData _self;
  final $Res Function(_NendoRelaseInfoData) _then;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastReleaseDate = null,
    Object? monthReleaseList = null,
  }) {
    return _then(_NendoRelaseInfoData(
      lastReleaseDate: null == lastReleaseDate
          ? _self.lastReleaseDate
          : lastReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthReleaseList: null == monthReleaseList
          ? _self._monthReleaseList
          : monthReleaseList // ignore: cast_nullable_to_non_nullable
              as List<MonthReleaseData>,
    ));
  }
}

/// @nodoc
mixin _$MonthReleaseData {
  int get year;
  int get month;
  List<ReleaseData> get releaseList;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthReleaseDataCopyWith<MonthReleaseData> get copyWith =>
      _$MonthReleaseDataCopyWithImpl<MonthReleaseData>(
          this as MonthReleaseData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthReleaseData &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality()
                .equals(other.releaseList, releaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month,
      const DeepCollectionEquality().hash(releaseList));

  @override
  String toString() {
    return 'MonthReleaseData(year: $year, month: $month, releaseList: $releaseList)';
  }
}

/// @nodoc
abstract mixin class $MonthReleaseDataCopyWith<$Res> {
  factory $MonthReleaseDataCopyWith(
          MonthReleaseData value, $Res Function(MonthReleaseData) _then) =
      _$MonthReleaseDataCopyWithImpl;
  @useResult
  $Res call({int year, int month, List<ReleaseData> releaseList});
}

/// @nodoc
class _$MonthReleaseDataCopyWithImpl<$Res>
    implements $MonthReleaseDataCopyWith<$Res> {
  _$MonthReleaseDataCopyWithImpl(this._self, this._then);

  final MonthReleaseData _self;
  final $Res Function(MonthReleaseData) _then;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? releaseList = null,
  }) {
    return _then(_self.copyWith(
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      releaseList: null == releaseList
          ? _self.releaseList
          : releaseList // ignore: cast_nullable_to_non_nullable
              as List<ReleaseData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MonthReleaseData].
extension MonthReleaseDataPatterns on MonthReleaseData {
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
    TResult Function(_MonthReleaseData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData() when $default != null:
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
    TResult Function(_MonthReleaseData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData():
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
    TResult? Function(_MonthReleaseData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData() when $default != null:
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
    TResult Function(int year, int month, List<ReleaseData> releaseList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData() when $default != null:
        return $default(_that.year, _that.month, _that.releaseList);
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
    TResult Function(int year, int month, List<ReleaseData> releaseList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData():
        return $default(_that.year, _that.month, _that.releaseList);
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
    TResult? Function(int year, int month, List<ReleaseData> releaseList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthReleaseData() when $default != null:
        return $default(_that.year, _that.month, _that.releaseList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MonthReleaseData implements MonthReleaseData {
  const _MonthReleaseData(
      {required this.year,
      required this.month,
      required final List<ReleaseData> releaseList})
      : _releaseList = releaseList;

  @override
  final int year;
  @override
  final int month;
  final List<ReleaseData> _releaseList;
  @override
  List<ReleaseData> get releaseList {
    if (_releaseList is EqualUnmodifiableListView) return _releaseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releaseList);
  }

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MonthReleaseDataCopyWith<_MonthReleaseData> get copyWith =>
      __$MonthReleaseDataCopyWithImpl<_MonthReleaseData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthReleaseData &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality()
                .equals(other._releaseList, _releaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month,
      const DeepCollectionEquality().hash(_releaseList));

  @override
  String toString() {
    return 'MonthReleaseData(year: $year, month: $month, releaseList: $releaseList)';
  }
}

/// @nodoc
abstract mixin class _$MonthReleaseDataCopyWith<$Res>
    implements $MonthReleaseDataCopyWith<$Res> {
  factory _$MonthReleaseDataCopyWith(
          _MonthReleaseData value, $Res Function(_MonthReleaseData) _then) =
      __$MonthReleaseDataCopyWithImpl;
  @override
  @useResult
  $Res call({int year, int month, List<ReleaseData> releaseList});
}

/// @nodoc
class __$MonthReleaseDataCopyWithImpl<$Res>
    implements _$MonthReleaseDataCopyWith<$Res> {
  __$MonthReleaseDataCopyWithImpl(this._self, this._then);

  final _MonthReleaseData _self;
  final $Res Function(_MonthReleaseData) _then;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? releaseList = null,
  }) {
    return _then(_MonthReleaseData(
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      releaseList: null == releaseList
          ? _self._releaseList
          : releaseList // ignore: cast_nullable_to_non_nullable
              as List<ReleaseData>,
    ));
  }
}

/// @nodoc
mixin _$ReleaseData {
  DateTime get releaseData;
  NendoReleaseData get nendoData;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReleaseDataCopyWith<ReleaseData> get copyWith =>
      _$ReleaseDataCopyWithImpl<ReleaseData>(this as ReleaseData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReleaseData &&
            (identical(other.releaseData, releaseData) ||
                other.releaseData == releaseData) &&
            (identical(other.nendoData, nendoData) ||
                other.nendoData == nendoData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, releaseData, nendoData);

  @override
  String toString() {
    return 'ReleaseData(releaseData: $releaseData, nendoData: $nendoData)';
  }
}

/// @nodoc
abstract mixin class $ReleaseDataCopyWith<$Res> {
  factory $ReleaseDataCopyWith(
          ReleaseData value, $Res Function(ReleaseData) _then) =
      _$ReleaseDataCopyWithImpl;
  @useResult
  $Res call({DateTime releaseData, NendoReleaseData nendoData});

  $NendoReleaseDataCopyWith<$Res> get nendoData;
}

/// @nodoc
class _$ReleaseDataCopyWithImpl<$Res> implements $ReleaseDataCopyWith<$Res> {
  _$ReleaseDataCopyWithImpl(this._self, this._then);

  final ReleaseData _self;
  final $Res Function(ReleaseData) _then;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releaseData = null,
    Object? nendoData = null,
  }) {
    return _then(_self.copyWith(
      releaseData: null == releaseData
          ? _self.releaseData
          : releaseData // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nendoData: null == nendoData
          ? _self.nendoData
          : nendoData // ignore: cast_nullable_to_non_nullable
              as NendoReleaseData,
    ));
  }

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NendoReleaseDataCopyWith<$Res> get nendoData {
    return $NendoReleaseDataCopyWith<$Res>(_self.nendoData, (value) {
      return _then(_self.copyWith(nendoData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReleaseData].
extension ReleaseDataPatterns on ReleaseData {
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
    TResult Function(_ReleaseData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReleaseData() when $default != null:
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
    TResult Function(_ReleaseData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseData():
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
    TResult? Function(_ReleaseData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseData() when $default != null:
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
    TResult Function(DateTime releaseData, NendoReleaseData nendoData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReleaseData() when $default != null:
        return $default(_that.releaseData, _that.nendoData);
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
    TResult Function(DateTime releaseData, NendoReleaseData nendoData) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseData():
        return $default(_that.releaseData, _that.nendoData);
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
    TResult? Function(DateTime releaseData, NendoReleaseData nendoData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReleaseData() when $default != null:
        return $default(_that.releaseData, _that.nendoData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReleaseData implements ReleaseData {
  const _ReleaseData({required this.releaseData, required this.nendoData});

  @override
  final DateTime releaseData;
  @override
  final NendoReleaseData nendoData;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReleaseDataCopyWith<_ReleaseData> get copyWith =>
      __$ReleaseDataCopyWithImpl<_ReleaseData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReleaseData &&
            (identical(other.releaseData, releaseData) ||
                other.releaseData == releaseData) &&
            (identical(other.nendoData, nendoData) ||
                other.nendoData == nendoData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, releaseData, nendoData);

  @override
  String toString() {
    return 'ReleaseData(releaseData: $releaseData, nendoData: $nendoData)';
  }
}

/// @nodoc
abstract mixin class _$ReleaseDataCopyWith<$Res>
    implements $ReleaseDataCopyWith<$Res> {
  factory _$ReleaseDataCopyWith(
          _ReleaseData value, $Res Function(_ReleaseData) _then) =
      __$ReleaseDataCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime releaseData, NendoReleaseData nendoData});

  @override
  $NendoReleaseDataCopyWith<$Res> get nendoData;
}

/// @nodoc
class __$ReleaseDataCopyWithImpl<$Res> implements _$ReleaseDataCopyWith<$Res> {
  __$ReleaseDataCopyWithImpl(this._self, this._then);

  final _ReleaseData _self;
  final $Res Function(_ReleaseData) _then;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? releaseData = null,
    Object? nendoData = null,
  }) {
    return _then(_ReleaseData(
      releaseData: null == releaseData
          ? _self.releaseData
          : releaseData // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nendoData: null == nendoData
          ? _self.nendoData
          : nendoData // ignore: cast_nullable_to_non_nullable
              as NendoReleaseData,
    ));
  }

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NendoReleaseDataCopyWith<$Res> get nendoData {
    return $NendoReleaseDataCopyWith<$Res>(_self.nendoData, (value) {
      return _then(_self.copyWith(nendoData: value));
    });
  }
}

/// @nodoc
mixin _$NendoReleaseData {
  String? get imageLink;
  String get name;
  String get productLink;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoReleaseDataCopyWith<NendoReleaseData> get copyWith =>
      _$NendoReleaseDataCopyWithImpl<NendoReleaseData>(
          this as NendoReleaseData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoReleaseData &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productLink, productLink) ||
                other.productLink == productLink));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageLink, name, productLink);

  @override
  String toString() {
    return 'NendoReleaseData(imageLink: $imageLink, name: $name, productLink: $productLink)';
  }
}

/// @nodoc
abstract mixin class $NendoReleaseDataCopyWith<$Res> {
  factory $NendoReleaseDataCopyWith(
          NendoReleaseData value, $Res Function(NendoReleaseData) _then) =
      _$NendoReleaseDataCopyWithImpl;
  @useResult
  $Res call({String? imageLink, String name, String productLink});
}

/// @nodoc
class _$NendoReleaseDataCopyWithImpl<$Res>
    implements $NendoReleaseDataCopyWith<$Res> {
  _$NendoReleaseDataCopyWithImpl(this._self, this._then);

  final NendoReleaseData _self;
  final $Res Function(NendoReleaseData) _then;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageLink = freezed,
    Object? name = null,
    Object? productLink = null,
  }) {
    return _then(_self.copyWith(
      imageLink: freezed == imageLink
          ? _self.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _self.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoReleaseData].
extension NendoReleaseDataPatterns on NendoReleaseData {
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
    TResult Function(_NendoReldeaseData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData() when $default != null:
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
    TResult Function(_NendoReldeaseData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData():
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
    TResult? Function(_NendoReldeaseData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData() when $default != null:
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
    TResult Function(String? imageLink, String name, String productLink)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData() when $default != null:
        return $default(_that.imageLink, _that.name, _that.productLink);
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
    TResult Function(String? imageLink, String name, String productLink)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData():
        return $default(_that.imageLink, _that.name, _that.productLink);
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
    TResult? Function(String? imageLink, String name, String productLink)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoReldeaseData() when $default != null:
        return $default(_that.imageLink, _that.name, _that.productLink);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoReldeaseData implements NendoReleaseData {
  const _NendoReldeaseData(
      {this.imageLink, required this.name, required this.productLink});

  @override
  final String? imageLink;
  @override
  final String name;
  @override
  final String productLink;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoReldeaseDataCopyWith<_NendoReldeaseData> get copyWith =>
      __$NendoReldeaseDataCopyWithImpl<_NendoReldeaseData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoReldeaseData &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productLink, productLink) ||
                other.productLink == productLink));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageLink, name, productLink);

  @override
  String toString() {
    return 'NendoReleaseData(imageLink: $imageLink, name: $name, productLink: $productLink)';
  }
}

/// @nodoc
abstract mixin class _$NendoReldeaseDataCopyWith<$Res>
    implements $NendoReleaseDataCopyWith<$Res> {
  factory _$NendoReldeaseDataCopyWith(
          _NendoReldeaseData value, $Res Function(_NendoReldeaseData) _then) =
      __$NendoReldeaseDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? imageLink, String name, String productLink});
}

/// @nodoc
class __$NendoReldeaseDataCopyWithImpl<$Res>
    implements _$NendoReldeaseDataCopyWith<$Res> {
  __$NendoReldeaseDataCopyWithImpl(this._self, this._then);

  final _NendoReldeaseData _self;
  final $Res Function(_NendoReldeaseData) _then;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageLink = freezed,
    Object? name = null,
    Object? productLink = null,
  }) {
    return _then(_NendoReldeaseData(
      imageLink: freezed == imageLink
          ? _self.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _self.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

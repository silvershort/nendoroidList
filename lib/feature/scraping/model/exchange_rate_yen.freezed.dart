// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_yen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExchangeRateYen {
  @JsonKey(name: 'country')
  List<Country> get countryList;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExchangeRateYenCopyWith<ExchangeRateYen> get copyWith =>
      _$ExchangeRateYenCopyWithImpl<ExchangeRateYen>(
          this as ExchangeRateYen, _$identity);

  /// Serializes this ExchangeRateYen to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExchangeRateYen &&
            const DeepCollectionEquality()
                .equals(other.countryList, countryList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(countryList));

  @override
  String toString() {
    return 'ExchangeRateYen(countryList: $countryList)';
  }
}

/// @nodoc
abstract mixin class $ExchangeRateYenCopyWith<$Res> {
  factory $ExchangeRateYenCopyWith(
          ExchangeRateYen value, $Res Function(ExchangeRateYen) _then) =
      _$ExchangeRateYenCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'country') List<Country> countryList});
}

/// @nodoc
class _$ExchangeRateYenCopyWithImpl<$Res>
    implements $ExchangeRateYenCopyWith<$Res> {
  _$ExchangeRateYenCopyWithImpl(this._self, this._then);

  final ExchangeRateYen _self;
  final $Res Function(ExchangeRateYen) _then;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryList = null,
  }) {
    return _then(_self.copyWith(
      countryList: null == countryList
          ? _self.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExchangeRateYen].
extension ExchangeRateYenPatterns on ExchangeRateYen {
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
    TResult Function(_ExchangeRateYen value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen() when $default != null:
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
    TResult Function(_ExchangeRateYen value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen():
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
    TResult? Function(_ExchangeRateYen value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen() when $default != null:
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
    TResult Function(@JsonKey(name: 'country') List<Country> countryList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen() when $default != null:
        return $default(_that.countryList);
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
    TResult Function(@JsonKey(name: 'country') List<Country> countryList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen():
        return $default(_that.countryList);
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
    TResult? Function(@JsonKey(name: 'country') List<Country> countryList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExchangeRateYen() when $default != null:
        return $default(_that.countryList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExchangeRateYen implements ExchangeRateYen {
  const _ExchangeRateYen(
      {@JsonKey(name: 'country') required final List<Country> countryList})
      : _countryList = countryList;
  factory _ExchangeRateYen.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateYenFromJson(json);

  final List<Country> _countryList;
  @override
  @JsonKey(name: 'country')
  List<Country> get countryList {
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExchangeRateYenCopyWith<_ExchangeRateYen> get copyWith =>
      __$ExchangeRateYenCopyWithImpl<_ExchangeRateYen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExchangeRateYenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExchangeRateYen &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_countryList));

  @override
  String toString() {
    return 'ExchangeRateYen(countryList: $countryList)';
  }
}

/// @nodoc
abstract mixin class _$ExchangeRateYenCopyWith<$Res>
    implements $ExchangeRateYenCopyWith<$Res> {
  factory _$ExchangeRateYenCopyWith(
          _ExchangeRateYen value, $Res Function(_ExchangeRateYen) _then) =
      __$ExchangeRateYenCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'country') List<Country> countryList});
}

/// @nodoc
class __$ExchangeRateYenCopyWithImpl<$Res>
    implements _$ExchangeRateYenCopyWith<$Res> {
  __$ExchangeRateYenCopyWithImpl(this._self, this._then);

  final _ExchangeRateYen _self;
  final $Res Function(_ExchangeRateYen) _then;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countryList = null,
  }) {
    return _then(_ExchangeRateYen(
      countryList: null == countryList
          ? _self._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// @nodoc
mixin _$Country {
  String get value;
  String get subValue;
  String get currencyUnit;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryCopyWith<Country> get copyWith =>
      _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Country &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.subValue, subValue) ||
                other.subValue == subValue) &&
            (identical(other.currencyUnit, currencyUnit) ||
                other.currencyUnit == currencyUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, subValue, currencyUnit);

  @override
  String toString() {
    return 'Country(value: $value, subValue: $subValue, currencyUnit: $currencyUnit)';
  }
}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) =
      _$CountryCopyWithImpl;
  @useResult
  $Res call({String value, String subValue, String currencyUnit});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? subValue = null,
    Object? currencyUnit = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      subValue: null == subValue
          ? _self.subValue
          : subValue // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _self.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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
    TResult Function(_Country value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
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
    TResult Function(_Country value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country():
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
    TResult? Function(_Country value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
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
    TResult Function(String value, String subValue, String currencyUnit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
        return $default(_that.value, _that.subValue, _that.currencyUnit);
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
    TResult Function(String value, String subValue, String currencyUnit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country():
        return $default(_that.value, _that.subValue, _that.currencyUnit);
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
    TResult? Function(String value, String subValue, String currencyUnit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Country() when $default != null:
        return $default(_that.value, _that.subValue, _that.currencyUnit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Country implements Country {
  const _Country(
      {required this.value,
      required this.subValue,
      required this.currencyUnit});
  factory _Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @override
  final String value;
  @override
  final String subValue;
  @override
  final String currencyUnit;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Country &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.subValue, subValue) ||
                other.subValue == subValue) &&
            (identical(other.currencyUnit, currencyUnit) ||
                other.currencyUnit == currencyUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, subValue, currencyUnit);

  @override
  String toString() {
    return 'Country(value: $value, subValue: $subValue, currencyUnit: $currencyUnit)';
  }
}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) =
      __$CountryCopyWithImpl;
  @override
  @useResult
  $Res call({String value, String subValue, String currencyUnit});
}

/// @nodoc
class __$CountryCopyWithImpl<$Res> implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? subValue = null,
    Object? currencyUnit = null,
  }) {
    return _then(_Country(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      subValue: null == subValue
          ? _self.subValue
          : subValue // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _self.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

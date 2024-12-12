// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_rate_yen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeRateYen _$ExchangeRateYenFromJson(Map<String, dynamic> json) {
  return _ExchangeRateYen.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRateYen {
  @JsonKey(name: 'country')
  List<Country> get countryList => throw _privateConstructorUsedError;

  /// Serializes this ExchangeRateYen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeRateYenCopyWith<ExchangeRateYen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRateYenCopyWith<$Res> {
  factory $ExchangeRateYenCopyWith(
          ExchangeRateYen value, $Res Function(ExchangeRateYen) then) =
      _$ExchangeRateYenCopyWithImpl<$Res, ExchangeRateYen>;
  @useResult
  $Res call({@JsonKey(name: 'country') List<Country> countryList});
}

/// @nodoc
class _$ExchangeRateYenCopyWithImpl<$Res, $Val extends ExchangeRateYen>
    implements $ExchangeRateYenCopyWith<$Res> {
  _$ExchangeRateYenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryList = null,
  }) {
    return _then(_value.copyWith(
      countryList: null == countryList
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeRateYenImplCopyWith<$Res>
    implements $ExchangeRateYenCopyWith<$Res> {
  factory _$$ExchangeRateYenImplCopyWith(_$ExchangeRateYenImpl value,
          $Res Function(_$ExchangeRateYenImpl) then) =
      __$$ExchangeRateYenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'country') List<Country> countryList});
}

/// @nodoc
class __$$ExchangeRateYenImplCopyWithImpl<$Res>
    extends _$ExchangeRateYenCopyWithImpl<$Res, _$ExchangeRateYenImpl>
    implements _$$ExchangeRateYenImplCopyWith<$Res> {
  __$$ExchangeRateYenImplCopyWithImpl(
      _$ExchangeRateYenImpl _value, $Res Function(_$ExchangeRateYenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryList = null,
  }) {
    return _then(_$ExchangeRateYenImpl(
      countryList: null == countryList
          ? _value._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeRateYenImpl implements _ExchangeRateYen {
  const _$ExchangeRateYenImpl(
      {@JsonKey(name: 'country') required final List<Country> countryList})
      : _countryList = countryList;

  factory _$ExchangeRateYenImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeRateYenImplFromJson(json);

  final List<Country> _countryList;
  @override
  @JsonKey(name: 'country')
  List<Country> get countryList {
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

  @override
  String toString() {
    return 'ExchangeRateYen(countryList: $countryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeRateYenImpl &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_countryList));

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeRateYenImplCopyWith<_$ExchangeRateYenImpl> get copyWith =>
      __$$ExchangeRateYenImplCopyWithImpl<_$ExchangeRateYenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeRateYenImplToJson(
      this,
    );
  }
}

abstract class _ExchangeRateYen implements ExchangeRateYen {
  const factory _ExchangeRateYen(
      {@JsonKey(name: 'country')
      required final List<Country> countryList}) = _$ExchangeRateYenImpl;

  factory _ExchangeRateYen.fromJson(Map<String, dynamic> json) =
      _$ExchangeRateYenImpl.fromJson;

  @override
  @JsonKey(name: 'country')
  List<Country> get countryList;

  /// Create a copy of ExchangeRateYen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeRateYenImplCopyWith<_$ExchangeRateYenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String get value => throw _privateConstructorUsedError;
  String get subValue => throw _privateConstructorUsedError;
  String get currencyUnit => throw _privateConstructorUsedError;

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String value, String subValue, String currencyUnit});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? subValue = null,
    Object? currencyUnit = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      subValue: null == subValue
          ? _value.subValue
          : subValue // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _value.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String subValue, String currencyUnit});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? subValue = null,
    Object? currencyUnit = null,
  }) {
    return _then(_$CountryImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      subValue: null == subValue
          ? _value.subValue
          : subValue // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _value.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {required this.value,
      required this.subValue,
      required this.currencyUnit});

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final String value;
  @override
  final String subValue;
  @override
  final String currencyUnit;

  @override
  String toString() {
    return 'Country(value: $value, subValue: $subValue, currencyUnit: $currencyUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.subValue, subValue) ||
                other.subValue == subValue) &&
            (identical(other.currencyUnit, currencyUnit) ||
                other.currencyUnit == currencyUnit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, subValue, currencyUnit);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final String value,
      required final String subValue,
      required final String currencyUnit}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  String get value;
  @override
  String get subValue;
  @override
  String get currencyUnit;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

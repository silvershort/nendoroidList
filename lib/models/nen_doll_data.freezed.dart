// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nen_doll_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NenDollData _$NenDollDataFromJson(Map<String, dynamic> json) {
  return _NenDollData.fromJson(json);
}

/// @nodoc
mixin _$NenDollData {
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'gsc_productNum')
  int get gscProductNum => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  List<String>? get releaseDate => throw _privateConstructorUsedError;
  Series get series => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this NenDollData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NenDollData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NenDollDataCopyWith<NenDollData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NenDollDataCopyWith<$Res> {
  factory $NenDollDataCopyWith(
          NenDollData value, $Res Function(NenDollData) then) =
      _$NenDollDataCopyWithImpl<$Res, NenDollData>;
  @useResult
  $Res call(
      {String? gender,
      @JsonKey(name: 'gsc_productNum') int gscProductNum,
      String image,
      Name name,
      int price,
      @JsonKey(name: 'release_date') List<String>? releaseDate,
      Series series,
      String type});
}

/// @nodoc
class _$NenDollDataCopyWithImpl<$Res, $Val extends NenDollData>
    implements $NenDollDataCopyWith<$Res> {
  _$NenDollDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NenDollData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = freezed,
    Object? gscProductNum = null,
    Object? image = null,
    Object? name = null,
    Object? price = null,
    Object? releaseDate = freezed,
    Object? series = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gscProductNum: null == gscProductNum
          ? _value.gscProductNum
          : gscProductNum // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NenDollDataImplCopyWith<$Res>
    implements $NenDollDataCopyWith<$Res> {
  factory _$$NenDollDataImplCopyWith(
          _$NenDollDataImpl value, $Res Function(_$NenDollDataImpl) then) =
      __$$NenDollDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? gender,
      @JsonKey(name: 'gsc_productNum') int gscProductNum,
      String image,
      Name name,
      int price,
      @JsonKey(name: 'release_date') List<String>? releaseDate,
      Series series,
      String type});
}

/// @nodoc
class __$$NenDollDataImplCopyWithImpl<$Res>
    extends _$NenDollDataCopyWithImpl<$Res, _$NenDollDataImpl>
    implements _$$NenDollDataImplCopyWith<$Res> {
  __$$NenDollDataImplCopyWithImpl(
      _$NenDollDataImpl _value, $Res Function(_$NenDollDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NenDollData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = freezed,
    Object? gscProductNum = null,
    Object? image = null,
    Object? name = null,
    Object? price = null,
    Object? releaseDate = freezed,
    Object? series = null,
    Object? type = null,
  }) {
    return _then(_$NenDollDataImpl(
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gscProductNum: null == gscProductNum
          ? _value.gscProductNum
          : gscProductNum // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: freezed == releaseDate
          ? _value._releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NenDollDataImpl implements _NenDollData {
  const _$NenDollDataImpl(
      {this.gender,
      @JsonKey(name: 'gsc_productNum') required this.gscProductNum,
      required this.image,
      required this.name,
      required this.price,
      @JsonKey(name: 'release_date') final List<String>? releaseDate,
      required this.series,
      required this.type})
      : _releaseDate = releaseDate;

  factory _$NenDollDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NenDollDataImplFromJson(json);

  @override
  final String? gender;
  @override
  @JsonKey(name: 'gsc_productNum')
  final int gscProductNum;
  @override
  final String image;
  @override
  final Name name;
  @override
  final int price;
  final List<String>? _releaseDate;
  @override
  @JsonKey(name: 'release_date')
  List<String>? get releaseDate {
    final value = _releaseDate;
    if (value == null) return null;
    if (_releaseDate is EqualUnmodifiableListView) return _releaseDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Series series;
  @override
  final String type;

  @override
  String toString() {
    return 'NenDollData(gender: $gender, gscProductNum: $gscProductNum, image: $image, name: $name, price: $price, releaseDate: $releaseDate, series: $series, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NenDollDataImpl &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.gscProductNum, gscProductNum) ||
                other.gscProductNum == gscProductNum) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._releaseDate, _releaseDate) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gender,
      gscProductNum,
      image,
      name,
      price,
      const DeepCollectionEquality().hash(_releaseDate),
      series,
      type);

  /// Create a copy of NenDollData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NenDollDataImplCopyWith<_$NenDollDataImpl> get copyWith =>
      __$$NenDollDataImplCopyWithImpl<_$NenDollDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NenDollDataImplToJson(
      this,
    );
  }
}

abstract class _NenDollData implements NenDollData {
  const factory _NenDollData(
      {final String? gender,
      @JsonKey(name: 'gsc_productNum') required final int gscProductNum,
      required final String image,
      required final Name name,
      required final int price,
      @JsonKey(name: 'release_date') final List<String>? releaseDate,
      required final Series series,
      required final String type}) = _$NenDollDataImpl;

  factory _NenDollData.fromJson(Map<String, dynamic> json) =
      _$NenDollDataImpl.fromJson;

  @override
  String? get gender;
  @override
  @JsonKey(name: 'gsc_productNum')
  int get gscProductNum;
  @override
  String get image;
  @override
  Name get name;
  @override
  int get price;
  @override
  @JsonKey(name: 'release_date')
  List<String>? get releaseDate;
  @override
  Series get series;
  @override
  String get type;

  /// Create a copy of NenDollData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NenDollDataImplCopyWith<_$NenDollDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

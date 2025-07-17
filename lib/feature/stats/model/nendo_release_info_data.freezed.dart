// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_release_info_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NendoRelaseInfoData {
  DateTime get lastReleaseDate => throw _privateConstructorUsedError;
  List<MonthReleaseData> get monthReleaseList =>
      throw _privateConstructorUsedError;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NendoRelaseInfoDataCopyWith<NendoRelaseInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoRelaseInfoDataCopyWith<$Res> {
  factory $NendoRelaseInfoDataCopyWith(
          NendoRelaseInfoData value, $Res Function(NendoRelaseInfoData) then) =
      _$NendoRelaseInfoDataCopyWithImpl<$Res, NendoRelaseInfoData>;
  @useResult
  $Res call(
      {DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList});
}

/// @nodoc
class _$NendoRelaseInfoDataCopyWithImpl<$Res, $Val extends NendoRelaseInfoData>
    implements $NendoRelaseInfoDataCopyWith<$Res> {
  _$NendoRelaseInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReleaseDate = null,
    Object? monthReleaseList = null,
  }) {
    return _then(_value.copyWith(
      lastReleaseDate: null == lastReleaseDate
          ? _value.lastReleaseDate
          : lastReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthReleaseList: null == monthReleaseList
          ? _value.monthReleaseList
          : monthReleaseList // ignore: cast_nullable_to_non_nullable
              as List<MonthReleaseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NendoRelaseInfoDataImplCopyWith<$Res>
    implements $NendoRelaseInfoDataCopyWith<$Res> {
  factory _$$NendoRelaseInfoDataImplCopyWith(_$NendoRelaseInfoDataImpl value,
          $Res Function(_$NendoRelaseInfoDataImpl) then) =
      __$$NendoRelaseInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime lastReleaseDate, List<MonthReleaseData> monthReleaseList});
}

/// @nodoc
class __$$NendoRelaseInfoDataImplCopyWithImpl<$Res>
    extends _$NendoRelaseInfoDataCopyWithImpl<$Res, _$NendoRelaseInfoDataImpl>
    implements _$$NendoRelaseInfoDataImplCopyWith<$Res> {
  __$$NendoRelaseInfoDataImplCopyWithImpl(_$NendoRelaseInfoDataImpl _value,
      $Res Function(_$NendoRelaseInfoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastReleaseDate = null,
    Object? monthReleaseList = null,
  }) {
    return _then(_$NendoRelaseInfoDataImpl(
      lastReleaseDate: null == lastReleaseDate
          ? _value.lastReleaseDate
          : lastReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthReleaseList: null == monthReleaseList
          ? _value._monthReleaseList
          : monthReleaseList // ignore: cast_nullable_to_non_nullable
              as List<MonthReleaseData>,
    ));
  }
}

/// @nodoc

class _$NendoRelaseInfoDataImpl implements _NendoRelaseInfoData {
  const _$NendoRelaseInfoDataImpl(
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

  @override
  String toString() {
    return 'NendoRelaseInfoData(lastReleaseDate: $lastReleaseDate, monthReleaseList: $monthReleaseList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NendoRelaseInfoDataImpl &&
            (identical(other.lastReleaseDate, lastReleaseDate) ||
                other.lastReleaseDate == lastReleaseDate) &&
            const DeepCollectionEquality()
                .equals(other._monthReleaseList, _monthReleaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastReleaseDate,
      const DeepCollectionEquality().hash(_monthReleaseList));

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NendoRelaseInfoDataImplCopyWith<_$NendoRelaseInfoDataImpl> get copyWith =>
      __$$NendoRelaseInfoDataImplCopyWithImpl<_$NendoRelaseInfoDataImpl>(
          this, _$identity);
}

abstract class _NendoRelaseInfoData implements NendoRelaseInfoData {
  const factory _NendoRelaseInfoData(
          {required final DateTime lastReleaseDate,
          required final List<MonthReleaseData> monthReleaseList}) =
      _$NendoRelaseInfoDataImpl;

  @override
  DateTime get lastReleaseDate;
  @override
  List<MonthReleaseData> get monthReleaseList;

  /// Create a copy of NendoRelaseInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NendoRelaseInfoDataImplCopyWith<_$NendoRelaseInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthReleaseData {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  List<ReleaseData> get releaseList => throw _privateConstructorUsedError;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthReleaseDataCopyWith<MonthReleaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthReleaseDataCopyWith<$Res> {
  factory $MonthReleaseDataCopyWith(
          MonthReleaseData value, $Res Function(MonthReleaseData) then) =
      _$MonthReleaseDataCopyWithImpl<$Res, MonthReleaseData>;
  @useResult
  $Res call({int year, int month, List<ReleaseData> releaseList});
}

/// @nodoc
class _$MonthReleaseDataCopyWithImpl<$Res, $Val extends MonthReleaseData>
    implements $MonthReleaseDataCopyWith<$Res> {
  _$MonthReleaseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? releaseList = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      releaseList: null == releaseList
          ? _value.releaseList
          : releaseList // ignore: cast_nullable_to_non_nullable
              as List<ReleaseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthReleaseDataImplCopyWith<$Res>
    implements $MonthReleaseDataCopyWith<$Res> {
  factory _$$MonthReleaseDataImplCopyWith(_$MonthReleaseDataImpl value,
          $Res Function(_$MonthReleaseDataImpl) then) =
      __$$MonthReleaseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, List<ReleaseData> releaseList});
}

/// @nodoc
class __$$MonthReleaseDataImplCopyWithImpl<$Res>
    extends _$MonthReleaseDataCopyWithImpl<$Res, _$MonthReleaseDataImpl>
    implements _$$MonthReleaseDataImplCopyWith<$Res> {
  __$$MonthReleaseDataImplCopyWithImpl(_$MonthReleaseDataImpl _value,
      $Res Function(_$MonthReleaseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? releaseList = null,
  }) {
    return _then(_$MonthReleaseDataImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      releaseList: null == releaseList
          ? _value._releaseList
          : releaseList // ignore: cast_nullable_to_non_nullable
              as List<ReleaseData>,
    ));
  }
}

/// @nodoc

class _$MonthReleaseDataImpl implements _MonthReleaseData {
  const _$MonthReleaseDataImpl(
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

  @override
  String toString() {
    return 'MonthReleaseData(year: $year, month: $month, releaseList: $releaseList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthReleaseDataImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality()
                .equals(other._releaseList, _releaseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month,
      const DeepCollectionEquality().hash(_releaseList));

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthReleaseDataImplCopyWith<_$MonthReleaseDataImpl> get copyWith =>
      __$$MonthReleaseDataImplCopyWithImpl<_$MonthReleaseDataImpl>(
          this, _$identity);
}

abstract class _MonthReleaseData implements MonthReleaseData {
  const factory _MonthReleaseData(
      {required final int year,
      required final int month,
      required final List<ReleaseData> releaseList}) = _$MonthReleaseDataImpl;

  @override
  int get year;
  @override
  int get month;
  @override
  List<ReleaseData> get releaseList;

  /// Create a copy of MonthReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthReleaseDataImplCopyWith<_$MonthReleaseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReleaseData {
  DateTime get releaseData => throw _privateConstructorUsedError;
  NendoReleaseData get nendoData => throw _privateConstructorUsedError;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReleaseDataCopyWith<ReleaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseDataCopyWith<$Res> {
  factory $ReleaseDataCopyWith(
          ReleaseData value, $Res Function(ReleaseData) then) =
      _$ReleaseDataCopyWithImpl<$Res, ReleaseData>;
  @useResult
  $Res call({DateTime releaseData, NendoReleaseData nendoData});

  $NendoReleaseDataCopyWith<$Res> get nendoData;
}

/// @nodoc
class _$ReleaseDataCopyWithImpl<$Res, $Val extends ReleaseData>
    implements $ReleaseDataCopyWith<$Res> {
  _$ReleaseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releaseData = null,
    Object? nendoData = null,
  }) {
    return _then(_value.copyWith(
      releaseData: null == releaseData
          ? _value.releaseData
          : releaseData // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nendoData: null == nendoData
          ? _value.nendoData
          : nendoData // ignore: cast_nullable_to_non_nullable
              as NendoReleaseData,
    ) as $Val);
  }

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NendoReleaseDataCopyWith<$Res> get nendoData {
    return $NendoReleaseDataCopyWith<$Res>(_value.nendoData, (value) {
      return _then(_value.copyWith(nendoData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReleaseDataImplCopyWith<$Res>
    implements $ReleaseDataCopyWith<$Res> {
  factory _$$ReleaseDataImplCopyWith(
          _$ReleaseDataImpl value, $Res Function(_$ReleaseDataImpl) then) =
      __$$ReleaseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime releaseData, NendoReleaseData nendoData});

  @override
  $NendoReleaseDataCopyWith<$Res> get nendoData;
}

/// @nodoc
class __$$ReleaseDataImplCopyWithImpl<$Res>
    extends _$ReleaseDataCopyWithImpl<$Res, _$ReleaseDataImpl>
    implements _$$ReleaseDataImplCopyWith<$Res> {
  __$$ReleaseDataImplCopyWithImpl(
      _$ReleaseDataImpl _value, $Res Function(_$ReleaseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releaseData = null,
    Object? nendoData = null,
  }) {
    return _then(_$ReleaseDataImpl(
      releaseData: null == releaseData
          ? _value.releaseData
          : releaseData // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nendoData: null == nendoData
          ? _value.nendoData
          : nendoData // ignore: cast_nullable_to_non_nullable
              as NendoReleaseData,
    ));
  }
}

/// @nodoc

class _$ReleaseDataImpl implements _ReleaseData {
  const _$ReleaseDataImpl({required this.releaseData, required this.nendoData});

  @override
  final DateTime releaseData;
  @override
  final NendoReleaseData nendoData;

  @override
  String toString() {
    return 'ReleaseData(releaseData: $releaseData, nendoData: $nendoData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReleaseDataImpl &&
            (identical(other.releaseData, releaseData) ||
                other.releaseData == releaseData) &&
            (identical(other.nendoData, nendoData) ||
                other.nendoData == nendoData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, releaseData, nendoData);

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReleaseDataImplCopyWith<_$ReleaseDataImpl> get copyWith =>
      __$$ReleaseDataImplCopyWithImpl<_$ReleaseDataImpl>(this, _$identity);
}

abstract class _ReleaseData implements ReleaseData {
  const factory _ReleaseData(
      {required final DateTime releaseData,
      required final NendoReleaseData nendoData}) = _$ReleaseDataImpl;

  @override
  DateTime get releaseData;
  @override
  NendoReleaseData get nendoData;

  /// Create a copy of ReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReleaseDataImplCopyWith<_$ReleaseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NendoReleaseData {
  String? get imageLink => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get productLink => throw _privateConstructorUsedError;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NendoReleaseDataCopyWith<NendoReleaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoReleaseDataCopyWith<$Res> {
  factory $NendoReleaseDataCopyWith(
          NendoReleaseData value, $Res Function(NendoReleaseData) then) =
      _$NendoReleaseDataCopyWithImpl<$Res, NendoReleaseData>;
  @useResult
  $Res call({String? imageLink, String name, String productLink});
}

/// @nodoc
class _$NendoReleaseDataCopyWithImpl<$Res, $Val extends NendoReleaseData>
    implements $NendoReleaseDataCopyWith<$Res> {
  _$NendoReleaseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageLink = freezed,
    Object? name = null,
    Object? productLink = null,
  }) {
    return _then(_value.copyWith(
      imageLink: freezed == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _value.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NendoReldeaseDataImplCopyWith<$Res>
    implements $NendoReleaseDataCopyWith<$Res> {
  factory _$$NendoReldeaseDataImplCopyWith(_$NendoReldeaseDataImpl value,
          $Res Function(_$NendoReldeaseDataImpl) then) =
      __$$NendoReldeaseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageLink, String name, String productLink});
}

/// @nodoc
class __$$NendoReldeaseDataImplCopyWithImpl<$Res>
    extends _$NendoReleaseDataCopyWithImpl<$Res, _$NendoReldeaseDataImpl>
    implements _$$NendoReldeaseDataImplCopyWith<$Res> {
  __$$NendoReldeaseDataImplCopyWithImpl(_$NendoReldeaseDataImpl _value,
      $Res Function(_$NendoReldeaseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageLink = freezed,
    Object? name = null,
    Object? productLink = null,
  }) {
    return _then(_$NendoReldeaseDataImpl(
      imageLink: freezed == imageLink
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productLink: null == productLink
          ? _value.productLink
          : productLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NendoReldeaseDataImpl implements _NendoReldeaseData {
  const _$NendoReldeaseDataImpl(
      {this.imageLink, required this.name, required this.productLink});

  @override
  final String? imageLink;
  @override
  final String name;
  @override
  final String productLink;

  @override
  String toString() {
    return 'NendoReleaseData(imageLink: $imageLink, name: $name, productLink: $productLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NendoReldeaseDataImpl &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productLink, productLink) ||
                other.productLink == productLink));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageLink, name, productLink);

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NendoReldeaseDataImplCopyWith<_$NendoReldeaseDataImpl> get copyWith =>
      __$$NendoReldeaseDataImplCopyWithImpl<_$NendoReldeaseDataImpl>(
          this, _$identity);
}

abstract class _NendoReldeaseData implements NendoReleaseData {
  const factory _NendoReldeaseData(
      {final String? imageLink,
      required final String name,
      required final String productLink}) = _$NendoReldeaseDataImpl;

  @override
  String? get imageLink;
  @override
  String get name;
  @override
  String get productLink;

  /// Create a copy of NendoReleaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NendoReldeaseDataImplCopyWith<_$NendoReldeaseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

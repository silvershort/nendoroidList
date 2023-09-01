// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubscribeData {
  @HiveField(0)
  TwitterSubscribe get twitterSubscribe => throw _privateConstructorUsedError;
  @HiveField(1)
  DcinsideSubscribe get dcinsideSubscribe => throw _privateConstructorUsedError;
  @HiveField(2)
  RuliwebSubscribe get ruliwebSubscribe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscribeDataCopyWith<SubscribeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeDataCopyWith<$Res> {
  factory $SubscribeDataCopyWith(
          SubscribeData value, $Res Function(SubscribeData) then) =
      _$SubscribeDataCopyWithImpl<$Res, SubscribeData>;
  @useResult
  $Res call(
      {@HiveField(0) TwitterSubscribe twitterSubscribe,
      @HiveField(1) DcinsideSubscribe dcinsideSubscribe,
      @HiveField(2) RuliwebSubscribe ruliwebSubscribe});

  $TwitterSubscribeCopyWith<$Res> get twitterSubscribe;
  $DcinsideSubscribeCopyWith<$Res> get dcinsideSubscribe;
  $RuliwebSubscribeCopyWith<$Res> get ruliwebSubscribe;
}

/// @nodoc
class _$SubscribeDataCopyWithImpl<$Res, $Val extends SubscribeData>
    implements $SubscribeDataCopyWith<$Res> {
  _$SubscribeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twitterSubscribe = null,
    Object? dcinsideSubscribe = null,
    Object? ruliwebSubscribe = null,
  }) {
    return _then(_value.copyWith(
      twitterSubscribe: null == twitterSubscribe
          ? _value.twitterSubscribe
          : twitterSubscribe // ignore: cast_nullable_to_non_nullable
              as TwitterSubscribe,
      dcinsideSubscribe: null == dcinsideSubscribe
          ? _value.dcinsideSubscribe
          : dcinsideSubscribe // ignore: cast_nullable_to_non_nullable
              as DcinsideSubscribe,
      ruliwebSubscribe: null == ruliwebSubscribe
          ? _value.ruliwebSubscribe
          : ruliwebSubscribe // ignore: cast_nullable_to_non_nullable
              as RuliwebSubscribe,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TwitterSubscribeCopyWith<$Res> get twitterSubscribe {
    return $TwitterSubscribeCopyWith<$Res>(_value.twitterSubscribe, (value) {
      return _then(_value.copyWith(twitterSubscribe: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DcinsideSubscribeCopyWith<$Res> get dcinsideSubscribe {
    return $DcinsideSubscribeCopyWith<$Res>(_value.dcinsideSubscribe, (value) {
      return _then(_value.copyWith(dcinsideSubscribe: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RuliwebSubscribeCopyWith<$Res> get ruliwebSubscribe {
    return $RuliwebSubscribeCopyWith<$Res>(_value.ruliwebSubscribe, (value) {
      return _then(_value.copyWith(ruliwebSubscribe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubscribeDataCopyWith<$Res>
    implements $SubscribeDataCopyWith<$Res> {
  factory _$$_SubscribeDataCopyWith(
          _$_SubscribeData value, $Res Function(_$_SubscribeData) then) =
      __$$_SubscribeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) TwitterSubscribe twitterSubscribe,
      @HiveField(1) DcinsideSubscribe dcinsideSubscribe,
      @HiveField(2) RuliwebSubscribe ruliwebSubscribe});

  @override
  $TwitterSubscribeCopyWith<$Res> get twitterSubscribe;
  @override
  $DcinsideSubscribeCopyWith<$Res> get dcinsideSubscribe;
  @override
  $RuliwebSubscribeCopyWith<$Res> get ruliwebSubscribe;
}

/// @nodoc
class __$$_SubscribeDataCopyWithImpl<$Res>
    extends _$SubscribeDataCopyWithImpl<$Res, _$_SubscribeData>
    implements _$$_SubscribeDataCopyWith<$Res> {
  __$$_SubscribeDataCopyWithImpl(
      _$_SubscribeData _value, $Res Function(_$_SubscribeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twitterSubscribe = null,
    Object? dcinsideSubscribe = null,
    Object? ruliwebSubscribe = null,
  }) {
    return _then(_$_SubscribeData(
      twitterSubscribe: null == twitterSubscribe
          ? _value.twitterSubscribe
          : twitterSubscribe // ignore: cast_nullable_to_non_nullable
              as TwitterSubscribe,
      dcinsideSubscribe: null == dcinsideSubscribe
          ? _value.dcinsideSubscribe
          : dcinsideSubscribe // ignore: cast_nullable_to_non_nullable
              as DcinsideSubscribe,
      ruliwebSubscribe: null == ruliwebSubscribe
          ? _value.ruliwebSubscribe
          : ruliwebSubscribe // ignore: cast_nullable_to_non_nullable
              as RuliwebSubscribe,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 4, adapterName: "SubscribeDataAdapter")
class _$_SubscribeData implements _SubscribeData {
  const _$_SubscribeData(
      {@HiveField(0) this.twitterSubscribe = const TwitterSubscribe(),
      @HiveField(1) this.dcinsideSubscribe = const DcinsideSubscribe(),
      @HiveField(2) this.ruliwebSubscribe = const RuliwebSubscribe()});

  @override
  @JsonKey()
  @HiveField(0)
  final TwitterSubscribe twitterSubscribe;
  @override
  @JsonKey()
  @HiveField(1)
  final DcinsideSubscribe dcinsideSubscribe;
  @override
  @JsonKey()
  @HiveField(2)
  final RuliwebSubscribe ruliwebSubscribe;

  @override
  String toString() {
    return 'SubscribeData(twitterSubscribe: $twitterSubscribe, dcinsideSubscribe: $dcinsideSubscribe, ruliwebSubscribe: $ruliwebSubscribe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscribeData &&
            (identical(other.twitterSubscribe, twitterSubscribe) ||
                other.twitterSubscribe == twitterSubscribe) &&
            (identical(other.dcinsideSubscribe, dcinsideSubscribe) ||
                other.dcinsideSubscribe == dcinsideSubscribe) &&
            (identical(other.ruliwebSubscribe, ruliwebSubscribe) ||
                other.ruliwebSubscribe == ruliwebSubscribe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, twitterSubscribe, dcinsideSubscribe, ruliwebSubscribe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscribeDataCopyWith<_$_SubscribeData> get copyWith =>
      __$$_SubscribeDataCopyWithImpl<_$_SubscribeData>(this, _$identity);
}

abstract class _SubscribeData implements SubscribeData {
  const factory _SubscribeData(
          {@HiveField(0) final TwitterSubscribe twitterSubscribe,
          @HiveField(1) final DcinsideSubscribe dcinsideSubscribe,
          @HiveField(2) final RuliwebSubscribe ruliwebSubscribe}) =
      _$_SubscribeData;

  @override
  @HiveField(0)
  TwitterSubscribe get twitterSubscribe;
  @override
  @HiveField(1)
  DcinsideSubscribe get dcinsideSubscribe;
  @override
  @HiveField(2)
  RuliwebSubscribe get ruliwebSubscribe;
  @override
  @JsonKey(ignore: true)
  _$$_SubscribeDataCopyWith<_$_SubscribeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TwitterSubscribe {
  @HiveField(0)
  bool get goodSmileJP => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get goodSmileUS => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get goodSmileKR => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get ninimal => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get figureInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TwitterSubscribeCopyWith<TwitterSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwitterSubscribeCopyWith<$Res> {
  factory $TwitterSubscribeCopyWith(
          TwitterSubscribe value, $Res Function(TwitterSubscribe) then) =
      _$TwitterSubscribeCopyWithImpl<$Res, TwitterSubscribe>;
  @useResult
  $Res call(
      {@HiveField(0) bool goodSmileJP,
      @HiveField(1) bool goodSmileUS,
      @HiveField(2) bool goodSmileKR,
      @HiveField(3) bool ninimal,
      @HiveField(4) bool figureInfo});
}

/// @nodoc
class _$TwitterSubscribeCopyWithImpl<$Res, $Val extends TwitterSubscribe>
    implements $TwitterSubscribeCopyWith<$Res> {
  _$TwitterSubscribeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodSmileJP = null,
    Object? goodSmileUS = null,
    Object? goodSmileKR = null,
    Object? ninimal = null,
    Object? figureInfo = null,
  }) {
    return _then(_value.copyWith(
      goodSmileJP: null == goodSmileJP
          ? _value.goodSmileJP
          : goodSmileJP // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileUS: null == goodSmileUS
          ? _value.goodSmileUS
          : goodSmileUS // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileKR: null == goodSmileKR
          ? _value.goodSmileKR
          : goodSmileKR // ignore: cast_nullable_to_non_nullable
              as bool,
      ninimal: null == ninimal
          ? _value.ninimal
          : ninimal // ignore: cast_nullable_to_non_nullable
              as bool,
      figureInfo: null == figureInfo
          ? _value.figureInfo
          : figureInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TwitterSubscribeCopyWith<$Res>
    implements $TwitterSubscribeCopyWith<$Res> {
  factory _$$_TwitterSubscribeCopyWith(
          _$_TwitterSubscribe value, $Res Function(_$_TwitterSubscribe) then) =
      __$$_TwitterSubscribeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool goodSmileJP,
      @HiveField(1) bool goodSmileUS,
      @HiveField(2) bool goodSmileKR,
      @HiveField(3) bool ninimal,
      @HiveField(4) bool figureInfo});
}

/// @nodoc
class __$$_TwitterSubscribeCopyWithImpl<$Res>
    extends _$TwitterSubscribeCopyWithImpl<$Res, _$_TwitterSubscribe>
    implements _$$_TwitterSubscribeCopyWith<$Res> {
  __$$_TwitterSubscribeCopyWithImpl(
      _$_TwitterSubscribe _value, $Res Function(_$_TwitterSubscribe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodSmileJP = null,
    Object? goodSmileUS = null,
    Object? goodSmileKR = null,
    Object? ninimal = null,
    Object? figureInfo = null,
  }) {
    return _then(_$_TwitterSubscribe(
      goodSmileJP: null == goodSmileJP
          ? _value.goodSmileJP
          : goodSmileJP // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileUS: null == goodSmileUS
          ? _value.goodSmileUS
          : goodSmileUS // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileKR: null == goodSmileKR
          ? _value.goodSmileKR
          : goodSmileKR // ignore: cast_nullable_to_non_nullable
              as bool,
      ninimal: null == ninimal
          ? _value.ninimal
          : ninimal // ignore: cast_nullable_to_non_nullable
              as bool,
      figureInfo: null == figureInfo
          ? _value.figureInfo
          : figureInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 5, adapterName: "TwitterSubscribeAdapter")
class _$_TwitterSubscribe implements _TwitterSubscribe {
  const _$_TwitterSubscribe(
      {@HiveField(0) this.goodSmileJP = false,
      @HiveField(1) this.goodSmileUS = false,
      @HiveField(2) this.goodSmileKR = true,
      @HiveField(3) this.ninimal = true,
      @HiveField(4) this.figureInfo = true});

  @override
  @JsonKey()
  @HiveField(0)
  final bool goodSmileJP;
  @override
  @JsonKey()
  @HiveField(1)
  final bool goodSmileUS;
  @override
  @JsonKey()
  @HiveField(2)
  final bool goodSmileKR;
  @override
  @JsonKey()
  @HiveField(3)
  final bool ninimal;
  @override
  @JsonKey()
  @HiveField(4)
  final bool figureInfo;

  @override
  String toString() {
    return 'TwitterSubscribe(goodSmileJP: $goodSmileJP, goodSmileUS: $goodSmileUS, goodSmileKR: $goodSmileKR, ninimal: $ninimal, figureInfo: $figureInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TwitterSubscribe &&
            (identical(other.goodSmileJP, goodSmileJP) ||
                other.goodSmileJP == goodSmileJP) &&
            (identical(other.goodSmileUS, goodSmileUS) ||
                other.goodSmileUS == goodSmileUS) &&
            (identical(other.goodSmileKR, goodSmileKR) ||
                other.goodSmileKR == goodSmileKR) &&
            (identical(other.ninimal, ninimal) || other.ninimal == ninimal) &&
            (identical(other.figureInfo, figureInfo) ||
                other.figureInfo == figureInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, goodSmileJP, goodSmileUS, goodSmileKR, ninimal, figureInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TwitterSubscribeCopyWith<_$_TwitterSubscribe> get copyWith =>
      __$$_TwitterSubscribeCopyWithImpl<_$_TwitterSubscribe>(this, _$identity);
}

abstract class _TwitterSubscribe implements TwitterSubscribe {
  const factory _TwitterSubscribe(
      {@HiveField(0) final bool goodSmileJP,
      @HiveField(1) final bool goodSmileUS,
      @HiveField(2) final bool goodSmileKR,
      @HiveField(3) final bool ninimal,
      @HiveField(4) final bool figureInfo}) = _$_TwitterSubscribe;

  @override
  @HiveField(0)
  bool get goodSmileJP;
  @override
  @HiveField(1)
  bool get goodSmileUS;
  @override
  @HiveField(2)
  bool get goodSmileKR;
  @override
  @HiveField(3)
  bool get ninimal;
  @override
  @HiveField(4)
  bool get figureInfo;
  @override
  @JsonKey(ignore: true)
  _$$_TwitterSubscribeCopyWith<_$_TwitterSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DcinsideSubscribe {
  @HiveField(0)
  bool get information => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DcinsideSubscribeCopyWith<DcinsideSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DcinsideSubscribeCopyWith<$Res> {
  factory $DcinsideSubscribeCopyWith(
          DcinsideSubscribe value, $Res Function(DcinsideSubscribe) then) =
      _$DcinsideSubscribeCopyWithImpl<$Res, DcinsideSubscribe>;
  @useResult
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class _$DcinsideSubscribeCopyWithImpl<$Res, $Val extends DcinsideSubscribe>
    implements $DcinsideSubscribeCopyWith<$Res> {
  _$DcinsideSubscribeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? review = null,
  }) {
    return _then(_value.copyWith(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DcinsideSubscribeCopyWith<$Res>
    implements $DcinsideSubscribeCopyWith<$Res> {
  factory _$$_DcinsideSubscribeCopyWith(_$_DcinsideSubscribe value,
          $Res Function(_$_DcinsideSubscribe) then) =
      __$$_DcinsideSubscribeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class __$$_DcinsideSubscribeCopyWithImpl<$Res>
    extends _$DcinsideSubscribeCopyWithImpl<$Res, _$_DcinsideSubscribe>
    implements _$$_DcinsideSubscribeCopyWith<$Res> {
  __$$_DcinsideSubscribeCopyWithImpl(
      _$_DcinsideSubscribe _value, $Res Function(_$_DcinsideSubscribe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? review = null,
  }) {
    return _then(_$_DcinsideSubscribe(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 6, adapterName: "DcinsideSubscribeAdapter")
class _$_DcinsideSubscribe implements _DcinsideSubscribe {
  const _$_DcinsideSubscribe(
      {@HiveField(0) this.information = true,
      @HiveField(1) this.review = true});

  @override
  @JsonKey()
  @HiveField(0)
  final bool information;
  @override
  @JsonKey()
  @HiveField(1)
  final bool review;

  @override
  String toString() {
    return 'DcinsideSubscribe(information: $information, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DcinsideSubscribe &&
            (identical(other.information, information) ||
                other.information == information) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, information, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DcinsideSubscribeCopyWith<_$_DcinsideSubscribe> get copyWith =>
      __$$_DcinsideSubscribeCopyWithImpl<_$_DcinsideSubscribe>(
          this, _$identity);
}

abstract class _DcinsideSubscribe implements DcinsideSubscribe {
  const factory _DcinsideSubscribe(
      {@HiveField(0) final bool information,
      @HiveField(1) final bool review}) = _$_DcinsideSubscribe;

  @override
  @HiveField(0)
  bool get information;
  @override
  @HiveField(1)
  bool get review;
  @override
  @JsonKey(ignore: true)
  _$$_DcinsideSubscribeCopyWith<_$_DcinsideSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RuliwebSubscribe {
  @HiveField(0)
  bool get information => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RuliwebSubscribeCopyWith<RuliwebSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuliwebSubscribeCopyWith<$Res> {
  factory $RuliwebSubscribeCopyWith(
          RuliwebSubscribe value, $Res Function(RuliwebSubscribe) then) =
      _$RuliwebSubscribeCopyWithImpl<$Res, RuliwebSubscribe>;
  @useResult
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class _$RuliwebSubscribeCopyWithImpl<$Res, $Val extends RuliwebSubscribe>
    implements $RuliwebSubscribeCopyWith<$Res> {
  _$RuliwebSubscribeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? review = null,
  }) {
    return _then(_value.copyWith(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RuliwebSubscribeCopyWith<$Res>
    implements $RuliwebSubscribeCopyWith<$Res> {
  factory _$$_RuliwebSubscribeCopyWith(
          _$_RuliwebSubscribe value, $Res Function(_$_RuliwebSubscribe) then) =
      __$$_RuliwebSubscribeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class __$$_RuliwebSubscribeCopyWithImpl<$Res>
    extends _$RuliwebSubscribeCopyWithImpl<$Res, _$_RuliwebSubscribe>
    implements _$$_RuliwebSubscribeCopyWith<$Res> {
  __$$_RuliwebSubscribeCopyWithImpl(
      _$_RuliwebSubscribe _value, $Res Function(_$_RuliwebSubscribe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? information = null,
    Object? review = null,
  }) {
    return _then(_$_RuliwebSubscribe(
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 7, adapterName: "RuliwebSubscribeAdapter")
class _$_RuliwebSubscribe implements _RuliwebSubscribe {
  const _$_RuliwebSubscribe(
      {@HiveField(0) this.information = true,
      @HiveField(1) this.review = true});

  @override
  @JsonKey()
  @HiveField(0)
  final bool information;
  @override
  @JsonKey()
  @HiveField(1)
  final bool review;

  @override
  String toString() {
    return 'RuliwebSubscribe(information: $information, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RuliwebSubscribe &&
            (identical(other.information, information) ||
                other.information == information) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, information, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RuliwebSubscribeCopyWith<_$_RuliwebSubscribe> get copyWith =>
      __$$_RuliwebSubscribeCopyWithImpl<_$_RuliwebSubscribe>(this, _$identity);
}

abstract class _RuliwebSubscribe implements RuliwebSubscribe {
  const factory _RuliwebSubscribe(
      {@HiveField(0) final bool information,
      @HiveField(1) final bool review}) = _$_RuliwebSubscribe;

  @override
  @HiveField(0)
  bool get information;
  @override
  @HiveField(1)
  bool get review;
  @override
  @JsonKey(ignore: true)
  _$$_RuliwebSubscribeCopyWith<_$_RuliwebSubscribe> get copyWith =>
      throw _privateConstructorUsedError;
}

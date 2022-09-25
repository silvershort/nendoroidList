// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$SubscribeDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) TwitterSubscribe twitterSubscribe,
      @HiveField(1) DcinsideSubscribe dcinsideSubscribe,
      @HiveField(2) RuliwebSubscribe ruliwebSubscribe});

  $TwitterSubscribeCopyWith<$Res> get twitterSubscribe;
  $DcinsideSubscribeCopyWith<$Res> get dcinsideSubscribe;
  $RuliwebSubscribeCopyWith<$Res> get ruliwebSubscribe;
}

/// @nodoc
class _$SubscribeDataCopyWithImpl<$Res>
    implements $SubscribeDataCopyWith<$Res> {
  _$SubscribeDataCopyWithImpl(this._value, this._then);

  final SubscribeData _value;
  // ignore: unused_field
  final $Res Function(SubscribeData) _then;

  @override
  $Res call({
    Object? twitterSubscribe = freezed,
    Object? dcinsideSubscribe = freezed,
    Object? ruliwebSubscribe = freezed,
  }) {
    return _then(_value.copyWith(
      twitterSubscribe: twitterSubscribe == freezed
          ? _value.twitterSubscribe
          : twitterSubscribe // ignore: cast_nullable_to_non_nullable
              as TwitterSubscribe,
      dcinsideSubscribe: dcinsideSubscribe == freezed
          ? _value.dcinsideSubscribe
          : dcinsideSubscribe // ignore: cast_nullable_to_non_nullable
              as DcinsideSubscribe,
      ruliwebSubscribe: ruliwebSubscribe == freezed
          ? _value.ruliwebSubscribe
          : ruliwebSubscribe // ignore: cast_nullable_to_non_nullable
              as RuliwebSubscribe,
    ));
  }

  @override
  $TwitterSubscribeCopyWith<$Res> get twitterSubscribe {
    return $TwitterSubscribeCopyWith<$Res>(_value.twitterSubscribe, (value) {
      return _then(_value.copyWith(twitterSubscribe: value));
    });
  }

  @override
  $DcinsideSubscribeCopyWith<$Res> get dcinsideSubscribe {
    return $DcinsideSubscribeCopyWith<$Res>(_value.dcinsideSubscribe, (value) {
      return _then(_value.copyWith(dcinsideSubscribe: value));
    });
  }

  @override
  $RuliwebSubscribeCopyWith<$Res> get ruliwebSubscribe {
    return $RuliwebSubscribeCopyWith<$Res>(_value.ruliwebSubscribe, (value) {
      return _then(_value.copyWith(ruliwebSubscribe: value));
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
    extends _$SubscribeDataCopyWithImpl<$Res>
    implements _$$_SubscribeDataCopyWith<$Res> {
  __$$_SubscribeDataCopyWithImpl(
      _$_SubscribeData _value, $Res Function(_$_SubscribeData) _then)
      : super(_value, (v) => _then(v as _$_SubscribeData));

  @override
  _$_SubscribeData get _value => super._value as _$_SubscribeData;

  @override
  $Res call({
    Object? twitterSubscribe = freezed,
    Object? dcinsideSubscribe = freezed,
    Object? ruliwebSubscribe = freezed,
  }) {
    return _then(_$_SubscribeData(
      twitterSubscribe: twitterSubscribe == freezed
          ? _value.twitterSubscribe
          : twitterSubscribe // ignore: cast_nullable_to_non_nullable
              as TwitterSubscribe,
      dcinsideSubscribe: dcinsideSubscribe == freezed
          ? _value.dcinsideSubscribe
          : dcinsideSubscribe // ignore: cast_nullable_to_non_nullable
              as DcinsideSubscribe,
      ruliwebSubscribe: ruliwebSubscribe == freezed
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
      {@HiveField(0) required this.twitterSubscribe,
      @HiveField(1) required this.dcinsideSubscribe,
      @HiveField(2) required this.ruliwebSubscribe});

  @override
  @HiveField(0)
  final TwitterSubscribe twitterSubscribe;
  @override
  @HiveField(1)
  final DcinsideSubscribe dcinsideSubscribe;
  @override
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
            const DeepCollectionEquality()
                .equals(other.twitterSubscribe, twitterSubscribe) &&
            const DeepCollectionEquality()
                .equals(other.dcinsideSubscribe, dcinsideSubscribe) &&
            const DeepCollectionEquality()
                .equals(other.ruliwebSubscribe, ruliwebSubscribe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(twitterSubscribe),
      const DeepCollectionEquality().hash(dcinsideSubscribe),
      const DeepCollectionEquality().hash(ruliwebSubscribe));

  @JsonKey(ignore: true)
  @override
  _$$_SubscribeDataCopyWith<_$_SubscribeData> get copyWith =>
      __$$_SubscribeDataCopyWithImpl<_$_SubscribeData>(this, _$identity);
}

abstract class _SubscribeData implements SubscribeData {
  const factory _SubscribeData(
          {@HiveField(0) required final TwitterSubscribe twitterSubscribe,
          @HiveField(1) required final DcinsideSubscribe dcinsideSubscribe,
          @HiveField(2) required final RuliwebSubscribe ruliwebSubscribe}) =
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
      _$TwitterSubscribeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool goodSmileJP,
      @HiveField(1) bool goodSmileUS,
      @HiveField(2) bool goodSmileKR,
      @HiveField(3) bool ninimal,
      @HiveField(4) bool figureInfo});
}

/// @nodoc
class _$TwitterSubscribeCopyWithImpl<$Res>
    implements $TwitterSubscribeCopyWith<$Res> {
  _$TwitterSubscribeCopyWithImpl(this._value, this._then);

  final TwitterSubscribe _value;
  // ignore: unused_field
  final $Res Function(TwitterSubscribe) _then;

  @override
  $Res call({
    Object? goodSmileJP = freezed,
    Object? goodSmileUS = freezed,
    Object? goodSmileKR = freezed,
    Object? ninimal = freezed,
    Object? figureInfo = freezed,
  }) {
    return _then(_value.copyWith(
      goodSmileJP: goodSmileJP == freezed
          ? _value.goodSmileJP
          : goodSmileJP // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileUS: goodSmileUS == freezed
          ? _value.goodSmileUS
          : goodSmileUS // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileKR: goodSmileKR == freezed
          ? _value.goodSmileKR
          : goodSmileKR // ignore: cast_nullable_to_non_nullable
              as bool,
      ninimal: ninimal == freezed
          ? _value.ninimal
          : ninimal // ignore: cast_nullable_to_non_nullable
              as bool,
      figureInfo: figureInfo == freezed
          ? _value.figureInfo
          : figureInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TwitterSubscribeCopyWith<$Res>
    implements $TwitterSubscribeCopyWith<$Res> {
  factory _$$_TwitterSubscribeCopyWith(
          _$_TwitterSubscribe value, $Res Function(_$_TwitterSubscribe) then) =
      __$$_TwitterSubscribeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool goodSmileJP,
      @HiveField(1) bool goodSmileUS,
      @HiveField(2) bool goodSmileKR,
      @HiveField(3) bool ninimal,
      @HiveField(4) bool figureInfo});
}

/// @nodoc
class __$$_TwitterSubscribeCopyWithImpl<$Res>
    extends _$TwitterSubscribeCopyWithImpl<$Res>
    implements _$$_TwitterSubscribeCopyWith<$Res> {
  __$$_TwitterSubscribeCopyWithImpl(
      _$_TwitterSubscribe _value, $Res Function(_$_TwitterSubscribe) _then)
      : super(_value, (v) => _then(v as _$_TwitterSubscribe));

  @override
  _$_TwitterSubscribe get _value => super._value as _$_TwitterSubscribe;

  @override
  $Res call({
    Object? goodSmileJP = freezed,
    Object? goodSmileUS = freezed,
    Object? goodSmileKR = freezed,
    Object? ninimal = freezed,
    Object? figureInfo = freezed,
  }) {
    return _then(_$_TwitterSubscribe(
      goodSmileJP: goodSmileJP == freezed
          ? _value.goodSmileJP
          : goodSmileJP // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileUS: goodSmileUS == freezed
          ? _value.goodSmileUS
          : goodSmileUS // ignore: cast_nullable_to_non_nullable
              as bool,
      goodSmileKR: goodSmileKR == freezed
          ? _value.goodSmileKR
          : goodSmileKR // ignore: cast_nullable_to_non_nullable
              as bool,
      ninimal: ninimal == freezed
          ? _value.ninimal
          : ninimal // ignore: cast_nullable_to_non_nullable
              as bool,
      figureInfo: figureInfo == freezed
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
      {@HiveField(0) required this.goodSmileJP,
      @HiveField(1) required this.goodSmileUS,
      @HiveField(2) required this.goodSmileKR,
      @HiveField(3) required this.ninimal,
      @HiveField(4) required this.figureInfo});

  @override
  @HiveField(0)
  final bool goodSmileJP;
  @override
  @HiveField(1)
  final bool goodSmileUS;
  @override
  @HiveField(2)
  final bool goodSmileKR;
  @override
  @HiveField(3)
  final bool ninimal;
  @override
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
            const DeepCollectionEquality()
                .equals(other.goodSmileJP, goodSmileJP) &&
            const DeepCollectionEquality()
                .equals(other.goodSmileUS, goodSmileUS) &&
            const DeepCollectionEquality()
                .equals(other.goodSmileKR, goodSmileKR) &&
            const DeepCollectionEquality().equals(other.ninimal, ninimal) &&
            const DeepCollectionEquality()
                .equals(other.figureInfo, figureInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(goodSmileJP),
      const DeepCollectionEquality().hash(goodSmileUS),
      const DeepCollectionEquality().hash(goodSmileKR),
      const DeepCollectionEquality().hash(ninimal),
      const DeepCollectionEquality().hash(figureInfo));

  @JsonKey(ignore: true)
  @override
  _$$_TwitterSubscribeCopyWith<_$_TwitterSubscribe> get copyWith =>
      __$$_TwitterSubscribeCopyWithImpl<_$_TwitterSubscribe>(this, _$identity);
}

abstract class _TwitterSubscribe implements TwitterSubscribe {
  const factory _TwitterSubscribe(
      {@HiveField(0) required final bool goodSmileJP,
      @HiveField(1) required final bool goodSmileUS,
      @HiveField(2) required final bool goodSmileKR,
      @HiveField(3) required final bool ninimal,
      @HiveField(4) required final bool figureInfo}) = _$_TwitterSubscribe;

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
      _$DcinsideSubscribeCopyWithImpl<$Res>;
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class _$DcinsideSubscribeCopyWithImpl<$Res>
    implements $DcinsideSubscribeCopyWith<$Res> {
  _$DcinsideSubscribeCopyWithImpl(this._value, this._then);

  final DcinsideSubscribe _value;
  // ignore: unused_field
  final $Res Function(DcinsideSubscribe) _then;

  @override
  $Res call({
    Object? information = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DcinsideSubscribeCopyWith<$Res>
    implements $DcinsideSubscribeCopyWith<$Res> {
  factory _$$_DcinsideSubscribeCopyWith(_$_DcinsideSubscribe value,
          $Res Function(_$_DcinsideSubscribe) then) =
      __$$_DcinsideSubscribeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class __$$_DcinsideSubscribeCopyWithImpl<$Res>
    extends _$DcinsideSubscribeCopyWithImpl<$Res>
    implements _$$_DcinsideSubscribeCopyWith<$Res> {
  __$$_DcinsideSubscribeCopyWithImpl(
      _$_DcinsideSubscribe _value, $Res Function(_$_DcinsideSubscribe) _then)
      : super(_value, (v) => _then(v as _$_DcinsideSubscribe));

  @override
  _$_DcinsideSubscribe get _value => super._value as _$_DcinsideSubscribe;

  @override
  $Res call({
    Object? information = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_DcinsideSubscribe(
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: review == freezed
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
      {@HiveField(0) required this.information,
      @HiveField(1) required this.review});

  @override
  @HiveField(0)
  final bool information;
  @override
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
            const DeepCollectionEquality()
                .equals(other.information, information) &&
            const DeepCollectionEquality().equals(other.review, review));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(information),
      const DeepCollectionEquality().hash(review));

  @JsonKey(ignore: true)
  @override
  _$$_DcinsideSubscribeCopyWith<_$_DcinsideSubscribe> get copyWith =>
      __$$_DcinsideSubscribeCopyWithImpl<_$_DcinsideSubscribe>(
          this, _$identity);
}

abstract class _DcinsideSubscribe implements DcinsideSubscribe {
  const factory _DcinsideSubscribe(
      {@HiveField(0) required final bool information,
      @HiveField(1) required final bool review}) = _$_DcinsideSubscribe;

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
      _$RuliwebSubscribeCopyWithImpl<$Res>;
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class _$RuliwebSubscribeCopyWithImpl<$Res>
    implements $RuliwebSubscribeCopyWith<$Res> {
  _$RuliwebSubscribeCopyWithImpl(this._value, this._then);

  final RuliwebSubscribe _value;
  // ignore: unused_field
  final $Res Function(RuliwebSubscribe) _then;

  @override
  $Res call({
    Object? information = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RuliwebSubscribeCopyWith<$Res>
    implements $RuliwebSubscribeCopyWith<$Res> {
  factory _$$_RuliwebSubscribeCopyWith(
          _$_RuliwebSubscribe value, $Res Function(_$_RuliwebSubscribe) then) =
      __$$_RuliwebSubscribeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) bool information, @HiveField(1) bool review});
}

/// @nodoc
class __$$_RuliwebSubscribeCopyWithImpl<$Res>
    extends _$RuliwebSubscribeCopyWithImpl<$Res>
    implements _$$_RuliwebSubscribeCopyWith<$Res> {
  __$$_RuliwebSubscribeCopyWithImpl(
      _$_RuliwebSubscribe _value, $Res Function(_$_RuliwebSubscribe) _then)
      : super(_value, (v) => _then(v as _$_RuliwebSubscribe));

  @override
  _$_RuliwebSubscribe get _value => super._value as _$_RuliwebSubscribe;

  @override
  $Res call({
    Object? information = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_RuliwebSubscribe(
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as bool,
      review: review == freezed
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
      {@HiveField(0) required this.information,
      @HiveField(1) required this.review});

  @override
  @HiveField(0)
  final bool information;
  @override
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
            const DeepCollectionEquality()
                .equals(other.information, information) &&
            const DeepCollectionEquality().equals(other.review, review));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(information),
      const DeepCollectionEquality().hash(review));

  @JsonKey(ignore: true)
  @override
  _$$_RuliwebSubscribeCopyWith<_$_RuliwebSubscribe> get copyWith =>
      __$$_RuliwebSubscribeCopyWithImpl<_$_RuliwebSubscribe>(this, _$identity);
}

abstract class _RuliwebSubscribe implements RuliwebSubscribe {
  const factory _RuliwebSubscribe(
      {@HiveField(0) required final bool information,
      @HiveField(1) required final bool review}) = _$_RuliwebSubscribe;

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

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsItemData {
  String? get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  bool get soldOut => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsItemDataCopyWith<NewsItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsItemDataCopyWith<$Res> {
  factory $NewsItemDataCopyWith(
          NewsItemData value, $Res Function(NewsItemData) then) =
      _$NewsItemDataCopyWithImpl<$Res, NewsItemData>;
  @useResult
  $Res call(
      {String? number,
      String name,
      String? price,
      String imagePath,
      String link,
      bool soldOut});
}

/// @nodoc
class _$NewsItemDataCopyWithImpl<$Res, $Val extends NewsItemData>
    implements $NewsItemDataCopyWith<$Res> {
  _$NewsItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? name = null,
    Object? price = freezed,
    Object? imagePath = null,
    Object? link = null,
    Object? soldOut = null,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      soldOut: null == soldOut
          ? _value.soldOut
          : soldOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsItemDataCopyWith<$Res>
    implements $NewsItemDataCopyWith<$Res> {
  factory _$$_NewsItemDataCopyWith(
          _$_NewsItemData value, $Res Function(_$_NewsItemData) then) =
      __$$_NewsItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? number,
      String name,
      String? price,
      String imagePath,
      String link,
      bool soldOut});
}

/// @nodoc
class __$$_NewsItemDataCopyWithImpl<$Res>
    extends _$NewsItemDataCopyWithImpl<$Res, _$_NewsItemData>
    implements _$$_NewsItemDataCopyWith<$Res> {
  __$$_NewsItemDataCopyWithImpl(
      _$_NewsItemData _value, $Res Function(_$_NewsItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? name = null,
    Object? price = freezed,
    Object? imagePath = null,
    Object? link = null,
    Object? soldOut = null,
  }) {
    return _then(_$_NewsItemData(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      soldOut: null == soldOut
          ? _value.soldOut
          : soldOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NewsItemData implements _NewsItemData {
  const _$_NewsItemData(
      {this.number,
      required this.name,
      this.price,
      required this.imagePath,
      this.link = '',
      this.soldOut = false});

  @override
  final String? number;
  @override
  final String name;
  @override
  final String? price;
  @override
  final String imagePath;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final bool soldOut;

  @override
  String toString() {
    return 'NewsItemData(number: $number, name: $name, price: $price, imagePath: $imagePath, link: $link, soldOut: $soldOut)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsItemData &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.soldOut, soldOut) || other.soldOut == soldOut));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, price, imagePath, link, soldOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsItemDataCopyWith<_$_NewsItemData> get copyWith =>
      __$$_NewsItemDataCopyWithImpl<_$_NewsItemData>(this, _$identity);
}

abstract class _NewsItemData implements NewsItemData {
  const factory _NewsItemData(
      {final String? number,
      required final String name,
      final String? price,
      required final String imagePath,
      final String link,
      final bool soldOut}) = _$_NewsItemData;

  @override
  String? get number;
  @override
  String get name;
  @override
  String? get price;
  @override
  String get imagePath;
  @override
  String get link;
  @override
  bool get soldOut;
  @override
  @JsonKey(ignore: true)
  _$$_NewsItemDataCopyWith<_$_NewsItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  List<NewsItemData> get specialGoodsList => throw _privateConstructorUsedError;
  List<NewsItemData> get ninimalList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {List<NewsItemData> specialGoodsList, List<NewsItemData> ninimalList});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialGoodsList = null,
    Object? ninimalList = null,
  }) {
    return _then(_value.copyWith(
      specialGoodsList: null == specialGoodsList
          ? _value.specialGoodsList
          : specialGoodsList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      ninimalList: null == ninimalList
          ? _value.ninimalList
          : ninimalList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewsItemData> specialGoodsList, List<NewsItemData> ninimalList});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialGoodsList = null,
    Object? ninimalList = null,
  }) {
    return _then(_$_NewsState(
      specialGoodsList: null == specialGoodsList
          ? _value._specialGoodsList
          : specialGoodsList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      ninimalList: null == ninimalList
          ? _value._ninimalList
          : ninimalList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {final List<NewsItemData> specialGoodsList = const [],
      final List<NewsItemData> ninimalList = const []})
      : _specialGoodsList = specialGoodsList,
        _ninimalList = ninimalList;

  final List<NewsItemData> _specialGoodsList;
  @override
  @JsonKey()
  List<NewsItemData> get specialGoodsList {
    if (_specialGoodsList is EqualUnmodifiableListView)
      return _specialGoodsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialGoodsList);
  }

  final List<NewsItemData> _ninimalList;
  @override
  @JsonKey()
  List<NewsItemData> get ninimalList {
    if (_ninimalList is EqualUnmodifiableListView) return _ninimalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ninimalList);
  }

  @override
  String toString() {
    return 'NewsState(specialGoodsList: $specialGoodsList, ninimalList: $ninimalList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality()
                .equals(other._specialGoodsList, _specialGoodsList) &&
            const DeepCollectionEquality()
                .equals(other._ninimalList, _ninimalList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_specialGoodsList),
      const DeepCollectionEquality().hash(_ninimalList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final List<NewsItemData> specialGoodsList,
      final List<NewsItemData> ninimalList}) = _$_NewsState;

  @override
  List<NewsItemData> get specialGoodsList;
  @override
  List<NewsItemData> get ninimalList;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

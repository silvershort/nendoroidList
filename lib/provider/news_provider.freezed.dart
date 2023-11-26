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
  List<NewsItemData> get imminentList => throw _privateConstructorUsedError;

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
      {List<NewsItemData> specialGoodsList,
      List<NewsItemData> ninimalList,
      List<NewsItemData> imminentList});
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
    Object? imminentList = null,
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
      imminentList: null == imminentList
          ? _value.imminentList
          : imminentList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewsItemData> specialGoodsList,
      List<NewsItemData> ninimalList,
      List<NewsItemData> imminentList});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialGoodsList = null,
    Object? ninimalList = null,
    Object? imminentList = null,
  }) {
    return _then(_$NewsStateImpl(
      specialGoodsList: null == specialGoodsList
          ? _value._specialGoodsList
          : specialGoodsList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      ninimalList: null == ninimalList
          ? _value._ninimalList
          : ninimalList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
      imminentList: null == imminentList
          ? _value._imminentList
          : imminentList // ignore: cast_nullable_to_non_nullable
              as List<NewsItemData>,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl implements _NewsState {
  const _$NewsStateImpl(
      {final List<NewsItemData> specialGoodsList = const [],
      final List<NewsItemData> ninimalList = const [],
      final List<NewsItemData> imminentList = const []})
      : _specialGoodsList = specialGoodsList,
        _ninimalList = ninimalList,
        _imminentList = imminentList;

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

  final List<NewsItemData> _imminentList;
  @override
  @JsonKey()
  List<NewsItemData> get imminentList {
    if (_imminentList is EqualUnmodifiableListView) return _imminentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imminentList);
  }

  @override
  String toString() {
    return 'NewsState(specialGoodsList: $specialGoodsList, ninimalList: $ninimalList, imminentList: $imminentList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._specialGoodsList, _specialGoodsList) &&
            const DeepCollectionEquality()
                .equals(other._ninimalList, _ninimalList) &&
            const DeepCollectionEquality()
                .equals(other._imminentList, _imminentList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_specialGoodsList),
      const DeepCollectionEquality().hash(_ninimalList),
      const DeepCollectionEquality().hash(_imminentList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final List<NewsItemData> specialGoodsList,
      final List<NewsItemData> ninimalList,
      final List<NewsItemData> imminentList}) = _$NewsStateImpl;

  @override
  List<NewsItemData> get specialGoodsList;
  @override
  List<NewsItemData> get ninimalList;
  @override
  List<NewsItemData> get imminentList;
  @override
  @JsonKey(ignore: true)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

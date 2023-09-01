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
  List<NewsData> get newsList => throw _privateConstructorUsedError;
  SubscribeData get subscribeData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call({List<NewsData> newsList, SubscribeData subscribeData});

  $SubscribeDataCopyWith<$Res> get subscribeData;
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
    Object? newsList = null,
    Object? subscribeData = null,
  }) {
    return _then(_value.copyWith(
      newsList: null == newsList
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<NewsData>,
      subscribeData: null == subscribeData
          ? _value.subscribeData
          : subscribeData // ignore: cast_nullable_to_non_nullable
              as SubscribeData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscribeDataCopyWith<$Res> get subscribeData {
    return $SubscribeDataCopyWith<$Res>(_value.subscribeData, (value) {
      return _then(_value.copyWith(subscribeData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NewsData> newsList, SubscribeData subscribeData});

  @override
  $SubscribeDataCopyWith<$Res> get subscribeData;
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
    Object? newsList = null,
    Object? subscribeData = null,
  }) {
    return _then(_$_NewsState(
      newsList: null == newsList
          ? _value._newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<NewsData>,
      subscribeData: null == subscribeData
          ? _value.subscribeData
          : subscribeData // ignore: cast_nullable_to_non_nullable
              as SubscribeData,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {final List<NewsData> newsList = const [],
      this.subscribeData = const SubscribeData()})
      : _newsList = newsList;

  final List<NewsData> _newsList;
  @override
  @JsonKey()
  List<NewsData> get newsList {
    if (_newsList is EqualUnmodifiableListView) return _newsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsList);
  }

  @override
  @JsonKey()
  final SubscribeData subscribeData;

  @override
  String toString() {
    return 'NewsState(newsList: $newsList, subscribeData: $subscribeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality().equals(other._newsList, _newsList) &&
            (identical(other.subscribeData, subscribeData) ||
                other.subscribeData == subscribeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_newsList), subscribeData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final List<NewsData> newsList,
      final SubscribeData subscribeData}) = _$_NewsState;

  @override
  List<NewsData> get newsList;
  @override
  SubscribeData get subscribeData;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

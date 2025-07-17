// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_smile_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoodSmileNewsModel {
  String get link => throw _privateConstructorUsedError;
  List<String> get nendoNameList => throw _privateConstructorUsedError;
  List<NendoData> get nendoList => throw _privateConstructorUsedError;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoodSmileNewsModelCopyWith<GoodSmileNewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodSmileNewsModelCopyWith<$Res> {
  factory $GoodSmileNewsModelCopyWith(
          GoodSmileNewsModel value, $Res Function(GoodSmileNewsModel) then) =
      _$GoodSmileNewsModelCopyWithImpl<$Res, GoodSmileNewsModel>;
  @useResult
  $Res call(
      {String link, List<String> nendoNameList, List<NendoData> nendoList});
}

/// @nodoc
class _$GoodSmileNewsModelCopyWithImpl<$Res, $Val extends GoodSmileNewsModel>
    implements $GoodSmileNewsModelCopyWith<$Res> {
  _$GoodSmileNewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? nendoNameList = null,
    Object? nendoList = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      nendoNameList: null == nendoNameList
          ? _value.nendoNameList
          : nendoNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nendoList: null == nendoList
          ? _value.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoodSmileNewsModelImplCopyWith<$Res>
    implements $GoodSmileNewsModelCopyWith<$Res> {
  factory _$$GoodSmileNewsModelImplCopyWith(_$GoodSmileNewsModelImpl value,
          $Res Function(_$GoodSmileNewsModelImpl) then) =
      __$$GoodSmileNewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String link, List<String> nendoNameList, List<NendoData> nendoList});
}

/// @nodoc
class __$$GoodSmileNewsModelImplCopyWithImpl<$Res>
    extends _$GoodSmileNewsModelCopyWithImpl<$Res, _$GoodSmileNewsModelImpl>
    implements _$$GoodSmileNewsModelImplCopyWith<$Res> {
  __$$GoodSmileNewsModelImplCopyWithImpl(_$GoodSmileNewsModelImpl _value,
      $Res Function(_$GoodSmileNewsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? nendoNameList = null,
    Object? nendoList = null,
  }) {
    return _then(_$GoodSmileNewsModelImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      nendoNameList: null == nendoNameList
          ? _value._nendoNameList
          : nendoNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nendoList: null == nendoList
          ? _value._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

/// @nodoc

class _$GoodSmileNewsModelImpl implements _GoodSmileNewsModel {
  const _$GoodSmileNewsModelImpl(
      {required this.link,
      final List<String> nendoNameList = const [],
      final List<NendoData> nendoList = const []})
      : _nendoNameList = nendoNameList,
        _nendoList = nendoList;

  @override
  final String link;
  final List<String> _nendoNameList;
  @override
  @JsonKey()
  List<String> get nendoNameList {
    if (_nendoNameList is EqualUnmodifiableListView) return _nendoNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoNameList);
  }

  final List<NendoData> _nendoList;
  @override
  @JsonKey()
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  @override
  String toString() {
    return 'GoodSmileNewsModel(link: $link, nendoNameList: $nendoNameList, nendoList: $nendoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodSmileNewsModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._nendoNameList, _nendoNameList) &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      link,
      const DeepCollectionEquality().hash(_nendoNameList),
      const DeepCollectionEquality().hash(_nendoList));

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodSmileNewsModelImplCopyWith<_$GoodSmileNewsModelImpl> get copyWith =>
      __$$GoodSmileNewsModelImplCopyWithImpl<_$GoodSmileNewsModelImpl>(
          this, _$identity);
}

abstract class _GoodSmileNewsModel implements GoodSmileNewsModel {
  const factory _GoodSmileNewsModel(
      {required final String link,
      final List<String> nendoNameList,
      final List<NendoData> nendoList}) = _$GoodSmileNewsModelImpl;

  @override
  String get link;
  @override
  List<String> get nendoNameList;
  @override
  List<NendoData> get nendoList;

  /// Create a copy of GoodSmileNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoodSmileNewsModelImplCopyWith<_$GoodSmileNewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

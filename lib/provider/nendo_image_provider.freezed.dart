// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_image_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NendoImageState {
  List<String> get imageList => throw _privateConstructorUsedError;
  List<String> get thumbnailList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NendoImageStateCopyWith<NendoImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoImageStateCopyWith<$Res> {
  factory $NendoImageStateCopyWith(
          NendoImageState value, $Res Function(NendoImageState) then) =
      _$NendoImageStateCopyWithImpl<$Res, NendoImageState>;
  @useResult
  $Res call({List<String> imageList, List<String> thumbnailList});
}

/// @nodoc
class _$NendoImageStateCopyWithImpl<$Res, $Val extends NendoImageState>
    implements $NendoImageStateCopyWith<$Res> {
  _$NendoImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageList = null,
    Object? thumbnailList = null,
  }) {
    return _then(_value.copyWith(
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailList: null == thumbnailList
          ? _value.thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NendoImageStateCopyWith<$Res>
    implements $NendoImageStateCopyWith<$Res> {
  factory _$$_NendoImageStateCopyWith(
          _$_NendoImageState value, $Res Function(_$_NendoImageState) then) =
      __$$_NendoImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imageList, List<String> thumbnailList});
}

/// @nodoc
class __$$_NendoImageStateCopyWithImpl<$Res>
    extends _$NendoImageStateCopyWithImpl<$Res, _$_NendoImageState>
    implements _$$_NendoImageStateCopyWith<$Res> {
  __$$_NendoImageStateCopyWithImpl(
      _$_NendoImageState _value, $Res Function(_$_NendoImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageList = null,
    Object? thumbnailList = null,
  }) {
    return _then(_$_NendoImageState(
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnailList: null == thumbnailList
          ? _value._thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_NendoImageState implements _NendoImageState {
  const _$_NendoImageState(
      {required final List<String> imageList,
      required final List<String> thumbnailList})
      : _imageList = imageList,
        _thumbnailList = thumbnailList;

  final List<String> _imageList;
  @override
  List<String> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  final List<String> _thumbnailList;
  @override
  List<String> get thumbnailList {
    if (_thumbnailList is EqualUnmodifiableListView) return _thumbnailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailList);
  }

  @override
  String toString() {
    return 'NendoImageState(imageList: $imageList, thumbnailList: $thumbnailList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NendoImageState &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailList, _thumbnailList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageList),
      const DeepCollectionEquality().hash(_thumbnailList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NendoImageStateCopyWith<_$_NendoImageState> get copyWith =>
      __$$_NendoImageStateCopyWithImpl<_$_NendoImageState>(this, _$identity);
}

abstract class _NendoImageState implements NendoImageState {
  const factory _NendoImageState(
      {required final List<String> imageList,
      required final List<String> thumbnailList}) = _$_NendoImageState;

  @override
  List<String> get imageList;
  @override
  List<String> get thumbnailList;
  @override
  @JsonKey(ignore: true)
  _$$_NendoImageStateCopyWith<_$_NendoImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

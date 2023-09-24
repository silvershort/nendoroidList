// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NendoGroup {
  String get name => throw _privateConstructorUsedError;
  List<NendoData> get nendoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NendoGroupCopyWith<NendoGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoGroupCopyWith<$Res> {
  factory $NendoGroupCopyWith(
          NendoGroup value, $Res Function(NendoGroup) then) =
      _$NendoGroupCopyWithImpl<$Res, NendoGroup>;
  @useResult
  $Res call({String name, List<NendoData> nendoList});
}

/// @nodoc
class _$NendoGroupCopyWithImpl<$Res, $Val extends NendoGroup>
    implements $NendoGroupCopyWith<$Res> {
  _$NendoGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nendoList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nendoList: null == nendoList
          ? _value.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NendoGroupCopyWith<$Res>
    implements $NendoGroupCopyWith<$Res> {
  factory _$$_NendoGroupCopyWith(
          _$_NendoGroup value, $Res Function(_$_NendoGroup) then) =
      __$$_NendoGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<NendoData> nendoList});
}

/// @nodoc
class __$$_NendoGroupCopyWithImpl<$Res>
    extends _$NendoGroupCopyWithImpl<$Res, _$_NendoGroup>
    implements _$$_NendoGroupCopyWith<$Res> {
  __$$_NendoGroupCopyWithImpl(
      _$_NendoGroup _value, $Res Function(_$_NendoGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nendoList = null,
  }) {
    return _then(_$_NendoGroup(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nendoList: null == nendoList
          ? _value._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
    ));
  }
}

/// @nodoc

class _$_NendoGroup implements _NendoGroup {
  const _$_NendoGroup(
      {required this.name, required final List<NendoData> nendoList})
      : _nendoList = nendoList;

  @override
  final String name;
  final List<NendoData> _nendoList;
  @override
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  @override
  String toString() {
    return 'NendoGroup(name: $name, nendoList: $nendoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NendoGroup &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_nendoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NendoGroupCopyWith<_$_NendoGroup> get copyWith =>
      __$$_NendoGroupCopyWithImpl<_$_NendoGroup>(this, _$identity);
}

abstract class _NendoGroup implements NendoGroup {
  const factory _NendoGroup(
      {required final String name,
      required final List<NendoData> nendoList}) = _$_NendoGroup;

  @override
  String get name;
  @override
  List<NendoData> get nendoList;
  @override
  @JsonKey(ignore: true)
  _$$_NendoGroupCopyWith<_$_NendoGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

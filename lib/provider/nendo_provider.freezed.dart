// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NendoState {
  List<NendoData> get nendoList => throw _privateConstructorUsedError;
  List<NendoData> get nenDollList => throw _privateConstructorUsedError;
  List<NendoData> get filteredNendoList => throw _privateConstructorUsedError;
  List<SetData> get setList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NendoStateCopyWith<NendoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoStateCopyWith<$Res> {
  factory $NendoStateCopyWith(
          NendoState value, $Res Function(NendoState) then) =
      _$NendoStateCopyWithImpl<$Res, NendoState>;
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<NendoData> filteredNendoList,
      List<SetData> setList});
}

/// @nodoc
class _$NendoStateCopyWithImpl<$Res, $Val extends NendoState>
    implements $NendoStateCopyWith<$Res> {
  _$NendoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? filteredNendoList = null,
    Object? setList = null,
  }) {
    return _then(_value.copyWith(
      nendoList: null == nendoList
          ? _value.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _value.nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      filteredNendoList: null == filteredNendoList
          ? _value.filteredNendoList
          : filteredNendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _value.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NendoStateImplCopyWith<$Res>
    implements $NendoStateCopyWith<$Res> {
  factory _$$NendoStateImplCopyWith(
          _$NendoStateImpl value, $Res Function(_$NendoStateImpl) then) =
      __$$NendoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<NendoData> filteredNendoList,
      List<SetData> setList});
}

/// @nodoc
class __$$NendoStateImplCopyWithImpl<$Res>
    extends _$NendoStateCopyWithImpl<$Res, _$NendoStateImpl>
    implements _$$NendoStateImplCopyWith<$Res> {
  __$$NendoStateImplCopyWithImpl(
      _$NendoStateImpl _value, $Res Function(_$NendoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? filteredNendoList = null,
    Object? setList = null,
  }) {
    return _then(_$NendoStateImpl(
      nendoList: null == nendoList
          ? _value._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _value._nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      filteredNendoList: null == filteredNendoList
          ? _value._filteredNendoList
          : filteredNendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _value._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
    ));
  }
}

/// @nodoc

class _$NendoStateImpl with DiagnosticableTreeMixin implements _NendoState {
  const _$NendoStateImpl(
      {final List<NendoData> nendoList = const [],
      final List<NendoData> nenDollList = const [],
      final List<NendoData> filteredNendoList = const [],
      final List<SetData> setList = const []})
      : _nendoList = nendoList,
        _nenDollList = nenDollList,
        _filteredNendoList = filteredNendoList,
        _setList = setList;

  final List<NendoData> _nendoList;
  @override
  @JsonKey()
  List<NendoData> get nendoList {
    if (_nendoList is EqualUnmodifiableListView) return _nendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nendoList);
  }

  final List<NendoData> _nenDollList;
  @override
  @JsonKey()
  List<NendoData> get nenDollList {
    if (_nenDollList is EqualUnmodifiableListView) return _nenDollList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nenDollList);
  }

  final List<NendoData> _filteredNendoList;
  @override
  @JsonKey()
  List<NendoData> get filteredNendoList {
    if (_filteredNendoList is EqualUnmodifiableListView)
      return _filteredNendoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredNendoList);
  }

  final List<SetData> _setList;
  @override
  @JsonKey()
  List<SetData> get setList {
    if (_setList is EqualUnmodifiableListView) return _setList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_setList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NendoState(nendoList: $nendoList, nenDollList: $nenDollList, filteredNendoList: $filteredNendoList, setList: $setList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NendoState'))
      ..add(DiagnosticsProperty('nendoList', nendoList))
      ..add(DiagnosticsProperty('nenDollList', nenDollList))
      ..add(DiagnosticsProperty('filteredNendoList', filteredNendoList))
      ..add(DiagnosticsProperty('setList', setList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NendoStateImpl &&
            const DeepCollectionEquality()
                .equals(other._nendoList, _nendoList) &&
            const DeepCollectionEquality()
                .equals(other._nenDollList, _nenDollList) &&
            const DeepCollectionEquality()
                .equals(other._filteredNendoList, _filteredNendoList) &&
            const DeepCollectionEquality().equals(other._setList, _setList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nendoList),
      const DeepCollectionEquality().hash(_nenDollList),
      const DeepCollectionEquality().hash(_filteredNendoList),
      const DeepCollectionEquality().hash(_setList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NendoStateImplCopyWith<_$NendoStateImpl> get copyWith =>
      __$$NendoStateImplCopyWithImpl<_$NendoStateImpl>(this, _$identity);
}

abstract class _NendoState implements NendoState {
  const factory _NendoState(
      {final List<NendoData> nendoList,
      final List<NendoData> nenDollList,
      final List<NendoData> filteredNendoList,
      final List<SetData> setList}) = _$NendoStateImpl;

  @override
  List<NendoData> get nendoList;
  @override
  List<NendoData> get nenDollList;
  @override
  List<NendoData> get filteredNendoList;
  @override
  List<SetData> get setList;
  @override
  @JsonKey(ignore: true)
  _$$NendoStateImplCopyWith<_$NendoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

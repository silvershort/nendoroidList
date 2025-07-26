// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoState implements DiagnosticableTreeMixin {
  List<NendoData> get nendoList;
  List<NendoData> get nenDollList;
  List<NendoData> get filteredNendoList;
  List<SetData> get setList;

  /// Create a copy of NendoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoStateCopyWith<NendoState> get copyWith =>
      _$NendoStateCopyWithImpl<NendoState>(this as NendoState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NendoState'))
      ..add(DiagnosticsProperty('nendoList', nendoList))
      ..add(DiagnosticsProperty('nenDollList', nenDollList))
      ..add(DiagnosticsProperty('filteredNendoList', filteredNendoList))
      ..add(DiagnosticsProperty('setList', setList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoState &&
            const DeepCollectionEquality().equals(other.nendoList, nendoList) &&
            const DeepCollectionEquality()
                .equals(other.nenDollList, nenDollList) &&
            const DeepCollectionEquality()
                .equals(other.filteredNendoList, filteredNendoList) &&
            const DeepCollectionEquality().equals(other.setList, setList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nendoList),
      const DeepCollectionEquality().hash(nenDollList),
      const DeepCollectionEquality().hash(filteredNendoList),
      const DeepCollectionEquality().hash(setList));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NendoState(nendoList: $nendoList, nenDollList: $nenDollList, filteredNendoList: $filteredNendoList, setList: $setList)';
  }
}

/// @nodoc
abstract mixin class $NendoStateCopyWith<$Res> {
  factory $NendoStateCopyWith(
          NendoState value, $Res Function(NendoState) _then) =
      _$NendoStateCopyWithImpl;
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<NendoData> filteredNendoList,
      List<SetData> setList});
}

/// @nodoc
class _$NendoStateCopyWithImpl<$Res> implements $NendoStateCopyWith<$Res> {
  _$NendoStateCopyWithImpl(this._self, this._then);

  final NendoState _self;
  final $Res Function(NendoState) _then;

  /// Create a copy of NendoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? filteredNendoList = null,
    Object? setList = null,
  }) {
    return _then(_self.copyWith(
      nendoList: null == nendoList
          ? _self.nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _self.nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      filteredNendoList: null == filteredNendoList
          ? _self.filteredNendoList
          : filteredNendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _self.setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NendoState].
extension NendoStatePatterns on NendoState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NendoState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NendoState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NendoState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<NendoData> nendoList, List<NendoData> nenDollList,
            List<NendoData> filteredNendoList, List<SetData> setList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoState() when $default != null:
        return $default(_that.nendoList, _that.nenDollList,
            _that.filteredNendoList, _that.setList);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<NendoData> nendoList, List<NendoData> nenDollList,
            List<NendoData> filteredNendoList, List<SetData> setList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoState():
        return $default(_that.nendoList, _that.nenDollList,
            _that.filteredNendoList, _that.setList);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<NendoData> nendoList, List<NendoData> nenDollList,
            List<NendoData> filteredNendoList, List<SetData> setList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoState() when $default != null:
        return $default(_that.nendoList, _that.nenDollList,
            _that.filteredNendoList, _that.setList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoState with DiagnosticableTreeMixin implements NendoState {
  const _NendoState(
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

  /// Create a copy of NendoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoStateCopyWith<_NendoState> get copyWith =>
      __$NendoStateCopyWithImpl<_NendoState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'NendoState'))
      ..add(DiagnosticsProperty('nendoList', nendoList))
      ..add(DiagnosticsProperty('nenDollList', nenDollList))
      ..add(DiagnosticsProperty('filteredNendoList', filteredNendoList))
      ..add(DiagnosticsProperty('setList', setList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoState &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NendoState(nendoList: $nendoList, nenDollList: $nenDollList, filteredNendoList: $filteredNendoList, setList: $setList)';
  }
}

/// @nodoc
abstract mixin class _$NendoStateCopyWith<$Res>
    implements $NendoStateCopyWith<$Res> {
  factory _$NendoStateCopyWith(
          _NendoState value, $Res Function(_NendoState) _then) =
      __$NendoStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NendoData> nendoList,
      List<NendoData> nenDollList,
      List<NendoData> filteredNendoList,
      List<SetData> setList});
}

/// @nodoc
class __$NendoStateCopyWithImpl<$Res> implements _$NendoStateCopyWith<$Res> {
  __$NendoStateCopyWithImpl(this._self, this._then);

  final _NendoState _self;
  final $Res Function(_NendoState) _then;

  /// Create a copy of NendoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nendoList = null,
    Object? nenDollList = null,
    Object? filteredNendoList = null,
    Object? setList = null,
  }) {
    return _then(_NendoState(
      nendoList: null == nendoList
          ? _self._nendoList
          : nendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      nenDollList: null == nenDollList
          ? _self._nenDollList
          : nenDollList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      filteredNendoList: null == filteredNendoList
          ? _self._filteredNendoList
          : filteredNendoList // ignore: cast_nullable_to_non_nullable
              as List<NendoData>,
      setList: null == setList
          ? _self._setList
          : setList // ignore: cast_nullable_to_non_nullable
              as List<SetData>,
    ));
  }
}

// dart format on

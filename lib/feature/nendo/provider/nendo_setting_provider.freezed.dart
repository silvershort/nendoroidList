// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_setting_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NendoListSettingState {
  DataType get dataType;
  ViewMode get viewMode;
  EditMode get editMode;
  FilterData get filterData;
  SortData get sortData;
  GridVisibleData get gridVisibleData;

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NendoListSettingStateCopyWith<NendoListSettingState> get copyWith =>
      _$NendoListSettingStateCopyWithImpl<NendoListSettingState>(
          this as NendoListSettingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NendoListSettingState &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.filterData, filterData) ||
                other.filterData == filterData) &&
            (identical(other.sortData, sortData) ||
                other.sortData == sortData) &&
            (identical(other.gridVisibleData, gridVisibleData) ||
                other.gridVisibleData == gridVisibleData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataType, viewMode, editMode,
      filterData, sortData, gridVisibleData);

  @override
  String toString() {
    return 'NendoListSettingState(dataType: $dataType, viewMode: $viewMode, editMode: $editMode, filterData: $filterData, sortData: $sortData, gridVisibleData: $gridVisibleData)';
  }
}

/// @nodoc
abstract mixin class $NendoListSettingStateCopyWith<$Res> {
  factory $NendoListSettingStateCopyWith(NendoListSettingState value,
          $Res Function(NendoListSettingState) _then) =
      _$NendoListSettingStateCopyWithImpl;
  @useResult
  $Res call(
      {DataType dataType,
      ViewMode viewMode,
      EditMode editMode,
      FilterData filterData,
      SortData sortData,
      GridVisibleData gridVisibleData});

  $FilterDataCopyWith<$Res> get filterData;
  $SortDataCopyWith<$Res> get sortData;
  $GridVisibleDataCopyWith<$Res> get gridVisibleData;
}

/// @nodoc
class _$NendoListSettingStateCopyWithImpl<$Res>
    implements $NendoListSettingStateCopyWith<$Res> {
  _$NendoListSettingStateCopyWithImpl(this._self, this._then);

  final NendoListSettingState _self;
  final $Res Function(NendoListSettingState) _then;

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataType = null,
    Object? viewMode = null,
    Object? editMode = null,
    Object? filterData = null,
    Object? sortData = null,
    Object? gridVisibleData = null,
  }) {
    return _then(_self.copyWith(
      dataType: null == dataType
          ? _self.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as EditMode,
      filterData: null == filterData
          ? _self.filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as FilterData,
      sortData: null == sortData
          ? _self.sortData
          : sortData // ignore: cast_nullable_to_non_nullable
              as SortData,
      gridVisibleData: null == gridVisibleData
          ? _self.gridVisibleData
          : gridVisibleData // ignore: cast_nullable_to_non_nullable
              as GridVisibleData,
    ));
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterDataCopyWith<$Res> get filterData {
    return $FilterDataCopyWith<$Res>(_self.filterData, (value) {
      return _then(_self.copyWith(filterData: value));
    });
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SortDataCopyWith<$Res> get sortData {
    return $SortDataCopyWith<$Res>(_self.sortData, (value) {
      return _then(_self.copyWith(sortData: value));
    });
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GridVisibleDataCopyWith<$Res> get gridVisibleData {
    return $GridVisibleDataCopyWith<$Res>(_self.gridVisibleData, (value) {
      return _then(_self.copyWith(gridVisibleData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NendoListSettingState].
extension NendoListSettingStatePatterns on NendoListSettingState {
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
    TResult Function(_NendoListSettingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState() when $default != null:
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
    TResult Function(_NendoListSettingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState():
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
    TResult? Function(_NendoListSettingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState() when $default != null:
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
    TResult Function(
            DataType dataType,
            ViewMode viewMode,
            EditMode editMode,
            FilterData filterData,
            SortData sortData,
            GridVisibleData gridVisibleData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState() when $default != null:
        return $default(_that.dataType, _that.viewMode, _that.editMode,
            _that.filterData, _that.sortData, _that.gridVisibleData);
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
    TResult Function(
            DataType dataType,
            ViewMode viewMode,
            EditMode editMode,
            FilterData filterData,
            SortData sortData,
            GridVisibleData gridVisibleData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState():
        return $default(_that.dataType, _that.viewMode, _that.editMode,
            _that.filterData, _that.sortData, _that.gridVisibleData);
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
    TResult? Function(
            DataType dataType,
            ViewMode viewMode,
            EditMode editMode,
            FilterData filterData,
            SortData sortData,
            GridVisibleData gridVisibleData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NendoListSettingState() when $default != null:
        return $default(_that.dataType, _that.viewMode, _that.editMode,
            _that.filterData, _that.sortData, _that.gridVisibleData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NendoListSettingState implements NendoListSettingState {
  const _NendoListSettingState(
      {required this.dataType,
      required this.viewMode,
      required this.editMode,
      required this.filterData,
      required this.sortData,
      required this.gridVisibleData});

  @override
  final DataType dataType;
  @override
  final ViewMode viewMode;
  @override
  final EditMode editMode;
  @override
  final FilterData filterData;
  @override
  final SortData sortData;
  @override
  final GridVisibleData gridVisibleData;

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NendoListSettingStateCopyWith<_NendoListSettingState> get copyWith =>
      __$NendoListSettingStateCopyWithImpl<_NendoListSettingState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NendoListSettingState &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.filterData, filterData) ||
                other.filterData == filterData) &&
            (identical(other.sortData, sortData) ||
                other.sortData == sortData) &&
            (identical(other.gridVisibleData, gridVisibleData) ||
                other.gridVisibleData == gridVisibleData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataType, viewMode, editMode,
      filterData, sortData, gridVisibleData);

  @override
  String toString() {
    return 'NendoListSettingState(dataType: $dataType, viewMode: $viewMode, editMode: $editMode, filterData: $filterData, sortData: $sortData, gridVisibleData: $gridVisibleData)';
  }
}

/// @nodoc
abstract mixin class _$NendoListSettingStateCopyWith<$Res>
    implements $NendoListSettingStateCopyWith<$Res> {
  factory _$NendoListSettingStateCopyWith(_NendoListSettingState value,
          $Res Function(_NendoListSettingState) _then) =
      __$NendoListSettingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DataType dataType,
      ViewMode viewMode,
      EditMode editMode,
      FilterData filterData,
      SortData sortData,
      GridVisibleData gridVisibleData});

  @override
  $FilterDataCopyWith<$Res> get filterData;
  @override
  $SortDataCopyWith<$Res> get sortData;
  @override
  $GridVisibleDataCopyWith<$Res> get gridVisibleData;
}

/// @nodoc
class __$NendoListSettingStateCopyWithImpl<$Res>
    implements _$NendoListSettingStateCopyWith<$Res> {
  __$NendoListSettingStateCopyWithImpl(this._self, this._then);

  final _NendoListSettingState _self;
  final $Res Function(_NendoListSettingState) _then;

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dataType = null,
    Object? viewMode = null,
    Object? editMode = null,
    Object? filterData = null,
    Object? sortData = null,
    Object? gridVisibleData = null,
  }) {
    return _then(_NendoListSettingState(
      dataType: null == dataType
          ? _self.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
      viewMode: null == viewMode
          ? _self.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as EditMode,
      filterData: null == filterData
          ? _self.filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as FilterData,
      sortData: null == sortData
          ? _self.sortData
          : sortData // ignore: cast_nullable_to_non_nullable
              as SortData,
      gridVisibleData: null == gridVisibleData
          ? _self.gridVisibleData
          : gridVisibleData // ignore: cast_nullable_to_non_nullable
              as GridVisibleData,
    ));
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterDataCopyWith<$Res> get filterData {
    return $FilterDataCopyWith<$Res>(_self.filterData, (value) {
      return _then(_self.copyWith(filterData: value));
    });
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SortDataCopyWith<$Res> get sortData {
    return $SortDataCopyWith<$Res>(_self.sortData, (value) {
      return _then(_self.copyWith(sortData: value));
    });
  }

  /// Create a copy of NendoListSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GridVisibleDataCopyWith<$Res> get gridVisibleData {
    return $GridVisibleDataCopyWith<$Res>(_self.gridVisibleData, (value) {
      return _then(_self.copyWith(gridVisibleData: value));
    });
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nendo_setting_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NendoListSettingState {
  ViewMode get viewMode => throw _privateConstructorUsedError;
  EditMode get editMode => throw _privateConstructorUsedError;
  FilterData get filterData => throw _privateConstructorUsedError;
  SortData get sortData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NendoListSettingStateCopyWith<NendoListSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NendoListSettingStateCopyWith<$Res> {
  factory $NendoListSettingStateCopyWith(NendoListSettingState value,
          $Res Function(NendoListSettingState) then) =
      _$NendoListSettingStateCopyWithImpl<$Res, NendoListSettingState>;
  @useResult
  $Res call(
      {ViewMode viewMode,
      EditMode editMode,
      FilterData filterData,
      SortData sortData});

  $FilterDataCopyWith<$Res> get filterData;
  $SortDataCopyWith<$Res> get sortData;
}

/// @nodoc
class _$NendoListSettingStateCopyWithImpl<$Res,
        $Val extends NendoListSettingState>
    implements $NendoListSettingStateCopyWith<$Res> {
  _$NendoListSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewMode = null,
    Object? editMode = null,
    Object? filterData = null,
    Object? sortData = null,
  }) {
    return _then(_value.copyWith(
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as EditMode,
      filterData: null == filterData
          ? _value.filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as FilterData,
      sortData: null == sortData
          ? _value.sortData
          : sortData // ignore: cast_nullable_to_non_nullable
              as SortData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterDataCopyWith<$Res> get filterData {
    return $FilterDataCopyWith<$Res>(_value.filterData, (value) {
      return _then(_value.copyWith(filterData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SortDataCopyWith<$Res> get sortData {
    return $SortDataCopyWith<$Res>(_value.sortData, (value) {
      return _then(_value.copyWith(sortData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NendoListSettingStateCopyWith<$Res>
    implements $NendoListSettingStateCopyWith<$Res> {
  factory _$$_NendoListSettingStateCopyWith(_$_NendoListSettingState value,
          $Res Function(_$_NendoListSettingState) then) =
      __$$_NendoListSettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewMode viewMode,
      EditMode editMode,
      FilterData filterData,
      SortData sortData});

  @override
  $FilterDataCopyWith<$Res> get filterData;
  @override
  $SortDataCopyWith<$Res> get sortData;
}

/// @nodoc
class __$$_NendoListSettingStateCopyWithImpl<$Res>
    extends _$NendoListSettingStateCopyWithImpl<$Res, _$_NendoListSettingState>
    implements _$$_NendoListSettingStateCopyWith<$Res> {
  __$$_NendoListSettingStateCopyWithImpl(_$_NendoListSettingState _value,
      $Res Function(_$_NendoListSettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewMode = null,
    Object? editMode = null,
    Object? filterData = null,
    Object? sortData = null,
  }) {
    return _then(_$_NendoListSettingState(
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as EditMode,
      filterData: null == filterData
          ? _value.filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as FilterData,
      sortData: null == sortData
          ? _value.sortData
          : sortData // ignore: cast_nullable_to_non_nullable
              as SortData,
    ));
  }
}

/// @nodoc

class _$_NendoListSettingState implements _NendoListSettingState {
  const _$_NendoListSettingState(
      {required this.viewMode,
      required this.editMode,
      required this.filterData,
      required this.sortData});

  @override
  final ViewMode viewMode;
  @override
  final EditMode editMode;
  @override
  final FilterData filterData;
  @override
  final SortData sortData;

  @override
  String toString() {
    return 'NendoListSettingState(viewMode: $viewMode, editMode: $editMode, filterData: $filterData, sortData: $sortData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NendoListSettingState &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.filterData, filterData) ||
                other.filterData == filterData) &&
            (identical(other.sortData, sortData) ||
                other.sortData == sortData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, viewMode, editMode, filterData, sortData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NendoListSettingStateCopyWith<_$_NendoListSettingState> get copyWith =>
      __$$_NendoListSettingStateCopyWithImpl<_$_NendoListSettingState>(
          this, _$identity);
}

abstract class _NendoListSettingState implements NendoListSettingState {
  const factory _NendoListSettingState(
      {required final ViewMode viewMode,
      required final EditMode editMode,
      required final FilterData filterData,
      required final SortData sortData}) = _$_NendoListSettingState;

  @override
  ViewMode get viewMode;
  @override
  EditMode get editMode;
  @override
  FilterData get filterData;
  @override
  SortData get sortData;
  @override
  @JsonKey(ignore: true)
  _$$_NendoListSettingStateCopyWith<_$_NendoListSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortData {
  SortingOrder get sortingOrder => throw _privateConstructorUsedError;
  SortingMethod get sortingMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortDataCopyWith<SortData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortDataCopyWith<$Res> {
  factory $SortDataCopyWith(SortData value, $Res Function(SortData) then) =
      _$SortDataCopyWithImpl<$Res, SortData>;
  @useResult
  $Res call({SortingOrder sortingOrder, SortingMethod sortingMethod});
}

/// @nodoc
class _$SortDataCopyWithImpl<$Res, $Val extends SortData>
    implements $SortDataCopyWith<$Res> {
  _$SortDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortingOrder = null,
    Object? sortingMethod = null,
  }) {
    return _then(_value.copyWith(
      sortingOrder: null == sortingOrder
          ? _value.sortingOrder
          : sortingOrder // ignore: cast_nullable_to_non_nullable
              as SortingOrder,
      sortingMethod: null == sortingMethod
          ? _value.sortingMethod
          : sortingMethod // ignore: cast_nullable_to_non_nullable
              as SortingMethod,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SortDataImplCopyWith<$Res>
    implements $SortDataCopyWith<$Res> {
  factory _$$SortDataImplCopyWith(
          _$SortDataImpl value, $Res Function(_$SortDataImpl) then) =
      __$$SortDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortingOrder sortingOrder, SortingMethod sortingMethod});
}

/// @nodoc
class __$$SortDataImplCopyWithImpl<$Res>
    extends _$SortDataCopyWithImpl<$Res, _$SortDataImpl>
    implements _$$SortDataImplCopyWith<$Res> {
  __$$SortDataImplCopyWithImpl(
      _$SortDataImpl _value, $Res Function(_$SortDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortingOrder = null,
    Object? sortingMethod = null,
  }) {
    return _then(_$SortDataImpl(
      sortingOrder: null == sortingOrder
          ? _value.sortingOrder
          : sortingOrder // ignore: cast_nullable_to_non_nullable
              as SortingOrder,
      sortingMethod: null == sortingMethod
          ? _value.sortingMethod
          : sortingMethod // ignore: cast_nullable_to_non_nullable
              as SortingMethod,
    ));
  }
}

/// @nodoc

class _$SortDataImpl extends _SortData {
  const _$SortDataImpl(
      {this.sortingOrder = const DESC(),
      this.sortingMethod = const SortingMethodNum()})
      : super._();

  @override
  @JsonKey()
  final SortingOrder sortingOrder;
  @override
  @JsonKey()
  final SortingMethod sortingMethod;

  @override
  String toString() {
    return 'SortData(sortingOrder: $sortingOrder, sortingMethod: $sortingMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortDataImpl &&
            (identical(other.sortingOrder, sortingOrder) ||
                other.sortingOrder == sortingOrder) &&
            (identical(other.sortingMethod, sortingMethod) ||
                other.sortingMethod == sortingMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortingOrder, sortingMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortDataImplCopyWith<_$SortDataImpl> get copyWith =>
      __$$SortDataImplCopyWithImpl<_$SortDataImpl>(this, _$identity);
}

abstract class _SortData extends SortData {
  const factory _SortData(
      {final SortingOrder sortingOrder,
      final SortingMethod sortingMethod}) = _$SortDataImpl;
  const _SortData._() : super._();

  @override
  SortingOrder get sortingOrder;
  @override
  SortingMethod get sortingMethod;
  @override
  @JsonKey(ignore: true)
  _$$SortDataImplCopyWith<_$SortDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

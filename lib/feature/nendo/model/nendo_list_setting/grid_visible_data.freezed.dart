// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_visible_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GridVisibleData {
  bool get number => throw _privateConstructorUsedError;
  bool get name => throw _privateConstructorUsedError;
  bool get have => throw _privateConstructorUsedError;
  bool get preOrder => throw _privateConstructorUsedError;
  bool get wish => throw _privateConstructorUsedError;
  Emphasize get emphasize => throw _privateConstructorUsedError;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridVisibleDataCopyWith<GridVisibleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridVisibleDataCopyWith<$Res> {
  factory $GridVisibleDataCopyWith(
          GridVisibleData value, $Res Function(GridVisibleData) then) =
      _$GridVisibleDataCopyWithImpl<$Res, GridVisibleData>;
  @useResult
  $Res call(
      {bool number,
      bool name,
      bool have,
      bool preOrder,
      bool wish,
      Emphasize emphasize});
}

/// @nodoc
class _$GridVisibleDataCopyWithImpl<$Res, $Val extends GridVisibleData>
    implements $GridVisibleDataCopyWith<$Res> {
  _$GridVisibleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? have = null,
    Object? preOrder = null,
    Object? wish = null,
    Object? emphasize = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      have: null == have
          ? _value.have
          : have // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrder: null == preOrder
          ? _value.preOrder
          : preOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      wish: null == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as bool,
      emphasize: null == emphasize
          ? _value.emphasize
          : emphasize // ignore: cast_nullable_to_non_nullable
              as Emphasize,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GridVisibleDataImplCopyWith<$Res>
    implements $GridVisibleDataCopyWith<$Res> {
  factory _$$GridVisibleDataImplCopyWith(_$GridVisibleDataImpl value,
          $Res Function(_$GridVisibleDataImpl) then) =
      __$$GridVisibleDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool number,
      bool name,
      bool have,
      bool preOrder,
      bool wish,
      Emphasize emphasize});
}

/// @nodoc
class __$$GridVisibleDataImplCopyWithImpl<$Res>
    extends _$GridVisibleDataCopyWithImpl<$Res, _$GridVisibleDataImpl>
    implements _$$GridVisibleDataImplCopyWith<$Res> {
  __$$GridVisibleDataImplCopyWithImpl(
      _$GridVisibleDataImpl _value, $Res Function(_$GridVisibleDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? have = null,
    Object? preOrder = null,
    Object? wish = null,
    Object? emphasize = null,
  }) {
    return _then(_$GridVisibleDataImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      have: null == have
          ? _value.have
          : have // ignore: cast_nullable_to_non_nullable
              as bool,
      preOrder: null == preOrder
          ? _value.preOrder
          : preOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      wish: null == wish
          ? _value.wish
          : wish // ignore: cast_nullable_to_non_nullable
              as bool,
      emphasize: null == emphasize
          ? _value.emphasize
          : emphasize // ignore: cast_nullable_to_non_nullable
              as Emphasize,
    ));
  }
}

/// @nodoc

class _$GridVisibleDataImpl implements _GridVisibleData {
  const _$GridVisibleDataImpl(
      {this.number = false,
      this.name = false,
      this.have = false,
      this.preOrder = false,
      this.wish = false,
      this.emphasize = const NonEmphasize()});

  @override
  @JsonKey()
  final bool number;
  @override
  @JsonKey()
  final bool name;
  @override
  @JsonKey()
  final bool have;
  @override
  @JsonKey()
  final bool preOrder;
  @override
  @JsonKey()
  final bool wish;
  @override
  @JsonKey()
  final Emphasize emphasize;

  @override
  String toString() {
    return 'GridVisibleData(number: $number, name: $name, have: $have, preOrder: $preOrder, wish: $wish, emphasize: $emphasize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridVisibleDataImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.have, have) || other.have == have) &&
            (identical(other.preOrder, preOrder) ||
                other.preOrder == preOrder) &&
            (identical(other.wish, wish) || other.wish == wish) &&
            (identical(other.emphasize, emphasize) ||
                other.emphasize == emphasize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, number, name, have, preOrder, wish, emphasize);

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridVisibleDataImplCopyWith<_$GridVisibleDataImpl> get copyWith =>
      __$$GridVisibleDataImplCopyWithImpl<_$GridVisibleDataImpl>(
          this, _$identity);
}

abstract class _GridVisibleData implements GridVisibleData {
  const factory _GridVisibleData(
      {final bool number,
      final bool name,
      final bool have,
      final bool preOrder,
      final bool wish,
      final Emphasize emphasize}) = _$GridVisibleDataImpl;

  @override
  bool get number;
  @override
  bool get name;
  @override
  bool get have;
  @override
  bool get preOrder;
  @override
  bool get wish;
  @override
  Emphasize get emphasize;

  /// Create a copy of GridVisibleData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridVisibleDataImplCopyWith<_$GridVisibleDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

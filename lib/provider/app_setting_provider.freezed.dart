// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppSettingState {
  MaterialColor get seedColor => throw _privateConstructorUsedError;
  Brightness get brightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingStateCopyWith<AppSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingStateCopyWith<$Res> {
  factory $AppSettingStateCopyWith(
          AppSettingState value, $Res Function(AppSettingState) then) =
      _$AppSettingStateCopyWithImpl<$Res, AppSettingState>;
  @useResult
  $Res call({MaterialColor seedColor, Brightness brightness});
}

/// @nodoc
class _$AppSettingStateCopyWithImpl<$Res, $Val extends AppSettingState>
    implements $AppSettingStateCopyWith<$Res> {
  _$AppSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedColor = null,
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      seedColor: null == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppSettingStateCopyWith<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  factory _$$_AppSettingStateCopyWith(
          _$_AppSettingState value, $Res Function(_$_AppSettingState) then) =
      __$$_AppSettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialColor seedColor, Brightness brightness});
}

/// @nodoc
class __$$_AppSettingStateCopyWithImpl<$Res>
    extends _$AppSettingStateCopyWithImpl<$Res, _$_AppSettingState>
    implements _$$_AppSettingStateCopyWith<$Res> {
  __$$_AppSettingStateCopyWithImpl(
      _$_AppSettingState _value, $Res Function(_$_AppSettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seedColor = null,
    Object? brightness = null,
  }) {
    return _then(_$_AppSettingState(
      seedColor: null == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$_AppSettingState implements _AppSettingState {
  const _$_AppSettingState({required this.seedColor, required this.brightness});

  @override
  final MaterialColor seedColor;
  @override
  final Brightness brightness;

  @override
  String toString() {
    return 'AppSettingState(seedColor: $seedColor, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSettingState &&
            (identical(other.seedColor, seedColor) ||
                other.seedColor == seedColor) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, seedColor, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppSettingStateCopyWith<_$_AppSettingState> get copyWith =>
      __$$_AppSettingStateCopyWithImpl<_$_AppSettingState>(this, _$identity);
}

abstract class _AppSettingState implements AppSettingState {
  const factory _AppSettingState(
      {required final MaterialColor seedColor,
      required final Brightness brightness}) = _$_AppSettingState;

  @override
  MaterialColor get seedColor;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingStateCopyWith<_$_AppSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

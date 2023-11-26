// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_download_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileDownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? success,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDownloadStateCopyWith<$Res> {
  factory $FileDownloadStateCopyWith(
          FileDownloadState value, $Res Function(FileDownloadState) then) =
      _$FileDownloadStateCopyWithImpl<$Res, FileDownloadState>;
}

/// @nodoc
class _$FileDownloadStateCopyWithImpl<$Res, $Val extends FileDownloadState>
    implements $FileDownloadStateCopyWith<$Res> {
  _$FileDownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadIdleImplCopyWith<$Res> {
  factory _$$DownloadIdleImplCopyWith(
          _$DownloadIdleImpl value, $Res Function(_$DownloadIdleImpl) then) =
      __$$DownloadIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadIdleImplCopyWithImpl<$Res>
    extends _$FileDownloadStateCopyWithImpl<$Res, _$DownloadIdleImpl>
    implements _$$DownloadIdleImplCopyWith<$Res> {
  __$$DownloadIdleImplCopyWithImpl(
      _$DownloadIdleImpl _value, $Res Function(_$DownloadIdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadIdleImpl implements DownloadIdle {
  _$DownloadIdleImpl();

  @override
  String toString() {
    return 'FileDownloadState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class DownloadIdle implements FileDownloadState {
  factory DownloadIdle() = _$DownloadIdleImpl;
}

/// @nodoc
abstract class _$$DownloadSuccessImplCopyWith<$Res> {
  factory _$$DownloadSuccessImplCopyWith(_$DownloadSuccessImpl value,
          $Res Function(_$DownloadSuccessImpl) then) =
      __$$DownloadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadSuccessImplCopyWithImpl<$Res>
    extends _$FileDownloadStateCopyWithImpl<$Res, _$DownloadSuccessImpl>
    implements _$$DownloadSuccessImplCopyWith<$Res> {
  __$$DownloadSuccessImplCopyWithImpl(
      _$DownloadSuccessImpl _value, $Res Function(_$DownloadSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadSuccessImpl implements DownloadSuccess {
  _$DownloadSuccessImpl();

  @override
  String toString() {
    return 'FileDownloadState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DownloadSuccess implements FileDownloadState {
  factory DownloadSuccess() = _$DownloadSuccessImpl;
}

/// @nodoc
abstract class _$$DownloadErrorImplCopyWith<$Res> {
  factory _$$DownloadErrorImplCopyWith(
          _$DownloadErrorImpl value, $Res Function(_$DownloadErrorImpl) then) =
      __$$DownloadErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadErrorImplCopyWithImpl<$Res>
    extends _$FileDownloadStateCopyWithImpl<$Res, _$DownloadErrorImpl>
    implements _$$DownloadErrorImplCopyWith<$Res> {
  __$$DownloadErrorImplCopyWithImpl(
      _$DownloadErrorImpl _value, $Res Function(_$DownloadErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadErrorImpl implements DownloadError {
  _$DownloadErrorImpl();

  @override
  String toString() {
    return 'FileDownloadState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DownloadError implements FileDownloadState {
  factory DownloadError() = _$DownloadErrorImpl;
}

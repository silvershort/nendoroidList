// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_download_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileDownloadState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FileDownloadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FileDownloadState()';
  }
}

/// @nodoc
class $FileDownloadStateCopyWith<$Res> {
  $FileDownloadStateCopyWith(
      FileDownloadState _, $Res Function(FileDownloadState) __);
}

/// Adds pattern-matching-related methods to [FileDownloadState].
extension FileDownloadStatePatterns on FileDownloadState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadIdle value)? idle,
    TResult Function(DownloadSuccess value)? success,
    TResult Function(DownloadError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle(_that);
      case DownloadSuccess() when success != null:
        return success(_that);
      case DownloadError() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadIdle value) idle,
    required TResult Function(DownloadSuccess value) success,
    required TResult Function(DownloadError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle():
        return idle(_that);
      case DownloadSuccess():
        return success(_that);
      case DownloadError():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadIdle value)? idle,
    TResult? Function(DownloadSuccess value)? success,
    TResult? Function(DownloadError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle(_that);
      case DownloadSuccess() when success != null:
        return success(_that);
      case DownloadError() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle();
      case DownloadSuccess() when success != null:
        return success();
      case DownloadError() when error != null:
        return error();
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
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle():
        return idle();
      case DownloadSuccess():
        return success();
      case DownloadError():
        return error();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? success,
    TResult? Function()? error,
  }) {
    final _that = this;
    switch (_that) {
      case DownloadIdle() when idle != null:
        return idle();
      case DownloadSuccess() when success != null:
        return success();
      case DownloadError() when error != null:
        return error();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DownloadIdle implements FileDownloadState {
  DownloadIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FileDownloadState.idle()';
  }
}

/// @nodoc

class DownloadSuccess implements FileDownloadState {
  DownloadSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FileDownloadState.success()';
  }
}

/// @nodoc

class DownloadError implements FileDownloadState {
  DownloadError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FileDownloadState.error()';
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiResult<$T>()';
  }
}

/// @nodoc
class $ApiResultCopyWith<T, $Res> {
  $ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}

/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
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
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
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
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Success():
        return success(_that);
      case _Error():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success<T> value)? success,
    TResult? Function(_Error<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
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
    TResult Function(T value)? success,
    TResult Function(ApiError error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Success() when success != null:
        return success(_that.value);
      case _Error() when error != null:
        return error(_that.error, _that.stackTrace);
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
    required TResult Function(T value) success,
    required TResult Function(ApiError error, StackTrace stackTrace) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Success():
        return success(_that.value);
      case _Error():
        return error(_that.error, _that.stackTrace);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(ApiError error, StackTrace stackTrace)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Success() when success != null:
        return success(_that.value);
      case _Error() when error != null:
        return error(_that.error, _that.stackTrace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Success<T> implements ApiResult<T> {
  const _Success(this.value);

  final T value;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'ApiResult<$T>.success(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Success<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _Error<T> implements ApiResult<T> {
  const _Error(this.error, this.stackTrace);

  final ApiError error;
  final StackTrace stackTrace;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, stackTrace);

  @override
  String toString() {
    return 'ApiResult<$T>.error(error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({ApiError error, StackTrace stackTrace});

  $ApiErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$ErrorCopyWithImpl<T, $Res> implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_Error<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError,
      null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<$Res> get error {
    return $ApiErrorCopyWith<$Res>(_self.error, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc
mixin _$ApiError {
  int get code;
  String get message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<ApiError> get copyWith =>
      _$ApiErrorCopyWithImpl<ApiError>(this as ApiError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) _then) =
      _$ApiErrorCopyWithImpl;
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res> implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError _self;
  final $Res Function(ApiError) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ApiError].
extension ApiErrorPatterns on ApiError {
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
    TResult Function(_ApiError value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiError() when $default != null:
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
    TResult Function(_ApiError value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiError():
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
    TResult? Function(_ApiError value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiError() when $default != null:
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
    TResult Function(int code, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiError() when $default != null:
        return $default(_that.code, _that.message);
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
    TResult Function(int code, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiError():
        return $default(_that.code, _that.message);
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
    TResult? Function(int code, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiError() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ApiError implements ApiError {
  const _ApiError({this.code = 0, required this.message});

  @override
  @JsonKey()
  final int code;
  @override
  final String message;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiErrorCopyWith<_ApiError> get copyWith =>
      __$ApiErrorCopyWithImpl<_ApiError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ApiErrorCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$ApiErrorCopyWith(_ApiError value, $Res Function(_ApiError) _then) =
      __$ApiErrorCopyWithImpl;
  @override
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$ApiErrorCopyWithImpl<$Res> implements _$ApiErrorCopyWith<$Res> {
  __$ApiErrorCopyWithImpl(this._self, this._then);

  final _ApiError _self;
  final $Res Function(_ApiError) _then;

  /// Create a copy of ApiError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_ApiError(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

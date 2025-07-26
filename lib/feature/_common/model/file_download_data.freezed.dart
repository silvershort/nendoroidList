// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileDownloadData {
  String get downloadUrl;
  String? get fileName;
  bool get showNotification;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileDownloadDataCopyWith<FileDownloadData> get copyWith =>
      _$FileDownloadDataCopyWithImpl<FileDownloadData>(
          this as FileDownloadData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileDownloadData &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.showNotification, showNotification) ||
                other.showNotification == showNotification));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, downloadUrl, fileName, showNotification);

  @override
  String toString() {
    return 'FileDownloadData(downloadUrl: $downloadUrl, fileName: $fileName, showNotification: $showNotification)';
  }
}

/// @nodoc
abstract mixin class $FileDownloadDataCopyWith<$Res> {
  factory $FileDownloadDataCopyWith(
          FileDownloadData value, $Res Function(FileDownloadData) _then) =
      _$FileDownloadDataCopyWithImpl;
  @useResult
  $Res call({String downloadUrl, String? fileName, bool showNotification});
}

/// @nodoc
class _$FileDownloadDataCopyWithImpl<$Res>
    implements $FileDownloadDataCopyWith<$Res> {
  _$FileDownloadDataCopyWithImpl(this._self, this._then);

  final FileDownloadData _self;
  final $Res Function(FileDownloadData) _then;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? fileName = freezed,
    Object? showNotification = null,
  }) {
    return _then(_self.copyWith(
      downloadUrl: null == downloadUrl
          ? _self.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      showNotification: null == showNotification
          ? _self.showNotification
          : showNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FileDownloadData].
extension FileDownloadDataPatterns on FileDownloadData {
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
    TResult Function(_FileDownloadData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData() when $default != null:
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
    TResult Function(_FileDownloadData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData():
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
    TResult? Function(_FileDownloadData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData() when $default != null:
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
            String downloadUrl, String? fileName, bool showNotification)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData() when $default != null:
        return $default(
            _that.downloadUrl, _that.fileName, _that.showNotification);
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
            String downloadUrl, String? fileName, bool showNotification)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData():
        return $default(
            _that.downloadUrl, _that.fileName, _that.showNotification);
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
            String downloadUrl, String? fileName, bool showNotification)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FileDownloadData() when $default != null:
        return $default(
            _that.downloadUrl, _that.fileName, _that.showNotification);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FileDownloadData implements FileDownloadData {
  const _FileDownloadData(
      {required this.downloadUrl, this.fileName, this.showNotification = true});

  @override
  final String downloadUrl;
  @override
  final String? fileName;
  @override
  @JsonKey()
  final bool showNotification;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileDownloadDataCopyWith<_FileDownloadData> get copyWith =>
      __$FileDownloadDataCopyWithImpl<_FileDownloadData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileDownloadData &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.showNotification, showNotification) ||
                other.showNotification == showNotification));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, downloadUrl, fileName, showNotification);

  @override
  String toString() {
    return 'FileDownloadData(downloadUrl: $downloadUrl, fileName: $fileName, showNotification: $showNotification)';
  }
}

/// @nodoc
abstract mixin class _$FileDownloadDataCopyWith<$Res>
    implements $FileDownloadDataCopyWith<$Res> {
  factory _$FileDownloadDataCopyWith(
          _FileDownloadData value, $Res Function(_FileDownloadData) _then) =
      __$FileDownloadDataCopyWithImpl;
  @override
  @useResult
  $Res call({String downloadUrl, String? fileName, bool showNotification});
}

/// @nodoc
class __$FileDownloadDataCopyWithImpl<$Res>
    implements _$FileDownloadDataCopyWith<$Res> {
  __$FileDownloadDataCopyWithImpl(this._self, this._then);

  final _FileDownloadData _self;
  final $Res Function(_FileDownloadData) _then;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? downloadUrl = null,
    Object? fileName = freezed,
    Object? showNotification = null,
  }) {
    return _then(_FileDownloadData(
      downloadUrl: null == downloadUrl
          ? _self.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      showNotification: null == showNotification
          ? _self.showNotification
          : showNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

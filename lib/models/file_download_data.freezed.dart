// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileDownloadData {
  String get downloadUrl => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  bool get showNotification => throw _privateConstructorUsedError;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileDownloadDataCopyWith<FileDownloadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDownloadDataCopyWith<$Res> {
  factory $FileDownloadDataCopyWith(
          FileDownloadData value, $Res Function(FileDownloadData) then) =
      _$FileDownloadDataCopyWithImpl<$Res, FileDownloadData>;
  @useResult
  $Res call({String downloadUrl, String? fileName, bool showNotification});
}

/// @nodoc
class _$FileDownloadDataCopyWithImpl<$Res, $Val extends FileDownloadData>
    implements $FileDownloadDataCopyWith<$Res> {
  _$FileDownloadDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? fileName = freezed,
    Object? showNotification = null,
  }) {
    return _then(_value.copyWith(
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      showNotification: null == showNotification
          ? _value.showNotification
          : showNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileDownloadDataImplCopyWith<$Res>
    implements $FileDownloadDataCopyWith<$Res> {
  factory _$$FileDownloadDataImplCopyWith(_$FileDownloadDataImpl value,
          $Res Function(_$FileDownloadDataImpl) then) =
      __$$FileDownloadDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadUrl, String? fileName, bool showNotification});
}

/// @nodoc
class __$$FileDownloadDataImplCopyWithImpl<$Res>
    extends _$FileDownloadDataCopyWithImpl<$Res, _$FileDownloadDataImpl>
    implements _$$FileDownloadDataImplCopyWith<$Res> {
  __$$FileDownloadDataImplCopyWithImpl(_$FileDownloadDataImpl _value,
      $Res Function(_$FileDownloadDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? fileName = freezed,
    Object? showNotification = null,
  }) {
    return _then(_$FileDownloadDataImpl(
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      showNotification: null == showNotification
          ? _value.showNotification
          : showNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FileDownloadDataImpl implements _FileDownloadData {
  const _$FileDownloadDataImpl(
      {required this.downloadUrl, this.fileName, this.showNotification = true});

  @override
  final String downloadUrl;
  @override
  final String? fileName;
  @override
  @JsonKey()
  final bool showNotification;

  @override
  String toString() {
    return 'FileDownloadData(downloadUrl: $downloadUrl, fileName: $fileName, showNotification: $showNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileDownloadDataImpl &&
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

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileDownloadDataImplCopyWith<_$FileDownloadDataImpl> get copyWith =>
      __$$FileDownloadDataImplCopyWithImpl<_$FileDownloadDataImpl>(
          this, _$identity);
}

abstract class _FileDownloadData implements FileDownloadData {
  const factory _FileDownloadData(
      {required final String downloadUrl,
      final String? fileName,
      final bool showNotification}) = _$FileDownloadDataImpl;

  @override
  String get downloadUrl;
  @override
  String? get fileName;
  @override
  bool get showNotification;

  /// Create a copy of FileDownloadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileDownloadDataImplCopyWith<_$FileDownloadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_download_data.freezed.dart';

@freezed
class FileDownloadData with _$FileDownloadData {
  const factory FileDownloadData({
    required String downloadUrl,
    String? fileName,
    @Default(true) bool showNotification,
  }) = _FileDownloadData;
}

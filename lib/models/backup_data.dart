import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/models/set_data.dart';

import 'nendo_data.dart';

part 'backup_data.freezed.dart';
part 'backup_data.g.dart';

@freezed
class BackupData with _$BackupData {
  const factory BackupData({
    required List<NendoData> nendoList,
    required List<SetData> setList,
    required String email,
    required String commitHash,
    required String commitDate,
    required String backupDate,
  }) = _BackupData;

  factory BackupData.fromJson(Map<String, dynamic> json) => _$BackupDataFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BackupData _$$_BackupDataFromJson(Map<String, dynamic> json) =>
    _$_BackupData(
      nendoList: (json['nendoList'] as List<dynamic>)
          .map((e) => NendoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      setList: (json['setList'] as List<dynamic>)
          .map((e) => SetData.fromJson(e as Map<String, dynamic>))
          .toList(),
      commitHash: json['commitHash'] as String,
      backupDate: json['backupDate'] as String,
    );

Map<String, dynamic> _$$_BackupDataToJson(_$_BackupData instance) =>
    <String, dynamic>{
      'nendoList': instance.nendoList,
      'setList': instance.setList,
      'commitHash': instance.commitHash,
      'backupDate': instance.backupDate,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackupData _$BackupDataFromJson(Map<String, dynamic> json) => _BackupData(
      nendoList: (json['nendoList'] as List<dynamic>)
          .map((e) => NendoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nenDollList: (json['nenDollList'] as List<dynamic>?)
              ?.map((e) => NendoData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      setList: (json['setList'] as List<dynamic>)
          .map((e) => SetData.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String,
      commitHash: json['commitHash'] as String,
      commitDate: json['commitDate'] as String,
      backupDate: json['backupDate'] as String,
    );

Map<String, dynamic> _$BackupDataToJson(_BackupData instance) =>
    <String, dynamic>{
      'nendoList': instance.nendoList,
      'nenDollList': instance.nenDollList,
      'setList': instance.setList,
      'email': instance.email,
      'commitHash': instance.commitHash,
      'commitDate': instance.commitDate,
      'backupDate': instance.backupDate,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nendo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NendoDto _$NendoDtoFromJson(Map<String, dynamic> json) => _NendoDto(
      num: json['num'] as String,
      gscProductNum: (json['gsc_product_num'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      image: json['image'] as String,
      gender: json['gender'] as String?,
      nameKo: json['nameKo'] as String?,
      nameJa: json['nameJa'] as String?,
      nameEn: json['nameEn'] as String?,
      seriesKo: json['seriesKo'] as String?,
      seriesJa: json['seriesJa'] as String?,
      seriesEn: json['seriesEn'] as String?,
    );

Map<String, dynamic> _$NendoDtoToJson(_NendoDto instance) => <String, dynamic>{
      'num': instance.num,
      'gsc_product_num': instance.gscProductNum,
      'price': instance.price,
      'image': instance.image,
      'gender': instance.gender,
      'nameKo': instance.nameKo,
      'nameJa': instance.nameJa,
      'nameEn': instance.nameEn,
      'seriesKo': instance.seriesKo,
      'seriesJa': instance.seriesJa,
      'seriesEn': instance.seriesEn,
    };

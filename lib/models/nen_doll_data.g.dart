// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nen_doll_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NenDollData _$$_NenDollDataFromJson(Map<String, dynamic> json) =>
    _$_NenDollData(
      gender: json['gender'] as String?,
      gscProductNum: json['gsc_productNum'] as int,
      image: json['image'] as String,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      price: json['price'] as int,
      releaseDate: (json['release_date'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      series: Series.fromJson(json['series'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_NenDollDataToJson(_$_NenDollData instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'gsc_productNum': instance.gscProductNum,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'release_date': instance.releaseDate,
      'series': instance.series,
      'type': instance.type,
    };

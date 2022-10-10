// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_yen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateYen _$ExchangeRateYenFromJson(Map<String, dynamic> json) =>
    ExchangeRateYen(
      code: json['code'] as String?,
      currencyCode: json['currencyCode'] as String?,
      currencyName: json['currencyName'] as String?,
      country: json['country'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      ttSellingPrice: (json['ttSellingPrice'] as num?)?.toDouble(),
      modifiedAt: json['modifiedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExchangeRateYenToJson(ExchangeRateYen instance) =>
    <String, dynamic>{
      'code': instance.code,
      'currencyCode': instance.currencyCode,
      'currencyName': instance.currencyName,
      'country': instance.country,
      'name': instance.name,
      'date': instance.date,
      'time': instance.time,
      'basePrice': instance.basePrice,
      'ttSellingPrice': instance.ttSellingPrice,
      'modifiedAt': instance.modifiedAt,
      'createdAt': instance.createdAt,
    };

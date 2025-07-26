// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_yen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExchangeRateYen _$ExchangeRateYenFromJson(Map<String, dynamic> json) =>
    _ExchangeRateYen(
      countryList: (json['country'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExchangeRateYenToJson(_ExchangeRateYen instance) =>
    <String, dynamic>{
      'country': instance.countryList,
    };

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
      value: json['value'] as String,
      subValue: json['subValue'] as String,
      currencyUnit: json['currencyUnit'] as String,
    );

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
      'value': instance.value,
      'subValue': instance.subValue,
      'currencyUnit': instance.currencyUnit,
    };

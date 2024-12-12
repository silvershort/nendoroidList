// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_yen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateYenImpl _$$ExchangeRateYenImplFromJson(
        Map<String, dynamic> json) =>
    _$ExchangeRateYenImpl(
      countryList: (json['country'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExchangeRateYenImplToJson(
        _$ExchangeRateYenImpl instance) =>
    <String, dynamic>{
      'country': instance.countryList,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      value: json['value'] as String,
      subValue: json['subValue'] as String,
      currencyUnit: json['currencyUnit'] as String,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'subValue': instance.subValue,
      'currencyUnit': instance.currencyUnit,
    };

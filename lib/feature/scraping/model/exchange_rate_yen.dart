import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_yen.freezed.dart';
part 'exchange_rate_yen.g.dart';

@freezed
abstract class ExchangeRateYen with _$ExchangeRateYen {
  const factory ExchangeRateYen({
    @JsonKey(name: 'country') required List<Country> countryList,
  }) = _ExchangeRateYen;

  factory ExchangeRateYen.fromJson(Map<String, dynamic> json) => _$ExchangeRateYenFromJson(json);
}

@freezed
abstract class Country with _$Country {
  const factory Country({
    required String value,
    required String subValue,
    required String currencyUnit,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}

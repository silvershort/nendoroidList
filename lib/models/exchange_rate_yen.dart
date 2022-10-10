import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate_yen.g.dart';

@JsonSerializable()
class ExchangeRateYen {
  String? code;
  String? currencyCode;
  String? currencyName;
  String? country;
  String? name;
  String? date;
  String? time;
  double? basePrice;
  double? ttSellingPrice;
  String? modifiedAt;
  String? createdAt;

  ExchangeRateYen(
      {this.code,
      this.currencyCode,
      this.currencyName,
      this.country,
      this.name,
      this.date,
      this.time,
      this.basePrice,
      this.ttSellingPrice,
      this.modifiedAt,
      this.createdAt});

  factory ExchangeRateYen.fromJson(Map<String, dynamic> json) => _$ExchangeRateYenFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateYenToJson(this);
}

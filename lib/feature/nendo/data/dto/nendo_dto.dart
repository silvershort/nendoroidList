import 'package:freezed_annotation/freezed_annotation.dart';

part 'nendo_dto.g.dart';

part 'nendo_dto.freezed.dart';

@freezed
abstract class NendoDto with _$NendoDto {
  const factory NendoDto({
    required String num,
    @JsonKey(name: 'gsc_product_num') required int gscProductNum,
    required int price,
    required String image,
    String? gender,
    String? nameKo,
    String? nameJa,
    String? nameEn,
    String? seriesKo,
    String? seriesJa,
    String? seriesEn,
  }) = _NendoDto;

  factory NendoDto.fromJson(Map<String, dynamic> json) => _$NendoDtoFromJson(json);
}

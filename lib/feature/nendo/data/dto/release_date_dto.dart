import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_date_dto.freezed.dart';

part 'release_date_dto.g.dart';

@freezed
abstract class ReleaseDateDto with _$ReleaseDateDto {
  const factory ReleaseDateDto({
    @JsonKey(name: 'nendo_num') required String nendoNum,
    @JsonKey(name: 'release_date') required String releaseDate,
}) = _ReleaseDateDto;

  factory ReleaseDateDto.fromJson(Map<String, dynamic> json) => _$ReleaseDateDtoFromJson(json);
}
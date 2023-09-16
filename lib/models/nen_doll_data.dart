// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/models/nendo_data.dart';

part 'nen_doll_data.g.dart';

part 'nen_doll_data.freezed.dart';

@freezed
class NenDollData with _$NenDollData {
  const factory NenDollData({
    String? gender,
    @JsonKey(name: 'gsc_productNum') required int gscProductNum,
    required String image,
    required Name name,
    required int price,
    @JsonKey(name: 'release_date') List<String>? releaseDate,
    required Series series,
    required String type,
}) = _NenDollData;

  factory NenDollData.fromJson(Map<String, dynamic> json) => _$NenDollDataFromJson(json);
}
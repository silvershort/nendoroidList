import 'package:freezed_annotation/freezed_annotation.dart';

part 'nendo_release_info_data.freezed.dart';

@freezed
class NendoRelaseInfoData with _$NendoRelaseInfoData {
  const factory NendoRelaseInfoData({
    required DateTime lastReleaseDate,
    required List<MonthReleaseData> monthReleaseList,
  }) = _NendoRelaseInfoData;
}

@freezed
class MonthReleaseData with _$MonthReleaseData {
  const factory MonthReleaseData({
    required int year,
    required int month,
    required List<ReleaseData> releaseList,
  }) = _MonthReleaseData;
}

@freezed
class ReleaseData with _$ReleaseData {
  const factory ReleaseData({
    required DateTime releaseData,
    required NendoReleaseData nendoData,
  }) = _ReleaseData;
}

@freezed
class NendoReleaseData with _$NendoReleaseData {
  const factory NendoReleaseData({
    String? imageLink,
    required String name,
    required String productLink,
  }) = _NendoReldeaseData;
}

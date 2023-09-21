import 'package:freezed_annotation/freezed_annotation.dart';

part 'doll_filter_data.freezed.dart';

@freezed
class DollFilterData with _$DollFilterData {
  const factory DollFilterData({
    @Default(true) bool bodyFilter,
    @Default(true) bool clothesFilter,
    @Default(true) bool customizingFilter,
    @Default(true) bool dollFilter,
  }) = _DollFilterData;

  const DollFilterData._();

  DollFilterData invertBody() {
    return copyWith(bodyFilter: !bodyFilter);
  }
  DollFilterData invertClothes() {
    return copyWith(clothesFilter: !clothesFilter);
  }
  DollFilterData invertCustomizing() {
    return copyWith(customizingFilter: !customizingFilter);
  }
  DollFilterData invertDoll() {
    return copyWith(dollFilter: !dollFilter);
  }
}
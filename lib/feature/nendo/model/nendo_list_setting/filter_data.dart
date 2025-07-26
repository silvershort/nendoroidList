import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_data.freezed.dart';

@freezed
abstract class FilterData with _$FilterData {
  const factory FilterData({
    @Default(false) bool haveFilter,
    @Default(false) bool notHaveFilter,
    @Default(false) bool wishFilter,
    // @Default(false) bool expectedFilter,
    @Default(false) bool preOrderFilter,
    @Default(false) bool femaleFilter,
    @Default(false) bool maleFilter,
    @Default(false) bool etcFilter,
  }) = _FilterData;

  const FilterData._();

  FilterData invertHave() {
   return copyWith(haveFilter: !haveFilter);
  }
  FilterData invertNotHave() {
    return copyWith(notHaveFilter: !notHaveFilter);
  }
  FilterData invertWish() {
    return copyWith(wishFilter: !wishFilter);
  }
  FilterData invertPreOrder() {
    return copyWith(preOrderFilter: !preOrderFilter);
  }
  // FilterData invertExpected() {
  //   return copyWith(expectedFilter: !expectedFilter);
  // }
  FilterData invertFemale() {
    return copyWith(femaleFilter: !femaleFilter);
  }
  FilterData invertMale() {
    return copyWith(maleFilter: !maleFilter);
  }
  FilterData invertEtc() {
    return copyWith(etcFilter: !etcFilter);
  }
}
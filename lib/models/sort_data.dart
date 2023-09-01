import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_data.freezed.dart';

@freezed
class SortData with _$SortData {
  const factory SortData({
    @Default(ASC()) SortingOrder sortingOrder,
    @Default(SortingMethodNum()) SortingMethod sortingMethod,
  }) = _SortData;

  const SortData._();

  SortData toggleOrderValue() {
    return copyWith(
      sortingOrder: sortingOrder.toggleValue,
    );
  }
}

sealed class SortingOrder {
  const SortingOrder();

  SortingOrder get toggleValue => switch (this) {
        ASC() => const DESC(),
        DESC() => const ASC(),
      };
}

class ASC extends SortingOrder {
  const ASC();
}

class DESC extends SortingOrder {
  const DESC();
}

sealed class SortingMethod {
  const SortingMethod();
}

class SortingMethodNum extends SortingMethod {
  const SortingMethodNum();
}

class SortingMethodRelease extends SortingMethod {
  const SortingMethodRelease();
}

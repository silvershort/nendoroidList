import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_visible_data.freezed.dart';

@freezed
abstract class GridVisibleData with _$GridVisibleData {
  const factory GridVisibleData({
    @Default(false) bool number,
    @Default(false) bool name,
    @Default(false) bool have,
    @Default(false) bool preOrder,
    @Default(false) bool wish,
    @Default(NonEmphasize()) Emphasize emphasize,
  }) = _GridVisibleData;
}

sealed class Emphasize {
  const Emphasize();
}

class NonEmphasize extends Emphasize {
  const NonEmphasize();
}
class HaveEmphasize extends Emphasize {
  const HaveEmphasize();
}
class PreOrderEmphasize extends Emphasize {
  const PreOrderEmphasize();
}
class WishEmphasize extends Emphasize {
  const WishEmphasize();
}
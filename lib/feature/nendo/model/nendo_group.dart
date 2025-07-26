import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';

part 'nendo_group.freezed.dart';

@freezed
abstract class NendoGroup with _$NendoGroup {
  const factory NendoGroup({
    required String name,
    required List<NendoData> nendoList,
}) = _NendoGroup;
}

sealed class Grouping {}
class NumberGroup extends Grouping {}
class SeriesGroup extends Grouping {}
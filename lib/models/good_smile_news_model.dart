import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/models/nendo_data.dart';

part 'good_smile_news_model.freezed.dart';

@freezed
class GoodSmileNewsModel with _$GoodSmileNewsModel {
  const factory GoodSmileNewsModel({
    required String link,
    @Default([]) List<String> nendoNameList,
    @Default([]) List<NendoData> nendoList,
  }) = _GoodSmileNewsModel;
}

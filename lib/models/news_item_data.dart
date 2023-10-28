import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item_data.freezed.dart';

@freezed
class NewsItemData with _$NewsItemData {
  const factory NewsItemData({
    String? number,
    required String name,
    String? price,
    required String imagePath,
    @Default('') String link,
    @Default(false) bool soldOut,
  }) = _NewsItemData;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/networks/services/scraping_serivce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.freezed.dart';
part 'news_provider.g.dart';

@riverpod
class News extends _$News {
  // 페이지네이션을 위한 간격
  final Duration _period = const Duration(days: 3);

  // API 호출 변수
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  FutureOr<NewsState> build() async {
    return initData();
  }

  Future<NewsState> initData() async {
    final List<NewsItemData> specialList = await getNendoroidList();
    final List<NewsItemData> ninimalList = await getNinimalList();
    final List<NewsItemData> imminentList = await getNendoroidAnnounced();
    return NewsState(
      specialGoodsList: specialList,
      ninimalList: ninimalList,
      imminentList: imminentList,
    );
  }

  Future<List<NewsItemData>> getNendoroidAnnounced() async {
    final result = await ref.read(scrapingServiceProvider).getNendoroidAnnounced();

    return result.when(
      success: (value) {
        return value;
      },
      error: (error, stackTrace) {
        logger.e(error.message);
        return [];
      },
    );
  }

  Future<List<NewsItemData>> getNendoroidList() async {
    final result = await ref.read(scrapingServiceProvider).getGoodSmileSpecialList();

    return result.when(
      success: (value) {
        return value;
      },
      error: (error, stackTrace) {
        logger.e(error.message);
        return [];
      },
    );
  }

  Future<List<NewsItemData>> getNinimalList() async {
    final result = await ref.read(scrapingServiceProvider).getNinimalList();

    return result.when(
      success: (value) {
        return value;
      },
      error: (error, stackTrace) {
        logger.e(error.message);
        return [];
      },
    );
  }
}

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<NewsItemData> specialGoodsList,
    @Default([]) List<NewsItemData> ninimalList,
    @Default([]) List<NewsItemData> imminentList,
  }) = _NewsState;
}

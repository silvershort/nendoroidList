import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/app/extention/list_extension.dart';
import 'package:nendoroid_db/feature/_common/data/dio/app_dio.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';
import 'package:nendoroid_db/feature/scraping/data/service/scraping_serivce.dart';
import 'package:nendoroid_db/feature/scraping/model/good_smile_news_model.dart';
import 'package:nendoroid_db/feature/scraping/model/news_item_data.dart';
import 'package:nendoroid_db/main.dart';
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
    final GoodSmileNewsModel? goodSmileNewsModel = await getGoodSmileNews();

    return NewsState(
      specialGoodsList: specialList,
      ninimalList: ninimalList,
      imminentList: imminentList,
      goodSmileNewsModel: goodSmileNewsModel,
    );
  }

  Future<List<NewsItemData>> getNendoroidAnnounced() async {
    final result = await ref.read(scrapingServiceProvider).getNendoroidAnnounced();

    return result.when(
      success: (value) {
        return value;
      },
      error: (error, stackTrace) {
        talker.error(error.message, error, stackTrace);
        return [];
      },
    );
  }

  Future<List<NewsItemData>> getNendoroidList() async {
    // 알 수 없는 이유로 네이버 헤더에 쿠키값을 포함하지 않으면 스크래핑이 되지 않는다.
    // 따라서 Dio쪽에 헤더를 추가했다가 메소드가 끝날때 해제시킨다.
    final appDioController = ref.read(appDioProvider.notifier);
    appDioController.addHeader({'Cookie': 'wcs_bt=s_17766344d46d1:1726706449; Path=/; Expires=Fri, 19 Sep 2025 00:43:33 GMT;'});

    final result = await ref.read(scrapingServiceProvider).getGoodSmileSpecialList();

    appDioController.removeHeader(['Cookie']);

    return result.when(
      success: (value) {
        return value;
      },
      error: (error, stackTrace) {
        talker.error(error.message, error, stackTrace);
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
        talker.error(error.message, error, stackTrace);
        return [];
      },
    );
  }

  Future<GoodSmileNewsModel?> getGoodSmileNews() async {
    final result = await ref.read(scrapingServiceProvider).getGoodSmileNews();

    return result.when(
      success: (value) {
        if (ref.read(nendoProvider).hasValue) {
          final List<NendoData> nendoList = value.nendoNameList.expand<NendoData>((e) {
            final NendoData? nendo = ref.read(nendoProvider).requireValue.nendoList.getNendoByENName(e);
            return nendo != null ? [nendo] : [];
          }).toList();

          final newGoodSmileNews = value.copyWith(
            nendoList: nendoList,
          );

          return newGoodSmileNews;
        } else {
          return null;
        }
      },
      error: (error, stackTrace) {
        talker.error(error.message, error, stackTrace);
        return null;
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
    GoodSmileNewsModel? goodSmileNewsModel,
  }) = _NewsState;
}

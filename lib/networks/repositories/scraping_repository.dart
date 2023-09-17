import 'package:dio/dio.dart';
import 'package:nendoroid_db/models/exchange_rate_yen.dart';
import 'package:nendoroid_db/networks/dio/app_dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scraping_repository.g.dart';

@Riverpod(keepAlive: true)
ScrapingRepository scrapingRepository(ScrapingRepositoryRef ref) {
  return ScrapingRepository(ref.watch(appDioProvider));
}

@RestApi()
abstract class ScrapingRepository {
  factory ScrapingRepository(Dio dio) = _ScrapingRepository;

  // 루리웹 피규어 정보 리스트
  @GET("https://bbs.ruliweb.com/family/242/board/300017")
  Future<HttpResponse> getRuliwebInfoList(@Query("page") int page,);

  // 루리웹 피규어 갤러리 리스트
  @GET("https://bbs.ruliweb.com/family/242/board/300087")
  Future<HttpResponse> getRuliwebGalleryList(@Query("page") int page,);

  // 루리웹 디테일
  @GET("https://bbs.ruliweb.com/family/242/board/300017/read/{id}")
  Future<HttpResponse> getRuliwebDetail(@Path("id") String id,);

  // 넨갤 리스트
  @GET("https://gall.dcinside.com/mgallery/board/lists/")
  Future<HttpResponse> getDcinsideList({
    @Query("id") required String id,
    @Query("sort_type") required String sortType,
    @Query("search_head") required String searchHead,
    @Query("page") required int page,
  });

  // 넨도로이드 이미지
  @GET("https://www.goodsmile.info/ja/product/{gscProductNum}")
  Future<HttpResponse> getGoodSmileImage({
    @Path("gscProductNum") required String gscProductNum,
  });

  // 엔화 환율 정보
  @GET("https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRWJPY")
  Future<List<ExchangeRateYen>> getExchangeRate();
}
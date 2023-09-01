import 'package:dio/dio.dart';
import 'package:nendoroid_db/models/exchange_rate_yen.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/tweet_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // 넨도 데이터 가져오기
  @GET("https://raw.githubusercontent.com/KhoraLee/NendoroidDB/dashboard/Nendoroid/{folderName}/{fileName}")
  Future<NendoData> getNendoData(
    @Path("folderName") String folderName,
    @Path("fileName") String fileName,
  );

  // 세트 데이터 가져오기
  @GET("https://raw.githubusercontent.com/KhoraLee/NendoroidDB/dashboard/Nendoroid/{folderName}/{fileName}")
  Future<SetData> getSetData(
      @Path("folderName") String folderName,
      @Path("fileName") String fileName,
  );

  // 폴더 이름 리스트 및 넨도 json 파일명 리스트 가져오기
  @GET("https://api.github.com/repos/KhoraLee/NendoroidDB/contents/Nendoroid/{folderName}")
  Future<List<Repo>> getRepoList(
      @Path("folderName") String folderName,
  );

  // 환율 정보 받아오기
  @GET("https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRWJPY")
  Future<List<ExchangeRateYen>> getExchangeRate();

  // 트위터 타임라인 받아오기
  @GET("https://api.twitter.com/2/users/{id}/tweets")
  Future<TweetData> getTwitterTimeline(
    @Path("id") String id,
    @Queries() Map<String, dynamic> queries,
  );

  // 유저 정보 받아오기
  @GET("https://api.twitter.com/2/users")
  Future<UsernameData> getTwitterUsername(
    @Query("ids") String username,
    @Query("user.fields") String userFields,
  );

  // 루리웹 피규어 정보 리스트
  @GET("https://bbs.ruliweb.com/family/242/board/300017")
  Future<HttpResponse> getRuliwebInfoList(
    @Query("page") int page,
  );

  // 루리웹 피규어 갤러리 리스트
  @GET("https://bbs.ruliweb.com/family/242/board/300087")
  Future<HttpResponse> getRuliwebGalleryList(
    @Query("page") int page,
  );

  // 루리웹 디테일
  @GET("https://bbs.ruliweb.com/family/242/board/300017/read/{id}")
  Future<HttpResponse> getRuliwebDetail(
    @Path("id") String id,
  );

  // 넨갤 리스트
  @GET("https://gall.dcinside.com/mgallery/board/lists/")
  Future<HttpResponse> getDcinsideList(
    @Query("id") String id,
    @Query("sort_type") String sortType,
    @Query("search_head") String searchHead,
    @Query("page") int page,
  );
}

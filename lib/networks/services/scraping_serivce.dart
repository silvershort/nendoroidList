import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/networks/repositories/scraping_repository.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scraping_serivce.g.dart';

@Riverpod(keepAlive: true)
ScrapingService scrapingService(ScrapingServiceRef ref) {
  return ScrapingService(repository: ref.watch(scrapingRepositoryProvider));
}

class ScrapingService {
  final ScrapingRepository repository;

  const ScrapingService({
    required this.repository,
  });

  Future<ApiResult<HttpResponse>> getRuliwebInfoList({
    required int page,
  }) {
    return apiCall(request: repository.getRuliwebInfoList(page));
  }

  Future<ApiResult<HttpResponse>> getRuliwebGalleryList({
    required int page,
  }) {
    return apiCall(request: repository.getRuliwebGalleryList(page));
  }

  Future<ApiResult<HttpResponse>> getRuliwebDetail({
    required String id,
  }) {
    return apiCall(request: repository.getRuliwebDetail(id));
  }

  Future<ApiResult<HttpResponse>> getDcinsideList({
    required String id,
    required String sortType,
    required String searchHead,
    required int page,
  }) {
    return apiCall(
      request: repository.getDcinsideList(
        id: id,
        sortType: sortType,
        searchHead: searchHead,
        page: page,
      ),
    );
  }

  Future<ApiResult<({List<String> imageList, List<String> thumbnailList})>> getGoodSmileImage({
    required String gscProductNum,
  }) async {
    try {
      final response = await repository.getGoodSmileImage(gscProductNum: gscProductNum);
      Document document = parse(response.data);
      Element nodeList = document.getElementsByClassName("itemPhotos").first;
      List<String> imageList = nodeList
          .getElementsByClassName("inline_fix")
          .map((e) => "https:${e.getElementsByTagName("a").firstWhere((element) => element.className == "imagebox").attributes["href"] ?? ""}")
          .toList();
      List<String> thumbnailList = nodeList.getElementsByClassName("iconZoom").map((e) => "https:${e.attributes["src"] ?? ""}").toList();
      return ApiResult.success((imageList: imageList, thumbnailList: thumbnailList));
    } catch (error, stackTrace) {
      logger.e(error.toString(), stackTrace: stackTrace);
      return ApiResult.error(ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<int>> getExchangeRate() async {
    try {
      final response = await repository.getExchangeRate();
      logger.i(response.toString());
      return ApiResult.success(response[0].ttSellingPrice?.toInt() ?? 0);
    } catch (error, stackTrace) {
      logger.e(error.toString(), stackTrace: stackTrace);
      return ApiResult.error(ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }
}

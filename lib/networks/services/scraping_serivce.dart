import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/networks/repositories/scraping_repository.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scraping_serivce.g.dart';

@riverpod
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
}

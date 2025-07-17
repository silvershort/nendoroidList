import 'package:nendoroid_db/feature/_common/model/api_result.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/scraping/data/repository/github_repository.dart';
import 'package:nendoroid_db/feature/scraping/model/repo.dart';
import 'package:nendoroid_db/feature/scraping/model/set_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_service.g.dart';

@Riverpod(keepAlive: true)
GithubService githubService(GithubServiceRef ref) {
  return GithubService(repository: ref.watch(githubRepositoryProvider));
}

class GithubService {
  final GithubRepository repository;

  const GithubService({
    required this.repository,
  });

  Future<NendoData> getNendoData({
    required String folderName,
    required String fileName,
  }) {
    // return apiCall(request: repository.getNendoData(folderName, fileName));
    return repository.getNendoData(folderName, fileName);
  }

  Future<SetData> getSetData({
    required String folderName,
    required String fileName,
  }) async {
    // return apiCall(request: repository.getSetData(folderName, fileName));
    return repository.getSetData(folderName, fileName);
  }

  Future<ApiResult<List<Repo>>> getRepoList({
    required String folderName,
  }) {
    return apiCall(request: repository.getRepoList(folderName));
  }
}

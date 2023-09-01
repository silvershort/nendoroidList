import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/repositories/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_service.g.dart';

@riverpod
GithubService githubService(GithubServiceRef ref) {
  return GithubService(repository: ref.watch(githubRepository));
}

class GithubService {
  final GithubRepository repository;

  const GithubService({
    required this.repository,
  });

  Future<ApiResult<NendoData>> getNendoData({
    required String folderName,
    required String fileName,
  }) {
    return apiCall(request: repository.getNendoData(folderName, fileName));
  }

  Future<ApiResult<SetData>> getSetData({
    required String folderName,
    required String fileName,
  }) {
    return apiCall(request: repository.getSetData(folderName, fileName));
  }

  Future<ApiResult<List<Repo>>> getRepoList({
    required String folderName,
  }) {
    return apiCall(request: repository.getRepoList(folderName));
  }
}

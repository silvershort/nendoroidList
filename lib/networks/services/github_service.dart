import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/doll_type.dart';
import 'package:nendoroid_db/models/nen_doll_data.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/repositories/github_repository.dart';
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

  Future<NenDollData> getNenDollData({
    required DollType dollType,
    required String fileName,
  }) async {
    // return apiCall(request: repository.getNenDollData(dollType.name, fileName));
    return repository.getNenDollData(dollType.name, fileName);
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

  Future<List<Repo>> getNenDollJsonList({
    required DollType dollType,
  }) async {
    return await repository.getNenDollJsonList(dollType.name);
  }
}

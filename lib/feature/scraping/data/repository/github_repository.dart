import 'package:dio/dio.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/scraping/data/dio/github_dio.dart';
import 'package:nendoroid_db/feature/scraping/model/repo.dart';
import 'package:nendoroid_db/feature/scraping/model/set_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository.g.dart';

@Riverpod(keepAlive: true)
GithubRepository githubRepository(GithubRepositoryRef ref) {
  return GithubRepository(ref.watch(githubDioProvider));
}

@RestApi()
abstract class GithubRepository {
  factory GithubRepository(Dio dio) = _GithubRepository;

  // 넨도 데이터 가져오기
  @GET("https://raw.githubusercontent.com/silvershort/NewNendoroidDB/main/Nendoroid/{folderName}/{fileName}")
  Future<NendoData> getNendoData(
    @Path("folderName") String folderName,
    @Path("fileName") String fileName,
  );

  // 세트 데이터 가져오기
  @GET("https://raw.githubusercontent.com/silvershort/NewNendoroidDB/main/Nendoroid/{folderName}/{fileName}")
  Future<SetData> getSetData(
    @Path("folderName") String folderName,
    @Path("fileName") String fileName,
  );

  // 폴더 이름 리스트 및 넨도 json 파일명 리스트 가져오기
  @GET("https://api.github.com/repos/silvershort/NewNendoroidDB/contents/Nendoroid/{folderName}")
  Future<List<Repo>> getRepoList(
    @Path("folderName") String folderName,
  );

  // 넨돌 데이터 리스트 받아오기
  @GET("https://api.github.com/repos/silvershort/NewNendoroidDB/contents/NendoroidDoll/{folderName}")
  Future<List<Repo>> getNenDollJsonList(
    @Path("folderName") String folderName,
  );
}

import 'package:dio/dio.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/repo.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/networks/dio/app_dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository.g.dart';

final githubRepository = Provider((ref) => GithubRepository(ref.watch(appDioProvider)));

@RestApi()
abstract class GithubRepository {
  factory GithubRepository(Dio dio) = _GithubRepository;

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
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

import '../models/nendo_data.dart';
import '../models/repo.dart';
import '../models/set_data.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // 넨도 데이터 가져오기
  @GET("https://raw.githubusercontent.com/KhoraLee/NendoroidDB/main/Nendoroid/{folderName}/{fileName}")
  Future<NendoData> getNendoData(
    @Path("folderName") String folderName,
    @Path("fileName") String fileName,
  );

  // 세트 데이터 가져오기
  @GET("https://raw.githubusercontent.com/KhoraLee/NendoroidDB/main/Nendoroid/{folderName}/{fileName}")
  Future<SetData> getSetData(
      @Path("folderName") String folderName,
      @Path("fileName") String fileName,
  );

  // 폴더 이름 리스트 및 넨도 json 파일명 리스트 가져오기
  @GET('https://api.github.com/repos/KhoraLee/NendoroidDB/contents/Nendoroid/{folderName}')
  Future<List<Repo>> getRepoList(
      @Path("folderName") String folderName,
  );
}

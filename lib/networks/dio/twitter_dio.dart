import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'twitter_dio.g.dart';

@Riverpod(keepAlive: true)
class TwitterDio extends _$TwitterDio {
  final Dio _dio = Dio();

  @override
  Dio build() {
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    );
    return _dio;
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
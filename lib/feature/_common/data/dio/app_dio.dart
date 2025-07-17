import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_dio.g.dart';

@Riverpod(keepAlive: true)
class AppDio extends _$AppDio {
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

  void addHeader(Map<String, dynamic> header) {
    _dio.options.headers.addAll(header);
  }

  void removeHeader(List<String> keys) {
    for (var key in keys) {
      _dio.options.headers.remove(key);
    }
  }

}
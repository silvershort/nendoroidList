import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/main.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T value) = _Success<T>;
  const factory ApiResult.error(ApiError error, StackTrace stackTrace) = _Error;
}

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    @Default(0) int code,
    required String message,
  }) = _ApiError;
}

Future<ApiResult<T>> apiCall<T>({required Future<T> request}) async {
  try {
    final T result = await request;
    logger.d(result.toString());
    return ApiResult<T>.success(result);
  } on DioException catch (error, stackTrace){
    logger.e(ApiError(code: error.response?.statusCode ?? 0, message: error.message ?? ''), stackTrace: stackTrace);
    return ApiResult.error(ApiError(code: error.response?.statusCode ?? 0, message: error.message ?? ''), stackTrace);
  } catch (error, stackTrace) {
    logger.e(error: error, stackTrace);
    return ApiResult.error(ApiError(code: 0, message: error.toString()), stackTrace);
  }
}
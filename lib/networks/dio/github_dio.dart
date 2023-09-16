import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nendoroid_db/main_new.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_dio.g.dart';

@Riverpod(keepAlive: true)
Dio githubDio(GithubDioRef ref) {
  return Dio()
    ..interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
        ),
        InterceptorsWrapper(
          onResponse: (res, handler) async {
            logger.i('res : ${res.data.toString()}');
            if (res.headers.map[Headers.contentTypeHeader]?.first.startsWith('text') == true) {
              res.data = jsonDecode(res.data as String);
              return handler.next(res);
            }
            return handler.next(res);
          },
        ),
      ],
    );
}

import 'package:dio/dio.dart';
import 'package:nendoroid_db/models/tweet_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:nendoroid_db/networks/dio/app_dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'twitter_repository.g.dart';

@riverpod
TwitterRepository twitterRepository(TwitterRepositoryRef ref) {
  return TwitterRepository(ref.watch(appDioProvider));
}

@RestApi()
abstract class TwitterRepository {
  factory TwitterRepository(Dio dio) = _TwitterRepository;

  // 트위터 타임라인 받아오기
  @GET("https://api.twitter.com/2/users/{id}/tweets")
  Future<TweetData> getTwitterTimeline({
    @Path("id") required String id,
    @Queries() required Map<String, dynamic> queries,
  });

  // 유저 정보 받아오기
  @GET("https://api.twitter.com/2/users")
  Future<UsernameData> getTwitterUsername({
    @Query("ids") required String username,
    @Query("user.fields") required String userFields,
  });
}

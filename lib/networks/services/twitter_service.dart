import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/tweet_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:nendoroid_db/networks/repositories/twitter_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'twitter_service.g.dart';

@riverpod
TwitterService twitterService(TwitterServiceRef ref) {
  return TwitterService(repository: ref.watch(twitterRepositoryProvider));
}

class TwitterService {
  final TwitterRepository repository;

  const TwitterService({
    required this.repository,
  });

  Future<ApiResult<TweetData>> getTwitterTimeline({
    required String id,
    required Map<String, dynamic> queries,
  }) {
    return apiCall(request: repository.getTwitterTimeline(id: id, queries: queries));
  }

  Future<ApiResult<UsernameData>> getTwitterUsername({
    required String username,
    required String userFields,
  }) {
    return apiCall(request: repository.getTwitterUsername(username: username, userFields: userFields));
  }
}

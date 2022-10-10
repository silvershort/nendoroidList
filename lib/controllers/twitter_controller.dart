import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/models/subscribe_data.dart';
import 'package:nendoroid_db/models/tweet_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:nendoroid_db/services/rest_client.dart';

class TwitterController extends GetxController {
  // API 호출용 상수
  final String bearerToken = "AAAAAAAAAAAAAAAAAAAAAFvaggEAAAAAWBnBTItA8zWx9KY%2BHxDTjwSvR5s%3DSyGdKaXNMawsGbat83kcXu84GSeGHl4GlXmhC58YWpATNsT9La";
  final String goodSmileId = "68864104";
  final String goodSmileUSId = "755974370";
  final String goodSmileKRId = "1410541618805936129";
  final String figureInfoId = "771024858897526785";
  final String ninimalId = "3286303020";

  // 트위터 유저 정보
  List<UserData> userList = [];

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> initData(TwitterSubscribe subscribe) async {
    List<String> userIdList = [];
    if (subscribe.goodSmileJP) userIdList.add(goodSmileId);
    if (subscribe.goodSmileUS) userIdList.add(goodSmileUSId);
    if (subscribe.goodSmileKR) userIdList.add(goodSmileKRId);
    if (subscribe.ninimal) userIdList.add(ninimalId);
    if (subscribe.figureInfo) userIdList.add(figureInfoId);
    String userId = userIdList.join(",");
    print("userId : $userId");

    await fetchUserdata(userId);
  }

  Future<List<NewsData>?> fetchTimeline({
    required String userId,
    required String startTime,
    required String endTime,
  }) async {
    TweetData? tweetData;

    try {
      tweetData = await getRepoClient().getTwitterTimeline(
            userId,
            {
              "expansions": "attachments.media_keys",
              "user.fields": "url",
              "media.fields": "url",
              "start_time": startTime,
              "end_time": endTime,
              "tweet.fields": "created_at"
            },
          );
    } catch (e) {
      print(e.toString());
    }

    if (tweetData == null) {
      return null;
    }

    List<NewsData> informationList = [];
    List<Media>? mediaList = tweetData.includes?.media;

    for (int i = 0; i < tweetData.data.length; i++) {
      Data data = tweetData.data[i];
      String id = data.id;
      String content = data.text;
      String createdAt = data.createdAt;
      List<String> attachList = [];

      // RT 제거
      if (content.startsWith("RT @")) {
        continue;
      }

      // 맨션 제거
      if (content.startsWith("@")) {
        continue;
      }

      if (mediaList != null && data.attachments?.mediaKeys != null) {
        for (String mediaKey in data.attachments!.mediaKeys) {
          attachList.add(mediaList.firstWhere((element) => element.mediaKey == mediaKey).url ?? "");
        }
      }
      informationList.add(NewsData(
        type: NewsType.twitter,
        id: id,
        author: userList.firstWhere((element) => element.id == userId),
        content: content,
        createdAt: createdAt,
        imageUrlList: attachList,
      ));
    }
    return informationList;
  }

  Future<void> fetchUserdata(String userId) async {
    if (userId.isEmpty) {
      return;
    }
    UsernameData usernameData = await getRepoClient()
        .getTwitterUsername(
      userId,
      "profile_image_url",
    )
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("@@@ error statusCode : ${res?.statusCode}");
          print("@@@ error msg : ${res?.data.toString()}");
          break;
        default:
          break;
      }
    }).onError((error, stackTrace) {
      return Future.value(UsernameData(data: []));
    });
    userList = usernameData.data;
    return;
  }

  RestClient getRepoClient() {
    return RestClient(Dio()..options.headers["Authorization"] = "Bearer $bearerToken");
  }
}

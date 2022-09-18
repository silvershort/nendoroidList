import 'dart:async';
import 'dart:io' hide HttpResponse;

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/models/information_data.dart';
import 'package:nendoroid_db/models/tweet_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:nendoroid_db/services/rest_client.dart';

class TwitterController extends GetxController {
  // API 호출용 상수
  final String bearerToken = "AAAAAAAAAAAAAAAAAAAAAFvaggEAAAAAWBnBTItA8zWx9KY%2BHxDTjwSvR5s%3DSyGdKaXNMawsGbat83kcXu84GSeGHl4GlXmhC58YWpATNsT9La";
  final String goodSmileId = "68864104";
  final String goodSmileUSId = "755974370";

  // API 호출 변수
  late DateTime startTime;
  late DateTime endTime;

  // 트위터 유저 정보
  List<UserData> userList = [];

  // 날짜 형식
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  @override
  void onInit() async {
    super.onInit();
    await fetchUserdata("$goodSmileId,$goodSmileUSId");
    initData();
  }

  void initData() {
    endTime = DateTime.now();
    startTime = endTime.subtract(const Duration(days: 7));
  }

  Future<List<InformationData>?> fetchTimeline({required String userId, bool reset = false}) async {
    if (reset) {
      initData();
    }
    TweetData? tweetData = await getRepoClient().getTwitterTimeline(
      userId,
      {
        "expansions": "attachments.media_keys",
        "user.fields": "url",
        "media.fields": "url",
        "start_time": dateFormat.format(startTime),
        "end_time": dateFormat.format(endTime),
        "tweet.fields": "created_at"
      },
    ).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("error statusCode : ${res?.statusCode}");
          print("error msg : ${res?.data.toString()}");
          break;
        default:
          break;
      }
    }).onError((error, stackTrace) {
      return Future(() => null);
    });

    if (tweetData == null) {
      return null;
    }

    List<InformationData> informationList = [];
    List<Media>? mediaList = tweetData.includes?.media;

    for (int i = 0; i < tweetData.data.length; i++) {
      Data data = tweetData.data[i];
      String content = data.text;
      String createdAt = data.createdAt;
      List<String> attachList = [];

      if (mediaList != null && data.attachments?.mediaKeys != null) {
        for (String mediaKey in data.attachments!.mediaKeys) {
          attachList.add(mediaList.firstWhere((element) => element.mediaKey == mediaKey).url);
        }
      }
      informationList.add(InformationData(
        type: InformationType.twitter,
        author: userList.firstWhereOrNull((element) => element.id == userId)?.username ?? "유저정보없음",
        content: content,
        createdAt: createdAt,
        imageUrlList: attachList,
      ));
    }

    for (InformationData data in informationList) {
      print("@@@ data : ${data.createdAt}");
      print("@@@ data : ${data.imageUrlList.toString()}");
    }
    return informationList;
  }

  Future<void> fetchUserdata(String userId) async {
    UsernameData usernameData = await getRepoClient().getTwitterUsername(
      userId,
      "profile_image_url",
    ).catchError((Object obj) {
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

    userList.addAll(usernameData.data);
    return;
  }

  RestClient getRepoClient() {
    return RestClient(Dio()..options.headers["Authorization"] = "Bearer $bearerToken");
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/controllers/twitter_controller.dart';
import 'package:nendoroid_db/models/news_data.dart';

class NewsController extends GetxController {
  // 컨트롤러
  final ScrollController scrollController = ScrollController();

  // 상수
  final Duration week = const Duration(days: 7);

  // API 호출 변수
  late DateTime startTime;
  late DateTime endTime;
  final RxBool _initFlag = false.obs;
  bool get initFlag => _initFlag.value;
  final RxBool _apiCall = false.obs;
  bool get apiCall => _apiCall.value;

  // 날짜 형식
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  // 정렬 방식
  int Function(NewsData a, NewsData b) sortRules = (a, b) {
    DateTime aTime = DateTime.parse(a.createdAt);
    DateTime bTime = DateTime.parse(b.createdAt);
    return bTime.compareTo(aTime);
  };

  late TwitterController twitterController;
  final RxList<NewsData> newsDataList = <NewsData>[].obs;

  @override
  void onInit() async {
    super.onInit();
    twitterController = Get.put(TwitterController());
    await twitterController.initData();
    await initData();
  }

  Future<void> initData() async {
    _initFlag.value = false;
    endTime = DateTime.now();
    startTime = endTime.subtract(week);
    newsDataList.clear();
    await fetchData();
    _initFlag.value = true;
    _apiCall.value = false;
  }

  Future<void> fetchData() async {
    if (apiCall) {
      return;
    }
    _apiCall.value = true;

    List<NewsData> tempList = [];
    tempList.addAll(await fetchTwitter());

    // 모든 데이터를 다 받아온 후 날짜순으로 정렬하고 리스트에 넣어주기
    newsDataList.addAll(tempList..sort(sortRules));
    newsDataList.refresh();

    // 다음검색을 위해서 일주일씩 빼줌
    endTime = startTime;
    startTime = startTime.subtract(week);

    if (initFlag) _apiCall.value = false;

    return;
  }

  Future<List<NewsData>> fetchTwitter() async {
    if (twitterController.userList.isEmpty) {
      return Future(() => []);
    }

    List<NewsData> tempList = [];

    for (int i = 0; i < twitterController.userList.length; i++) {
      List<NewsData>? resultList = await twitterController.fetchTimeline(
        userId: twitterController.userList[i].id,
        endTime: dateFormat.format(endTime),
        startTime: dateFormat.format(startTime),
      );
      if (resultList != null) {
        tempList.addAll(resultList);
      }
    }

    return tempList;
  }
}

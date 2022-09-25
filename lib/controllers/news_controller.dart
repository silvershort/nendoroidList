import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/controllers/dcinside_controller.dart';
import 'package:nendoroid_db/controllers/ruliweb_controller.dart';
import 'package:nendoroid_db/controllers/twitter_controller.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/models/subscribe_data.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';

class NewsController extends GetxController {
  // 컨트롤러
  final ScrollController scrollController = ScrollController();

  // 상수
  final Duration period = const Duration(days: 3);

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

  // 구독
  late Rx<SubscribeData> _subscribe;
  SubscribeData get subscribe => _subscribe.value;
  late SubscribeData tempSubscribe;
  late Box subscribeBox;

  late TwitterController twitterController;
  late RuliwebController ruliwebController;
  late DcinsideController dcinsideController;
  final RxList<NewsData> newsDataList = <NewsData>[].obs;

  @override
  void onInit() async {
    super.onInit();
    twitterController = Get.put(TwitterController());
    ruliwebController = Get.put(RuliwebController());
    dcinsideController = Get.put(DcinsideController());
    await loadSubscribe();
    await initData();
  }

  Future<void> loadSubscribe() async {
    subscribeBox = await Hive.openBox<SubscribeData>(HiveName.subscribeBoxName);
    SubscribeData? tempData = subscribeBox.get(HiveName.subscribeKey);
    if (tempData == null) {
      _subscribe = const SubscribeData(
        twitterSubscribe: TwitterSubscribe(
          goodSmileJP: false,
          goodSmileUS: false,
          goodSmileKR: true,
          ninimal: true,
          figureInfo: true,
        ),
        dcinsideSubscribe: DcinsideSubscribe(
          information: true,
          review: true,
        ),
        ruliwebSubscribe: RuliwebSubscribe(
          information: true,
          review: true,
        ),
      ).obs;
      saveSubscribe();
    } else {
      _subscribe = tempData.copyWith().obs;
      _subscribe.refresh();
    }
    return;
  }

  Future<void> saveSubscribe() async {
    print("@@@ saveSubscribe : ${subscribe.twitterSubscribe.goodSmileUS}");
    await subscribeBox.put(HiveName.subscribeKey, subscribe);
    _subscribe.refresh();
    return;
  }

  Future<void> cancelSubscribe() async {
    _subscribe.value = tempSubscribe.copyWith();
    _subscribe.refresh();
  }

  void updateSubscribe(SubscribeData data) {
    print("@@@ update data : ${data.twitterSubscribe.goodSmileUS}");
    _subscribe.value = data;
    print("@@@ update data2 : ${subscribe.twitterSubscribe.goodSmileUS}");
    _subscribe.refresh();
  }

  void backupSubscribe() {
    tempSubscribe = subscribe.copyWith();
  }

  Future<void> initData() async {
    _initFlag.value = false;
    endTime = DateTime.now();
    startTime = endTime.subtract(period);
    newsDataList.clear();
    ruliwebController.resetData();
    dcinsideController.resetData();
    await twitterController.initData(subscribe.twitterSubscribe);
    await ruliwebController.initData(subscribe.ruliwebSubscribe);
    await dcinsideController.initData(subscribe.dcinsideSubscribe);
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
    tempList.addAll(await ruliwebController.getNewsList(startTime, endTime));
    tempList.addAll(await dcinsideController.getNewsList(startTime, endTime));

    // 모든 데이터를 다 받아온 후 날짜순으로 정렬하고 리스트에 넣어주기
    newsDataList.addAll(tempList..sort(sortRules));
    newsDataList.refresh();

    // 다음검색을 위해서 정해진 기간만큼빼줌
    endTime = startTime;
    startTime = startTime.subtract(period);

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
        userId: twitterController.userList[i].id!,
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

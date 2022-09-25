import 'package:dio/dio.dart' hide HttpResponse;
import 'package:get/get.dart' hide Node;
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/services/rest_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import '../models/username_data.dart';

class DcinsideController extends GetxController {
  // api 상수
  final String nendoGall = "nendoroid";
  final String sortType = "N";
  final String information = "40";
  final String review = "60";

  // api 변수
  int _infoPage = 1;
  int _reviewPage = 1;

  List<NewsData> dcInfoList = [];
  List<NewsData> dcReviewList = [];

  Future<void> initData() async {
    await fetchDcinsideInfoList();
    await fetchDcinsideReviewList();
  }

  void resetData() {
    _infoPage = 1;
    _reviewPage = 1;
    dcInfoList.clear();
    dcReviewList.clear();
  }

  Future<List<NewsData>> getNewsList(DateTime start, DateTime end) async {
    print("@@@ getNewsList");
    print("@@@ start : $start");
    print("@@@ end : $end");
    if (dcInfoList.isEmpty) {
      await fetchDcinsideInfoList();
    } else {
      if (DateTime.parse(dcInfoList[dcInfoList.length - 1].createdAt).isAfter(start)) {
        await fetchDcinsideInfoList();
      }
    }
    if (dcReviewList.isEmpty) {
      await fetchDcinsideReviewList();
    } else {
      if (DateTime.parse(dcReviewList[dcReviewList.length - 1].createdAt).isAfter(start)) {
        await fetchDcinsideReviewList();
      }
    }
    List<NewsData> tempList = [];
    tempList.addAll(
        dcInfoList.where((element) {
          DateTime currentTime = DateTime.parse(element.createdAt);
          print("@@@ currentTime 11 : $currentTime");
          if (currentTime.isAfter(start) && currentTime.isBefore(end)) {
            return true;
          } else {
            return false;
          }
        }).toList()
    );
    tempList.addAll(
        dcReviewList.where((element) {
          DateTime currentTime = DateTime.parse(element.createdAt);
          print("@@@ currentTime 22 : $currentTime");
          if (currentTime.isAfter(start) && currentTime.isBefore(end)) {
            return true;
          } else {
            return false;
          }
        }).toList()
    );
    return tempList;
  }

  Future<void> fetchDcinsideReviewList() async {
    HttpResponse response = await RestClient(Dio()).getDcinsideList(
      nendoGall,
      sortType,
      review,
      _reviewPage,
    );
    List<NewsData> tempList = [];
    Document document = parse(response.data);
    List<Element> nodeList = document.getElementsByClassName("ub-content us-post");
    for (Element element in nodeList) {
      String subject = element.querySelector(".gall_subject")?.querySelector(".subject_inner")?.text ?? "";
      // 공지, 설문 등등 제거
      if (subject != "넨도리뷰") {
        continue;
      }
      /*String no = element.children.firstWhere((element) => element.className == "gall_num").text;
      String count = element.children.firstWhere((element) => element.className == "gall_count").text;
      String recommend = element.children.firstWhere((element) => element.className == "gall_recommend").text;*/
      String title = element.children.firstWhere((element) => element.className == "gall_tit ub-word").getElementsByTagName("a")[0].text;
      String writer = element.children.firstWhere((element) => element.className == "gall_writer ub-writer").attributes["data-nick"] ?? "";
      String date = element.children.firstWhere((element) => element.className == "gall_date").attributes["title"] ?? "";
      String link = "https://gall.dcinside.com/${element.children.firstWhere((element) => element.className == "gall_tit ub-word").getElementsByTagName("a")[0].attributes["href"]?.trim() ?? ""}";

      tempList.add(NewsData(
        type: NewsType.dc,
        subject: subject,
        title: title,
        author: UserData(
          name: writer,
          profileImageUrl: "assets/logo/dc_logo.png",
        ),
        content: "",
        createdAt: date,
        link: link,
        imageUrlList: [],
      ));
    }
    _reviewPage++;
    dcReviewList.addAll(tempList);
    return;
  }

  Future<void> fetchDcinsideInfoList() async {
    HttpResponse response = await RestClient(Dio()).getDcinsideList(
      nendoGall,
      sortType,
      information,
      _infoPage,
    );
    List<NewsData> tempList = [];
    Document document = parse(response.data);
    List<Element> nodeList = document.getElementsByClassName("ub-content us-post");
    for (Element element in nodeList) {
      String subject = element.querySelector(".gall_subject")?.text ?? "";
      print("@@@ subject : $subject");
      // 공지, 설문 등등 제거
      if (subject != "정보") {
        continue;
      }
      /*String no = element.children.firstWhere((element) => element.className == "gall_num").text;
      String count = element.children.firstWhere((element) => element.className == "gall_count").text;
      String recommend = element.children.firstWhere((element) => element.className == "gall_recommend").text;*/
      String title = element.children.firstWhere((element) => element.className == "gall_tit ub-word").getElementsByTagName("a")[0].text;
      String writer = element.children.firstWhere((element) => element.className == "gall_writer ub-writer").attributes["data-nick"] ?? "";
      String date = element.children.firstWhere((element) => element.className == "gall_date").attributes["title"] ?? "";
      String link = "https://gall.dcinside.com/${element.children.firstWhere((element) => element.className == "gall_tit ub-word").getElementsByTagName("a")[0].attributes["href"]?.trim() ?? ""}";

      print("@@@ title $title}");
      print("@@@ writer $writer}");
      print("@@@ date $date}");
      print("@@@ link $link}");

      tempList.add(NewsData(
        type: NewsType.dc,
        subject: subject,
        title: title,
        author: UserData(
          name: writer,
          profileImageUrl: "assets/logo/dc_logo.png",
        ),
        content: "",
        createdAt: date,
        link: link,
        imageUrlList: [],
      ));
    }
    _infoPage++;
    dcInfoList.addAll(tempList);
    return;
  }

/*String content = "";
      List<String> appendingFileList = [];
      HttpResponse response = await RestClient(Dio()).getDcinsideDetail(nendoGall, int.parse(no), searchHead, _page,);
      Document document = parse(response.data);
      List<Node> nodeList = document.getElementsByClassName("write_div");
      for (Node node in nodeList) {
        content += "${node.text?.trim() ?? ""}\n";
      }
      List<Node> attachNodeList = document.getElementsByClassName("appending_file");
      for (Node node in attachNodeList) {
        for (Element element in node.children) {
          String? imgUrl = element.getElementsByTagName("a")[0].attributes["href"];
          if (imgUrl != null) {
            appendingFileList.add("https://image.dcinside.com/viewimagePop.php?${imgUrl.substring(imgUrl.indexOf("?") + 1)}");
          }
        }
      }*/
}

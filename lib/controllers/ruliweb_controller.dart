import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/models/username_data.dart';
import 'package:nendoroid_db/services/rest_client.dart';
import 'package:retrofit/retrofit.dart';

class RuliwebController extends GetxController {
  int _infoPage = 1;
  int _galleryPage = 1;
  List<NewsData> ruliwebInfoList = [];
  List<NewsData> ruliwebGalleryList = [];
  List<String> keyWordList = ["굿스마일", "굿 스마일", "넨도로이드", "넨도"];

  void resetData() {
    _infoPage = 1;
    _galleryPage = 1;
    ruliwebInfoList.clear();
    ruliwebGalleryList.clear();
  }

  Future<void> initData() async {
    await fetchRuliwebInfo();
    await fetchRuliwebGallery();
  }

  bool checkKeyword(String str) {
    for (String keyWord in keyWordList) {
      if (str.contains(keyWord)) {
        return true;
      }
    }
    return false;
  }

  Future<List<NewsData>> getNewsList(DateTime start, DateTime end) async {
    // 찾으려고 하는 시작일이 리스트의 마지막 날짜보다 빠를경우 새로운 데이터를 받아와준다.
    if (ruliwebInfoList.isNotEmpty) {
      while (DateTime.parse(ruliwebInfoList[ruliwebInfoList.length - 1].createdAt).isAfter(start)) {
        await fetchRuliwebInfo();
      }
    } else {
      await fetchRuliwebInfo();
    }
    if (ruliwebGalleryList.isNotEmpty) {
      while (DateTime.parse(ruliwebGalleryList[ruliwebGalleryList.length - 1].createdAt).isAfter(start)) {
        await fetchRuliwebGallery();
      }
    } else {
      await fetchRuliwebGallery();
    }
    List<NewsData> tempList = ruliwebInfoList.where((element) {
      DateTime currentTime = DateTime.parse(element.createdAt);
      if (currentTime.isAfter(start) && currentTime.isBefore(end)) {
        return true;
      } else {
        return false;
      }
    }).toList();
    tempList.addAll(ruliwebGalleryList.where((element) {
      DateTime currentTime = DateTime.parse(element.createdAt);
      if (currentTime.isAfter(start) && currentTime.isBefore(end)) {
        return true;
      } else {
        return false;
      }
    }).toList());
    return tempList;
  }

  Future<void> fetchRuliwebInfo() async {
    List<NewsData> newsList = [];
    HttpResponse response = await RestClient(Dio()).getRuliwebInfoList(_infoPage);
    Document document = parse(response.data);
    List<Element> elementList = document.getElementsByClassName('table_body blocktarget');
    for (Element element in elementList) {
      String id = "";
      String title = "";
      String content = "";
      String link = "";
      String author = "";
      String createdAt = "";

      Element? relative = element.querySelector(".relative");
      Element? writer = element.querySelector(".writer text_over");
      Element? idElement = element.querySelector(".id");
      Element? time = element.querySelector(".time");

      if (time == null) {
        continue;
      }

      title = relative?.getElementsByTagName("a")[0].text ?? "";
      link = relative?.getElementsByTagName("a")[0].attributes["href"] ?? "";
      author = writer?.getElementsByTagName("a")[0].text ?? "";
      id = idElement?.text.trim() ?? "";
      createdAt = time.text.trim();

      // 일본 소식만 가져오기
      if (!element.text.contains("일본")) {
        continue;
      }

      // 특정단어를 포함하지 않을경우 가져오지 않는다.
      if (!checkKeyword(title)) {
        continue;
      }

      if (createdAt.contains(":")) {
        DateTime date = DateTime.now();
        date = date.subtract(Duration(hours: date.hour, minutes: date.minute));
        date = date.add(Duration(hours: int.parse(createdAt.split(":")[0]), minutes: int.parse(createdAt.split(":")[1])));
        createdAt = date.toString();
      } else {
        // 루리웹 특성상 어제글은 시간을 알 수 없기 때문에 임의의 시간을 대입해줘서 일종의 셔플효과를 내준다.
        DateTime date = DateTime.parse(createdAt.replaceAll(".", "-"));
        Random random = Random();
        date = date.add(Duration(hours: random.nextInt(23), minutes: random.nextInt(59)));
        createdAt = date.toString();
      }

      newsList.add(
        NewsData(
          type: NewsType.ruliweb,
          author: UserData(
            name: author,
            profileImageUrl: "assets/logo/ruliweb_logo.png",
          ),
          title: title,
          content: content,
          subject: "피규어 정보",
          createdAt: createdAt,
          link: link,
          imageUrlList: [],
        ),
      );
    }
    _infoPage++;
    ruliwebInfoList.addAll(newsList);
    // 글작성으로 인해서 페이지가 밀려났을때 중복된 글을 검색할 수 있으므로 중복 제거를 해준다.
    ruliwebInfoList = ruliwebInfoList.toSet().toList();
    return;
  }

  Future<void> fetchRuliwebGallery() async {
    List<NewsData> newsList = [];
    HttpResponse response = await RestClient(Dio()).getRuliwebGalleryList(_galleryPage);
    Document document = parse(response.data);
    List<Element> elementList = document.getElementsByClassName('table_body blocktarget');
    for (Element element in elementList) {
      String id = "";
      String title = "";
      String content = "";
      String link = "";
      String author = "";
      String createdAt = "";

      Element? relative = element.querySelector(".relative");
      Element? writer = element.querySelector(".writer text_over");
      Element? idElement = element.querySelector(".id");
      Element? time = element.querySelector(".time");

      if (time == null) {
        continue;
      }

      title = relative?.getElementsByTagName("a")[0].text ?? "";
      link = relative?.getElementsByTagName("a")[0].attributes["href"] ?? "";
      author = writer?.getElementsByTagName("a")[0].text ?? "";
      id = idElement?.text.trim() ?? "";
      createdAt = time.text.trim();

      // 특정단어를 포함하지 않을경우 가져오지 않는다.
      if (!checkKeyword(title)) {
        continue;
      }

      if (createdAt.contains(":")) {
        DateTime date = DateTime.now();
        date = date.subtract(Duration(hours: date.hour, minutes: date.minute));
        date = date.add(Duration(hours: int.parse(createdAt.split(":")[0]), minutes: int.parse(createdAt.split(":")[1])));
        createdAt = date.toString();
      } else {
        // 루리웹 특성상 어제글은 시간을 알 수 없기 때문에 임의의 시간을 대입해줘서 일종의 셔플효과를 내준다.
        DateTime date = DateTime.parse(createdAt.replaceAll(".", "-"));
        Random random = Random();
        date = date.add(Duration(hours: random.nextInt(23), minutes: random.nextInt(59)));
        createdAt = date.toString();
      }

      newsList.add(
        NewsData(
          type: NewsType.ruliweb,
          author: UserData(name: author, profileImageUrl: "assets/logo/ruliweb_logo.png"),
          title: title,
          subject: "피규어 갤러리",
          content: content,
          createdAt: createdAt,
          link: link,
          imageUrlList: [],
        ),
      );
    }
    _galleryPage++;
    ruliwebGalleryList.addAll(newsList);
    // 글작성으로 인해서 페이지가 밀려났을때 중복된 글을 검색할 수 있으므로 중복 제거를 해준다.
    ruliwebGalleryList = ruliwebGalleryList.toSet().toList();
    return;
  }

/*// 디테일한 날짜 구하기
  HttpResponse response = await RestClient(Dio()).getRuliwebDetail(id);

  Document document = parse(response.data);
  Element? regdate = document.querySelector(".regdate");
  Element? contentElement = document.querySelector(".view_content autolink");
  if (regdate == null) {
  continue;
  }
  content = contentElement?.text ?? "";
  createdAt = regdate.text;
  createdAt = createdAt.replaceAll("(", "");
  createdAt = createdAt.replaceAll(")", "");
  createdAt = createdAt.replaceAll(".", "-");*/
}

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/api/api_result.dart';
import 'package:nendoroid_db/models/good_smile_news_model.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/networks/repositories/scraping_repository.dart';
import 'package:nendoroid_db/utilities/constant.dart';
import 'package:nendoroid_db/utilities/extension/string_extension.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scraping_serivce.g.dart';

@Riverpod(keepAlive: true)
ScrapingService scrapingService(ScrapingServiceRef ref) {
  return ScrapingService(repository: ref.watch(scrapingRepositoryProvider));
}

class ScrapingService {
  final ScrapingRepository repository;
  final String _releaseNewsCategory = 'Shipping Info';
  final String _releaseNewsKeyword = 'Release Dates';

  const ScrapingService({
    required this.repository,
  });

  Future<ApiResult<HttpResponse>> getRuliwebInfoList({
    required int page,
  }) {
    return apiCall(request: repository.getRuliwebInfoList(page));
  }

  Future<ApiResult<HttpResponse>> getRuliwebGalleryList({
    required int page,
  }) {
    return apiCall(request: repository.getRuliwebGalleryList(page));
  }

  Future<ApiResult<HttpResponse>> getRuliwebDetail({
    required String id,
  }) {
    return apiCall(request: repository.getRuliwebDetail(id));
  }

  Future<ApiResult<HttpResponse>> getDcinsideList({
    required String id,
    required String sortType,
    required String searchHead,
    required int page,
  }) {
    return apiCall(
      request: repository.getDcinsideList(
        id: id,
        sortType: sortType,
        searchHead: searchHead,
        page: page,
      ),
    );
  }

  Future<ApiResult<({List<String> imageList, List<String> thumbnailList})>>
      getGoodSmileImage({
    required String gscProductNum,
  }) async {
    try {
      final response =
          await repository.getGoodSmileImage(gscProductNum: gscProductNum);
      Document document = parse(response.data);
      Element? nodeList =
          document.getElementsByClassName("itemPhotos").firstOrNull;
      if (nodeList == null) {
        throw Exception('No itemPhotos');
      }
      List<String> imageList = nodeList
          .getElementsByClassName("inline_fix")
          .map((e) =>
              "https:${e.getElementsByTagName("a").firstWhere((element) => element.className == "imagebox").attributes["href"] ?? ""}")
          .toList();
      List<String> thumbnailList = document
              .getElementsByClassName("itemThumb clearfix")
              .firstOrNull
              ?.getElementsByTagName('li')
              .map((e) =>
                  "https:${e.getElementsByTagName('img').firstOrNull?.attributes['src'] ?? ''}")
              .toList() ??
          [];
      return ApiResult.success(
          (imageList: imageList, thumbnailList: thumbnailList));
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return ApiResult.error(
          ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<List<NewsItemData>>> getNendoroidAnnounced() async {
    try {
      final response = await repository.getNendoroidAnnounced();
      final Document document = parse(response.data);

      final Element? imminentText =
          document.getElementsByClassName('current-date shimelist').firstOrNull;
      final Element? imminentSection =
          document.getElementsByClassName('hitList clearfix').firstOrNull;
      if (imminentText == null || imminentSection == null) {
        return const ApiResult.success([]);
      }

      final List<Element> imminentList = imminentSection.getElementsByClassName(
          'hitItem shimeproduct nendoroid nendoroid_series');

      final itemList = imminentList.map((e) {
        String name = e
                .getElementsByClassName('hitTtl')
                .firstOrNull
                ?.getElementsByTagName('span')
                .firstOrNull
                ?.text ??
            '';
        bool soldout = false;
        String link = e
                .getElementsByClassName('hitBox')
                .firstOrNull
                ?.getElementsByTagName('a')
                .firstOrNull
                ?.attributes['href'] ??
            '';
        String imagePath = e
                .getElementsByClassName('hitBox')
                .firstOrNull
                ?.getElementsByTagName('img')
                .firstOrNull
                ?.attributes['data-original'] ??
            '';

        imagePath = 'https:$imagePath';

        // 품절 여부 체크
        final imgList = e
                .getElementsByClassName('icon')
                .firstOrNull
                ?.getElementsByTagName('img') ??
            [];
        for (var img in imgList) {
          if (img.attributes['alt'] == '품절') {
            soldout = true;
          }
        }
        return NewsItemData(
          name: name,
          imagePath: imagePath,
          soldOut: soldout,
          link: link,
        );
      }).toList();

      return ApiResult.success(itemList
          .where((element) => !element.name.contains('10cm솜'))
          .toList());
    } catch (error, stackTrace) {
      return ApiResult.error(
          ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<List<NewsItemData>>> getNinimalList() async {
    try {
      final response = await repository.getNinimal();
      final Document document = parse(response.data);

      final List<Element> productList =
          document.getElementsByClassName('item xans-record-');

      final itemList = productList.map((e) {
        String name = e
                .getElementsByClassName('name')
                .firstOrNull
                ?.getElementsByTagName('span')
                .lastOrNull
                ?.text ??
            '';
        bool soldout = false;
        String price = e
                .getElementsByClassName(' xans-record-')
                .firstOrNull
                ?.getElementsByTagName('span')
                .where((element) => element.text.contains('원'))
                .firstOrNull
                ?.text ??
            '';
        String link = e
                .getElementsByClassName('box')
                .firstOrNull
                ?.getElementsByTagName('a')
                .firstOrNull
                ?.attributes['href'] ??
            '';
        String imagePath = e
                .getElementsByClassName('box')
                .firstOrNull
                ?.getElementsByTagName('img')
                .firstOrNull
                ?.attributes['src'] ??
            '';

        link = 'https://ninimal.co.kr/$link';

        // 품절 여부 체크
        final imgList = e
                .getElementsByClassName('icon')
                .firstOrNull
                ?.getElementsByTagName('img') ??
            [];
        for (var img in imgList) {
          if (img.attributes['alt'] == '품절') {
            soldout = true;
          }
        }
        return NewsItemData(
          name: name,
          price: price,
          imagePath: imagePath,
          soldOut: soldout,
          link: link,
        );
      }).toList();

      return ApiResult.success(itemList
          .where((element) => !element.name.contains('10cm솜'))
          .toList());
    } catch (error, stackTrace) {
      return ApiResult.error(
          ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<void>> getNendoroidReleaseData() async {
    try {
      final response = await repository.getNendoroidReleaseInfo();
      final Document document = parse(response.data);

      // 날짜 설명이 있는 컨텐츠 영역
      final List<Element> content = document.getElementsByClassName("content");

      // 마지막 업데이트 날짜를 찾기위한 정규식 (Update: 로 시작하고 )로 끝나는 사이의 문자열을 추출)
      RegExp regex = RegExp(r'Update: \((.*?)\)');
      Match? match = regex.firstMatch(content.first.text);

      if (match != null) {
        talker.info('Last update : ${match.group(1)}');
      } else {
        talker.debug('마지막 업데이트 날짜를 찾지 못했습니다.');
      }

      // 릴리즈 데이터가 있는 영역
      final List<Element> releaseDataList =
          document.getElementsByClassName("arrowlisting");

      for (Element monthItem in releaseDataList) {
        monthItem.getElementsByTagName('largedate');
      }

      return ApiResult.success(null);
    } on DioException catch (error, stackTrace) {
      return ApiResult.error(
        ApiError(
            code: error.response?.statusCode ?? 0,
            message: error.message ?? ''),
        stackTrace,
      );
    } catch (error, stackTrace) {
      return ApiResult.error(
        ApiError(code: 0, message: error.toString()),
        stackTrace,
      );
    }
  }

  Future<ApiResult<List<String>>> getOnlineStoreThumbnailList(
      String gscProductNum) async {
    try {
      List<String> thumbnailList = [];

      final response = await repository.getOnlineStoreThumbnailList(
          gscProductNum: gscProductNum);
      final Document document = parse(response.data);

      // 썸네일 리스트 클래스 가져오기
      final List<Element> elementList = document.getElementsByClassName(
          "c-photo-product-slider__thumbnail-button ");

      // for문을 돌면서 실제 이미지 링크만 뽑아서 저장해둔다.
      for (Element element in elementList) {
        final String? url = element
            // .getElementsByClassName('c-image')
            // .firstOrNull
            .getElementsByTagName('img')
            .firstOrNull
            ?.attributes['src'];
        if (url != null) {
          thumbnailList.add('https://www.goodsmile.com$url');
        }
      }
      return ApiResult.success(thumbnailList);
    } catch (error, stackTrace) {
      return ApiResult.error(ApiError(message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<List<NewsItemData>>> getGoodSmileSpecialList() async {
    try {
      List<NewsItemData> list = [];
      int currentPage = 1;
      int lastPage = 1;

      while (true) {
        final response =
            await repository.getGoodSmileKRSpecialImage(page: currentPage);
        final Document document = parse(response.data);

        // 마지막 페이지가 어디인지 확인하고 저장해준다.
        if (lastPage == 1) {
          final List<Element> pageElement =
              document.getElementsByClassName("UWN4IvaQza");
          lastPage = pageElement.length;
        }

        final List<NewsItemData> tempList = document
            .getElementsByClassName("ZdiAiTrQWZ _1BDRwBQfa1 SQUARE t52c8ixKbX")
            .map((e) {
          String imagePath = e
                  .getElementsByClassName("_25CKxIKjAk")
                  .firstOrNull
                  ?.attributes["src"] ??
              '';
          String name = e
                  .getElementsByClassName("_25CKxIKjAk")
                  .firstOrNull
                  ?.attributes["alt"] ??
              '';
          String number = name.onlyNumberFirst.toString();
          name = name.replaceFirst(number, '');
          String link = e
                  .getElementsByTagName("a")
                  .firstWhere(
                      (element) => element.className.contains("stX4bV9Ny3"))
                  .attributes["href"] ??
              '';
          String price =
              e.getElementsByClassName('LGJCRfhDKi').firstOrNull?.text ?? '';
          bool soldOut =
              e.getElementsByClassName('text blind').firstOrNull?.text ==
                  'SOLD OUT';

          link = 'https://brand.naver.com$link';
          return NewsItemData(
              imagePath: imagePath,
              number: number,
              name: name,
              link: link,
              price: price,
              soldOut: soldOut);
        }).toList();

        list.addAll(tempList
            .where((element) => element.name.contains('넨도로이드'))
            .map((e) => e.copyWith(
                name: e.name
                    .replaceFirst('[특전]', '')
                    .replaceFirst('넨도로이드', '')
                    .trim()))
            .toList());

        if (lastPage == currentPage) {
          break;
        }
        currentPage++;
      }
      return ApiResult.success(list);
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return ApiResult.error(
          ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }

  Future<ApiResult<GoodSmileNewsModel>> getGoodSmileNews() async {
    final response = await repository.getOnlineStoreNewsList();
    final Document document = parse(response.data);

    final List<Element> pageElement =
        document.getElementsByClassName("c-news__row");

    GoodSmileNewsModel? goodSmileNewsModel;
    // 넨도로이드 이름을 담을 리스트
    final List<String> releaseNendoList = [];

    // 현재 날짜를 기준으로 지난달과 이번달의 데이터를 들고온다. 20일이 지났다면 이번달 데이터만 들고온다.
    final today = DateTime.now();
    final List<String> months = [];

    months.add(Constant.months[today.month - 1]);

    if (today.day < 20) {
      int previous = today.month - 1;
      if (previous == 0) {
        previous = 12;
      }
      months.add(Constant.months[previous - 1]);
    }

    for (final Element element in pageElement) {
      final Element? category =
          element.getElementsByClassName('c-news__category').firstOrNull;
      final Element? title =
          element.getElementsByClassName('c-news__title').firstOrNull;
      final Element? link = element.getElementsByTagName('a').firstOrNull;

      // 뉴스 리스트에서 카테고리가 'Shipping Info'인 항목을 골라낸다.
      if (category?.text != _releaseNewsCategory) {
        continue;
      }

      if (title == null) {
        continue;
      }
      // 제목에 Release Dates가 들어가있는 것만 골라낸다
      if (!title.text.contains(_releaseNewsKeyword)) {
        continue;
      }

      for (final month in months) {
        if (!title.text.contains(month)) {
          continue;
        }
      }

      final String? detailLink = link?.attributes['href'];

      if (detailLink != null) {
        final String newsNumber = detailLink.split('/').last;
        final response =
        await repository.getOnlineStoreNewsDetail(newsNumber: newsNumber);
        final Document document = parse(response.data);

        final content = document.getElementById('notice-1');

        if (content == null) {
          continue;
        }

        // 실제 뉴스 내용에서 넨도로이드 제품만 추출
        for (final line in content.text.split('\n')) {
          if (line.contains('Nendoroid') && !line.contains('Doll')) {
            // -과 ( 사이의 문자열 추출 후 Nendoroid라는 문자를 삭제
            final pattern = RegExp(r'- (.*?) \(');
            final match = pattern.firstMatch(line);
            final nendoName =
            match?.group(1)?.replaceAll('Nendoroid', '').trim();

            if (nendoName != null) {
              releaseNendoList.add(nendoName);
            }
          }
        }
      }
    }

    goodSmileNewsModel = GoodSmileNewsModel(
      link: 'https://www.goodsmile.com/en/news',
      nendoNameList: releaseNendoList.toSet().toList(),
    );

    return ApiResult.success(goodSmileNewsModel);
    return const ApiResult.error(
        ApiError(message: 'Not found news'), StackTrace.empty);
  }

  Future<ApiResult<int>> getExchangeRate() async {
    try {
      final response = await repository.getExchangeRate();
      talker.info(response.toString());

      late int price;

      for (final country in response.countryList) {
        if (country.currencyUnit.contains('원')) {
          price = (country.value.onlyDouble * 100).toInt();
        }
      }

      return ApiResult.success(price);
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return ApiResult.error(
          ApiError(code: 0, message: error.toString()), stackTrace);
    }
  }
}

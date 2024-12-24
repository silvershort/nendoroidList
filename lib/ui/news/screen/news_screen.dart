import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/provider/news_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/news/widget/news_list_section.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("넨도로이드 소식"),
      ),
      body: state.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () => ref.refresh(newsProvider.future),
            child: ListView(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              children: [
                if (data.goodSmileNewsModel != null)
                  NewsListSection.nendoData(
                    title: '출고 확정🚚 배송 임박 넨도로이드',
                    onTitleTap: () {
                      context.push(RoutePath.webView, extra: data.goodSmileNewsModel!.link);
                    },
                    nendoList: data.goodSmileNewsModel!.nendoList,
                  ),
                // NewsListSection(
                //   title: '예약마감⏰ 임박 넨도로이드',
                //   onTitleTap: () {
                //     context.push(
                //       '${RoutePath.newsDetail}?title=마감 임박 넨도로이드&homePage=https://www.goodsmile.info/en/products/category/nendoroid_series/announced',
                //       extra: data.imminentList,
                //     );
                //   },
                //   itemList: data.imminentList,
                //   onTap: (index) {
                //     launchUrl(
                //       Uri.parse(data.imminentList[index].link),
                //       mode: LaunchMode.externalApplication,
                //     );
                //   },
                // ),
                NewsListSection(
                  title: '특전🎁 포함! 굿스마일 코리아 예약 목록',
                  onTitleTap: () {
                    context.push(
                      '${RoutePath.newsDetail}?title=굿스마일 코리아&homePage=https://brand.naver.com/goodsmilekr',
                      extra: data.specialGoodsList,
                    );
                  },
                  itemList: data.specialGoodsList,
                  onTap: (index) {
                    launchUrl(
                      Uri.parse(data.specialGoodsList[index].link),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                NewsListSection(
                  title: '넨돌 의상🩳 니니멀 신상품',
                  onTitleTap: () {
                    context.push(
                      '${RoutePath.newsDetail}?title=니니멀&homePage=https://ninimal.co.kr',
                      extra: data.ninimalList,
                    );
                  },
                  itemList: data.ninimalList.map((e) {
                    return NewsItemData(
                      name: e.name,
                      price: e.price,
                      imagePath: e.imagePath,
                      soldOut: e.soldOut,
                    );
                  }).toList(),
                  onTap: (index) {
                    launchUrl(
                      Uri.parse(data.ninimalList[index].link),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          talker.error(error.toString());
          talker.error(stackTrace.toString());
          return const Center(
            child: Text('데이터 로딩에 실패했습니다.'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

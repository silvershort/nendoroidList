import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/news_controller.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/views/news/widget/community_tile.dart';
import 'package:nendoroid_db/views/news/widget/twitter_tile.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (priceController.initFlag && !priceController.apiCall) {
          await priceController.initData();
        }
        return;
      },
      child: Obx(() {
        if (!priceController.initFlag
            || priceController.apiCall && priceController.newsDataList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (priceController.initFlag && priceController.newsDataList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "데이터를 가져오는데 실패했습니다.\n네트워크 상태를 확인해주세요.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    priceController.initData();
                  },
                  child: const Text("다시 시도"),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            controller: priceController.scrollController,
            physics: const RangeMaintainingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            itemCount: priceController.newsDataList.length + 1,
            itemBuilder: (context, index) {
              if (index >= priceController.newsDataList.length) {
                if (!priceController.apiCall) {
                  // fetchData()에 의해서 build 가 완료되기 이전에 Obx 에 의해 다시 build 가 호출될 수 있음.
                  // addPostFrameCallback 으로 해당 작업이 완료되기 전까지 빌드작업을 미뤄줌.
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    priceController.fetchData();
                  });
                }
                return Container(
                  height: 60.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              }
              NewsData data = priceController.newsDataList[index];
              if (data.type == NewsType.twitter) {
                return TwitterTile(data: priceController.newsDataList[index]);
              } else {
                return CommunityTile(data: priceController.newsDataList[index]);
              }
            },
          );
        }
      }),
    );
  }
}

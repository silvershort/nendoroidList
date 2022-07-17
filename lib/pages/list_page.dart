import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';

import '../controllers/nendo_controller.dart';
import '../widgets/nendo_item.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => mainView(context)),
    );
  }

  Widget mainView(BuildContext context) {
    final NendoController controller = Get.find<NendoController>();
    final DashboardController dashboardController = Get.find<DashboardController>();
    // 최초 로딩
    if (controller.nendoList.isEmpty && !controller.initComplete.value) {
      return const CircularProgressIndicator();
      // 넨도 데이터가 없을때
    } else if (controller.nendoList.isEmpty &&
        controller.initComplete.value &&
        !controller.downloadComplete.value &&
        !controller.downloadLoading.value &&
        !controller.downloadError.value) {
      return GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("넨도로이드 데이터 다운로드가 필요합니다."),
            const Text("최초 다운로드시 시간이 다소 걸립니다."),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text("넨도 데이터 가져오기"),
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: Text("다운로드 경고"),
                  content: Text("[${controller.dataSize}] 데이터를 다운로드 합니다."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("취소"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        controller.fetchData();
                      },
                      child: const Text("확인"),
                    ),
                  ],
                ));
              },
            ),
          ],
        ),
      );

      // 넨도 데이터를 다운받을때
    } else if (controller.downloadLoading.value) {
      if (controller.totalStep.value == 0) {
        return const Text("넨도로이드 목록을 가져오는중...");
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${controller.currentStep.value} / ${controller.totalStep.value}"),
            const SizedBox(
              height: 5.0,
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: LinearProgressIndicator(
                value: controller.currentStep.value / controller.totalStep.value,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        );
      }
      // 리스트 출력
    } else {
      if (controller.downloadError.value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("다운로드 도중 에러가 발생했습니다."),
            const Text("지속해서 발생한다면 개인용 Github 토큰을 등록해주세요."),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                controller.downloadError.value = false;
                controller.init();
              },
              child: const Text(
                "되돌아가기",
              ),
            ),
          ],
        );
      } else {
        if (controller.nendoList.isEmpty) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            // 해당 옵션을 켜야 컨테이너의 빈화면에도 tap 이벤트가 수신됨
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: const Text("조건에 해당하는 넨도로이드가 없습니다."),
            ),
          );
        } else {
          return Scrollbar(
            thickness: 5.0,
            radius: const Radius.circular(5.0),
            controller: scrollController,
            interactive: true,
            trackVisibility: true,
            thumbVisibility: true,
            // 스크롤 했을때 검색창 포커스 해제
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  if (dashboardController.searchMode.value) {
                    FocusScope.of(context).unfocus();
                  }
                }
                return true;
              },
              child: ListView.separated(
                // ios 스타일 오버스크롤
                physics: const BouncingScrollPhysics(),
                // 컨트롤러를 Scrollbar 위젯과 공유해야 오류가 안생김
                controller: scrollController,
                padding: const EdgeInsets.only(top: 10.0),
                scrollDirection: Axis.vertical,
                itemCount: controller.nendoList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    if (dashboardController.searchMode.value) {
                      return Container(
                        height: 24,
                        padding: const EdgeInsets.only(left: 10.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "검색된 넨도로이드 수 : ${controller.nendoList.length}",
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  } else {
                    return NendoItem(nendoData: controller.nendoList[index - 1]);
                  }
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                  );
                },
              ),
            ),
          );
        }
      }
    }
  }
}

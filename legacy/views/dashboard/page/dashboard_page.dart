import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/news_controller.dart';
import 'package:nendoroid_db/views/dashboard/widget/main_appbar.dart';
import 'package:nendoroid_db/views/dashboard/widget/main_body.dart';
import 'package:nendoroid_db/views/dashboard/widget/main_bottom_navigation_bar.dart';
import 'package:nendoroid_db/views/list/widget/filter_bottom_sheet.dart';
import 'package:nendoroid_db/views_common/widget/scroll_to_opacity_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController controller = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          int index = controller.pageQueue.previousPage();
          // index 가 -1일 경우 더이상 이동할 화면이 없다는 뜻
          if (index == -1) {
            // 리스트 화면을 보고 있을 경우 종료 팝업을 띄워주고 아니라면 리스트 화면으로 이동
            if (controller.tabIndex == 0) {
              return onWillPop();
            } else {
              controller.tabIndex = 0;
              return Future(() => false);
            }
          } else {
            controller.tabIndex = index;
            return Future(() => false);
          }
        },
        child: Obx(() =>
          Scaffold(
            appBar: controller.tabIndex == 0 ? null : const MainAppBar(),
            body: const SafeArea(
              top: false,
              child: MainBody(),
            ),
            bottomNavigationBar: MediaQuery.of(context).size.width < 640 ? const MainBottomNavigationBar() : null,
            floatingActionButton: Visibility(
              visible: controller.tabIndex == 0 || controller.tabIndex == 2,
              child: ScrollToOpacityWidget(
                priceController: Get.find<NendoController>().scrollController,
                child: FloatingActionButton(
                  onPressed: () {
                    controller.tabIndex == 0
                        ? Get.bottomSheet(
                            Wrap(
                              children: [
                                FilterBottomSheet(),
                              ],
                            ),
                            isScrollControlled: true,
                          )
                        : Get.find<NewsController>().scrollController.jumpTo(0);
                  },
                  mini: controller.tabIndex == 2 ? true : false,
                  child: controller.tabIndex == 0
                      ? const Icon(
                          Icons.filter_alt,
                        )
                      : const Icon(
                          Icons.arrow_drop_up,
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (controller.backPressTime == null || now.difference(controller.backPressTime!) > const Duration(seconds: 2)) {
      controller.backPressTime = now;
      Get.showSnackbar(const GetSnackBar(
        title: "알림",
        message: "뒤로 버튼을 한 번 더 누르시면 종료됩니다.",
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }
}

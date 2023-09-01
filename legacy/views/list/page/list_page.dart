import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/views/dashboard/widget/main_sliver_app_bar.dart';
import 'package:nendoroid_db/views/list/widget/list_download_error.dart';
import 'package:nendoroid_db/views/list/widget/list_download_view.dart';
import 'package:nendoroid_db/views/list/widget/list_empty_view.dart';
import 'package:nendoroid_db/views/list/widget/list_nendo_view.dart';
import 'package:nendoroid_db/views/list/widget/list_notification_view.dart';

class ListPage extends GetView<NendoController> {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5.0,
      radius: const Radius.circular(5.0),
      controller: controller.scrollController,
      interactive: true,
      trackVisibility: true,
      thumbVisibility: true,
      // 스크롤 했을때 검색창 포커스 해제
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            if (Get.find<DashboardController>().searchMode) {
              FocusScope.of(context).unfocus();
            }
          }
          return true;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          // 컨트롤러를 Scrollbar 위젯과 공유해야 오류가 안생김
          controller: controller.scrollController,
          slivers: const [
            MainSliverAppBar(),
            ListMainView(),
          ],
        ),
      ),
    );
  }
}

class ListMainView extends GetView<NendoController> {
  const ListMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.nendoList.isEmpty && !controller.initComplete) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
        // 넨도 데이터가 없을때
      } else if (controller.nendoList.isEmpty &&
          controller.initComplete &&
          !controller.downloadComplete &&
          !controller.downloadLoading &&
          !controller.downloadError) {
        return const SliverFillRemaining(
          child: ListNotificationView(),
        );
        // 넨도 데이터를 다운받을때
      } else if (controller.downloadLoading) {
        if (controller.totalStep == 0) {
          return const SliverFillRemaining(
            child: Center(
              child: Text("넨도로이드 목록을 가져오는중..."),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: ListDownloadView(),
          );
        }
        // 리스트 출력
      } else {
        if (controller.downloadError) {
          return const SliverFillRemaining(child: ListDownloadError());
        } else {
          if (controller.nendoList.isEmpty) {
            return const SliverFillRemaining(child: ListEmptyView());
          } else {
            return ListNendoView();
          }
        }
      }
    });
  }
}

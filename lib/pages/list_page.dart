import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/widgets/list/list_download_error.dart';
import 'package:nendoroid_db/widgets/list/list_download_view.dart';
import 'package:nendoroid_db/widgets/list/list_empty_view.dart';
import 'package:nendoroid_db/widgets/list/list_nendo_view.dart';
import 'package:nendoroid_db/widgets/list/list_notification_view.dart';

import '../controllers/nendo_controller.dart';
import '../widgets/list/list_nendo_item.dart';

class ListPage extends GetView<NendoController> {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => mainView(context)),
    );
  }

  Widget mainView(BuildContext context) {
    // 최초 로딩
    if (controller.nendoList.isEmpty && !controller.initComplete) {
      return const CircularProgressIndicator();
      // 넨도 데이터가 없을때
    } else if (controller.nendoList.isEmpty &&
        controller.initComplete &&
        !controller.downloadComplete &&
        !controller.downloadLoading &&
        !controller.downloadError) {
      return const ListNotificationView();
      // 넨도 데이터를 다운받을때
    } else if (controller.downloadLoading) {
      if (controller.totalStep == 0) {
        return const Text("넨도로이드 목록을 가져오는중...");
      } else {
        return const ListDownloadView();
      }
      // 리스트 출력
    } else {
      if (controller.downloadError) {
        return const ListDownloadError();
      } else {
        if (controller.nendoList.isEmpty) {
          return const ListEmptyView();
        } else {
          return ListNendoView();
        }
      }
    }
  }
}
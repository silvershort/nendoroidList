import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/widgets/dialog/common_dialog.dart';

import '../../utilities/intl_util.dart';

class SettingUpdateView extends StatelessWidget {
  SettingUpdateView({Key? key}) : super(key: key);
  final DashboardController dashboardController = Get.find<DashboardController>();
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (IntlUtil.needUpdate(nendoController.serverCommitDate, nendoController.localCommitDate)) {
                showUpdateDialog();
              }
            },
            child: Row(
              children: [
                Text(
                  nendoController.serverCommitDate.isEmpty
                      ? "업데이트 데이터가 없습니다."
                      : IntlUtil.needUpdate(nendoController.serverCommitDate, nendoController.localCommitDate)
                      ? "DB업데이트가 필요합니다. (탭 해서 업데이트)"
                      : "최신버전입니다.",
                  style: const TextStyle(fontSize: 13.0, color: Colors.deepOrangeAccent),
                )
              ],
            ),
          ),
          const SizedBox(height: 3.0),
          Row(
            children: [
              Text(
                nendoController.serverCommitDate.isEmpty ? "DB 업데이트 : 데이터가 없습니다." : "DB 업데이트 : ${nendoController.serverCommitDate}",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(width: 5.0),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Icon(
                    Icons.update,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onTap: () {
                  showUpdateDialog();
                },
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            nendoController.localCommitDate.isEmpty ? "로컬 업데이트 : 데이터가 없습니다." : "로컬 업데이트 : ${nendoController.localCommitDate}",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      );
    });
  }

  void showUpdateDialog() {
    Get.dialog(
      CommonDialog(
        title: "DB 업데이트",
        content: IntlUtil.needUpdate(nendoController.serverCommitDate, nendoController.localCommitDate)
            ? "DB 업데이트를 진행하시겠습니까?\n모든 데이터를 다시 받기때문에 시간이 다소 소요되며 다운로드 도중 앱 종료시 저장된 데이터가 삭제될 수 있습니다."
            : "이미 최신버전입니다.\n강제 업데이트를 진행할까요?",
        negativeText: "취소",
        positiveOnClick: () {
          Get.find<DashboardController>().tabIndex = 0;
          nendoController.backupData();
          nendoController.fetchData();
        },
      ),
    );
  }
}

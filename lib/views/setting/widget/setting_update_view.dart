import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/views_common/dialog/common_dialog.dart';

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
          InkWell(
            onTap: () {
              showUpdateDialog();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0, top: 3.0, right: 3.0),
                  child: Text(
                    nendoController.serverCommitDate.isEmpty
                        ? "업데이트 데이터가 없습니다. (탭 해서 강제 업데이트)"
                        : IntlUtil.needUpdate(nendoController.serverCommitDate, nendoController.localCommitDate)
                        ? "DB업데이트가 필요합니다. (탭 해서 업데이트)"
                        : "최신버전입니다. (탭 해서 강제 업데이트)",
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                nendoController.serverCommitDate.isEmpty ? "DB 업데이트 : 데이터가 없습니다." : "DB 업데이트 : ${nendoController.serverCommitDate}",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              /*const SizedBox(width: 5.0),
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
              ),*/
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            nendoController.localCommitDate.isEmpty ? "로컬 업데이트 : 데이터가 없습니다." : "로컬 업데이트 : ${nendoController.localCommitDate}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );
    });
  }

  void showUpdateDialog() {
    // bool updateNeeds = IntlUtil.needUpdate(nendoController.serverCommitDate, nendoController.localCommitDate);
    Get.dialog(
      CommonDialog(
        title: "DB 업데이트",
        content: "DB 업데이트를 진행하시겠습니까?\n다운로드 도중 앱 종료시 저장된 데이터가 삭제될 수 있습니다.",
        negativeText: "취소",
        positiveOnClick: () {
          Get.find<DashboardController>().tabIndex = 0;
          nendoController.saveBackupData();
          if (nendoController.localCommitHash != "null") {
            // 임시적으로 파베에서 데이터를 받도록 수정
            nendoController.fetchDataInFirestore();
            // nendoController.updateDB();
          } else {
            nendoController.fetchDataInFirestore();
          }
        },
      ),
    );
  }
}

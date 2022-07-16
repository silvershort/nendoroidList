import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/pages/license_info_page.dart';
import 'package:nendoroid_db/utilities/app_color.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);
  final NendoController nendoController = Get.find<NendoController>();
  final SettingController settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      children: [
        Obx(() => GestureDetector(
              onTap: () {
                if (IntlUtil.needUpdate(nendoController.serverCommitDate.value, nendoController.localCommitDate.value)) {
                  showUpdateDialog();
                }
              },
              child: Row(
                children: [
                  Text(
                    IntlUtil.needUpdate(nendoController.serverCommitDate.value, nendoController.localCommitDate.value)
                        ? "DB업데이트가 필요합니다. (탭 해서 업데이트)"
                        : "최신버전입니다.",
                    style: const TextStyle(fontSize: 13.0, color: Colors.deepOrangeAccent),
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 3.0,
        ),
        Obx(
          () => Row(
            children: [
              Text(
                nendoController.serverCommitDate.isEmpty ? "DB 업데이트 : 데이터가 없습니다." : "DB 업데이트 : ${nendoController.serverCommitDate.value}",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(width: 5.0,),
              Visibility(
                visible: IntlUtil.needUpdate(nendoController.serverCommitDate.value, nendoController.localCommitDate.value),
                child: InkWell(
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
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Obx(
          () => Text(
            nendoController.localCommitDate.isEmpty ? "로컬 업데이트 : 데이터가 없습니다." : "로컬 업데이트 : ${nendoController.localCommitDate.value}",
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            const Text(
              "개인 GithubToken",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                showInfoTokenDialog();
              },
              icon: Icon(
                Icons.help_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Text(
              " :",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Obx(
          () => Row(
            children: [
              Flexible(
                child: Text(
                  nendoController.getGithubTokenKey() ?? "등록된 토큰키가 없습니다.",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              Visibility(
                visible: nendoController.getGithubTokenKey() != null,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    clearGithubToken();
                  },
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: ElevatedButton(
              onPressed: () {
                showRegisterTokenDialog();
              },
              child: const Text("Token 등록하기"),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "테마 적용 : ",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          child: themeColorTile(AppColor.themeColors),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "앱 및 라이센스 정보 : ",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 5.0,
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(const LicenseInfoPage());
          },
          child: const Text(
            "앱 및 오픈소스 라이센스 정보"
          ),
        ),
      ],
    );
  }

  Widget themeColorTile(List<MaterialColor> primarySwatches) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: primarySwatches.length + 1,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 48,
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            color: index == primarySwatches.length ? Colors.black : primarySwatches[index],
          ),
          onTap: () {
            settingController.setAppTheme(index);
          },
        );
      },
      scrollDirection: Axis.vertical,
    );
  }

  void showUpdateDialog() {
    Get.dialog(AlertDialog(
      title: const Text("DB 업데이트"),
      content: const Text("DB 업데이트를 진행하시겠습니까?\n모든 데이터를 다시 받기때문에 시간이 다소 소요되며 다운로드 도중 앱 종료시 저장된 데이터가 삭제될 수 있습니다."),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            Get.find<DashboardController>().tabIndex.value = 0;
            nendoController.backupData();
            nendoController.fetchData();
            Get.back();
          },
          child: const Text("확인"),
        ),
      ],
    ));
  }

  void showInfoTokenDialog() {
    Get.dialog(AlertDialog(
      title: const Text("GithubToken 안내"),
      content: const Text(
        "해당앱은 서버가 따로 구축되어있지 않으며 Github에 저장되어있는 넨도로이드 DB를 Github 무료 API를 통해서 받아오고 있습니다.\n따라서 무료 API 호출 회수가 모두 소진될경우 일정시간동안 DB를 받아오는것이 불가능해지기 때문에 지속적으로 다운로드 에러가 발생할경우 개인용 토큰을 발급받아서 등록해주시기 바라며 등록 후에도 에러가 발생한다면 IP주소 변경 후에 시도해보시기 바랍니다.\n만약 에러가 발생하지 않는다면 굳이 등록할 필요는 없습니다.",
        style: TextStyle(height: 1.3),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("확인"),
        ),
      ],
    ));
  }

  void showRegisterTokenDialog() {
    TextEditingController controller = TextEditingController();
    Get.dialog(AlertDialog(
      title: const Text("개인 GithubToken 등록"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
            labelText: "Github Token",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            )),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Clipboard.getData(Clipboard.kTextPlain).then((value) {
                  controller.text = value?.text ?? "";
                });
              },
              child: const Text("붙여넣기"),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isEmpty) {
                  Get.back();
                } else {
                  nendoController.setGithubTokenKey(controller.text.trim());
                  Get.back();
                  showCommonDialog("등록이 완료되었습니다.");
                }
              },
              child: const Text("확인"),
            ),
          ],
        )
      ],
    ));
  }

  void showCommonDialog(String desc) {
    Get.dialog(
      AlertDialog(
        title: const Text("알림"),
        content: Text(desc),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("확인"),
          ),
        ],
      ),
    );
  }

  void clearGithubToken() {
    nendoController.githubToken.value = "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";
    nendoController.setGithubTokenKey("");
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/component/help_icon.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/widgets/dialog/common_dialog.dart';
import 'package:nendoroid_db/widgets/dialog/register_token_dialog.dart';

@Deprecated("Github 에서 더이상 다운로드를 진행하지 않음")
class SettingPersonalTokenView extends StatelessWidget {
  SettingPersonalTokenView({Key? key}) : super(key: key);
  final NendoController nendoController = Get.find<NendoController>();
  final SettingController settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "개인 GithubToken",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            HelpIcon(onTap: () {
              Get.dialog(
                const CommonDialog(
                  title: "GithubToken 안내",
                  content:
                  "해당앱은 서버가 따로 구축되어있지 않으며 Github에 저장되어있는 넨도로이드 DB를 Github 무료 API를 통해서 받아오고 있습니다.\n따라서 무료 API 호출 회수가 모두 소진될경우 일정시간동안 DB를 받아오는것이 불가능해지기 때문에 지속적으로 다운로드 에러가 발생할경우 개인용 토큰을 발급받아서 등록해주시기 바라며 등록 후에도 에러가 발생한다면 IP주소 변경 후에 시도해보시기 바랍니다.\n만약 에러가 발생하지 않는다면 굳이 등록할 필요는 없습니다.",
                  contentStyle: TextStyle(height: 1.3),
                ),
              );
            }),
            /*IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Get.dialog(
                  const CommonDialog(
                    title: "GithubToken 안내",
                    content:
                        "해당앱은 서버가 따로 구축되어있지 않으며 Github에 저장되어있는 넨도로이드 DB를 Github 무료 API를 통해서 받아오고 있습니다.\n따라서 무료 API 호출 회수가 모두 소진될경우 일정시간동안 DB를 받아오는것이 불가능해지기 때문에 지속적으로 다운로드 에러가 발생할경우 개인용 토큰을 발급받아서 등록해주시기 바라며 등록 후에도 에러가 발생한다면 IP주소 변경 후에 시도해보시기 바랍니다.\n만약 에러가 발생하지 않는다면 굳이 등록할 필요는 없습니다.",
                    contentStyle: TextStyle(height: 1.3),
                  ),
                );
              },
              icon: Icon(
                Icons.help_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),*/
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
                    settingController.clearGithubToken();
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
                Get.dialog(
                  const RegisterTokenDialog()
                );
              },
              child: const Text("Token 등록하기"),
            ),
          ),
        ),
      ],
    );
  }
}

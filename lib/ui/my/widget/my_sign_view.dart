import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/bottom_sheet/terms_agree_bottom_sheet.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/help_icon.dart';
import 'package:nendoroid_db/ui/my/controller/my_sign_controller.dart';
import 'package:nendoroid_db/utilities/extension/async_value_extension.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';

class MySignView extends ConsumerWidget {
  const MySignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(mySignControllerProvider, (previous, next) {
      next.showProgressDialogOnLoading(context);
      next.showDialogOnError(context);
      next.showDialogOnSuccess(context);
    });

    final auth = ref.watch(authProvider);
    final controller = ref.read(mySignControllerProvider.notifier);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "로그인 정보",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 5.0),
            if (auth == null)
              HelpIcon(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CommonDialog(
                        title: "로그인 안내",
                        content: "스마트폰 기기변경, 초기화 등의 이유로 데이터 백업이 필요할때 이메일 로그인 후 데이터를 백업할 수 있습니다.\n만일의 사태에 대비해서 데이터 백업을 주기적으로 해두는것을 권장합니다.",
                        contentStyle: TextStyle(height: 1.3),
                      );
                    },
                  );
                },
              ),
            const SizedBox(width: 5.0),
            Text(
              ":",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 10.0),
            if (auth == null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    onPressed: () {
                      controller.loginAndRegister(context);
                    },
                    child: Text(
                      "로그인 & 회원가입",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Text(
                  auth.email ?? "이메일 주소를 불러오지 못했습니다.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            if (auth != null)
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  controller.logout(context);
                },
                icon: const Icon(
                  Icons.clear,
                  size: 16,
                ),
              ),
          ],
        ),
        const SizedBox(height: 5.0),
        if (auth != null)
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 5.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.restoreNendoData(context: context, uid: auth.uid);
                        },
                        child: const Text(
                          "데이터 복구",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.backupNendoData(context: context, user: auth);
                        },
                        child: const Text(
                          "데이터 백업",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
      ],
    );
  }
}

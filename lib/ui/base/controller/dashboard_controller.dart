import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/remote_config_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  bool build() {
    // 자동 로그인 처리
    ref.read(authProvider.notifier).init();
    return false;
  }

  Future<void> initController() async {
    await ref.read(remoteConfigManagerProvider).init();
    state = true;
  }

  Future<void> appStartCheckList(BuildContext context) async {
    // 앱 버전 체크
    final updateData = ref.read(remoteConfigManagerProvider).checkNewVersion();

    if (updateData.needUpdate && context.mounted) {
      String content = updateData.force ? '필수 업데이트가 있습니다.' : '새로운 버전이 출시되었습니다!';
      if (updateData.updateText.isNotEmpty) {
        content += '\n\n${updateData.updateText}';
      }

      await showDialog(
        context: context,
        barrierDismissible: !updateData.force,
        builder: (context) {
          return CommonDialog(
            title: '업데이트 알림',
            content: content,
            negativeText: updateData.force ? null : '닫기',
            positiveText: '업데이트',
            positiveOnClick: () {
              if (Platform.isAndroid || Platform.isIOS) {
                final appId = Platform.isAndroid ? "com.silvershort.nendoroid_db" : "1634111114";
                final url = Uri.parse(Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/app/id$appId");
                launchUrl(url, mode: LaunchMode.platformDefault);
              }
            },
          );
        },
      );
    }

    // 원격 데이터 체크
    ref.read(nendoProvider.notifier).updateData();

    // 앱 공지사항 체크
    final noticeText = ref.read(remoteConfigManagerProvider).getNoticeText();

    if (noticeText.isNotEmpty && context.mounted) {
      await showDialog(
        context: context,
        barrierDismissible: !updateData.force,
        builder: (context) {
          return CommonDialog(
            title: '공지사항',
            content: noticeText,
            positiveText: '확인',
          );
        },
      );
    }
  }
}
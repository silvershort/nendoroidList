import 'package:flutter/material.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/provider/remote_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void appStartCheckList(BuildContext context) {
    // 앱 버전 체크
    ref.read(remoteConfigManagerProvider).checkNewVersion(context);
    // 원격 데이터 체크
    ref.read(nendoProvider.notifier).updateData();
  }
}
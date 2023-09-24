import 'package:flutter/material.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/my/screen/setting_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_controller.g.dart';

/// [SettingScreen] 과 1:1로 대응되는 컨트롤러
@riverpod
class SettingController extends _$SettingController {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  void dataReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return CommonDialog(
          content: '현재 넨도로이드 데이터를 초기화 하시겠습니까?\n\n(로그인 후 진행한 백업데이터는 유지됩니다.)',
          negativeText: '취소',
          positiveOnClick: () async {
            state = const AsyncLoading();
            try {
              await ref.read(nendoProvider.notifier).resetLocalData();
              state = const AsyncData('데이터 초기화가 완료되었습니다.');
            } catch (error, stackTrace) {
              state = AsyncError('데이터 초기화에 실패했습니다.', stackTrace);
            }
          },
        );
      },
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/app/constant/hive_name.dart';
import 'package:nendoroid_db/app/router/route_path.dart';
import 'package:nendoroid_db/feature/_common/component/dialog/common_dialog.dart';
import 'package:nendoroid_db/feature/_common/provider/hive_provider.dart';
import 'package:nendoroid_db/feature/auth/provider/auth_provider.dart';
import 'package:nendoroid_db/feature/auth/ui/widget/my_sign_view.dart';
import 'package:nendoroid_db/feature/auth/ui/widget/terms_agree_bottom_sheet.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_sign_controller.g.dart';

/// [MySignView]와 1:1로 대응되는 컨트롤러
@riverpod
class MySignController extends _$MySignController {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  void reset() {
    state = const AsyncData(null);
  }

  void loginAndRegister(BuildContext context) {
    final termBox = ref.read(hiveProvider).termsBox;

    if (termBox.get(HiveName.termsAgreeKey) ?? false) {
      context.go(RoutePath.login);
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return const TermsAgreeBottomSheet();
        },
        isScrollControlled: true,
      );
    }
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CommonDialog(
          content: "로그아웃 하시겠습니까?\n\n(이후 로그인을 위해서는 다시 메일인증을 해야합니다.)",
          negativeText: "취소",
          positiveText: "확인",
          positiveOnClick: () {
            ref.read(authProvider.notifier).signOut();
          },
        );
      },
    );
  }

  Future<void> restoreNendoData({
    required BuildContext context,
    required String uid,
  }) async {
    if (ref.read(nendoProvider).hasValue) {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return CommonDialog(
            content: "정말 데이터 복구를 진행하시겠습니까?\n\n(백업데이터와 현재데이터가 다를경우 백업데이터로 대체됩니다.)",
            positiveOnClick: () async {
              state = const AsyncLoading();
              try {
                await ref.read(nendoProvider.notifier).restoreBackupList(uid);
                state = const AsyncData('데이터 복구에 성공했습니다.');
              } catch (error, stackTrace) {
                state = AsyncError('데이터 복구에 실패했습니다.\n\nError : ${error.toString()}', stackTrace);
              }
            },
            negativeText: "취소",
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const CommonDialog(
            content: "넨도로이드 데이터를 먼저 받아주세요.",
          );
        },
      );
    }
  }

  Future<void> backupNendoData({
    required BuildContext context,
    required User user,
  }) async {
    if (user.email == null) {
      showDialog(
        context: context,
        builder: (context) {
          return const CommonDialog(
            content: "이메일 정보가 없습니다.",
          );
        },
      );
    }
    try {
      state = const AsyncLoading();
      await ref.read(nendoProvider.notifier).backupDataToFirestore(user: user);
      state = const AsyncData('데이터 백업에 성공하였습니다 !');
    } catch (error, stackTrace) {
      state = AsyncError('데이터 백업에 실패했습니다.\n\nError:${error.toString()}', stackTrace);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/feature/_common/component/dialog/common_dialog.dart';
import 'package:nendoroid_db/feature/nendo/ui/widget/dialog/loading_dialog.dart';

/// 로딩(로딩 중 화면 조작을 막아야할 경우), 성공, 실패 3가지 상태를 갖는 위젯에 적용시켜서 상태에 따라 다이얼로그를 표시해준다.
extension AsyncValueCommonUI on AsyncValue<String?> {
  // 로딩 다이얼로그에 부여되는 고유한 키
  static final GlobalKey<LoadingDialogState> dialogKey = GlobalKey();

  // 기본적인 loading, data, error 에 대한 세팅
  void defaultSetting(BuildContext context) {
    showProgressDialogOnLoading(context);
    showDialogOnSuccess(context);
    showDialogOnError(context);
  }

  // 로딩상태로 변했을 경우
  void showProgressDialogOnLoading(BuildContext context) {
    if (isLoading) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return LoadingDialog(key: dialogKey);
        },
      );
    }
  }

  // 무언가의 작업에 성공했을때 띄워주는 다이얼로그
  Future<void> showDialogOnSuccess(BuildContext context) async {
    if (!isLoading && hasValue && (value?.isNotEmpty ?? false)) {
      // pop()은 스크린을 닫아버릴 수도 있기 때문에 로딩 다이얼로그가 띄워져 있을때만 pop()을 사용한다.
      if (dialogKey.currentState != null) {
        context.pop();
      }

      await showDialog(
        context: context,
        builder: (context) {
          return CommonDialog(
            content: requireValue.toString(),
          );
        },
      );
    }
  }

  // 무언가의 작업에 실패했을때 띄워주는 다이얼로그
  Future<void> showDialogOnError(BuildContext context) async {
    if (!isLoading && hasError) {
      if (dialogKey.currentState != null) {
        context.pop();
      }

      await showDialog(
        context: context,
        builder: (context) {
          return CommonDialog(
            content: error.toString(),
          );
        },
      );
      return;
    }
  }

  /*void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }*/
}

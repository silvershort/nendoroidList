import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/divider/default_divider.dart';
import 'package:nendoroid_db/ui/_common_widget/radio_button/text_radio_button.dart';
import 'package:nendoroid_db/ui/_common_widget/text/setting_title.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/menu_count_tile.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/menu_switch_tile.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/menu_tile.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appSettingProvider);
    final controller = ref.read(appSettingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const SettingTitle(title: '리스트 설정'),
          const SizedBox(height: 5.0),
          MenuSwitchTile(
            title: '리스트 그룹 활성화',
            value: state.showGroupHeader,
            onChanged: (value) {
              controller.setShowHeader(value ?? false);
            },
          ),
          if (state.showGroupHeader)
            TextRadioButton(
              items: const ['번호 그룹', '시리즈 그룹'],
              selectedIndex: state.groupMethod,
              onTap: (index) {
                controller.setGroudMethod(index);
              },
            ),
          MenuSwitchTile(
            title: '스크롤시 UI 숨기기',
            value: state.hideUI,
            onChanged: (value) {
              controller.setHideUI(value ?? true);
            },
          ),
          MenuCountTile(
            title: '격자뷰 아이템 개수',
            value: state.gridCount,
            onChanged: (add) {
              controller.setGridCount(add);
            },
          ),
          MenuTile(
            title: '데이터 재다운로드',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CommonDialog(
                    content: '넨도로이드 데이터를 재다운로드 하시겠습니까?\n\n(주의 : 모든 저장된 데이터가 초기화 됩니다. 백업 후 사용해주세요.)',
                    negativeText: '취소',
                    positiveOnClick: () {
                      ref.read(nendoProvider.notifier).fetchData(forceDownload: true);
                    },
                  );
                },
              );
            },
          ),
          const DefaultDivider(),
          /*const SettingTitle(title: '데이터 설정'),
          MenuSwitchTile(
            title: '데이터 자동 백업',
            value: state.hideUI,
            onChanged: (value) {
              controller.setHideUI(value ?? true);
            },
          ),*/
        ],
      ),
    );
  }
}

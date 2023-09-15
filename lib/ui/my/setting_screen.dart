import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/divider/default_divider.dart';
import 'package:nendoroid_db/ui/_common_widget/radio_button/text_radio_button.dart';
import 'package:nendoroid_db/ui/_common_widget/text/setting_title.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/setting_count_tile.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/setting_switch_tile.dart';

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
          SettingSwitchTile(
            title: '리스트 그룹 활성화',
            value: state.showGroupHeader,
            onChanged: (value) {
              controller.setShowHeader(value ?? false);
            },
          ),
          if (state.showGroupHeader)
            TextRadioButton(
              items: const [
                '번호 그룹',
                '시리즈 그룹'
              ],
              selectedIndex: state.groupMethod,
              onTap: (index) {
                controller.setGroudMethod(index);
              },
            ),
          SettingSwitchTile(
            title: '스크롤시 UI 숨기기',
            value: state.hideUI,
            onChanged: (value) {
              controller.setHideUI(value ?? true);
            },
          ),
          SettingCountTile(
            title: '격자뷰 아이템 개수',
            value: state.gridCount,
            onChanged: (add) {
              controller.setGridCount(add);
            },
          ),
          const DefaultDivider(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/app/extention/async_value_extension.dart';
import 'package:nendoroid_db/feature/_common/component/dialog/common_dialog.dart';
import 'package:nendoroid_db/feature/_common/component/divider/default_divider.dart';
import 'package:nendoroid_db/feature/_common/component/state_button/text_radio_button.dart';
import 'package:nendoroid_db/feature/_common/component/text/setting_title.dart';
import 'package:nendoroid_db/feature/_common/provider/app_setting_provider.dart';
import 'package:nendoroid_db/feature/auth/ui/controller/setting_controller.dart';
import 'package:nendoroid_db/feature/auth/ui/widget/font_view.dart';
import 'package:nendoroid_db/feature/nendo/provider/nendo_provider.dart';
import 'package:nendoroid_db/feature/setting/ui/widget/menu_count_tile.dart';
import 'package:nendoroid_db/feature/setting/ui/widget/menu_switch_tile.dart';
import 'package:nendoroid_db/feature/setting/ui/widget/menu_tile.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(settingControllerProvider, (previous, next) {
      next.defaultSetting(context);
    });
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
          MenuSwitchTile(
            title: '상세페이지를 팝업형식으로 보기',
            value: state.usePopup,
            onChanged: (value) {
              controller.setNendoDetailUsePopup(value ?? false);
            },
          ),
          MenuCountTile(
            title: '격자뷰 아이템 개수',
            value: state.gridCount,
            onChanged: (add) {
              controller.setGridCount(add);
            },
          ),
          const DefaultDivider(),
          const SizedBox(height: 10.0),
          const SettingTitle(title: '데이터 설정'),
          MenuTile(
            title: '데이터 초기화',
            onPressed: () {
              ref.watch(settingControllerProvider.notifier).dataReset(context);
            },
          ),
          MenuTile(
            title: '데이터 재다운로드',
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return CommonDialog(
                    content: '넨도로이드 데이터를 재다운로드 하시겠습니까?',
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
          const SizedBox(height: 10.0),
          const SettingTitle(title: '폰트 설정'),
          const FontView(),
          const DefaultDivider(),
          // MenuTile(
          //   title: '넨돌 다운로드',
          //   onPressed: () {
          //     ref.read(githubDownloadProvider.notifier).fetchDollJsonNameList();
          //   },
          // ),
          // MenuTile(
          //   title: '넨돌 데이터 다운로드',
          //   onPressed: () async {
          //     final result = await ref.read(githubDownloadProvider.notifier).fetchNendoDollList();
          //     ref.read(nendoProvider.notifier).saveLocalDB(nenDollList: result);
          //   },
          // ),
          // MenuTile(
          //   title: '로컬 저장소 넨돌 저장',
          //   onPressed: () {
          //     ref.read(githubDownloadProvider.notifier).saveNendollLocalDB();
          //   },
          // ),
          // MenuTile(
          //   title: '로컬 저장소 저장',
          //   onPressed: () {
          //     ref.read(githubDownloadProvider.notifier).saveLocalDB();
          //   },
          // ),
          // MenuTile(
          //   title: '로컬 저장소 저장2',
          //   onPressed: () {
          //     ref.read(nendoProvider.notifier).fetchData();
          //   },
          // ),
          // MenuTile(
          //   title: '넨도 데이터 저장',
          //   onPressed: () {
          //     ref.read(githubDownloadProvider.notifier).fetchNendoData();
          //   },
          // ),
          // MenuTile(
          //   title: '원격 저장소에 데이터 저장',
          //   onPressed: () {
          //     ref.read(githubDownloadProvider.notifier).uploadFirebase();
          //   },
          // ),
          // const SettingTitle(title: '데이터 설정'),
          // MenuSwitchTile(
          //   title: '데이터 자동 백업',
          //   value: state.hideUI,
          //   onChanged: (value) {
          //     controller.setHideUI(value ?? true);
          //   },
          // ),
        ],
      ),
    );
  }
}

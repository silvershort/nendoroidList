import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/file_download_provider.dart';
import 'package:nendoroid_db/provider/nendo_list_scroll_controller_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/animation/scroll_to_hide_widget.dart';
import 'package:nendoroid_db/ui/base/controller/dashboard_controller.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(dashboardControllerProvider.notifier).initController());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dashboardControllerProvider, (previous, next) {
      if (next) {
        ref.read(dashboardControllerProvider.notifier).appStartCheckList(context);
      }
    });

    // 파일 다운로드 상태가 변경될 경우 토스트 메시지를 출력해준다.
    ref.listen(fileDownloadProvider, (previous, next) {
      switch (next) {
        case DownloadSuccess():
          Fluttertoast.showToast(msg: '다운로드에 성공했습니다.');
        case DownloadError():
          Fluttertoast.showToast(msg: '다운로드에 실패했습니다.');
        case DownloadIdle():
      }
    });

    // 앱 설정에 따라서 스크롤시 UI를 숨길지 여부
    final hideUI = ref.watch(appSettingProvider.select((value) => value.hideUI));

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: ScrollToHideWidget(
        controller: ref.watch(nendoListScrollControllerProvider),
        enable: hideUI,
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list),
              label: "List",
            ),
            NavigationDestination(
              icon: Icon(Icons.stacked_bar_chart),
              label: "Stats",
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: "News",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "My",
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}

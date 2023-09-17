import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_list_scroll_controller_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/animation/scroll_to_hide_widget.dart';
import 'package:nendoroid_db/ui/base/dashboard_controller.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);
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
  Widget build(BuildContext context) {
    ref.listen(dashboardControllerProvider, (previous, next) {
      if (next) {
        ref.read(dashboardControllerProvider.notifier).appStartCheckList(context);
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/nendo_list_scroll_controller_provider.dart';
import 'package:nendoroid_db/ui/_common_widget/animation/scroll_to_hide_widget.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 앱 설정에 따라서 스크롤시 UI를 숨길지 여부
    final hideUI = ref.watch(appSettingProvider.select((value) => value.hideUI));

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ScrollToHideWidget(
        controller: ref.watch(nendoListScrollControllerProvider),
        enable: hideUI,
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
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

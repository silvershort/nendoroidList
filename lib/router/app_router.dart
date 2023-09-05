import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/screens/dashboard/dashboard_screen.dart';
import 'package:nendoroid_db/ui/screens/list/list_screen.dart';
import 'package:nendoroid_db/ui/screens/nendo/nendo_web_screen.dart';
import 'package:nendoroid_db/ui/screens/news/news_screen.dart';
import 'package:nendoroid_db/ui/screens/setting/setting_screen.dart';
import 'package:nendoroid_db/ui/screens/stats/stats_screen.dart';
import 'package:nendoroid_db/ui/widget/image_view/image_detail_view.dart';
import 'package:nendoroid_db/utilities/extension/string_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellListNavigatorKey = GlobalKey<NavigatorState>();
final _shellStatsNavigatorKey = GlobalKey<NavigatorState>();
final _shellNewsNavigatorKey = GlobalKey<NavigatorState>();
final _shellSettingNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/list',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/image-detail',
      builder: (context, state) {
        final List<String> attachList = state.extra as List<String>;
        final int initialIndex = state.uri.queryParameters['start'].toIntOrDefault;
        return ImageDetailView(attachList: attachList, initialIndex: initialIndex);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/nendo-web',
      builder: (context, state) {
        final NendoData nendoData = state.extra as NendoData;
        return NendoWebPage(nendoData: nendoData);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/list',
              builder: (context, state) {
                return const ListScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/stats',
              builder: (context, state) {
                return const StatsScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/news',
              builder: (context, state) {
                return const NewsScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/setting',
              builder: (context, state) {
                return const SettingScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

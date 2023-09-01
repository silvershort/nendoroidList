import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/ui/screens/dashboard/dashboard_screen.dart';
import 'package:nendoroid_db/ui/screens/list/list_screen.dart';
import 'package:nendoroid_db/ui/screens/news/news_screen.dart';
import 'package:nendoroid_db/ui/screens/setting/setting_screen.dart';
import 'package:nendoroid_db/ui/screens/stats/stats_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellListNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell_list');

final appRouter = GoRouter(
  initialLocation: '/list',
  navigatorKey: _rootNavigatorKey,
  routes: [
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
              path: '/statistics',
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

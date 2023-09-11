import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/ui/dashboard/dashboard_screen.dart';
import 'package:nendoroid_db/ui/list/list_screen.dart';
import 'package:nendoroid_db/ui/my/app_info_screen.dart';
import 'package:nendoroid_db/ui/my/login_screen.dart';
import 'package:nendoroid_db/ui/my/my_screen.dart';
import 'package:nendoroid_db/ui/my/setting_screen.dart';
import 'package:nendoroid_db/ui/nendo/nendo_web_screen.dart';
import 'package:nendoroid_db/ui/news/news_screen.dart';
import 'package:nendoroid_db/ui/stats/stats_screen.dart';
import 'package:nendoroid_db/ui/_common_widget/image_view/image_detail_view.dart';
import 'package:nendoroid_db/utilities/extension/string_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _listShellNavigatorKey = GlobalKey<NavigatorState>();
final _statsShellNavigatorKey = GlobalKey<NavigatorState>();
final _newsShellNavigatorKey = GlobalKey<NavigatorState>();
final _myShellNavigatorKey = GlobalKey<NavigatorState>();

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
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/license',
      builder: (context, state) {
        return const LicensePage();
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
          navigatorKey: _myShellNavigatorKey,
          routes: [
            GoRoute(
              path: '/my',
              builder: (context, state) {
                return const MyScreen();
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _myShellNavigatorKey,
                  path: 'login',
                  builder: (context, state) {
                    return const LoginPage();
                  },
                ),
                GoRoute(
                  parentNavigatorKey: _myShellNavigatorKey,
                  path: 'app-info',
                  builder: (context, state) {
                    return const AppInfoScreen();
                  },
                ),
                GoRoute(
                  parentNavigatorKey: _myShellNavigatorKey,
                  path: 'setting',
                  builder: (context, state) {
                    return const SettingScreen();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

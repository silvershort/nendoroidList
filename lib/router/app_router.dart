import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/news_item_data.dart';
import 'package:nendoroid_db/ui/base/screen/dashboard_screen.dart';
import 'package:nendoroid_db/ui/list/screen/list_screen.dart';
import 'package:nendoroid_db/ui/my/screen/app_info_screen.dart';
import 'package:nendoroid_db/ui/my/screen/login_screen.dart';
import 'package:nendoroid_db/ui/my/screen/my_screen.dart';
import 'package:nendoroid_db/ui/my/screen/setting_screen.dart';
import 'package:nendoroid_db/ui/nendo/screen/nendo_detail_screen.dart';
import 'package:nendoroid_db/ui/nendo/screen/nendo_web_screen.dart';
import 'package:nendoroid_db/ui/news/screen/news_detail_screen.dart';
import 'package:nendoroid_db/ui/news/screen/news_screen.dart';
import 'package:nendoroid_db/ui/stats/screen/stats_screen.dart';
import 'package:nendoroid_db/ui/nendo/screen/image_detail_screen.dart';
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
        final int initialIndex =
            state.uri.queryParameters['start'].toIntOrDefault;
        return ImageDetailScreen(
            attachList: attachList, initialIndex: initialIndex);
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
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ListScreen());
              },
              routes: [
                GoRoute(
                  path: 'detail',
                  pageBuilder: (context, state) {
                    final NendoData nendoData = state.extra as NendoData;

                    return CustomTransitionPage(
                      child: NendoDetailScreen(nendoData: nendoData),
                      opaque: false,
                      transitionDuration: const Duration(milliseconds: 150),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
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
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) {
                    final String title =
                        state.uri.queryParameters['title'] ?? '상세보기';
                    final String homePage =
                        state.uri.queryParameters['homePage'] ?? '';
                    final List<NewsItemData> itemList =
                        state.extra as List<NewsItemData>;

                    return NewsDetailScreen(
                      title: title,
                      homePage: homePage,
                      itemList: itemList,
                    );
                  },
                ),
              ],
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/dom_parsing.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/divider/default_divider.dart';
import 'package:nendoroid_db/ui/_common_widget/tile/menu_tile.dart';
import 'package:nendoroid_db/ui/my/widget/my_sign_widget.dart';
import 'package:nendoroid_db/ui/my/widget/theme_widget.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("마이페이지"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                context.go(RoutePath.setting);
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: MySignWidget(),
          ),
          const SizedBox(height: 10.0),
          const DefaultDivider(),
          const SizedBox(height: 10.0),
          MenuTile(
            title: '앱 설정',
            onPressed: () {
              context.go(RoutePath.setting);
            },
          ),
          MenuTile(
            title: '앱 상세정보',
            onPressed: () {
              context.go(RoutePath.appInfo);
            },
          ),
          const SizedBox(height: 10.0),
          const DefaultDivider(),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ThemeWidget(),
          ),
        ],
      ),
    );
  }
}

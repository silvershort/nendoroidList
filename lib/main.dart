import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/notification_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/pages/dashboard_page.dart';
import 'package:nendoroid_db/utilities/app_color.dart';
import 'package:nendoroid_db/utilities/app_font.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';

import 'controllers/dashboard_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NendoDataAdapter());
  Hive.registerAdapter(NameAdapter());
  Hive.registerAdapter(SeriesAdapter());
  Hive.registerAdapter(SetDataAdapter());
  Box appThemeBox = await Hive.openBox<int>(HiveName.appThemeBoxName);
  int? index = appThemeBox.get(HiveName.appThemeIndexKey);
  late ThemeData appTheme;

  if (index == AppColor.themeColors.length) {
    appTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppFont.oneMobile,
    );
  } else {
    appTheme = ThemeData(
      primarySwatch: AppColor.themeColors[index ?? AppColor.defaultIndex],
      fontFamily: AppFont.oneMobile,
    );
  }

  Get.put(NendoController()).init();
  Get.put(DashboardController());
  Get.put(SettingController());
  Get.put(BottomSheetController());
  Get.put(NotificationController());

  runApp(MyApp(appTheme: appTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appTheme}) : super(key: key);
  final ThemeData appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: appTheme,
      home: DashboardPage(),
    );
  }
}

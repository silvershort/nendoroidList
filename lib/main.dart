import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nendoroid_db/controllers/app_version_controller.dart';
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
import 'controllers/my_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter(NendoDataAdapter());
  Hive.registerAdapter(NameAdapter());
  Hive.registerAdapter(SeriesAdapter());
  Hive.registerAdapter(SetDataAdapter());
  Box appThemeBox = await Hive.openBox<int>(HiveName.appThemeBoxName);
  int? index = appThemeBox.get(HiveName.appThemeIndexKey);
  late ThemeData appTheme;

  if (index == -1) {
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

  Get.put(NendoController());
  Get.put(MyController());
  Get.put(BottomSheetController());
  Get.put(DashboardController());
  Get.put(SettingController());
  Get.put(NotificationController());

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    runApp(MyApp(appTheme: appTheme));
  } else {
    runZonedGuarded<Future<void>>(() async {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      FirebaseAnalytics analytics = FirebaseAnalytics.instance;

      runApp(MyApp(appTheme: appTheme));
    }, (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appTheme}) : super(key: key);
  final ThemeData appTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: appTheme,
      home: const DashboardPage(),
    );
  }
}

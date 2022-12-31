import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nendoroid_db/controllers/auth_controller.dart';
import 'package:nendoroid_db/controllers/bottom_sheet_controller.dart';
import 'package:nendoroid_db/controllers/firestore_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/controllers/news_controller.dart';
import 'package:nendoroid_db/controllers/notification_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/subscribe_data.dart';
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
  Hive.registerAdapter(SubscribeDataAdapter());
  Hive.registerAdapter(TwitterSubscribeAdapter());
  Hive.registerAdapter(RuliwebSubscribeAdapter());
  Hive.registerAdapter(DcinsideSubscribeAdapter());

  Get.put(NendoController());
  Get.put(MyController());
  Get.put(BottomSheetController());
  Get.put(DashboardController());
  await Get.put(SettingController()).settingInit();
  Get.put(NotificationController());
  Get.put(NewsController());
  Get.put(FirestoreController());
  Get.put(AuthController());

  if (!kIsWeb) {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      runApp(MyApp());
    } else {
      runZonedGuarded<Future<void>>(() async {
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
        FirebaseAnalytics analytics = FirebaseAnalytics.instance;

        runApp(MyApp());
      }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find<SettingController>();
    return Obx(
      () => GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: settingController.seedColor,
            brightness: settingController.brightness,
            fontFamily: AppFont.oneMobile,
            appBarTheme: AppBarTheme(
              backgroundColor: ColorScheme.fromSeed(
                seedColor: settingController.seedColor,
                brightness: settingController.brightness,
              ).surfaceVariant.withAlpha(100),
              surfaceTintColor: Colors.white,
            )),
        home: const DashboardPage(),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nendoroid_db/firebase_options.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/models/set_data.dart';
import 'package:nendoroid_db/models/subscribe_data.dart';
import 'package:nendoroid_db/provider/app_setting_provider.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/notification_provider.dart';
import 'package:nendoroid_db/router/app_router.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'utilities/app_font.dart';

final talker = TalkerFlutter.init();

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterDownloader.initialize(debug: true);

  await Hive.initFlutter();
  Hive.registerAdapter(NendoDataAdapter());
  Hive.registerAdapter(NameAdapter());
  Hive.registerAdapter(SeriesAdapter());
  Hive.registerAdapter(SetDataAdapter());
  Hive.registerAdapter(SubscribeDataAdapter());
  Hive.registerAdapter(TwitterSubscribeAdapter());
  Hive.registerAdapter(RuliwebSubscribeAdapter());
  Hive.registerAdapter(DcinsideSubscribeAdapter());

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 앱 시작시 푸시 알림 권한 요청
  await FirebaseMessaging.instance.requestPermission(
    badge: true,
    alert: true,
    sound: true,
  );
  FlutterNativeSplash.remove();
  // FCM 토큰값 확인
  talker.info('FCM Token : ${await FirebaseMessaging.instance.getToken()}');

  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  runApp(ProviderScope(
    overrides: [
      hiveProvider.overrideWithValue(
        HiveManager(
          nendoBox: await Hive.openBox(HiveName.nendoBoxName),
          nenDollBox: await Hive.openBox(HiveName.nenDollBoxName),
          setBox: await Hive.openBox(HiveName.setBoxName),
          settingBox: await Hive.openBox(HiveName.settingBoxName),
          appThemeBox: await Hive.openBox(HiveName.appThemeBoxName),
          subscribeBox: await Hive.openBox(HiveName.subscribeBoxName),
          termsBox: await Hive.openBox(HiveName.termsBoxName),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appNotificationProvider);

    final settingState = ref.watch(appSettingProvider);

    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: settingState.seedColor,
        brightness: settingState.brightness,
        fontFamily: AppFont.oneMobile,
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 16,
            fontFamily: AppFont.oneMobile,
            letterSpacing: 0.5,
            height: 1.2,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontFamily: AppFont.oneMobile,
            letterSpacing: 0.5,
            height: 1.2,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorScheme.fromSeed(
            seedColor: settingState.seedColor,
            brightness: settingState.brightness,
          ).surfaceVariant,
          surfaceTintColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
            statusBarColor: Colors.black45,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}

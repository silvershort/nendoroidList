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
import 'package:nendoroid_db/app/constant/hive_name.dart';
import 'package:nendoroid_db/app/router/app_router.dart';
import 'package:nendoroid_db/feature/_common/provider/app_setting_provider.dart';
import 'package:nendoroid_db/feature/_common/provider/hive_provider.dart';
import 'package:nendoroid_db/feature/_common/provider/notification_provider.dart';
import 'package:nendoroid_db/feature/_common/provider/shared_preference_provider.dart';
import 'package:nendoroid_db/feature/auth/provider/auth_provider.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/scraping/model/set_data.dart';
import 'package:nendoroid_db/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init();

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'nendoroid_db',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(debug: true);

  await Hive.initFlutter();
  Hive.registerAdapter(NendoDataAdapter());
  Hive.registerAdapter(NameAdapter());
  Hive.registerAdapter(SeriesAdapter());
  Hive.registerAdapter(SetDataAdapter());

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

  final container = ProviderContainer(
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
      sharedPreferencesProvider.overrideWithValue(
          SharedPreferencesManager(await SharedPreferences.getInstance())),
    ],
  );
  container.read(authProvider);

  runApp(UncontrolledProviderScope(
    container: container,
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: settingState.seedColor,
        brightness: settingState.brightness,
        fontFamily: ref.watch(sharedPreferencesProvider).getFont(),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorScheme.fromSeed(
            seedColor: settingState.seedColor,
            brightness: settingState.brightness,
          ).surfaceVariant,
          surfaceTintColor: Colors.transparent,
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

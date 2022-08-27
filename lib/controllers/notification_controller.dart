import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/dashboard_controller.dart';

import '../firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

class NotificationController extends GetxController {
  late final FirebaseMessaging _messaging;
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "NendoroidChannel",
    "NendoroidName",
    description: "This channel is used for important notifications",
    importance: Importance.high,
    playSound: false,
    enableVibration: true,
  );
  AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  IOSInitializationSettings initializationSettingsIOS = const IOSInitializationSettings();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initNotification();
  }
  void _initNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 이유를 정확히 알 수 없으나 백그라운드에서 푸시알림을 수신했을때 onSelectNotification 가 작동하지 않음.
    // 따라서 해당 부분에서 앱이 실행중인지 검사하고 수동으로 onSelectNotification 호출
    var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null) {
      if (details.didNotificationLaunchApp) {
        onSelectNotification(details.payload);
      }
    }

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await _messaging.getToken();
      print("The token is $token");
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        String title = message.notification?.title ?? "";
        String body = message.notification?.body ?? "";

        flutterLocalNotificationsPlugin.initialize(InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        ),
          onSelectNotification: onSelectNotification,
        );

        flutterLocalNotificationsPlugin.show(
          message.hashCode,
          title,
          body,
          payload: json.encode(message.data).toString(),
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: const IOSNotificationDetails(
              badgeNumber: 1,
              subtitle: 'the subtitle',
              sound: 'slow_spring_board.aiff',
            ),
          ),
        );
      });
    }
  }

  void onSelectNotification(String? payload) {
    if (payload != null) {
      Map<String, dynamic> payloadMap = json.decode(payload);
      try {
        String? page = payloadMap["page"];

        // 푸시알림에 page 정보가 있을경우 푸시알림 클릭시 해당하는 tap index 로 이동
        if (page != null) {
          int index = 0;
          if (page == "list") {
            index = 0;
          } else if (page == "my") {
            index = 1;
          } else if (page == "setting") {
            index = 2;
          }
          Get.find<DashboardController>().tabIndex = index;
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

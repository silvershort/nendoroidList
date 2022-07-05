import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

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
    // await Firebase.initializeApp();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
        String? dialog = payloadMap["dialog"];
        String? productNum = payloadMap["productNum"];
        String? nendoNum = payloadMap["nendoNum"];
      } catch (e) {
        print(e);
      }
    }
  }
}

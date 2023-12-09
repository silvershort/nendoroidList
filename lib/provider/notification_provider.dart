import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nendoroid_db/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  talker.info('Handling a background message ${message.messageId}');
}

@Riverpod(keepAlive: true)
class AppNotification extends _$AppNotification {
  @override
  void build() {
    _initNotification();
    return;
  }

  final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
    "NendoroidChannel",
    "NendoroidName",
    description: "This channel is used for important notifications",
    importance: Importance.high,
    playSound: false,
    enableVibration: true,
  );
  final AndroidInitializationSettings _initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings _initializationSettingsIOS = const DarwinInitializationSettings();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void _initNotification() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await setupFlutterNotifications();

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      talker.info('FCM received initialMessage');
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  void _handleMessage(RemoteMessage message) {
    talker.info('FCM message: ${message.toString()}');
  }

  Future<void> setupFlutterNotifications() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: _initializationSettingsAndroid,
        iOS: _initializationSettingsIOS,
      ),
      onDidReceiveNotificationResponse: (details) {
        talker.info(
          'FCM Notification Click : ${details.toString()}',
        );
      },
    );
  }

  void showFlutterNotification(RemoteMessage message) {
    talker.info('showFlutterNotification : ${message.notification?.body}');

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      _flutterLocalNotificationsPlugin.show(
        message.hashCode,
        notification.title,
        notification.body,
        payload: json.encode(message.data).toString(),
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  }
}

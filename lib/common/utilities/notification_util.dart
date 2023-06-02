import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_note/common/constant/app_navigator_key.dart';

class NotificationUtils {
  static final NotificationUtils _singleton = NotificationUtils._();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationUtils() {
    return _singleton;
  }

  NotificationUtils._();

  // config variable
  static int idNotification = 0;
  static const String iconNoti = "@mipmap/launcher_icon";
  static const String androidNotiChannelId = "channel_id";
  static const String androidNotiChannelName = "Channel Name";
  static const NotificationDetails notiDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      androidNotiChannelId,
      androidNotiChannelName,
      icon: iconNoti,
      priority: Priority.high,
      importance: Importance.high,
      enableVibration: true,
    ),
  );

  static void listenNotificationForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Message: ${message.data}');

      if (message.data["title"] != null) {
        idNotification += 1;
        await flutterLocalNotificationsPlugin.show(
          idNotification,
          message.data["title"],
          message.data["body"],
          notiDetails,
          payload: message.data.toString(),
        );
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<void> backgroundHandler(RemoteMessage message) async {
    if (message.data["title"] != null) {
      idNotification += 1;
      await flutterLocalNotificationsPlugin.show(
        idNotification,
        message.data["title"],
        message.data["body"],
        notiDetails,
        payload: message.data.toString(),
      );
    }
  }

  static Future<void> _appTerminatedHandler() async {
    NotificationAppLaunchDetails? _data =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (_data == null) {
      return;
    }

    if (!_data.didNotificationLaunchApp) {
      return;
    }

    if (_data.notificationResponse == null ||
        _data.notificationResponse!.payload == null) {
      return;
    }

    Map<String, dynamic> notify =
        json.decode(_data.notificationResponse!.payload!);
  }

  static Future<void> setupFlutterNotifications() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(iconNoti);
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onSelectNotification,
      onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      androidNotiChannelId,
      androidNotiChannelName,
      description: 'project noti decription',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _appTerminatedHandler();
  }

  // need fully uninstall and install app
  @pragma('vm:entry-point')
  static void _onSelectNotification(NotificationResponse? payload) {
    Navigator.popUntil(
      AppNavigatorKey.navigatorKey.currentContext!,
      (route) => route.isFirst,
    );
  }

  static Future<String?> getToken() async {
    String? token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      print("FCM token: $token");
    } catch (e) {
      return null;
    }

    return token;
  }

  static Future<void> deleteToken() async {
    idNotification = 0;
    await FirebaseMessaging.instance.deleteToken();
  }
}

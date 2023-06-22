import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_note/common/utilities/notification_util.dart';

import 'package:my_note/app.dart';
import 'package:my_note/config/config_loading.dart';
import 'package:my_note/config/flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await runZonedGuarded(
    () async {
      Flavor.env = Environment.prod;
      ConfigLoading.configLoading();
      runApp(MyApp());
      FirebaseMessaging.onBackgroundMessage(
          NotificationUtils.backgroundHandler);
    },
    (error, stackTrace) {},
  );
}

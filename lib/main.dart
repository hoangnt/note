import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_note/common/utilities/notification_util.dart';

import 'package:my_note/app.dart';
import 'package:my_note/config/flavor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flavor.env = Environment.prod;
  runApp(MyApp());
  FirebaseMessaging.onBackgroundMessage(NotificationUtils.backgroundHandler);
}

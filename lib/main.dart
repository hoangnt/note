import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_note/common/constant/app_shared.dart';
import 'package:my_note/common/utilities/work_manager_dispatcher.dart';
import 'package:my_note/common/utilities/di.dart';
import 'package:my_note/common/utilities/notification_util.dart';

import 'package:my_note/app.dart';
import 'package:my_note/config/config_loading.dart';
import 'package:my_note/config/flavor.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config
  Flavor.env = Environment.prod;
  await AppShared.init();
  ConfigLoading.configLoading();

  // dependencies
  await boxInit();

  // util
  Workmanager().initialize(
    workManagerDispatcher,
    isInDebugMode: true,
  );

  runApp(MyApp());
  FirebaseMessaging.onBackgroundMessage(NotificationUtils.backgroundHandler);
}

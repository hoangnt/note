import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/modules/home/binding/home_binding.dart';
import 'package:my_note/modules/home/screen/home_screen.dart';
import 'package:my_note/modules/settings/binding/settings_binding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomeScreen(),
          bindings: [
            HomeBinding(),
            SettingsBinding(),
          ],
        ),
      ],
    );
  }
}

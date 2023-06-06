import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_note/common/constant/app_color.dart';
import 'package:my_note/modules/cart/binding/cart_binding.dart';
import 'package:my_note/modules/cart/screen/cart_screen.dart';
import 'package:my_note/modules/home/binding/entry_binding.dart';
import 'package:my_note/modules/home/screen/entry_screen.dart';
import 'package:my_note/modules/settings/binding/settings_binding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppColor.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.black, size: 20.sp),
          ),
        ),
        initialRoute: "/home",
        getPages: [
          GetPage(
            name: "/home",
            page: () => EntryScreen(),
            bindings: [
              EntryBinding(),
              SettingsBinding(),
            ],
          ),
          GetPage(
            name: "/cart",
            page: () => CartScreen(),
            binding: CartBinding(),
          ),
        ],
      ),
    );
  }
}

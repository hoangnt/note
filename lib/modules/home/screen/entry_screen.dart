import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/common/constant/app_color.dart';
import 'package:my_note/modules/home/controller/entry_controller.dart';
import 'package:my_note/modules/home/screen/home_screen.dart';
import 'package:my_note/modules/home/screen/settings_screen.dart';

class EntryScreen extends StatelessWidget {
  final _controller = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titleAppbar'.tr),
      ),
      body: GetBuilder<EntryController>(builder: (_) {
        return PageTransitionSwitcher(
          transitionBuilder: (child, anim1, anim2) {
            return FadeThroughTransition(
              animation: anim1,
              secondaryAnimation: anim2,
              child: child,
            );
          },
          child: _controller.selectedIndex == 0
              ? HomeScreen()
              : _controller.selectedIndex == 1
                  ? SettingsScreen()
                  : Container(),
        );
      }),
      bottomNavigationBar: GetBuilder<EntryController>(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: _controller.selectedIndex,
            onTap: _controller.onSelectBottomBar,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColor.primary,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(
              size: 25,
              color: AppColor.primary,
            ),
            unselectedIconTheme: IconThemeData(
              size: 22
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'homeNavigator'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settingNavigator'.tr,
              ),
            ],
          );
        },
      ),
    );
  }
}

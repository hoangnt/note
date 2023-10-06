import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/common/constant/app_color.dart';
import 'package:my_note/modules/home/controller/entry_controller.dart';
import 'package:my_note/modules/home/screen/home_screen.dart';
import 'package:my_note/modules/settings/screen/settings_screen.dart';

class EntryScreen extends StatelessWidget {
  final _controller = Get.find<EntryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is appbar"),
      ),
      body: GetBuilder<EntryController>(builder: (_) {
        switch (_controller.selectedIndex) {
          case 0:
            return HomeScreen();
          case 1:
            return SettingsScreen();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: GetBuilder<EntryController>(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: _controller.selectedIndex,
            onTap: _controller.onSelectBottomBar,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedItemColor: AppColor.primary,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: AppColor.primary),
          );
        },
      ),
    );
  }
}

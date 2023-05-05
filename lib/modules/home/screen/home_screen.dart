import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/modules/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is appbar"),
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return PageView(
          controller: _controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: _controller.onSelectBottomBar,
          children: [
            Text("home"),
            Text("settings"),
          ],
        );
      }),
      bottomNavigationBar: GetBuilder<HomeController>(
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
            selectedItemColor: Colors.amber,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: Colors.amber),
          );
        },
      ),
    );
  }
}

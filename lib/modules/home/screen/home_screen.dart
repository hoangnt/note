import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/config/routes.dart';
import 'package:my_note/modules/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.cart,
                  parameters: {"name": "Hoang"},
                );
              },
              child: Text("go to cart"),
            ),
            ElevatedButton(
              onPressed: _controller.getUser,
              child: Text("get user hive"),
            ),
            ElevatedButton(
              onPressed: _controller.saveUser,
              child: Text("save user hive"),
            ),
            ElevatedButton(
              onPressed: _controller.toggleLanguage,
              child: Text("change language"),
            ),
          ],
        ),
      ),
    );
  }
}

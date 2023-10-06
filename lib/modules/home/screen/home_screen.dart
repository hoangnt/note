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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _controller.callAPI,
              child: Text("call api"),
            ),
          ],
        ),
      ),
    );
  }
}

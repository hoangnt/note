import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/config/routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                Routes.cart,
                parameters: {"name": "Hoang"},
              );
            },
            child: Text("go to cart"),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Get.toNamed("/cart");
            },
            child: Text("go to cart"),
          ),
        ),
      ),
    );
  }
}

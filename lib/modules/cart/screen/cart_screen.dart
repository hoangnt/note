import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/modules/cart/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
    );
  }
}

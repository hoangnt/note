import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryController extends GetxController {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  void onSelectBottomBar(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    update();
  }
}

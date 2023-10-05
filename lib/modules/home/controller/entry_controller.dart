import 'package:get/get.dart';

class EntryController extends GetxController {
  int selectedIndex = 0;

  void onSelectBottomBar(int index) {
    selectedIndex = index;
    update();
  }
}

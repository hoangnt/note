import 'package:get/get.dart';

class SettingsController extends GetxController {
  double level = 0;

  void onChangeLevel(double val) {
    level = val;
    update();
  }
}

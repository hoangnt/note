import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  double level = 0;

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading setting");
    await Future.delayed(Duration(seconds: 7));
    EasyLoading.dismiss();
  }

  void onChangeLevel(double val) {
    level = val;
    update();
  }
}

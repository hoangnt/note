import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading home");
    await Future.delayed(Duration(seconds: 3));
    EasyLoading.dismiss();
  }
}

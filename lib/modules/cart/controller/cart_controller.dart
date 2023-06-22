import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading");
    await Future.delayed(Duration(seconds: 2));
    EasyLoading.dismiss();
  }
}

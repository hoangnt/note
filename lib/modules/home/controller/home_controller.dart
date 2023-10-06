import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_note/common/network_dio/api_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading home");
    await Future.delayed(Duration(seconds: 3));
    EasyLoading.dismiss();
  }

  Future<void> callAPI() async {
    ApiController _api = ApiController();

    _api.get(
      endpoint: "/something",
      params: {"name": "hoang"},
    );
  }
}

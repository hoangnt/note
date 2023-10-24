import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_note/modules/cart/model/user_model.dart';

class CartController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading");
    await Future.delayed(Duration(seconds: 2));
    EasyLoading.dismiss();
  }

  void removeDuplicate() {
    List<UserModel> list = [
      UserModel(name: "nguyen", age: 20),
      UserModel(name: "nguyen", age: 20),
      UserModel(name: "the", age: 20),
      UserModel(name: "hoang", age: 20),
      UserModel(name: "hoang", age: 20),
    ];

    final condition = list.map((val) => val.name).toSet();
    list.retainWhere((val) => condition.remove(val.name));

    list.forEach((val) {
      print("${val.name} - ${val.age}");
    });
  }
}

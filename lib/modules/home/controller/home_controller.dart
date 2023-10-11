import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:my_note/common/constant/hive_box_key.dart';
import 'package:my_note/modules/cart/model/user_model.dart';

class HomeController extends GetxController {
  final List<UserModel> listUser = [
    UserModel(id: "id1", name: "nguyen the hoang", age: 20),
    UserModel(id: "id2", name: "nguyen the hoan", age: 23),
    UserModel(id: "id3", name: "nguyen the hoa", age: 27),
  ];

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "loading home");
    await Future.delayed(Duration(seconds: 3));
    EasyLoading.dismiss();
  }

  Future<void> getUser() async {
    Box<UserModel> _boxUser = Hive.box<UserModel>(HiveBoxKey.userModelKey);
    UserModel? id1 = _boxUser.get("id1");
    // id1?.age = 999;
    // id1?.save();
    // print(id1?.toJson());
    _boxUser.toMap().forEach((key, val) {
      print("======$key");
      print(val.toJson());
    });
  }

  Future<void> saveUser() async {
    Box<UserModel> _boxUser = Hive.box<UserModel>(HiveBoxKey.userModelKey);
    await _boxUser.putAll(
      listUser.asMap().map((index, val) => MapEntry(val.id, val)),
    );
  }
}

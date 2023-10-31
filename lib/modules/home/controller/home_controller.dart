import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:my_note/common/constant/background_task_name.dart';
import 'package:my_note/common/constant/hive_box_key.dart';
import 'package:my_note/modules/cart/model/user_model.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';

class HomeController extends GetxController {
  final GlobalKey captureKey = GlobalKey();

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

  void toggleLanguage() {
    if (Get.locale == Locale("vi", "VN")) {
      Get.updateLocale(Locale("en", "US"));
      return;
    }
    Get.updateLocale(Locale("vi", "VN"));
  }

  Future<void> captureWidget() async {
    RenderRepaintBoundary? boundary =
        captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) {
      return;
    }

    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      return;
    }

    final directory = (await getDownloadsDirectory())!.path;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File imgFile = File("$directory/screenshot.png");

    await imgFile.writeAsBytes(pngBytes);
  }

  void triggerBackgroundTask() {
    Workmanager().registerOneOffTask(
      "unique-id",
      BackgroundTaskName.task1,
    );
  }

  Future<void> isolateSpawner() async {
    ReceivePort receivePort = ReceivePort();
    final isolate =
        await Isolate.spawn<SendPort>(_isolateTask, receivePort.sendPort);

    receivePort.listen((data) {
      print(data);

      if (data == 2) {
        isolate.kill();
        receivePort.close();
      }
    });
  }

  // must be static or top-level function
  static void _isolateTask(dynamic param) {
    SendPort sendPort = param as SendPort;

    Timer.periodic(Duration(seconds: 10), (timer) {
      // heavy task
      for (var i = 0; i <= 10000; i++) {
        print(i);
      }
      sendPort.send(timer.tick);
    });
  }
}

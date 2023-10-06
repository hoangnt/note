import 'package:get/get.dart';
import 'package:my_note/modules/home/controller/entry_controller.dart';
import 'package:my_note/modules/home/controller/home_controller.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(() => EntryController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

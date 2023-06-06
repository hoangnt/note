import 'package:get/get.dart';
import 'package:my_note/modules/home/controller/entry_controller.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(() => EntryController());
  }
}

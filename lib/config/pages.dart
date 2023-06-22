import 'package:get/get.dart';
import 'package:my_note/config/routes.dart';
import 'package:my_note/modules/cart/binding/cart_binding.dart';
import 'package:my_note/modules/cart/screen/cart_screen.dart';
import 'package:my_note/modules/home/binding/entry_binding.dart';
import 'package:my_note/modules/home/screen/entry_screen.dart';
import 'package:my_note/modules/settings/binding/settings_binding.dart';

class Pages {
  static final Pages instance = Pages._();

  List<GetPage> getPages = [];

  Pages._() {
    getPages = [
      GetPage(
        name: Routes.entry,
        page: () => EntryScreen(),
        bindings: [
          EntryBinding(),
          SettingsBinding(),
        ],
      ),
      GetPage(
        name: Routes.cart,
        page: () => CartScreen(),
        binding: CartBinding(),
      ),
    ];
  }
}

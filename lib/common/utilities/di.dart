import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note/common/constant/hive_box_key.dart';
import 'package:my_note/modules/cart/model/user_model.dart';

class DependenciesInjection {
  static final DependenciesInjection _instance = DependenciesInjection._();
  DependenciesInjection._();
  factory DependenciesInjection() => _instance;

  Future<void> boxInjection() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(HiveAdapterId.userModelId)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    if (!Hive.isBoxOpen(HiveBoxKey.userModelKey)) {
      await Hive.openBox<UserModel>(HiveBoxKey.userModelKey);
    }
  }
}

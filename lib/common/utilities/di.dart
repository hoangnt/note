import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note/common/constant/hive_box_key.dart';
import 'package:my_note/modules/cart/model/user_model.dart';

final getIt = GetIt.instance;

Future<void> boxInit() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(HiveAdapterId.userModelId)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isBoxOpen(HiveBoxKey.userModelKey)) {
    await Hive.openBox<UserModel>(HiveBoxKey.userModelKey);
  }
}

// void apiControllerInjection() {
//   final BaseOptions apiOption = BaseOptions(
//     baseUrl: BaseUrl.getServerUrl(),
//     connectTimeout: Duration(seconds: 10),
//   );
//   getIt.registerSingleton<Dio>(Dio(apiOption));
//   getIt.get<Dio>().interceptors.addAll([
//     TokenInterceptor(),
//     Interceptor1(),
//     Interceptor2(),
//     QueueInterceptor1(),
//     QueueInterceptor2(),
//   ]);
//   getIt.registerSingleton<ApiController>(ApiController(getIt()));
// }

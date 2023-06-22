import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_note/common/constant/app_color.dart';

class ConfigLoading {
  static void configLoading() {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColor.scaffoldBackground
      ..indicatorColor = AppColor.primary
      ..textColor = AppColor.primary
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}

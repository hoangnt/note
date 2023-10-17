import 'package:get/get.dart';
import 'package:my_note/common/constant/lang_en.dart';
import 'package:my_note/common/constant/lang_vi.dart';

class I10n extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': LangEn.lang,
        'vi_VN': LangVi.lang,
      };
}

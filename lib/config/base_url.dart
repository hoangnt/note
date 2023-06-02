import 'package:my_note/config/flavor.dart';

class BaseUrl {
  static const String _prdUrl = 'https://prod.com.vn';
  static const String _stgUrl = 'https://stg.com.vn';
  static const String _devUrl = 'https://dev.com.vn';

  static String getServerUrl() {
    switch (Flavor.env) {
      case Environment.prod:
        return _prdUrl;
      case Environment.stg:
        return _stgUrl;
      case Environment.dev:
        return _devUrl;
      default:
        return '';
    }
  }
}

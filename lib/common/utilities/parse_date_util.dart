import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class ParseDateUtil implements JsonConverter<DateTime?, String?> {
  const ParseDateUtil();

  @override
  DateTime? fromJson(String? val) {
    if (val == null) {
      return null;
    }

    return DateFormat("dd/MM/yyyy").parse(val);
  }

  @override
  String? toJson(DateTime? val) {
    if (val == null) {
      return null;
    }

    return DateFormat("dd/MM/yyyy").format(val);
  }
}

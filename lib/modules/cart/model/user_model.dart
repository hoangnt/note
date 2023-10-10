import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:my_note/common/constant/hive_box_key.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveAdapterId.userModelId)
class UserModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? age;
  @HiveField(3)
  DateTime? birth;

  UserModel({this.age, this.birth, this.id, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.age = json["age"];
    this.birth = json["birth"] != null
        ? DateFormat("dd/MM/yyyy").parse(json["birth"] as String)
        : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json["id"] = this.id;
    json["name"] = this.name;
    json["age"] = this.age;
    json["birth"] = this.birth != null
        ? DateFormat("dd/MM/yyyy").parse(this.birth.toString())
        : null;

    return json;
  }
}

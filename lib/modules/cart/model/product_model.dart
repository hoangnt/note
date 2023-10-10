import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_note/common/utilities/parse_date_util.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends HiveObject {
  String? id;
  String? name;
  double? price;

  @ParseDateUtil()
  DateTime? date;

  ProductModel({this.date, this.id, this.name, this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

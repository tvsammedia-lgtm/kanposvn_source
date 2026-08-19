import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  String? name;
  String? brand;
  String? category;

  String? imei;
  String? serial;
  String? color;
  String? capacity;
  
  String? condition;
  String? sku;
  int? stock;
  
  double? costPrice;
  double? sellingPrice;
  double? importPrice;
  double? consignmentPrice;
  
  DateTime? createdAt;
  DateTime? updatedAt;
}

import 'package:isar/isar.dart';

part 'gym_product.g.dart';

@collection
class GymProduct {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String productId = '';
  
  String name = ''; // Tên sản phẩm (Whey, Nước Suối...)
  String barcode = '';
  
  double price = 0;
  double importPrice = 0;
  
  int stock = 0;
  
  String category = 'drink'; // drink, supplement, clothing, accessory
  
  DateTime createdAt = DateTime.now();
  String status = 'active';
}

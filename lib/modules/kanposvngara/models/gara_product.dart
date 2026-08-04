import 'package:isar/isar.dart';

part 'gara_product.g.dart';

enum GaraProductType {
  PART('Phụ tùng'),
  SERVICE('Dịch vụ / Tiền công');

  final String label;
  const GaraProductType(this.label);
}

@collection
class GaraProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = '';

  String sku = '';
  String name = '';
  
  @enumerated
  GaraProductType type = GaraProductType.PART;

  double retailPrice = 0.0; // Giá bán
  double purchasePrice = 0.0; // Giá nhập
  String unit = ''; // Cái, Chai, Giờ...
  
  double currentStock = 0.0; // Tồn kho hiện tại (Nếu là phụ tùng)
}

import 'package:isar/isar.dart';

part 'vlxd_product.g.dart';

@collection
class VlxdProductCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String categoryId = ''; // For sync

  String name = ''; // Sắt thép, Xi măng, Cát, Đá, Gạch...
  String description = '';
}

@collection
class VlxdProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = ''; // For sync

  String productCode = ''; // Mã hàng (e.g., THEPD10)
  String barcode = '';
  String productName = ''; // Thép D10 Hòa Phát
  
  final category = IsarLink<VlxdProductCategory>();

  String unit = ''; // Kg, Bao, Viên, Khối, Cây...
  String specification = ''; // Quy cách (e.g., Cuộn, 11m)
  
  double purchasePrice = 0; // Giá nhập
  double retailPrice = 0; // Giá bán lẻ
  double wholesalePrice = 0; // Giá bán sỉ
  double dealerPrice = 0; // Giá đại lý
  
  double vatRate = 0; // % VAT
  String imageUrl = '';

  // Thuộc tính mở rộng cho VLXD
  double weightPerUnit = 0; // Trọng lượng
  String dimensions = ''; // Kích thước

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

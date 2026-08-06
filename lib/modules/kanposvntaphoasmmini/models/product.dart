import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class TapHoaCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String categoryId = ''; // For sync

  String name = ''; // Đồ uống, Bánh kẹo, Gia vị...
  String description = '';
}

@collection
class TapHoaProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = ''; // For sync

  String productCode = ''; // Mã hàng, Barcode, SKU
  String barcode = '';
  String qrCode = '';
  String sku = '';
  String productName = '';
  
  final category = IsarLink<TapHoaCategory>();

  String unit = ''; // Cái, Gói, Thùng, Lon...
  
  double purchasePrice = 0; // Giá nhập
  double retailPrice = 0; // Giá bán
  double wholesalePrice = 0; // Giá bán sỉ
  double promotionPrice = 0; // Giá khuyến mãi
  
  double vatRate = 0; // % VAT
  String imageUrl = '';

  DateTime? expiryDate; // Hạn sử dụng
  String manufacturer = ''; // Nhà sản xuất
  String note = ''; // Ghi chú

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

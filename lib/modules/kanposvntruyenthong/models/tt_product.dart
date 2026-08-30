import 'package:isar/isar.dart';

part 'tt_product.g.dart';

@collection
class TtCategory {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String categoryId = ''; // For sync

  String name = ''; // Rau lá, Củ, Quả, Gia vị, Đậu, Nấm...
  String description = '';
}

@collection
class TtUnit {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String unitId = ''; // For sync

  String name = ''; // kg, gram, bó, túi, quả, củ, thùng, bao, rổ, khay, cái

  /// Số đơn vị gốc trong 1 đơn vị này (quy đổi). VD: 1 bao = 25 kg.
  double conversionRate = 1;

  /// Đơn vị được coi là gốc (kg, gram) để tính tồn kho.
  String baseUnit = 'kg';
}

/// Sản phẩm rau củ quả — đặc thù hàng nông sản (hạn sử dụng, hao hụt, đơn vị quy đổi).
@collection
class TtProduct {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String productId = ''; // For sync

  String sku = '';
  String barcode = '';
  String name = ''; // Cà chua, Rau má, Dưa leo...
  final category = IsarLink<TtCategory>();

  String baseUnit = 'kg'; // Đơn vị tồn kho chuẩn
  String purchaseUnit = 'kg'; // Đơn vị nhập
  String saleUnit = 'kg'; // Đơn vị bán
  double conversionRate = 1; // VD: 1 bao = 25 kg

  double defaultPurchasePrice = 0; // Giá nhập mặc định
  double defaultSalePrice = 0; // Giá bán mặc định

  double minStock = 0; // Tồn tối thiểu (theo baseUnit)
  double maxStock = 0; // Tồn tối đa
  double reorderLevel = 0; // Mức đặt lại hàng

  int shelfLifeDays = 0; // Thời gian bảo quản (0 = không rõ)
  bool isPerishable = true; // Hàng dễ hư hỏng
  bool isActive = true;

  DateTime createdAt = DateTime.now();
}
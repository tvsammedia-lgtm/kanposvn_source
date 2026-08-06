import 'package:isar/isar.dart';

part 'inventory.g.dart';

@collection
class TapHoaInventoryItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String inventoryItemId = ''; // For sync

  String productId = '';
  String productName = '';
  
  double currentStock = 0;
  double minStock = 5;
  double maxStock = 100;
  
  String unit = '';
  double costPrice = 0; // Giá vốn trung bình
}

@collection
class TapHoaInventoryTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String transactionId = '';

  String inventoryItemId = '';
  String productName = '';

  String type = 'IMPORT'; // IMPORT, EXPORT, ADJUSTMENT
  double quantityChange = 0; // Dương hoặc Âm
  
  double oldStock = 0;
  double newStock = 0;

  DateTime timestamp = DateTime.now();
  String note = '';
  String referenceId = ''; // Phiếu nhập, phiếu xuất hoặc HD bán hàng
}

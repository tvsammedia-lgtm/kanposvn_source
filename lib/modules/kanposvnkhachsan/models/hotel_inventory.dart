import 'package:isar/isar.dart';

part 'hotel_inventory.g.dart';

enum InventoryTransactionType {
  IMPORT('Nhập kho'),
  EXPORT('Xuất kho'),
  ADJUSTMENT('Điều chỉnh');

  final String label;
  const InventoryTransactionType(this.label);
}

@collection
class HotelInventoryItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String itemId = ''; // UUID for sync

  String itemName = '';
  String sku = '';
  String unit = ''; // Lon, Chai, Cái...
  
  double costPrice = 0;
  int currentStock = 0;
  int minStock = 5;
}

@collection
class HotelInventoryTransaction {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String transactionId = '';

  final item = IsarLink<HotelInventoryItem>();

  @enumerated
  InventoryTransactionType type = InventoryTransactionType.IMPORT;

  int quantity = 0;
  double unitPrice = 0;
  String referenceInfo = ''; // Mã phiếu nhập/xuất
  String note = '';
  
  DateTime createdAt = DateTime.now();
}

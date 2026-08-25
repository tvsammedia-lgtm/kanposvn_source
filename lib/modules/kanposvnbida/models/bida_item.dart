import 'package:isar/isar.dart';

part 'bida_item.g.dart';

enum BidaItemCategory {
  DRINK('Nước uống'),
  FOOD('Đồ ăn'),
  TOBACCO('Thuốc lá'),
  OTHER('Khác'),
  BEER('Bia'),
  TOWEL('Khăn lạnh'),
  ICE('Đá');

  final String label;
  const BidaItemCategory(this.label);
}

@collection
class BidaItem {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String itemId = '';

  String name = '';

  @enumerated
  BidaItemCategory category = BidaItemCategory.DRINK;

  double price = 0.0;

  /// Giá vốn / giá nhập trung bình — dùng tính báo cáo lãi lỗ.
  double costPrice = 0.0;

  // Basic inventory
  int stock = 0;
}

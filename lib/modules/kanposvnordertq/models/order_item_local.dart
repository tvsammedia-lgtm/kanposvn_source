import 'package:isar/isar.dart';

part 'order_item_local.g.dart';

@collection
class OrderItemLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String orderItemId = ''; // UUID for sync

  @Index()
  String? orderId; // UUID of parent order

  String? productName;
  String? sku;
  double? quantity;
  double? unitPrice;
  String? currency;
  double? amount;
  
  double? weight;
  double? volume;
  
  String? trackingNumberCn;
  String? productUrl;
  String? note;
  
  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}

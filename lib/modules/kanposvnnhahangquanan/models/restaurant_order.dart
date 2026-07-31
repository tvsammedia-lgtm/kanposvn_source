import 'package:isar/isar.dart';
import 'restaurant_table.dart';

part 'restaurant_order.g.dart';

enum RestaurantOrderStatus {
  SERVING('Đang phục vụ'),
  COMPLETED('Đã thanh toán');

  final String label;
  const RestaurantOrderStatus(this.label);
}

enum RestaurantOrderItemStatus {
  PENDING('Chờ nấu'),
  COOKING('Đang nấu'),
  DONE('Hoàn thành');

  final String label;
  const RestaurantOrderItemStatus(this.label);
}

@embedded
class RestaurantOrderDetail {
  String detailId = ''; // To uniquely identify the item in KDS
  String itemId = '';
  String itemName = '';
  double price = 0.0;
  int quantity = 0;
  String note = ''; // e.g., Ít cay, Không hành

  @enumerated
  RestaurantOrderItemStatus status = RestaurantOrderItemStatus.PENDING;
}

@collection
class RestaurantOrder {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String orderId = '';

  final table = IsarLink<RestaurantTable>();

  List<RestaurantOrderDetail> details = [];

  double totalAmount = 0.0;

  @enumerated
  RestaurantOrderStatus status = RestaurantOrderStatus.SERVING;

  DateTime? createdAt;
  DateTime? closedAt;
}

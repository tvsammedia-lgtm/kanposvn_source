import 'package:isar/isar.dart';

part 'restaurant_table.g.dart';

enum RestaurantTableStatus {
  EMPTY('Trống'),
  SERVING('Đang phục vụ'),
  WAITING_PAYMENT('Chờ thanh toán');

  final String label;
  const RestaurantTableStatus(this.label);
}

@collection
class RestaurantTable {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String tableId = '';

  String name = ''; // e.g., Bàn 01
  String zone = ''; // e.g., Tầng 1, Sân Vườn, VIP
  
  @enumerated
  RestaurantTableStatus status = RestaurantTableStatus.EMPTY;
}

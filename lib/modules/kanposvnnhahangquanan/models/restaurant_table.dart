import 'package:isar/isar.dart';

part 'restaurant_table.g.dart';

enum RestaurantTableStatus {
  EMPTY('Trống'),
  SERVING('Đang phục vụ'),
  WAITING_PAYMENT('Chờ thanh toán'),
  RESERVED('Đặt trước'),
  CLEANING('Dọn bàn');

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

  int capacity = 4; // Sức chứa (số khách)

  // Tránh hiển thị giá trị sức chứa rác (vd: 9223372036854775808 từ dữ liệu
  // cloud) trên sơ đồ bàn.
  bool get hasValidCapacity => capacity >= 1 && capacity <= 100;

  @enumerated
  RestaurantTableStatus status = RestaurantTableStatus.EMPTY;
}

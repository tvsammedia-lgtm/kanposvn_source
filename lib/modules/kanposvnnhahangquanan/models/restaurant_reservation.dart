import 'package:isar/isar.dart';

part 'restaurant_reservation.g.dart';

enum RestaurantReservationStatus {
  BOOKED('Đã đặt'),
  SEATED('Đã vào bàn'),
  CANCELLED('Đã hủy'),
  NO_SHOW('Khách không đến');

  final String label;
  const RestaurantReservationStatus(this.label);
}

/// Đặt bàn trước: tên khách, điện thoại, thời gian, số người, ghi chú, đặt cọc.
@collection
class RestaurantReservation {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String reservationId = '';

  @Index()
  String tableId = '';
  String tableName = '';

  String customerName = '';
  String phone = '';

  @Index()
  DateTime time = DateTime.now();

  int guests = 2;
  double deposit = 0; // Tiền đặt cọc
  String note = '';

  @enumerated
  RestaurantReservationStatus status = RestaurantReservationStatus.BOOKED;
}

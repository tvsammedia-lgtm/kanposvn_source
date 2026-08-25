import 'package:isar/isar.dart';

part 'parking_customer.g.dart';

/// §3. Quản lý khách hàng bãi xe / thuê xe.
@collection
class ParkingCustomer {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';

  String cccd = '';

  @Index()
  String phone = '';

  String email = '';

  String address = '';

  /// Biển số xe thường dùng (lưu nhanh khi tra cứu).
  String licensePlate = '';

  String note = '';

  /// §14. Công nợ khách thuê xe: đã đặt cọc - còn thiếu được tính từ Rental,
  /// đây là nợ phát sinh khác (nếu có).
  double debtBalance = 0.0;

  DateTime createdAt = DateTime.now();
}

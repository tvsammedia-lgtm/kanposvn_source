import 'package:isar/isar.dart';

part 'restaurant_partner_models.g.dart';

/// Khách hàng: tích điểm, công nợ, voucher, sinh nhật.
@collection
class RestaurantCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String phone = '';
  DateTime? birthday;
  String email = '';

  int points = 0; // Điểm thưởng
  double debt = 0; // Công nợ phải thu từ khách

  bool hasVoucher = false;
  double voucherValue = 0;
}

/// Nhà cung cấp nguyên liệu: công nợ phải trả, lịch sử nhập hàng.
@collection
class RestaurantSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String phone = '';
  String address = '';
  String taxCode = ''; // MST

  double debt = 0; // Công nợ phải trả NCC
}

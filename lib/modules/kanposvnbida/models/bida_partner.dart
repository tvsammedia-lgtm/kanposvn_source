import 'package:isar/isar.dart';

part 'bida_partner.g.dart';

/// XVII. Khách hàng: mã, tên, điện thoại, điểm tích lũy, hội viên, công nợ.
@collection
class BidaCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';

  @Index()
  String phone = '';

  /// Điểm tích lũy (VD: 1 điểm / 10.000đ).
  int points = 0;

  bool isMember = false;

  /// XVIII. Công nợ còn lại khách phải trả.
  double debtBalance = 0.0;

  /// Tổng đã chi tiêu tính đến nay.
  double totalSpent = 0.0;

  DateTime createdAt = DateTime.now();
}

/// XVI. Nhà cung cấp: mã, tên, địa chỉ, điện thoại, email, công nợ.
@collection
class BidaSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';

  String address = '';

  String phone = '';

  String email = '';

  /// XIX. Tổng giá trị đã nhập hàng.
  double totalImported = 0.0;

  /// XIX. Tổng đã thanh toán cho NCC.
  double totalPaid = 0.0;

  /// XIX. Công nợ còn lại = totalImported - totalPaid.
  double get debtBalance => totalImported - totalPaid;

  DateTime createdAt = DateTime.now();
}

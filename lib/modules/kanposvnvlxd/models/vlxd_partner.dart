import 'package:isar/isar.dart';

part 'vlxd_partner.g.dart';

enum CustomerType {
  RETAIL('Khách lẻ'),
  AGENCY('Đại lý'),
  PROJECT('Công trình'),
  CONTRACTOR('Nhà thầu'),
  ENTERPRISE('Doanh nghiệp');

  final String label;
  const CustomerType(this.label);
}

@collection
class VlxdCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = '';

  String name = '';
  String taxCode = ''; // MST
  String phone = '';
  String email = '';
  String deliveryAddress = '';

  @enumerated
  CustomerType type = CustomerType.RETAIL;

  double currentDebt = 0; // Nợ hiện tại
  double debtLimit = 0; // Hạn mức nợ
  double discountRate = 0; // Chiết khấu %

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

@collection
class VlxdSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = '';

  String name = '';
  String taxCode = '';
  String phone = '';
  String email = '';
  String address = '';
  String contactPerson = '';

  double currentDebt = 0; // Công nợ NCC
  
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

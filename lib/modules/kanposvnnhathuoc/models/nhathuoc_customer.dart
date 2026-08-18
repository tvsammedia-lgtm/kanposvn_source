import 'package:isar/isar.dart';

part 'nhathuoc_customer.g.dart';

enum CustomerType {
  RETAIL('Khách lẻ'),
  VIP('Khách VIP'),
  BUSINESS('Khách doanh nghiệp');

  final String label;
  const CustomerType(this.label);
}

@collection
class NhathuocCustomer {
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
  String email = '';
  String address = '';
  String companyName = ''; // Tên DN (cho khách DN)

  @enumerated
  CustomerType customerType = CustomerType.RETAIL;

  double currentDebt = 0.0;
  int rewardPoints = 0;
  double totalSpent = 0.0;
  DateTime? lastPurchaseDate;
}

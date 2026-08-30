import 'package:isar/isar.dart';

part 'tt_partner.g.dart';

enum TtCustomerType {
  LO_LE('Khách lẻ'),
  QUEN('Khách quen'),
  QUAN_AN('Quán ăn'),
  NHA_HANG('Nhà hàng'),
  QUAN_NUOC('Quán nước'),
  CUA_HANG('Cửa hàng'),
  SI('Khách sỉ'),
  DAI_LY('Đại lý');

  final String label;
  const TtCustomerType(this.label);
}

@collection
class TtCustomer {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String customerId = ''; // For sync

  String code = '';
  String name = '';
  String phone = '';
  String address = '';

  @enumerated
  TtCustomerType customerType = TtCustomerType.LO_LE;

  double openingDebt = 0; // Nợ đầu kỳ
  double currentDebt = 0; // Nợ hiện tại
  double totalPurchase = 0; // Tổng mua
  double totalPayment = 0; // Tổng đã trả

  double loyaltyPoint = 0;
  String loyaltyRank = '';

  DateTime createdAt = DateTime.now();
}

@collection
class TtSupplier {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String supplierId = ''; // For sync

  String name = '';
  String phone = '';
  String address = '';
  String contactPerson = '';

  double openingDebt = 0; // Nợ đầu kỳ
  double currentDebt = 0; // Công nợ NCC

  DateTime createdAt = DateTime.now();
}
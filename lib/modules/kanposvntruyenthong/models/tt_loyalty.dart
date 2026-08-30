import 'package:isar/isar.dart';

import 'tt_partner.dart';

part 'tt_loyalty.g.dart';

@collection
class TtLoyaltyRule {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String ruleId = ''; // For sync

  String ruleName = ''; // VD: Quy đổi tiền mua -> điểm
  double amountPerPoint = 0; // 100.000 VNĐ = 1 điểm
  double pointPerAmount = 100000;
  double minimumInvoice = 0; // HĐ tối thiểu được tích điểm
  bool isActive = true;
}

enum TtLoyaltyType {
  EARN('Tích điểm'),
  REDEEM('Đổi quà'),
  ADJUST('Điều chỉnh'),
  EXPIRE('Hết hạn'),
  REFUND('Hoàn hàng');

  final String label;
  const TtLoyaltyType(this.label);
}

@collection
class TtLoyaltyTransaction {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String loyaltyTxId = ''; // For sync

  final customer = IsarLink<TtCustomer>();

  String invoiceId = ''; // SalesInvoice reference

  @enumerated
  TtLoyaltyType type = TtLoyaltyType.EARN;

  double points = 0;
  double balanceAfter = 0;
  String description = '';

  DateTime createdAt = DateTime.now();
}
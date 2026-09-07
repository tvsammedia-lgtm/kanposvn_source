import 'package:isar/isar.dart';

part 'payment_local.g.dart';

@collection
class PaymentLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String paymentId = ''; // UUID for sync

  @Index()
  String? customerId;

  @Index()
  String? orderId;

  double? amount;
  String? method; // CASH, BANK_TRANSFER, QR, EWALLET, OTHER
  String? reference;
  DateTime? paidAt;
  String? createdBy;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Index()
  DateTime? syncedAt;
  bool isDeleted = false;
}
import 'package:isar/isar.dart';

part 'billing.g.dart';

@collection
class Invoice {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? branchId;

  @Index()
  String? patientId;

  DateTime? invoiceDate;
  double? totalAmount;
  double? discount;
  double? tax;
  double? finalAmount;

  /// pending, paid, partial, cancelled
  String? status;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class InvoiceItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? invoiceId;

  String? serviceId;
  String? productId;

  double? quantity;
  double? unitPrice;
  double? discount;
  double? tax;
  double? amount;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class Payment {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? invoiceId;

  @Index()
  String? branchId;

  double? amount;
  
  /// cash, bank_transfer, card, e_wallet, other
  String? method;
  DateTime? paymentDate;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

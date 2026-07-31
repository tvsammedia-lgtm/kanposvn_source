import 'package:isar/isar.dart';

part 'transaction.g.dart';

@collection
class TransactionRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? remoteId;

  String? transactionCode;
  DateTime? transactionDate;

  String? sellerId;
  String? buyerId;
  String? propertyId;
  String? brokerId;

  double? askingPrice;
  double? finalPrice;
  double? commission;
  double? floorFee;
  String? notes;

  @Enumerated(EnumType.name)
  TransactionStatus status = TransactionStatus.negotiating;

  // Sync details
  DateTime? updatedAt;
  int? version;
  bool isSynced = false;
}

enum TransactionStatus {
  negotiating,
  deposited,
  notarized,
  completed,
  cancelled
}

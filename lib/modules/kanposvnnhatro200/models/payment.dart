import 'package:isar/isar.dart';
import 'hostel.dart';

part 'payment.g.dart';

@collection
class Payment {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? receiptNumber;
  String? tenantUuid;
  String? roomUuid;
  DateTime? paymentDate;
  String? content;

  double? rentAmount;
  double? electricAmount;
  double? waterAmount;
  double? internetAmount;
  double? garbageAmount;
  double? parkingAmount;
  double? otherServiceAmount;
  double? discount;
  double? promotion;
  double? totalAmount;
  double? paidAmount;
  double? debtAmount;

  String? collectedBy;
  int? month;
  int? year;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}

import 'package:isar/isar.dart';
import 'customer.dart';

part 'pawn_repair_order.g.dart';

@collection
class PawnRepairOrder {
  Id id = Isar.autoIncrement;

  String? orderCode;

  final customer = IsarLink<Customer>();

  String? deviceModel;
  String? imei;
  String? faultDescription;
  String? technicianName;

  double? estimatedCost;
  double? actualCost;

  @enumerated
  RepairStatus status = RepairStatus.received;

  DateTime? receivedDate;
  DateTime? completedDate;
  DateTime? deliveredDate;

  DateTime? createdAt;
  DateTime? updatedAt;
}

enum RepairStatus {
  received,
  inProgress,
  completed,
  delivered,
  cancelled,
}

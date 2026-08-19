import 'package:isar/isar.dart';
import 'hostel.dart';

part 'expense.g.dart';

@collection
class HostelExpense {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String? uuid;

  String? expenseNumber;
  String? category;
  String? description;
  double? amount;
  DateTime? expenseDate;
  String? roomUuid;
  String? paidBy;

  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;

  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}

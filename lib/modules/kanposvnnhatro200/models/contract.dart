import 'package:isar/isar.dart';
import 'hostel.dart';

part 'contract.g.dart';

@collection
class Contract {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? contractNumber;
  String? roomUuid;
  String? tenantUuid;
  
  DateTime? startDate;
  DateTime? endDate;
  
  double? rentPrice;
  double? depositAmount;
  int? paymentCycleMonths;

  // Sync details
  DateTime? updatedAt;
  DateTime? createdAt;
  bool deleted = false;
  
  @Enumerated(EnumType.name)
  SyncStatus syncStatus = SyncStatus.pending;
}

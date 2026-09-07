import 'package:isar/isar.dart';

part 'laboratory.g.dart';

@collection
class LabOrder {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? patientId;

  @Index()
  String? encounterId;

  @Index()
  String? doctorId;

  String? priority;
  
  /// ordered, collected, processing, completed, verified, cancelled
  @Index()
  String? status;

  DateTime? orderedAt;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class LabResult {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? labOrderId;

  String? testId;
  String? parameter;
  String? result;
  String? unit;
  String? referenceRange;
  String? abnormalFlag;

  String? technicianId;
  String? verifiedBy;
  DateTime? verifiedAt;
  String? note;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

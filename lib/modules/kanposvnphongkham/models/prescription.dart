import 'package:isar/isar.dart';

part 'prescription.g.dart';

@collection
class Prescription {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? patientId;

  @Index()
  String? encounterId;

  @Index()
  String? doctorId;

  /// draft, doctor_review, confirmed, dispensed, cancelled
  @Index()
  String? status;

  String? diagnosis;
  String? notes;

  DateTime? confirmedAt;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class PrescriptionItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? prescriptionId;

  String? drugId;
  String? batchId;
  
  String? dosage;
  String? frequency;
  String? route;
  double? quantity;
  String? duration;
  String? unit;
  String? instruction;
  String? warning;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

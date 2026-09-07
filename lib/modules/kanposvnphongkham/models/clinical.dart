import 'package:isar/isar.dart';

part 'clinical.g.dart';

@collection
class MedicalRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? patientId;

  @Index()
  String? clinicId;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

@collection
class Encounter {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? patientId;

  @Index()
  String? medicalRecordId;

  @Index()
  String? doctorId;

  String? reasonForVisit;
  String? symptoms;
  String? medicalHistory;

  // Vitals summary
  double? bloodPressureSystolic;
  double? bloodPressureDiastolic;
  double? pulse;
  double? temperature;
  double? spO2;
  double? respiratoryRate;
  double? height;
  double? weight;
  double? bmi;

  String? physicalExamination;
  String? preliminaryDiagnosis;
  String? finalDiagnosis;
  List<String>? icd10Codes;

  String? notes;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

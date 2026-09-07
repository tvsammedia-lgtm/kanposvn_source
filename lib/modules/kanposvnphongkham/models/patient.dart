import 'package:isar/isar.dart';

part 'patient.g.dart';

@collection
class Patient {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? uuid;

  @Index()
  String? clinicId;

  @Index()
  String? tenantId;

  @Index()
  String? patientCode;

  String? fullName;
  DateTime? dateOfBirth;
  String? gender;
  
  @Index()
  String? phone;
  String? address;
  String? emergencyContact;

  // Medical info
  List<String>? allergies;
  List<String>? chronicDiseases;
  List<String>? medicalHistory;
  List<String>? surgicalHistory;
  List<String>? familyHistory;
  List<String>? currentMedications;
  String? note;

  // Sync fields
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? version;
  String? syncStatus;
  String? deviceId;
}

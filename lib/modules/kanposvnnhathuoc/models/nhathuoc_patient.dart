import 'package:isar/isar.dart';

part 'nhathuoc_patient.g.dart';

enum PatientGender {
  MALE('Nam'),
  FEMALE('Nữ'),
  OTHER('Khác');

  final String label;
  const PatientGender(this.label);
}

@collection
class NhathuocPatient {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String patientId = '';

  String name = '';
  String phone = '';
  String address = '';
  String email = '';
  
  @enumerated
  PatientGender gender = PatientGender.MALE;
  DateTime? dateOfBirth;
  String citizenId = ''; // CCCD
  String occupation = ''; // Nghề nghiệp
  
  String medicalHistory = ''; // Tiền sử bệnh
  String underlyingDisease = ''; // Bệnh nền
  String allergies = ''; // Dị ứng thuốc
  String insurance = ''; // Bảo hiểm
  
  double currentDebt = 0.0;
  int rewardPoints = 0; // Điểm tích lũy
  String note = '';
}

import 'package:isar/isar.dart';

part 'nhathuoc_patient.g.dart';

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
  
  String medicalHistory = ''; // Tiền sử bệnh
  String allergies = ''; // Dị ứng thuốc
  
  double currentDebt = 0.0;
  int rewardPoints = 0; // Điểm tích lũy
}

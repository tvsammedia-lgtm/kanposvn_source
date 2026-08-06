import 'package:isar/isar.dart';

part 'member.g.dart';

@collection
class GymMember {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  
  @Index(unique: true, replace: true)
  String memberId = '';
  
  String branchId = ''; // Chi nhánh

  String fullName = '';
  String qrCode = ''; // Dùng để check-in
  String avatarUrl = '';
  String gender = 'male'; // male, female, other
  DateTime? dateOfBirth;
  
  String identityCard = ''; // CMND/CCCD
  String phone = '';
  String email = '';
  String address = '';
  
  String emergencyContact = '';
  String occupation = '';
  
  double heightCm = 0;
  double weightKg = 0;
  String target = ''; // Mục tiêu luyện tập (Giảm cân, Tăng cơ...)
  
  DateTime createdAt = DateTime.now();
  String status = 'active'; // active, inactive
}

@collection
class GymHealthProfile {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  
  @Index(unique: true, replace: true)
  String profileId = '';
  
  String memberId = ''; // Liên kết tới GymMember.memberId
  
  String bloodPressure = ''; // Huyết áp
  bool hasDiabetes = false; // Tiểu đường
  String allergies = ''; // Dị ứng
  String injuries = ''; // Chấn thương
  String medicalHistory = ''; // Tiền sử bệnh
  String ptNotes = ''; // Ghi chú PT
  
  // Body stats at current time
  double currentWeight = 0;
  double bodyFatPercentage = 0;
  double muscleMass = 0;
  String inbodyUrl = ''; // Hình ảnh kết quả InBody
  
  DateTime recordedAt = DateTime.now();
}

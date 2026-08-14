import 'package:isar/isar.dart';

part 'teacher.g.dart';

@collection
class NgoaiNguTeacher {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? teacherCode;
  String? fullName;
  String? avatar;
  String? phone;
  String? email;
  
  String? specialization; // Chuyên môn
  String? teachingLanguage; // Ngôn ngữ giảng dạy
  String? degreeLevel; // Trình độ
  String? certificates; // Chứng chỉ
  int? experienceYears; // Kinh nghiệm
  
  double? hourlyRate; // Mức phí
  
  @enumerated
  TeacherStatus status = TeacherStatus.active;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum TeacherStatus {
  active,
  inactive,
  onLeave
}

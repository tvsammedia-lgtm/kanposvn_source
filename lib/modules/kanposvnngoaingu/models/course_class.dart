import 'package:isar/isar.dart';

part 'course_class.g.dart';

@collection
class NgoaiNguCourse {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? courseCode;
  String? courseName;
  String? language; // English, Japanese, Vietnamese
  String? level; // A1, A2, N5, N4...
  
  double? defaultTuition; // Học phí mặc định
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

@collection
class NgoaiNguClass {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? classCode;
  String? className;
  
  String? courseUuid; // Liên kết tới khóa học
  String? teacherUuid; // Giáo viên phụ trách chính
  String? roomUuid; // Phòng học mặc định
  
  int? maxStudents;
  DateTime? startDate;
  DateTime? endDate;
  double? tuition; // Học phí thực tế áp dụng cho lớp
  
  @enumerated
  ClassStatus status = ClassStatus.planning;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

@collection
class NgoaiNguRoom {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? roomCode;
  String? roomName;
  int? capacity;
  
  @enumerated
  RoomType type = RoomType.physical;
  
  String? meetingUrl; // Dành cho lớp online
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum ClassStatus {
  planning,
  active,
  completed,
  cancelled
}

enum RoomType {
  physical,
  online,
  oneToOne,
  aiRoom
}

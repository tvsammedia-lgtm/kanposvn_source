import 'package:isar/isar.dart';

part 'schedule.g.dart';

@collection
class NgoaiNguLesson {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? classUuid;
  String? teacherUuid;
  String? roomUuid;
  
  DateTime? startTime;
  DateTime? endTime;
  
  String? lessonTopic;
  String? homework;
  String? teacherNote;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

@collection
class NgoaiNguAttendance {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? lessonUuid;
  String? studentUuid;
  
  @enumerated
  AttendanceStatus status = AttendanceStatus.present;
  
  String? note;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum AttendanceStatus {
  present,
  absent,
  late,
  excused,
  makeup
}

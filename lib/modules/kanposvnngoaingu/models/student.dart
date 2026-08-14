import 'package:isar/isar.dart';

part 'student.g.dart';

@collection
class NgoaiNguStudent {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? studentCode;
  String? fullName;
  DateTime? dateOfBirth;
  String? phone;
  String? email;
  String? avatar;
  String? address;
  DateTime? enrollmentDate;
  
  @enumerated
  StudentStatus status = StudentStatus.active;

  // Hồ sơ học tập
  String? learningLanguage;
  String? currentLevel;
  double? entryScore;
  double? currentScore;
  String? targetGoal;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum StudentStatus {
  active,
  inactive,
  graduated,
  droppedOut
}

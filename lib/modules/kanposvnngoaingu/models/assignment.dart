import 'package:isar/isar.dart';

part 'assignment.g.dart';

@collection
class NgoaiNguAssignment {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? centerId;
  String? branchId;

  String? classUuid;
  String? teacherUuid;
  
  String? title;
  String? description;
  String? attachmentUrl;
  
  DateTime? dueDate;
  
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

@collection
class NgoaiNguAssignmentSubmission {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? assignmentUuid;
  String? studentUuid;
  
  String? studentAnswer; // Dạng text
  String? attachmentUrl; // File học viên nộp
  
  double? score;
  String? teacherFeedback;
  
  @enumerated
  SubmissionStatus status = SubmissionStatus.submitted;
  
  DateTime? submittedAt;
  DateTime? gradedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum SubmissionStatus {
  submitted,
  graded,
  returned,
  late
}

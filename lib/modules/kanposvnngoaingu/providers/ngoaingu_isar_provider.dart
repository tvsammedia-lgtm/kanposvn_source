import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';
import '../models/student.dart';
import '../models/teacher.dart';
import '../models/course_class.dart';
import '../models/schedule.dart';
import '../models/assignment.dart';
import '../models/ai_evaluation.dart';

final ngoaiNguIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('ngoaiNguIsarProvider must be overridden');
});

class NgoaiNguDatabaseSetup {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        NgoaiNguUserSchema,
        NgoaiNguStudentSchema,
        NgoaiNguTeacherSchema,
        NgoaiNguCourseSchema,
        NgoaiNguClassSchema,
        NgoaiNguRoomSchema,
        NgoaiNguLessonSchema,
        NgoaiNguAttendanceSchema,
        NgoaiNguAssignmentSchema,
        NgoaiNguAssignmentSubmissionSchema,
        NgoaiNguAIAssessmentSchema,
      ],
      directory: dir.path,
      name: 'kanposvnngoaingu_db',
    );
  }
}

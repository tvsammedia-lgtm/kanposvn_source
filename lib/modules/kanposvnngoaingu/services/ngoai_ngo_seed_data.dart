import 'package:isar/isar.dart';
import '../models/ai_evaluation.dart';
import '../models/assignment.dart';
import '../models/course_class.dart';
import '../models/ngoai_ngo_ops.dart';
import '../models/schedule.dart';
import '../models/student.dart';
import '../models/teacher.dart';
import '../models/user.dart';
import '../providers/ngoaingu_isar_provider.dart';

/// Helper truy cập DB cho seed/logic.
class NgoaiNguIsarDb {
  static Future<Isar> open() => NgoaiNguDatabaseSetup.init();

  /// Mini dictionary cho AI từ vựng offline (§16).
  static Map<String, Map<String, dynamic>> miniDictionary() => {
        'beautiful': {
          'meaning': 'xinh đẹp, đẹp',
          'pronunciation': '/ˈbjuːtɪfl/',
          'level': 'A2',
          'examples': ['She is beautiful.', 'A beautiful day.'],
          'related': ['pretty', 'lovely', 'gorgeous'],
          'translation': 'đẹp',
        },
        'expensive': {
          'meaning': 'đắt (tiền)',
          'pronunciation': '/ɪkˈspensɪv/',
          'level': 'A1',
          'examples': ['This car is expensive.'],
          'related': ['cheap', 'costly'],
          'translation': 'đắt',
        },
        '予約': {
          'meaning': 'đặt trước (phòng, vé)',
          'pronunciation': 'よやく (yoyaku)',
          'level': 'N5',
          'examples': ['ホテルを予約する。'],
          'related': ['予約する', '予約済み'],
          'translation': 'đặt chỗ',
        },
      };
}

/// Bộ dữ liệu mẫu Trung tâm Ngoại ngữ theo kanposvnngoaingu.md.
class NgoaiNguSeedData {
  static Future<void> seedIfEmpty(Isar db) async {
    if (await db.ngoaiNguStudents.count() > 0) return;
    final now = DateTime.now();

    await db.writeTxn(() async {
      // ── §3+§29. Users & phân quyền ────────────────────────────
      await db.ngoaiNguUsers.putAll([
        NgoaiNguUser()
          ..uuid = 'user_admin'
          ..username = 'admin'
          ..passwordHash = 'hash_admin_123'
          ..fullName = 'Quản Trị Trung Tâm'
          ..role = NgoaiNguUserRole.centerAdmin,
        NgoaiNguUser()
          ..uuid = 'user_manager'
          ..username = 'manager'
          ..passwordHash = 'hash_mgr'
          ..fullName = 'Trần Quản Lý'
          ..role = NgoaiNguUserRole.manager,
        NgoaiNguUser()
          ..uuid = 'user_staff'
          ..username = 'staff01'
          ..passwordHash = 'hash_staff'
          ..fullName = 'Lê Văn Phục Vụ'
          ..role = NgoaiNguUserRole.staff,
      ]);

      // ── §5. Học viên ──────────────────────────────────────────
      final students = <NgoaiNguStudent>[
        NgoaiNguStudent()
          ..uuid = 'st_minh'
          ..studentCode = 'STU-001'
          ..fullName = 'Nguyễn Hoàng Minh'
          ..dateOfBirth = DateTime(2008, 3, 12)
          ..phone = '0913000111'
          ..enrollmentDate = now.subtract(const Duration(days: 120))
          ..status = StudentStatus.active
          ..learningLanguage = 'english'
          ..currentLevel = 'B1'
          ..entryScore = 58
          ..currentScore = 72
          ..targetGoal = 'IELTS 6.5',
        NgoaiNguStudent()
          ..uuid = 'st_lan'
          ..studentCode = 'STU-002'
          ..fullName = 'Võ Thị Lan'
          ..dateOfBirth = DateTime(2010, 7, 22)
          ..phone = '0913000222'
          ..enrollmentDate = now.subtract(const Duration(days: 60))
          ..status = StudentStatus.active
          ..learningLanguage = 'japanese'
          ..currentLevel = 'N5'
          ..entryScore = 45
          ..currentScore = 61
          ..targetGoal = 'JLPT N4',
        NgoaiNguStudent()
          ..uuid = 'st_david'
          ..studentCode = 'STU-003'
          ..fullName = 'David Smith'
          ..dateOfBirth = DateTime(1995, 11, 2)
          ..phone = '0913000333'
          ..enrollmentDate = now.subtract(const Duration(days: 30))
          ..status = StudentStatus.active
          ..learningLanguage = 'vietnamese'
          ..currentLevel = 'Beginner'
          ..entryScore = 40
          ..currentScore = 55
          ..targetGoal = 'Hội thoại hàng ngày',
        NgoaiNguStudent()
          ..uuid = 'st_ha'
          ..studentCode = 'STU-004'
          ..fullName = 'Bùi Ngọc Hà'
          ..dateOfBirth = DateTime(2009, 1, 9)
          ..phone = '0913000444'
          ..enrollmentDate = now.subtract(const Duration(days: 200))
          ..status = StudentStatus.graduated
          ..learningLanguage = 'english'
          ..currentLevel = 'B2'
          ..entryScore = 62
          ..currentScore = 85
          ..targetGoal = 'IELTS 7.0',
        NgoaiNguStudent()
          ..uuid = 'st_tuan'
          ..studentCode = 'STU-005'
          ..fullName = 'Phạm Đức Tuấn'
          ..dateOfBirth = DateTime(2007, 9, 30)
          ..phone = '0913000555'
          ..enrollmentDate = now.subtract(const Duration(days: 150))
          ..status = StudentStatus.droppedOut
          ..learningLanguage = 'english'
          ..currentLevel = 'A2'
          ..entryScore = 35
          ..currentScore = 38
          ..targetGoal = 'TOEIC 500',
      ];
      await db.ngoaiNguStudents.putAll(students);

      // ── §6. Giáo viên ─────────────────────────────────────────
      final teachers = <NgoaiNguTeacher>[
        NgoaiNguTeacher()
          ..uuid = 'tc_hung'
          ..teacherCode = 'TCH-001'
          ..fullName = 'Nguyễn Quốc Hùng'
          ..phone = '0924000111'
          ..specialization = 'IELTS Writing'
          ..teachingLanguage = 'english'
          ..degreeLevel = 'MA TESOL'
          ..certificates = 'IELTS 8.5; CELTA'
          ..experienceYears = 8
          ..hourlyRate = 450000
          ..status = TeacherStatus.active,
        NgoaiNguTeacher()
          ..uuid = 'tc_sakura'
          ..teacherCode = 'TCH-002'
          ..fullName = 'Tanaka Sakura'
          ..phone = '0924000222'
          ..specialization = 'JLPT Ngữ pháp'
          ..teachingLanguage = 'japanese'
          ..degreeLevel = 'Cử nhân Nhật ngữ'
          ..certificates = 'JLPT N1'
          ..experienceYears = 5
          ..hourlyRate = 380000
          ..status = TeacherStatus.active,
        NgoaiNguTeacher()
          ..uuid = 'tc_long'
          ..teacherCode = 'TCH-003'
          ..fullName = 'Hoàng Việt Long'
          ..phone = '0924000333'
          ..specialization = 'Tiếng Việt cho người nước ngoài'
          ..teachingLanguage = 'vietnamese'
          ..degreeLevel = 'Cử nhân Sư phạm'
          ..certificates = 'Chứng chỉ dạy TV'
          ..experienceYears = 3
          ..hourlyRate = 250000
          ..status = TeacherStatus.onLeave,
      ];
      await db.ngoaiNguTeachers.putAll(teachers);

      // ── §9. Khóa học ──────────────────────────────────────────
      final courses = <NgoaiNguCourse>[
        NgoaiNguCourse()
          ..uuid = 'course_eng_b1'
          ..courseCode = 'ENG-B1'
          ..courseName = 'General English B1'
          ..language = 'english'
          ..level = 'B1'
          ..defaultTuition = 4800000,
        NgoaiNguCourse()
          ..uuid = 'course_jp_n4'
          ..courseCode = 'JP-N4'
          ..courseName = 'JLPT N4 Căn bản'
          ..language = 'japanese'
          ..level = 'N4'
          ..defaultTuition = 5200000,
        NgoaiNguCourse()
          ..uuid = 'course_vn_beg'
          ..courseCode = 'VN-BEG'
          ..courseName = 'Vietnamese for Beginners'
          ..language = 'vietnamese'
          ..level = 'Beginner'
          ..defaultTuition = 3600000,
      ];
      await db.ngoaiNguCourses.putAll(courses);

      // ── §7. Phòng học ─────────────────────────────────────────
      await db.ngoaiNguRooms.putAll([
        NgoaiNguRoom()
          ..uuid = 'room_p101'
          ..roomCode = 'P-101'
          ..roomName = 'Phòng 101'
          ..capacity = 15
          ..type = RoomType.physical,
        NgoaiNguRoom()
          ..uuid = 'room_1o1'
          ..roomCode = '1O1-A'
          ..roomName = 'Phòng 1:1 A'
          ..capacity = 2
          ..type = RoomType.oneToOne,
        NgoaiNguRoom()
          ..uuid = 'room_online'
          ..roomCode = 'ONL-Zoom01'
          ..roomName = 'Zoom Room 01'
          ..capacity = 30
          ..type = RoomType.online
          ..meetingUrl = 'https://zoom.us/j/kanposvn-demo',
      ]);

      // ── §8. Lớp học 1:N và 1:1 ────────────────────────────────
      final clsEng = NgoaiNguClass()
        ..uuid = 'class_eng_b1_a'
        ..classCode = 'ENG-B1-A'
        ..className = 'English B1 - Nhóm sáng T3/T5'
        ..courseUuid = 'course_eng_b1'
        ..teacherUuid = 'tc_hung'
        ..roomUuid = 'room_p101'
        ..maxStudents = 12
        ..startDate = now.subtract(const Duration(days: 90))
        ..endDate = now.add(const Duration(days: 60))
        ..tuition = 4800000
        ..status = ClassStatus.active;
      final clsJp = NgoaiNguClass()
        ..uuid = 'class_jp_n4'
        ..classCode = 'JP-N4-EVE'
        ..className = 'JLPT N4 - Tối T2/T4'
        ..courseUuid = 'course_jp_n4'
        ..teacherUuid = 'tc_sakura'
        ..roomUuid = 'room_online'
        ..maxStudents = 20
        ..startDate = now.subtract(const Duration(days: 45))
        ..endDate = now.add(const Duration(days: 75))
        ..tuition = 5200000
        ..status = ClassStatus.active;
      final clsVn = NgoaiNguClass()
        ..uuid = 'class_vn_1o1'
        ..classCode = 'VN-BEG-1O1'
        ..className = 'Vietnamese 1:1 - David'
        ..courseUuid = 'course_vn_beg'
        ..teacherUuid = 'tc_long'
        ..roomUuid = 'room_1o1'
        ..maxStudents = 1
        ..startDate = now.subtract(const Duration(days: 20))
        ..endDate = now.add(const Duration(days: 70))
        ..tuition = 6000000
        ..status = ClassStatus.active;
      await db.ngoaiNguClass.putAll([clsEng, clsJp, clsVn]);

      // Ghi danh học viên vào lớp.
      await db.ngoaiNguClassStudents.putAll([
        NgoaiNguClassStudent()
          ..uuid = 'cs_eng_minh'
          ..classUuid = 'class_eng_b1_a'
          ..studentUuid = 'st_minh'
          ..enrolledAt = now.subtract(const Duration(days: 88)),
        NgoaiNguClassStudent()
          ..uuid = 'cs_eng_ha'
          ..classUuid = 'class_eng_b1_a'
          ..studentUuid = 'st_ha'
          ..enrolledAt = now.subtract(const Duration(days: 190)),
        NgoaiNguClassStudent()
          ..uuid = 'cs_jp_lan'
          ..classUuid = 'class_jp_n4'
          ..studentUuid = 'st_lan'
          ..enrolledAt = now.subtract(const Duration(days: 44)),
        NgoaiNguClassStudent()
          ..uuid = 'cs_vn_david'
          ..classUuid = 'class_vn_1o1'
          ..studentUuid = 'st_david'
          ..enrolledAt = now.subtract(const Duration(days: 18)),
      ]);

      // ── §13. Buổi học + điểm danh tuần qua ────────────────────
      for (int d = 14; d >= 1; d -= 2) {
        final start =
            DateTime(now.year, now.month, now.day - d, 8, 0);
        await db.ngoaiNguLessons.put(NgoaiNguLesson()
          ..uuid = 'lesson_eng_$d'
          ..classUuid = 'class_eng_b1_a'
          ..teacherUuid = 'tc_hung'
          ..roomUuid = 'room_p101'
          ..startTime = start
          ..endTime = start.add(const Duration(minutes: 90))
          ..lessonTopic = 'Unit ${15 - d ~/ 2}: Reading & Discussion');
        await db.ngoaiNguAttendances.put(NgoaiNguAttendance()
          ..uuid = 'att_eng_${d}_minh'
          ..lessonUuid = 'lesson_eng_$d'
          ..studentUuid = 'st_minh'
          ..status = d % 4 == 0 ? AttendanceStatus.late : AttendanceStatus.present);
      }

      // ── §11. Ngân hàng câu hỏi English placement ──────────────
      final q = <NgoaiNguQuestion>[
        // Vocabulary x3
        _q('eng_v1', NNLanguage.english, 'A1', NNSkill.vocabulary, 'Choose the word meaning "đẹp":', 'ugly||beautiful||fast||slow', 'beautiful'),
        _q('eng_v2', NNLanguage.english, 'A2', NNSkill.vocabulary, '"Expensive" means:', 'rẻ||đắt||dài||nhỏ', 'đắt'),
        _q('eng_v3', NNLanguage.english, 'B1', NNSkill.vocabulary, 'Synonym of "begin":', 'finish||start||middle||end', 'start'),
        // Grammar x3
        _q('eng_g1', NNLanguage.english, 'A1', NNSkill.grammar, 'I ___ to school every day.', 'go||goes||going||gone', 'go'),
        _q('eng_g2', NNLanguage.english, 'A2', NNSkill.grammar, 'She ___ TV last night.', 'watch||watches||watched||watching', 'watched'),
        _q('eng_g3', NNLanguage.english, 'B1', NNSkill.grammar, 'If I ___ rich, I would travel.', 'am||was||were||be', 'were'),
        // Reading x3
        _q('eng_r1', NNLanguage.english, 'A2', NNSkill.reading, '"Tom opens a shop on Monday." When does he open it?', 'Monday||Tuesday||Sunday||Friday', 'Monday'),
        _q('eng_r2', NNLanguage.english, 'B1', NNSkill.reading, '"Although it rained, we went out." Did they go out?', 'No||Yes||Maybe||Never', 'Yes'),
        _q('eng_r3', NNLanguage.english, 'B2', NNSkill.reading, '"The project was postponed due to funding issues." Why postponed?', 'funding||weather||success||holidays', 'funding'),
        // Listening x3 (text mô phỏng audio)
        _q('eng_l1', NNLanguage.english, 'A1', NNSkill.listening, '[Audio: "My name is Anna"] What is her name?', 'Anna||Anna\'s||Ann||Anny', 'Anna'),
        _q('eng_l2', NNLanguage.english, 'A2', NNSkill.listening, '[Audio: "The meeting starts at nine"] Time?', '9:00||10:00||8:00||7:00', '9:00'),
        _q('eng_l3', NNLanguage.english, 'B1', NNSkill.listening, '[Audio: "I would like a return ticket"] Ticket type?', 'return||one-way||first-class||child', 'return'),
        // Speaking x2 (chấm tự khai)
        _q('eng_s1', NNLanguage.english, 'A2', NNSkill.speaking, 'Introduce yourself in 30 seconds.', '', ''),
        _q('eng_s2', NNLanguage.english, 'B1', NNSkill.speaking, 'Describe your hometown.', '', ''),
        // Writing x2
        _q('eng_w1', NNLanguage.english, 'A2', NNSkill.writing, 'Write 3 sentences about your family.', '', ''),
        _q('eng_w2', NNLanguage.english, 'B1', NNSkill.writing, 'Write an email to reschedule a meeting.', '', ''),
      ];
      await db.ngoaiNguQuestions.putAll(q);

      // ── §15. Bài tập + nộp bài + chấm ─────────────────────────
      await db.ngoaiNguAssignments.put(NgoaiNguAssignment()
        ..uuid = 'asg_ielts_w1'
        ..classUuid = 'class_eng_b1_a'
        ..teacherUuid = 'tc_hung'
        ..title = 'Writing Task 2: Opinion essay'
        ..description = 'Viết 250 từ về chủ đề môi trường.'
        ..dueDate = now.add(const Duration(days: 3)));
      await db.ngoaiNguAssignmentSubmissions.put(NgoaiNguAssignmentSubmission()
        ..uuid = 'sub_minh_w1'
        ..assignmentUuid = 'asg_ielts_w1'
        ..studentUuid = 'st_minh'
        ..studentAnswer = 'Environmental protection is important because...'
        ..score = 78
        ..teacherFeedback = 'Good structure, watch grammar.'
        ..status = SubmissionStatus.graded
        ..submittedAt = now.subtract(const Duration(days: 1)));

      // ── §16. AI assessment mẫu ────────────────────────────────
      await db.ngoaiNguAIAssessments.put(NgoaiNguAIAssessment()
        ..uuid = 'ai_spk_minh_1'
        ..studentUuid = 'st_minh'
        ..type = AIEvaluationType.speaking
        ..originalText = 'I go to school yesterday'
        ..aiCorrectedText = 'I went to school yesterday'
        ..pronunciationScore = 72
        ..grammarScore = 60
        ..vocabularyScore = 70
        ..fluencyScore = 75
        ..overallScore = 69
        ..feedback = 'Chú ý thì quá khứ của động từ bất quy tắc.'
        ..assessedAt = now.subtract(const Duration(hours: 20)));

      // ── §18. Tiến bộ học tập ──────────────────────────────────
      for (int w = 4; w >= 1; w--) {
        await db.ngoaiNguProgressEntrys.put(NgoaiNguProgressEntry()
          ..entryId = 'prog_minh_w$w'
          ..studentUuid = 'st_minh'
          ..date = now.subtract(Duration(days: 7 * w))
          ..vocabScore = 60 + (4 - w) * 4
          ..grammarScore = 55 + (4 - w) * 6
          ..listeningScore = 65 + (4 - w) * 3
          ..speakingScore = 50 + (4 - w) * 5
          ..readingScore = 68 + (4 - w) * 3
          ..writingScore = 52 + (4 - w) * 6
          ..hoursStudied = 6);
      }

      // ── §20. Hóa đơn + voucher ────────────────────────────────
      await db.ngoaiNguVouchers.putAll([
        NgoaiNguVoucher()
          ..code = 'HOC10'
          ..type = 'percent'
          ..value = 10
          ..maxDiscount = 500000
          ..minOrder = 1000000
          ..validTo = now.add(const Duration(days: 60)),
        NgoaiNguVoucher()
          ..code = 'GIAM300'
          ..type = 'fixedAmount'
          ..value = 300000
          ..minOrder = 3000000
          ..validTo = now.add(const Duration(days: 30)),
      ]);

      final invPaid = NgoaiNguInvoice()
        ..invoiceCode = 'INV-2026-000001'
        ..studentUuid = 'st_minh'
        ..classUuid = 'class_eng_b1_a'
        ..courseUuid = 'course_eng_b1'
        ..amount = 4800000
        ..paidAmount = 4800000
        ..status = 'paid'
        ..paymentMethod = 'bank'
        ..dueDate = now.subtract(const Duration(days: 80));
      final invPartial = NgoaiNguInvoice()
        ..invoiceCode = 'INV-2026-000002'
        ..studentUuid = 'st_lan'
        ..classUuid = 'class_jp_n4'
        ..courseUuid = 'course_jp_n4'
        ..amount = 5200000
        ..paidAmount = 2600000
        ..discount = 260000 // GIAM300? dùng 5% minh họa
        ..status = 'partial'
        ..paymentMethod = 'momo'
        ..dueDate = now.add(const Duration(days: 5));
      final invUnpaid = NgoaiNguInvoice()
        ..invoiceCode = 'INV-2026-000003'
        ..studentUuid = 'st_david'
        ..classUuid = 'class_vn_1o1'
        ..courseUuid = 'course_vn_beg'
        ..amount = 6000000
        ..status = 'unpaid'
        ..dueDate = now.subtract(const Duration(days: 2)); // quá hạn
      await db.ngoaiNguInvoices.putAll([invPaid, invPartial, invUnpaid]);

      await db.ngoaiNguPaymentRecords.putAll([
        NgoaiNguPaymentRecord()
          ..paymentId = 'pay_inv1_full'
          ..invoiceCode = 'INV-2026-000001'
          ..amount = 4800000
          ..method = 'bank'
          ..paidAt = now.subtract(const Duration(days: 80)),
        NgoaiNguPaymentRecord()
          ..paymentId = 'pay_inv2_part'
          ..invoiceCode = 'INV-2026-000002'
          ..amount = 2600000
          ..method = 'momo'
          ..paidAt = now.subtract(const Duration(days: 20)),
      ]);
    });
  }
}

/// Helper tạo câu hỏi nhanh.
NgoaiNguQuestion _q(String id, NNLanguage lang, String level, NNSkill skill,
    String question, String options, String correct) {
  return NgoaiNguQuestion()
    ..questionId = id
    ..language = lang
    ..level = level
    ..skill = skill
    ..topic = skill.name
    ..type = options.isEmpty
        ? (skill == NNSkill.speaking ? NNQuestionType.speaking : NNQuestionType.writing)
        : NNQuestionType.singleChoice
    ..question = question
    ..options = options
    ..correctAnswer = correct
    ..difficulty = 2
    ..points = 1;
}

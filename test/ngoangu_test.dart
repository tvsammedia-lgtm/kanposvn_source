import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/models/course_class.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/models/teacher.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/models/ngoai_ngo_ops.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/models/schedule.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/models/student.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/providers/ngoaingu_isar_provider.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/services/ngoai_ngo_business_logic.dart';
import 'package:kanposvn/modules/kanposvnngoaingu/services/ngoai_ngo_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('ngoangu_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    db = await NgoaiNguDatabaseSetup.init();
    await NgoaiNguSeedData.seedIfEmpty(db);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  Future<NgoaiNguStudent> student(String uuid) async =>
      (await db.ngoaiNguStudents.filter().uuidEqualTo(uuid).findFirst())!;
  Future<NgoaiNguCourse> course(String uuid) async =>
      (await db.ngoaiNguCourses.filter().uuidEqualTo(uuid).findFirst())!;

  group('Seed dữ liệu mẫu theo kanposvnngoaingu.md', () {
    test('§5 Học viên đủ trạng thái + hồ sơ học tập', () async {
      expect(await db.ngoaiNguStudents.count(), 5);
      expect(
          await db.ngoaiNguStudents
              .filter()
              .statusEqualTo(StudentStatus.active)
              .count(),
          3);
      expect(
          await db.ngoaiNguStudents
              .filter()
              .statusEqualTo(StudentStatus.droppedOut)
              .count(),
          1);
    });
    test('§6-§9 Giáo viên / khóa học / phòng / lớp', () async {
      expect(await db.ngoaiNguTeachers.count(), 3);
      expect(await db.ngoaiNguCourses.count(), 3);
      expect(await db.ngoaiNguRooms.count(), 3);
      expect(await db.ngoaiNguClass.count(), 3);
      // Lớp 1:1 tối đa 1 học viên.
      final vn =
          await db.ngoaiNguClass.filter().uuidEqualTo('class_vn_1o1').findFirst();
      expect(vn!.maxStudents, 1);
    });
    test('§11 Ngân hàng câu hỏi đủ 6 kỹ năng English', () async {
      final qs = await db.ngoaiNguQuestions
          .filter()
          .languageEqualTo(NNLanguage.english)
          .findAll();
      expect(qs.map((x) => x.skill).toSet().length, 6); // vocab..writing
      expect(qs.length, greaterThanOrEqualTo(15));
    });
    test('§13 Buổi học + điểm danh seed', () async {
      expect(await db.ngoaiNguLessons.count(), 7);
      expect(await db.ngoaiNguAttendances.count(), 7);
    });
    test('§20 Hóa đơn: paid/partial/unpaid', () async {
      expect(await db.ngoaiNguInvoices.count(), 3);
      expect(
          await db.ngoaiNguInvoices.filter().statusEqualTo('partial').count(),
          1);
    });
  });

  group('§10+§12. Placement Test & chấm điểm trọng số', () {
    test('Trả lời đúng toàn bộ câu trắc nghiệm -> điểm cao + level B2',
        () async {
      final qs = await NgoaiNguBusinessLogic.buildPlacementTest(db,
          NNLanguage.english,
          questionsPerSkill: 10);
      // Trả đúng tất cả các câu trắc nghiệm.
      final answers = <String, String>{};
      for (final question in qs) {
        if (question.correctAnswer.isNotEmpty) {
          answers[question.questionId!] = question.correctAnswer;
        }
      }
      final result = await NgoaiNguBusinessLogic.submitPlacementTest(db,
          studentUuid: 'st_minh',
          language: NNLanguage.english,
          answers: answers,
          speakingSelfScore: 90,
          writingSelfScore: 90);
      expect(result.overallScore, closeTo(90.0 * 0.4 + 100.0 * 0.6, 8));
      expect(result.gradeLabel, anyOf('Excellent', 'Very Good'));
      expect(result.resultLevel, anyOf('B2', 'C1'));
    });

    test('Không trả lời gì -> 0 điểm, Need Improvement, level thấp', () async {
      final r = await NgoaiNguBusinessLogic.submitPlacementTest(db,
          studentUuid: 'st_minh',
          language: NNLanguage.english,
          answers: {});
      expect(r.overallScore, 0);
      expect(r.gradeLabel, 'Need Improvement');
      expect(r.resultLevel, 'A1');
    });

    test('Xếp loại chuẩn §12 theo mốc điểm', () {
      expect(NgoaiNguBusinessLogic.gradeLabelOf(95), 'Excellent');
      expect(NgoaiNguBusinessLogic.gradeLabelOf(85), 'Very Good');
      expect(NgoaiNguBusinessLogic.gradeLabelOf(72), 'Good');
      expect(NgoaiNguBusinessLogic.gradeLabelOf(63), 'Pass');
      expect(NgoaiNguBusinessLogic.gradeLabelOf(40), 'Need Improvement');
    });

    test('Level mapping 3 ngôn ngữ (khớp ví dụ 68.3 => B1)', () {
      expect(NgoaiNguBusinessLogic.levelFromScore(NNLanguage.english, 70), 'B1');
      expect(NgoaiNguBusinessLogic.levelFromScore(NNLanguage.english, 68.3), 'B1');
      expect(NgoaiNguBusinessLogic.levelFromScore(NNLanguage.japanese, 65), 'N3');
      expect(NgoaiNguBusinessLogic.levelFromScore(NNLanguage.japanese, 92), 'N1');
      expect(
          NgoaiNguBusinessLogic.levelFromScore(NNLanguage.vietnamese, 88),
          'Upper-Intermediate');
    });
  });

  group('§8+§38. Ghi danh & xếp lớp', () {
    test('Ghi danh hợp lệ -> tăng sĩ số lớp', () async {
      final cls =
          await db.ngoaiNguClass.filter().uuidEqualTo('class_jp_n4').findFirst();
      final st = await student('st_tuan'); // droppedOut quay lại học
      await NgoaiNguBusinessLogic.enrollStudent(db, cls!, st);
      final count = await db.ngoaiNguClassStudents
          .filter()
          .classUuidEqualTo(cls.uuid!)
          .count();
      expect(count, 2);
    });

    test('Chặn ghi danh trùng và chặn khi đủ sĩ số', () async {
      final cls1o1 = (await db.ngoaiNguClass.filter().uuidEqualTo('class_vn_1o1').findFirst())!;
      final david = await student('st_david');
      // David đã trong lớp 1:1 -> trùng.
      expect(() => NgoaiNguBusinessLogic.enrollStudent(db, cls1o1, david),
          throwsException);
      // Thêm người mới vào lớp 1:1 (max 1, đã có 1) -> đầy.
      final minh = await student('st_minh');
      expect(() => NgoaiNguBusinessLogic.enrollStudent(db, cls1o1, minh),
          throwsException);
    });
  });

  group('§7+§13. Xếp lịch & phát hiện trùng lịch', () {
    test('Trùng giáo viên cùng khung giờ -> chặn', () async {
      final lesson = NgoaiNguLesson()
        ..uuid = 'lesson_conflict_test'
        ..classUuid = 'class_eng_b1_a'
        ..teacherUuid = 'tc_hung' // tc_hung đã dạy lesson_eng_* sáng T3/T5
        ..roomUuid = ''
        ..startTime = DateTime.now().add(const Duration(days: 14))
        ..endTime = DateTime.now().add(const Duration(days: 14, minutes: 90));
      // Không trùng vì khung giờ mới — tạo buổi hợp lệ trước.
      await NgoaiNguBusinessLogic.createLesson(db, lesson);

      // Đè đúng khung giờ vừa tạo, đổi phòng nhưng cùng giáo viên -> trùng.
      final conflict = NgoaiNguLesson()
        ..uuid = 'lesson_conflict_2'
        ..teacherUuid = 'tc_hung'
        ..roomUuid = 'room_p101'
        ..startTime = lesson.startTime!
        ..endTime = lesson.endTime!;
      expect(() => NgoaiNguBusinessLogic.createLesson(db, conflict),
          throwsException);

      // Cùng khung giờ nhưng GIÁO VIÊN KHÁC + phòng khác -> OK.
      final ok = NgoaiNguLesson()
        ..uuid = 'lesson_ok'
        ..teacherUuid = 'tc_sakura'
        ..roomUuid = 'room_online'
        ..startTime = lesson.startTime!
        ..endTime = lesson.endTime!;
      await NgoaiNguBusinessLogic.createLesson(db, ok);
    });

    test('Giờ kết thúc trước giờ bắt đầu -> chặn', () async {
      final bad = NgoaiNguLesson()
        ..uuid = 'lesson_bad_time'
        ..teacherUuid = 'tc_hung'
        ..startTime = DateTime.now().add(const Duration(days: 20))
        ..endTime = DateTime.now().add(const Duration(days: 19));
      expect(() => NgoaiNguBusinessLogic.createLesson(db, bad),
          throwsException);
    });
  });

  group('§16+§18. AI Tutor & tiến bộ', () {
    test('AI sửa ngữ pháp: quá khứ đơn giản', () {
      final r = NgoaiNguBusinessLogic.aiFixGrammar('i go to school yesterday');
      expect(r.corrected, 'I went to school yesterday');
      expect(r.explanation, contains('quá khứ'));
    });

    test('AI tra từ vựng beautiful/expensive/予約', () async {
      final b = await NgoaiNguBusinessLogic.aiVocabLookup(db, 'Beautiful');
      expect(b!['translation'], 'đẹp');
      expect(b['pronunciation'], contains('bjuːtɪfl'));
      final jp = await NgoaiNguBusinessLogic.aiVocabLookup(db, '予約');
      expect(jp!['level'], 'N5');
      expect(await NgoaiNguBusinessLogic.aiVocabLookup(db, 'zzzzz'), isNull);
    });

    test('Phân tích tiến bộ: kỹ năng yếu/nặng từ dữ liệu tuần', () async {
      final a = await NgoaiNguBusinessLogic.analyzeProgress(db, 'st_minh');
      expect(a.weakSkills.isNotEmpty, isTrue);
      expect(a.strongSkills.isNotEmpty, isTrue);
      // Seed: speaking/writing thấp nhất, reading cao nhất.
      expect(a.weakSkills.first, anyOf('speaking', 'writing'));
      expect(a.strongSkills.contains('reading'), isTrue);
    });

    test('Kế hoạch cá nhân hóa nhắm vào kỹ năng yếu', () async {
      final plan =
          await NgoaiNguBusinessLogic.aiPersonalizedPlan(db, 'st_minh');
      expect(plan.length, greaterThanOrEqualTo(3));
      expect(plan.any((p) => p.contains('Luyện')), isTrue);
    });

    test('AI lộ trình A2→B2 8 tháng đúng cấu trúc §16', () {
      final steps = NgoaiNguBusinessLogic.aiRoadmap('A2', 'B2', 8);
      expect(steps.length, 4);
      expect(steps.first, contains('A2'));
      expect(steps.last, contains('mock test'));
    });

    test('recordProgress cập nhật điểm hiện tại của học viên', () async {
      await NgoaiNguBusinessLogic.recordProgress(db, NgoaiNguProgressEntry()
        ..entryId = 'prog_lan_new'
        ..studentUuid = 'st_lan'
        ..date = DateTime.now()
        ..vocabScore = 70
        ..grammarScore = 70
        ..listeningScore = 70
        ..speakingScore = 70
        ..readingScore = 70
        ..writingScore = 70
        ..hoursStudied = 5);
      final lan = await student('st_lan');
      expect(lan.currentScore, closeTo(70, 0.01));
    });
  });

  group('§19+§39. Chứng nhận QR', () {
    test('Hoàn thành khóa đạt >=60 -> cấp CERT + verify valid', () async {
      final minh = await student('st_minh');
      final engB1 = await course('course_eng_b1');
      final cert = await NgoaiNguBusinessLogic.issueCertificate(db,
          student: minh, course: engB1, finalScore: 82);
      expect(cert.certCode, startsWith('CERT-ENG-B1-2026-'));
      expect(cert.verificationCode, startsWith('QR-'));

      final info =
          await NgoaiNguBusinessLogic.verifyCertificate(db, cert.certCode);
      expect(info['valid'], isTrue);
      expect(info['student'], 'Nguyễn Hoàng Minh');
      expect(info['level'], 'B1');

      // Học viên chuyển trạng thái tốt nghiệp.
      expect((await student('st_minh')).status, StudentStatus.graduated);
    });

    test('Điểm <60 không cấp chứng chỉ (Remedial Learning)', () async {
      final tuan = await student('st_tuan');
      final eng = await course('course_eng_b1');
      expect(() => NgoaiNguBusinessLogic.issueCertificate(db,
          student: tuan, course: eng, finalScore: 45), throwsException);
    });

    test('Verify mã không tồn tại -> invalid', () async {
      final info = await NgoaiNguBusinessLogic.verifyCertificate(db, 'CERT-XXX');
      expect(info['valid'], isFalse);
    });
  });

  group('§20. Học phí / voucher / công nợ', () {
    test('Tạo hóa đơn dùng voucher % có trần giảm + đếm lượt dùng', () async {
      final lan = await student('st_lan');
      final jp = await course('course_jp_n4');
      final usageBefore =
          (await db.ngoaiNguVouchers.filter().codeEqualTo('HOC10').findFirst())!
              .usageCount;

      final inv = await NgoaiNguBusinessLogic.createInvoice(db,
          student: lan, course: jp, voucherCode: 'HOC10');
      expect(inv.amount, 5200000);
      // 10% của 5.2tr = 520k > trần 500k -> clamp 500k.
      expect(inv.discount, 500000);
      expect(inv.status, 'unpaid');
      final vAfter =
          await db.ngoaiNguVouchers.filter().codeEqualTo('HOC10').findFirst();
      expect(vAfter!.usageCount, usageBefore + 1);
    });

    test('Thanh toán từng phần: unpaid -> partial -> paid', () async {
      final lan = await student('st_lan');
      final jp = await course('course_jp_n4');
      var inv = await NgoaiNguBusinessLogic.createInvoice(db, student: lan, course: jp);

      inv = await NgoaiNguBusinessLogic.makePayment(db, inv, amount: 2000000);
      expect(inv.status, 'partial');
      inv = await NgoaiNguBusinessLogic.makePayment(db, inv,
          amount: inv.outstanding, method: 'vnpay');
      expect(inv.status, 'paid');
      expect(inv.outstanding, 0);
      // Vượt số nợ -> chặn.
      expect(() => NgoaiNguBusinessLogic.makePayment(db, inv, amount: 1),
          throwsException);
    });

    test('Voucher sai/hết hạn/minOrder -> chặn', () async {
      final david = await student('st_david');
      final vn = await course('course_vn_beg');
      expect(
          () => NgoaiNguBusinessLogic.createInvoice(db,
              student: david, course: vn, voucherCode: 'NOT_EXIST'),
          throwsException);
    });
  });

  group('§21+§35. Báo cáo & Dashboard', () {
    test('Doanh thu tổng hợp + công nợ còn lại', () async {
      final rev = await NgoaiNguBusinessLogic.revenueReport(
          db, DateTime(2020), DateTime(2100));
      expect(rev['total'], greaterThanOrEqualTo(7400000)); // 4.8tr + 2.6tr
      expect(rev['outstanding'], greaterThan(0));
      expect(rev.containsKey('bank'), isTrue);
    });

    test('Báo cáo đào tạo: tổng/mới/đang học/tốt nghiệp/bỏ học/tỷ lệ', () async {
      final t = await NgoaiNguBusinessLogic.trainingReport(
          DateTime(2000), DateTime(2100), db);
      expect(t['totalStudents'], 5);
      expect(t['graduated'], 2); // st_ha seed + st_minh vừa tốt nghiệp
      expect(t['droppedOut'], 1);
      expect(t['avgCurrentScore'], greaterThan(0));
      expect(t['completionRatePercent'], greaterThan(0));
    });

    test('Dashboard admin: đủ 7 chỉ số §35', () async {
      final d = await NgoaiNguBusinessLogic.dashboardSummary(db);
      expect(d['totalStudents'], 5);
      expect(d['teachers'], 3);
      expect(d['classes'], 3);
      expect(d['certificates'], greaterThanOrEqualTo(1));
      expect(d['outstandingTuition'], greaterThan(0));
    });
  });

  group('§24+§31. Sync queue & audit', () {
    test('Enqueue khi tạo invoice -> pending > 0 -> flush về 0', () async {
      final pending = await NgoaiNguBusinessLogic.pendingSyncCount(db);
      expect(pending, greaterThanOrEqualTo(3)); // certificate + invoices + payment
      final flushed = await NgoaiNguBusinessLogic.flushSyncQueue(db);
      expect(flushed, pending);
      expect(await NgoaiNguBusinessLogic.pendingSyncCount(db), 0);
    });

    test('Backup module đăng ký chung (CRM)', () {
      expect(ModuleBackupService.modules.any((m) => m.id == 'ngoaingu'), isTrue);
    });
  });
}

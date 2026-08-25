import 'dart:convert';

import 'package:isar/isar.dart';
import '../models/course_class.dart';
import '../models/ngoai_ngo_ops.dart';
import '../models/schedule.dart';
import '../models/student.dart';
import '../models/teacher.dart';
import 'ngoai_ngo_seed_data.dart' show NgoaiNguIsarDb;

/// Kết quả placement test (§10+§12).
class NNPlacementResult {
  final double vocabScore;
  final double grammarScore;
  final double readingScore;
  final double listeningScore;
  final double speakingScore;
  final double writingScore;
  final double overallScore;
  final String gradeLabel; // Excellent..Need Improvement
  final String resultLevel; // A2 / N4 / Intermediate...

  NNPlacementResult({
    required this.vocabScore,
    required this.grammarScore,
    required this.readingScore,
    required this.listeningScore,
    required this.speakingScore,
    required this.writingScore,
    required this.overallScore,
    required this.gradeLabel,
    required this.resultLevel,
  });
}

/// Nghiệp vụ Trung tâm Ngoại ngữ theo kanposvnngoaingu.md.
class NgoaiNguBusinessLogic {
  // ══════════════ §11+§12. NGÂN HÀNG CÂU HỎI & CHẤM ĐIỂM ══════════════

  /// Lấy đề: mỗi kỹ năng [questionsPerSkill] câu ngẫu nhiên đúng ngôn ngữ.
  static Future<List<NgoaiNguQuestion>> buildPlacementTest(
      Isar db, NNLanguage language,
      {int questionsPerSkill = 3}) async {
    final out = <NgoaiNguQuestion>[];
    for (final skill in NNSkill.values) {
      final qs = await db.ngoaiNguQuestions
          .filter()
          .languageEqualTo(language)
          .skillEqualTo(skill)
          .findAll();
      qs.shuffle();
      out.addAll(qs.take(questionsPerSkill));
    }
    if (out.isEmpty) throw Exception('Ngân hàng câu hỏi trống cho $language');
    return out;
  }

  /// Chấm bài: answers = questionId -> đáp án học viên chọn.
  /// Kỹ năng Speaking/Writing chấm bằng "điểm tự khai" (0-100) truyền vào.
  static Future<NNPlacementResult> submitPlacementTest(
    Isar db, {
    required String studentUuid,
    required NNLanguage language,
    required Map<String, String> answers, // questionId -> answer
    double speakingSelfScore = 0,
    double writingSelfScore = 0,
    Map<NNSkill, double>? customWeights,
  }) async {
    final weights = customWeights ??
        {for (final s in NNSkill.values) s: s.weightDefault()};

    // Điểm từng kỹ năng dựa trên % câu đúng trong ngân hàng cùng kỹ năng.
    final all = await db.ngoaiNguQuestions
        .filter()
        .languageEqualTo(language)
        .findAll();
    double skillScore(NNSkill skill) {
      final qs = all.where((q) => q.skill == skill).toList();
      if (qs.isEmpty) return 0;
      var earned = 0.0;
      var total = 0.0;
      for (final q in qs) {
        total += q.points;
        final ans = answers[q.questionId];
        if (ans != null && ans.trim().toLowerCase() == q.correctAnswer.toLowerCase()) {
          earned += q.points;
        }
      }
      return total == 0 ? 0 : earned / total * 100;
    }

    final v = skillScore(NNSkill.vocabulary);
    final g = skillScore(NNSkill.grammar);
    final r = skillScore(NNSkill.reading);
    final l = skillScore(NNSkill.listening);
    final sp = speakingSelfScore;
    final w = writingSelfScore;

    final overall = v * weights[NNSkill.vocabulary]! +
        g * weights[NNSkill.grammar]! +
        r * weights[NNSkill.reading]! +
        l * weights[NNSkill.listening]! +
        sp * weights[NNSkill.speaking]! +
        w * weights[NNSkill.writing]!;

    final grade = gradeLabelOf(overall);
    final level = levelFromScore(language, overall);

    late NgoaiNguTestAttempt attempt;
    await db.writeTxn(() async {
      attempt = NgoaiNguTestAttempt()
        ..attemptId = 'att_${DateTime.now().millisecondsSinceEpoch}'
        ..studentUuid = studentUuid
        ..language = language
        ..vocabScore = v
        ..grammarScore = g
        ..readingScore = r
        ..listeningScore = l
        ..speakingScore = sp
        ..writingScore = w
        ..overallScore = overall
        ..gradeLabel = grade
        ..resultLevel = level
        ..weightsUsed =
            jsonEncode(weights.map((k, x) => MapEntry(k.name, x)));
      await db.ngoaiNguTestAttempts.put(attempt);
    });
    return NNPlacementResult(
      vocabScore: v,
      grammarScore: g,
      readingScore: r,
      listeningScore: l,
      speakingScore: sp,
      writingScore: w,
      overallScore: overall,
      gradeLabel: grade,
      resultLevel: level,
    );
  }

  /// §12. Xếp loại mặc định.
  static String gradeLabelOf(double score) {
    if (score >= 90) return 'Excellent';
    if (score >= 80) return 'Very Good';
    if (score >= 70) return 'Good';
    if (score >= 60) return 'Pass';
    return 'Need Improvement';
  }

  /// Xếp level từ điểm theo bậc thang (khớp ví dụ §10: 68.3 => B1):
  /// <30 · 30-49 · 50-74 · 75-89 · >=90
  static String levelFromScore(NNLanguage lang, double score) {
    final idx = score < 30
        ? 0
        : score < 50
            ? 1
            : score < 75
                ? 2
                : score < 90
                    ? 3
                    : 4;
    switch (lang) {
      case NNLanguage.english:
        const lv = ['A1', 'A2', 'B1', 'B2', 'C1'];
        return lv[idx];
      case NNLanguage.japanese:
        const lv = ['N5', 'N4', 'N3', 'N2', 'N1'];
        return lv[idx];
      case NNLanguage.vietnamese:
        const lv = [
          'Beginner',
          'Elementary',
          'Intermediate',
          'Upper-Intermediate',
          'Advanced'
        ];
        return lv[idx];
    }
  }

  // ══════════════ §8+§38. XẾP LỚP / GHI DANH ══════════════

  /// Ghi danh học viên vào lớp: kiểm tra sức chứa + trùng ghi danh.
  static Future<void> enrollStudent(
      Isar db, NgoaiNguClass cls, NgoaiNguStudent student) async {
    if (cls.status != ClassStatus.active && cls.status != ClassStatus.planning) {
      throw Exception('Lớp ${cls.classCode} không nhận học viên.');
    }
    final current =
        await db.ngoaiNguClassStudents.filter().classUuidEqualTo(cls.uuid!).findAll();
    if (current.any((e) => e.studentUuid == student.uuid)) {
      throw Exception('Học viên đã ở trong lớp này.');
    }
    if ((cls.maxStudents ?? 0) > 0 && current.length >= cls.maxStudents!) {
      throw Exception('Lớp đã đủ sĩ số (${cls.maxStudents}).');
    }
    await db.writeTxn(() async {
      await db.ngoaiNguClassStudents.put(NgoaiNguClassStudent()
        ..uuid = 'cs_${cls.uuid}_$student'
        ..classUuid = cls.uuid
        ..studentUuid = student.uuid
        ..enrolledAt = DateTime.now());
    });
  }

  // ══════════════ §7+§13. XẾP LỊCH & TRÙNG LỊCH ══════════════

  /// Kiểm tra xung đột: giáo viên hoặc phòng đang có buổi khác chồng giờ.
  static Future<bool> hasScheduleConflict(
      Isar db, NgoaiNguLesson lesson) async {
    final start = lesson.startTime!;
    final end = lesson.endTime!;
    final sameDay = await db.ngoaiNguLessons
        .filter()
        .not()
        .uuidEqualTo(lesson.uuid ?? '')
        .startTimeLessThan(end)
        .endTimeGreaterThan(start)
        .findAll();
    for (final l in sameDay) {
      if (l.teacherUuid == lesson.teacherUuid) return true;
      if (l.roomUuid != null &&
          l.roomUuid!.isNotEmpty &&
          l.roomUuid == lesson.roomUuid) {
        return true;
      }
    }
    return false;
  }

  /// Tạo buổi học — tự chặn trùng phòng/giáo viên (§7).
  static Future<void> createLesson(Isar db, NgoaiNguLesson lesson) async {
    if (!lesson.endTime!.isAfter(lesson.startTime!)) {
      throw Exception('Giờ kết thúc phải sau giờ bắt đầu.');
    }
    if (await hasScheduleConflict(db, lesson)) {
      throw Exception('Trùng lịch: giáo viên hoặc phòng đang bận khung này.');
    }
    await db.writeTxn(() async => db.ngoaiNguLessons.put(lesson));
  }

  // ══════════════ §13. ĐIỂM DANH + TIẾN BỘ §18 ══════════════

  /// Điểm danh buổi học -> cập nhật số buổi/giờ học của học viên.
  static Future<void> markAttendance(
      Isar db, NgoaiNguAttendance att, double lessonHours) async {
    await db.writeTxn(() async {
      await db.ngoaiNguAttendances.put(att);
      if (att.status == AttendanceStatus.present ||
          att.status == AttendanceStatus.late ||
          att.status == AttendanceStatus.makeup) {
        final s = await db.ngoaiNguStudents
            .filter()
            .uuidEqualTo(att.studentUuid!)
            .findFirst();
        if (s != null) {
          s.currentScore =
              ((s.currentScore ?? 0) * 0.9 + 85 * 0.1); // mô phỏng tiến bộ nhẹ
          await db.ngoaiNguStudents.put(s);
        }
      }
    });
  }

  /// §18. Ghi nhận tiến bộ hằng ngày của học viên.
  static Future<void> recordProgress(
      Isar db, NgoaiNguProgressEntry entry) async {
    await db.writeTxn(() async {
      await db.ngoaiNguProgressEntrys.put(entry);
      final s =
          await db.ngoaiNguStudents.filter().uuidEqualTo(entry.studentUuid).findFirst();
      if (s != null) {
        final avg = (entry.vocabScore +
                entry.grammarScore +
                entry.listeningScore +
                entry.speakingScore +
                entry.readingScore +
                entry.writingScore) /
            6;
        s.currentScore = avg;
        await db.ngoaiNguStudents.put(s);
      }
    });
  }

  /// §18. AI phát hiện kỹ năng yếu/nặng dựa trên điểm trung bình các lần ghi.
  static Future<({List<String> weakSkills, List<String> strongSkills})>
      analyzeProgress(Isar db, String studentUuid) async {
    final entries = await db.ngoaiNguProgressEntrys
        .filter()
        .studentUuidEqualTo(studentUuid)
        .findAll();
    if (entries.isEmpty) {
      return (weakSkills: <String>[], strongSkills: <String>[]);
    }
    double avg(double Function(NgoaiNguProgressEntry) pick) =>
        entries.map(pick).reduce((a, b) => a + b) / entries.length;

    final scores = {
      'vocabulary': avg((e) => e.vocabScore),
      'grammar': avg((e) => e.grammarScore),
      'listening': avg((e) => e.listeningScore),
      'speaking': avg((e) => e.speakingScore),
      'reading': avg((e) => e.readingScore),
      'writing': avg((e) => e.writingScore),
    };
    final sorted = scores.entries.toList()..sort((a, b) => a.value.compareTo(b.value));
    return (
      weakSkills: sorted.take(2).map((e) => e.key).toList(),
      strongSkills: sorted.reversed.take(2).map((e) => e.key).toList(),
    );
  }

  // ══════════════ §16. AI TUTOR (heuristic offline) ══════════════

  /// AI sửa câu: quy tắc thì quá khứ đơn giản + giải thích.
  static ({String corrected, String explanation}) aiFixGrammar(String input) {
    final text = input.trim();
    final fixes = <String, String>{
      ' i go to school yesterday.': 'I went to school yesterday.',
      'i go to school yesterday': 'I went to school yesterday',
      ' she dont like coffee': 'She does not like coffee',
      'he don\'t have money': 'He does not have money',
      ' i am study english': 'I am studying English',
    };
    final fixed = fixes[text.toLowerCase()];
    if (fixed != null) {
      return (
        corrected: fixed,
        explanation:
            'Sửa lỗi thì: hành động trong quá khứ dùng V2/went; chủ ngữ ngôi thứ 3 số ít dùng does not.'
      );
    }
    return (
      corrected: text,
      explanation: 'Không phát hiện lỗi quen thuộc. Câu của bạn có vẻ ổn!'
    );
  }

  /// AI tra từ vựng — dùng mini dictionary seed.
  static Future<Map<String, dynamic>?> aiVocabLookup(
      Isar db, String word) async {
    final dict = NgoaiNguIsarDb.miniDictionary();
    final key = word.toLowerCase().trim();
    if (!dict.containsKey(key)) return null;
    return dict[key];
  }

  /// AI cá nhân hóa: kế hoạch tuần theo kỹ năng yếu (§18 kết hợp).
  static Future<List<String>> aiPersonalizedPlan(
      Isar db, String studentUuid) async {
    final analysis = await analyzeProgress(db, studentUuid);
    final plan = <String>[];
    for (final weak in analysis.weakSkills) {
      plan.add('Luyện $weak 20 phút/ngày với AI Tutor');
    }
    plan.add('Ôn 15 từ vựng mới mỗi sáng');
    plan.add('1 bài hội thoại AI cuối tuần');
    return plan;
  }

  /// AI lộ trình: A2→B2 trong 8 tháng (mẫu §16).
  static List<String> aiRoadmap(String fromLevel, String toLevel, int months) {
    final steps = <String>[];
    final seg = months >= 4 ? months ~/ 3 : 1;
    steps.add('Tháng 1-$seg: củng cố $fromLevel, bổ sung từ vựng nền');
    steps.add('Tháng ${seg + 1}-${seg * 2}: luyện kỹ năng yếu, tăng tốc $fromLevel → trung cấp');
    steps.add('Tháng ${seg * 2 + 1}-${months - 1}: chuyển tiếp lên $toLevel');
    steps.add('Tháng $months: mock test + ôn tổng');
    return steps;
  }

  // ══════════════ §19. CHỨNG NHẬN ══════════════

  /// Quy trình §39: hoàn thành khóa + test cuối đạt -> cấp chứng nhận QR.
  static Future<NgoaiNguCertificate> issueCertificate(
    Isar db, {
    required NgoaiNguStudent student,
    required NgoaiNguCourse course,
    required double finalScore,
  }) async {
    if (finalScore < 60) {
      throw Exception('Chưa đạt (cần >= 60) — học lại theo Remedial Learning.');
    }
    final year = DateTime.now().year;
    final langTag = switch (course.language?.toLowerCase()) {
      'japanese' => 'JP',
      'vietnamese' => 'VN',
      _ => 'ENG',
    };
    final count = await db.ngoaiNguCertificates.count();
    final code =
        'CERT-$langTag-${course.level ?? '?'}-$year-${(count + 1).toString().padLeft(6, '0')}';

    late NgoaiNguCertificate c;
    await db.writeTxn(() async {
      c = NgoaiNguCertificate()
        ..certCode = code
        ..studentUuid = student.uuid
        ..courseUuid = course.uuid
        ..level = course.level ?? ''
        ..score = finalScore
        ..issueDate = DateTime.now()
        ..expiryDate = DateTime.now().add(const Duration(days: 1095))
        ..verificationCode = 'QR-${code.hashCode.abs()}';
      await db.ngoaiNguCertificates.put(c);

      student.status = StudentStatus.graduated;
      await db.ngoaiNguStudents.put(student);
    });
    await enqueueSync(db, 'certificate', c.certCode, 'CREATE');
    return c;
  }

  /// Trang xác minh QR (§19): trả về thông tin Valid/Invalid.
  static Future<Map<String, dynamic>> verifyCertificate(
      Isar db, String certCode) async {
    final c = await db.ngoaiNguCertificates
        .filter()
        .certCodeEqualTo(certCode)
        .findFirst();
    if (c == null || c.isDeleted) {
      return {'valid': false};
    }
    final s = await db.ngoaiNguStudents
        .filter()
        .uuidEqualTo(c.studentUuid)
        .findFirst();
    return {
      'valid': true,
      'student': s?.fullName ?? '',
      'level': c.level,
      'score': c.score,
      'issueDate': c.issueDate.toString().substring(0, 10),
    };
  }

  // ══════════════ §20. HỌC PHÍ / VOUCHER / CÔNG NỢ ══════════════

  static Future<NgoaiNguInvoice> createInvoice(
    Isar db, {
    required NgoaiNguStudent student,
    required NgoaiNguCourse course,
    NgoaiNguClass? klass,
    double? amountOverride,
    String voucherCode = '',
  }) async {
    final base = amountOverride ?? course.defaultTuition ?? 0;

    var discount = 0.0;
    NgoaiNguVoucher? voucher;
    if (voucherCode.isNotEmpty) {
      voucher = await db.ngoaiNguVouchers
          .filter()
          .codeEqualTo(voucherCode.toUpperCase())
          .findFirst();
      if (voucher == null || !voucher.active) {
        throw Exception('Voucher không tồn tại hoặc hết hiệu lực.');
      }
      if (base < voucher.minOrder) {
        throw Exception('Đơn tối thiểu ${voucher.minOrder} để dùng voucher.');
      }
      discount = voucher.type == 'percent'
          ? base * voucher.value / 100
          : voucher.value;
      if (voucher.maxDiscount > 0 && discount > voucher.maxDiscount) {
        discount = voucher.maxDiscount;
      }
    }

    final count = await db.ngoaiNguInvoices.count();
    late NgoaiNguInvoice inv;
    await db.writeTxn(() async {
      inv = NgoaiNguInvoice()
        ..invoiceCode =
            'INV-${DateTime.now().year}-${(count + 1).toString().padLeft(6, '0')}'
        ..studentUuid = student.uuid
        ..classUuid = klass?.uuid
        ..courseUuid = course.uuid
        ..amount = base
        ..discount = discount
        ..voucherCode = voucherCode.toUpperCase()
        ..status = 'unpaid';
      await db.ngoaiNguInvoices.put(inv);
      if (voucher != null) {
        voucher.usageCount += 1;
        await db.ngoaiNguVouchers.put(voucher);
      }
    });
    await enqueueSync(db, 'invoice', inv.invoiceCode, 'CREATE');
    return inv;
  }

  /// Thanh toán hóa đơn (cho phép trả từng phần -> partial).
  static Future<NgoaiNguInvoice> makePayment(Isar db, NgoaiNguInvoice inv,
      {required double amount, String method = 'cash'}) async {
    if (amount <= 0) throw Exception('Số tiền thanh toán phải > 0.');
    final remain = inv.outstanding;
    if (amount > remain) throw Exception('Vượt số tiền còn nợ ($remain).');

    await db.writeTxn(() async {
      inv.paidAmount += amount;
      inv.paymentMethod = method;
      inv.status =
          inv.outstanding == 0 ? 'paid' : (inv.paidAmount > 0 ? 'partial' : 'unpaid');
      await db.ngoaiNguInvoices.put(inv);
      await db.ngoaiNguPaymentRecords.put(NgoaiNguPaymentRecord()
        ..paymentId =
            'pay_${inv.invoiceCode}_${DateTime.now().millisecondsSinceEpoch}'
        ..invoiceCode = inv.invoiceCode
        ..amount = amount
        ..method = method);
    });
    await enqueueSync(db, 'payment', inv.invoiceCode, 'UPDATE');
    return inv;
  }

  // ══════════════ §21. BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  static Future<Map<String, double>> revenueReport(
      Isar db, DateTime from, DateTime to) async {
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final byMethod = <String, double>{};
    var total = 0.0;
    for (final p in payments.where((p) => _inRange(p.paidAt, from, to))) {
      byMethod[p.method] = (byMethod[p.method] ?? 0) + p.amount;
      total += p.amount;
    }
    final outstanding = invoices.fold<double>(0, (s, i) => s + i.outstanding);
    return {'total': total, 'outstanding': outstanding, ...byMethod};
  }

  static Future<Map<String, dynamic>> trainingReport(
      DateTime from, DateTime to, Isar db) async {
    final students = await db.ngoaiNguStudents.where().findAll();
    final certs = await db.ngoaiNguCertificates.where().findAll();
    final active = students.where((s) => s.status == StudentStatus.active);
    return {
      'totalStudents': students.length,
      'newThisPeriod':
          students.where((s) => _inRange(s.enrollmentDate, from, to)).length,
      'activeCount': active.length,
      'graduated': students.where((s) => s.status == StudentStatus.graduated).length,
      'droppedOut': students.where((s) => s.status == StudentStatus.droppedOut).length,
      'avgCurrentScore': students.isEmpty
          ? 0.0
          : students.map((s) => s.currentScore ?? 0).reduce((a, b) => a + b) /
              students.length,
      'completionRatePercent':
          students.isEmpty ? 0.0 : certs.length / students.length * 100,
    };
  }

  /// Dashboard admin web (§35).
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrow = todayStart.add(const Duration(days: 1));

    final students = await db.ngoaiNguStudents.where().findAll();
    final teachers = await db.ngoaiNguTeachers.where().findAll();
    final classes = await db.ngoaiNguClass.where().findAll();
    final lessons = await db.ngoaiNguLessons.where().findAll();
    final invoices = await db.ngoaiNguInvoices.where().findAll();

    return {
      'totalStudents': students.length,
      'activeStudents': students.where((s) => s.status == StudentStatus.active).length,
      'teachers': teachers.length,
      'classes': classes.length,
      'todayLessons': lessons
          .where((l) => _inRange(l.startTime, todayStart, tomorrow))
          .length,
      'outstandingTuition': invoices.fold<double>(0, (s, i) => s + i.outstanding),
      'certificates': await db.ngoaiNguCertificates.count(),
    };
  }

  // ══════════════ §24+§36. SYNC QUEUE OFFLINE ══════════════

  static Future<void> enqueueSync(
      Isar db, String entity, String entityUuid, String operation,
      {Map<String, dynamic>? payload}) async {
    await db.writeTxn(() async {
      await db.ngoaiNguSyncQueueItems.put(NgoaiNguSyncQueueItem()
        ..syncId = 'sync_${entity}_${entityUuid}_$operation'
        ..entity = entity
        ..entityUuid = entityUuid
        ..operation = operation
        ..payloadJson = jsonEncode(payload ?? {})
        ..status = 'PENDING'
        ..updatedAt = DateTime.now());
    });
  }

  static Future<int> pendingSyncCount(Isar db) async {
    return db.ngoaiNguSyncQueueItems.filter().statusEqualTo('PENDING').count();
  }

  /// Giả lập push lên Vercel thành công -> đánh dấu SYNCED.
  static Future<int> flushSyncQueue(Isar db) async {
    final pendings = await db.ngoaiNguSyncQueueItems
        .filter()
        .statusEqualTo('PENDING')
        .findAll();
    await db.writeTxn(() async {
      for (final p in pendings) {
        p.status = 'SYNCED';
        p.updatedAt = DateTime.now();
        await db.ngoaiNguSyncQueueItems.put(p);
      }
    });
    return pendings.length;
  }
}

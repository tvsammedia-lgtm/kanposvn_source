import 'package:isar/isar.dart';

part 'ngoai_ngo_ops.g.dart';

/// §12. Kỹ năng đánh giá.
enum NNLanguage { english, japanese, vietnamese }

enum NNSkill {
  vocabulary,
  grammar,
  reading,
  listening,
  speaking,
  writing;

  double weightDefault() => switch (this) {
        NNSkill.vocabulary => 0.20,
        NNSkill.grammar => 0.20,
        NNSkill.reading => 0.15,
        NNSkill.listening => 0.15,
        NNSkill.speaking => 0.15,
        NNSkill.writing => 0.15,
      };
}

/// §11. Loại câu hỏi.
enum NNQuestionType {
  multipleChoice,
  singleChoice,
  trueFalse,
  fillBlank,
  matching,
  listening,
  speaking,
  writing,
  reading
}

/// §8. Liên kết lớp ↔ học viên.
@collection
class NgoaiNguClassStudent {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? classUuid;

  @Index()
  String? studentUuid;

  DateTime? enrolledAt;
  bool isDeleted = false;
}

/// §11. Ngân hàng câu hỏi.
@collection
class NgoaiNguQuestion {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? questionId;

  @enumerated
  NNLanguage language = NNLanguage.english;

  String level = 'A1'; // A1..C2 / N5..N1 / Beginner..

  @enumerated
  NNSkill skill = NNSkill.vocabulary;

  String topic = '';

  @enumerated
  NNQuestionType type = NNQuestionType.singleChoice;

  String question = '';

  /// Các lựa chọn phân tách bằng '||' (đơn giản offline).
  String options = '';

  String correctAnswer = '';
  String explanation = '';
  int difficulty = 1; // 1 Basic .. 5 Advanced
  double points = 1;
}

/// §10+§12. Bài test đầu vào / kiểm tra + điểm theo kỹ năng.
@collection
class NgoaiNguTestAttempt {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String attemptId = '';

  @Index()
  String? studentUuid;

  @enumerated
  NNLanguage language = NNLanguage.english;

  /// Điểm từng kỹ năng 0-100.
  double vocabScore = 0;
  double grammarScore = 0;
  double readingScore = 0;
  double listeningScore = 0;
  double speakingScore = 0;
  double writingScore = 0;

  double overallScore = 0; // Theo trọng số §12
  String gradeLabel = ''; // Excellent/Very Good/Good/Pass/Need Improvement
  String resultLevel = ''; // A1..C2 / N5..N1 ...

  /// Trọng số đã dùng tại lúc chấm (JSON).
  String weightsUsed = '';

  DateTime createdAt = DateTime.now();
}

/// §19. Chứng nhận + mã xác minh QR.
@collection
class NgoaiNguCertificate {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String certCode = ''; // CERT-ENG-B1-2026-000123

  @Index()
  String? studentUuid;
  String? courseUuid;
  String level = '';
  double score = 0;

  DateTime issueDate = DateTime.now();
  DateTime? expiryDate;

  String verificationCode = ''; // Dùng cho QR

  bool isDeleted = false;
}

/// §20. Hóa đơn học phí.
@collection
class NgoaiNguInvoice {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String invoiceCode = ''; // INV-2026-000001

  @Index()
  String? studentUuid;
  String? classUuid;
  String? courseUuid;

  double amount = 0; // Học phí gốc
  double discount = 0; // Giảm từ voucher/khuyến mãi
  double paidAmount = 0; // Đã trả

  String voucherCode = '';

  /// unpaid | partial | paid
  String status = 'unpaid';
  String paymentMethod = 'cash'; // cash | bank | momo | vnpay...

  DateTime dueDate = DateTime.now().add(const Duration(days: 7));
  DateTime createdAt = DateTime.now();
  bool isDeleted = false;

  double get outstanding => (amount - discount - paidAmount).clamp(0, double.infinity);
}

/// Lần thanh toán cho hóa đơn.
@collection
class NgoaiNguPaymentRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String paymentId = '';

  @Index()
  String invoiceCode = '';

  double amount = 0;
  String method = 'cash';
  String note = '';
  DateTime paidAt = DateTime.now();
}

/// Voucher học phí.
@collection
class NgoaiNguVoucher {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String code = '';

  /// percent | fixedAmount
  String type = 'percent';
  double value = 0;
  double maxDiscount = 0;
  double minOrder = 0;

  DateTime? validTo;
  bool active = true;
  int usageCount = 0;
}

/// §18. Tiến bộ học tập theo ngày.
@collection
class NgoaiNguProgressEntry {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String entryId = '';

  @Index()
  String? studentUuid;

  DateTime date = DateTime.now();

  double vocabScore = 0;
  double grammarScore = 0;
  double listeningScore = 0;
  double speakingScore = 0;
  double readingScore = 0;
  double writingScore = 0;

  double hoursStudied = 0;
}

/// §24. Sync Queue offline-first.
@collection
class NgoaiNguSyncQueueItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String syncId = '';

  String entity = ''; // student | invoice | ...
  String entityUuid = '';

  /// CREATE | UPDATE | DELETE
  String operation = 'CREATE';

  String payloadJson = '{}';

  /// PENDING | SYNCING | SYNCED | FAILED
  String status = 'PENDING';
  int retryCount = 0;

  DateTime updatedAt = DateTime.now();
}

/// §31. Audit Log.
@collection
class NgoaiNguAuditLog {
  Id id = Isar.autoIncrement;

  String userUuid = '';
  String action = ''; // CREATE | UPDATE | ENROLL | ISSUE_CERT | PAYMENT...
  String entity = '';
  String entityId = '';
  String detail = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

import 'package:isar/isar.dart';

part 'viec_ops_models.g.dart';

/// §13. Phiên nhận việc (một lần đi làm của ứng viên).
@collection
class ViecWorkSession {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String sessionId = '';

  @Index()
  String matchId = '';
  String contractId = '';
  String candidateId = '';
  String jobId = '';

  DateTime workDate = DateTime.now();
  double startHour = 8; // 8.5 = 08:30
  double endHour = 17;

  /// working | completed | cancelled
  String status = 'working';

  DateTime createdAt = DateTime.now();
}

/// §16. Thu chi trung tâm môi giới.
@collection
class ViecFinanceTx {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String txId = '';

  bool isIncome = false;

  /// Thu: REFERRAL_FEE | JOB_RENEWAL | VIP_POSTING | ADVERTISING | OTHER_IN
  /// Chi: SALARY | MARKETING | UTILITIES | OFFICE_RENT | OTHER_OUT
  @Index()
  String category = '';

  double amount = 0;
  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

/// §21. Đánh giá 2 chiều 5 sao.
@collection
class ViecRating {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String ratingId = '';

  @Index()
  String matchId = '';

  /// candidate | employer (ai là người chấm)
  String raterType = 'candidate';
  String targetUuid = ''; // uuid của đối tượng bị chấm

  int stars = 5;
  String comment = '';

  DateTime createdAt = DateTime.now();
}

/// §19. Thông báo.
@collection
class ViecNotification {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String notifId = '';

  String targetUuid = ''; // candidate/employer/user
  String channel = 'push'; // push | sms | email | zalo
  String title = '';
  String body = '';

  bool isRead = false;
  DateTime createdAt = DateTime.now();
}

/// §25. Nhật ký hệ thống.
@collection
class ViecAuditLog {
  Id isarId = Isar.autoIncrement;

  String actorUuid = '';
  String action = ''; // LOGIN | POST_JOB | ACCEPT_JOB | PAYMENT | UPDATE...
  String entity = '';
  String entityId = '';
  String detail = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

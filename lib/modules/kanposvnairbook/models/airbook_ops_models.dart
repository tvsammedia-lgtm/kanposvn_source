import 'package:isar/isar.dart';

part 'airbook_ops_models.g.dart';

/// §9. Hành khách theo booking.
enum AirPassengerType { ADT, CHD, INF }

@collection
class AirPassenger {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String passengerId = '';

  @Index()
  String bookingUuid = '';

  @enumerated
  AirPassengerType type = AirPassengerType.ADT;

  String title = ''; // Mr/Mrs/Ms
  String firstName = '';
  String lastName = '';
  String gender = '';
  DateTime? dateOfBirth;
  String nationality = 'VN';
  String passportNumber = '';
  DateTime? passportExpiry;
  String identityNumber = '';
  String phone = '';

  String get fullName => '$lastName $firstName'.trim();
}

/// §13. Thanh toán (một phần / hoàn tiền).
@collection
class AirPayment {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String paymentCode = '';

  @Index()
  String bookingUuid = '';

  /// bank | cash | ewallet | gateway
  String method = 'cash';

  double amount = 0; // >0 thu · <0 hoàn

  /// PENDING | SUCCESS | REFUNDED | PARTIAL_REFUND | FAILED
  String status = 'SUCCESS';

  String idempotencyKey = '';
  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

/// §32. Khuyến mãi theo hãng / tuyến / toàn sàn.
@collection
class AirPromotion {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String code = '';

  /// airline | route | platform
  String scope = 'platform';
  String refId = ''; // tên hãng hoặc 'HAN-SGN'

  /// percent | fixedAmount
  String type = 'percent';
  double value = 0;
  double maxDiscount = 0;

  int usageLimit = 100;
  int usedCount = 0;
  bool active = true;
}

/// §36. Audit log các thao tác quan trọng.
@collection
class AirAuditLog {
  Id id = Isar.autoIncrement;

  String actorUuid = '';

  /// LOGIN | CREATE_BOOKING | PAYMENT | ISSUE_TICKET | CANCEL_BOOKING | REFUND...
  String action = '';
  String entity = '';
  String entityId = '';
  String detail = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

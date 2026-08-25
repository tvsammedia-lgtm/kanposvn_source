import 'package:isar/isar.dart';

import 'ride_driver.dart' show VehicleType;

part 'ride_ops_models.g.dart';

/// §18. Khuyến mãi / Voucher KanRide.
@collection
class KanRidePromotion {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String code = '';

  String description = '';

  /// percent | fixedAmount | freeFirstRide
  String type = 'percent';

  double value = 0;
  double maxDiscount = 0; // Trần giảm (percent). 0 = không trần.
  double minFare = 0; // Đơn tối thiểu.

  DateTime? validFrom;
  DateTime? validTo;
  bool active = true;
  int usageCount = 0;
}

/// §20. Đánh giá chuyến đi 1-5 sao (khách chấm tài xế).
@collection
class RideRating {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String ratingId = '';

  @Index()
  String bookingUuid = '';

  @Index()
  String driverUuid = '';

  String passengerUuid = '';

  int stars = 5; // §20: 1-5 sao

  String comment = '';
  bool isComplaint = false; // Khiếu nại

  DateTime createdAt = DateTime.now();
}

// ═══════════════ GIAI ĐOẠN 2-4 (§43) ═══════════════

/// §21. Chat khách ↔ tài xế trong chuyến.
@collection
class RideChatMessage {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String msgId = '';

  @Index()
  String bookingUuid = '';

  /// customer | driver | support
  String senderRole = 'customer';
  String senderUuid = '';
  String text = '';
  String? imageUrl; // gửi hình
  DateTime createdAt = DateTime.now();
  DateTime? readAt;
}

/// §22. Số điện thoại ảo che giấu số thật khi gọi trong chuyến.
@collection
class RideMaskedCall {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String callId = '';

  @Index()
  String bookingUuid = '';

  String virtualNumber = ''; // Số ảo hiển thị cho 2 bên
  String passengerReal = '';
  String driverReal = '';
  DateTime expiresAt = DateTime.now().add(const Duration(hours: 2));
  DateTime createdAt = DateTime.now();
}

/// §23. Thông báo đa kênh (offline queue — push khi online).
@collection
class RideNotification {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String notifId = '';

  @Index()
  String userUuid = '';

  /// push | sms | email | zalo
  String channel = 'push';
  String title = '';
  String body = '';

  bool isRead = false;
  DateTime createdAt = DateTime.now();
}

/// §29. Quản lý khu vực / GeoFence.
@collection
class RideGeoFence {
  Id id = Isar.autoIncrement;

  bool isSynced = false;

  @Index(unique: true, replace: true)
  String fenceId = '';

  String name = ''; // VD: Nội thành TP.HCM
  String province = '';
  double centerLat = 0;
  double centerLng = 0;
  double radiusKm = 0;

  bool active = true;
}

/// §31. Trung tâm CSKH: ticket khiếu nại / hoàn tiền / bồi thường.
@collection
class RideSupportTicket {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String ticketId = '';

  String? bookingUuid;
  @Index()
  String userUuid = '';

  /// complaint | refund | compensation | other
  String category = 'other';
  String subject = '';
  String detail = '';

  /// open | processing | resolved
  String status = 'open';

  double refundAmount = 0;
  DateTime? resolvedAt;
  DateTime createdAt = DateTime.now();
}

/// §35. Nhật ký hệ thống (login/booking/payment/gps/api/error).
@collection
class RideAuditLog {
  Id id = Isar.autoIncrement;

  @Index()
  String action = ''; // LOGIN | BOOKING | PAYMENT | GPS | API | ERROR ...

  String actorUuid = '';
  String detail = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

/// §43-GĐ4. Thuê xe tự lái.
@collection
class RideSelfDriveRental {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String rentalId = '';

  String vehiclePlate = '';

  @enumerated
  VehicleType vehicleType = VehicleType.car4Seats;

  String customerName = '';
  String customerPhone = '';
  String customerCccd = '';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));

  double dailyPrice = 0;
  double deposit = 0;

  /// rented | returned | overdue
  String status = 'rented';

  DateTime? actualReturnTime;
  DateTime createdAt = DateTime.now();
}

/// §43-GĐ4. Đơn giao hàng / giao đồ ăn.
@collection
class RideDeliveryOrder {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String orderId = '';

  String customerName = '';
  String customerPhone = '';

  String pickupAddress = '';
  String dropoffAddress = '';
  String itemNote = ''; // Món hàng / món ăn
  double weightKg = 0;
  double fee = 0;

  String driverUuid = '';

  /// finding_driver | picked_up | delivered | cancelled
  String status = 'finding_driver';

  DateTime? completedAt;
  DateTime createdAt = DateTime.now();
}

/// §43-GĐ4. Taxi doanh nghiệp: hợp đồng tín dụng công ty.
@collection
class RideCorporateAccount {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String corpId = '';

  String companyName = '';
  String taxCode = '';
  String contactPhone = '';

  double creditLimitVnd = 0;
  double currentDebt = 0;

  int invoiceDayOfMonth = 1; // Xuất hóa đơn ngày mấy mỗi tháng
  bool active = true;
  DateTime createdAt = DateTime.now();
}

/// §43-GĐ4. API key cho đối tác tích hợp.
@collection
class RidePartnerApiKey {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String keyId = '';

  String partnerName = '';
  String apiKeyHash = ''; // Hash của API key (không lưu key thô)

  int quotaPerDay = 1000;
  int usedToday = 0;
  bool active = true;

  DateTime createdAt = DateTime.now();
}

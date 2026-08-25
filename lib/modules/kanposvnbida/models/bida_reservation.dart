import 'package:isar/isar.dart';

part 'bida_reservation.g.dart';

enum BidaReservationStatus {
  PENDING('Chờ đến'),
  CHECKED_IN('Đã nhận bàn'),
  CANCELLED('Đã hủy');

  final String label;
  const BidaReservationStatus(this.label);
}

/// Đặt bàn trước: khách đặt giờ đến, bàn, liên hệ, cọc.
@collection
class BidaReservation {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String reservationId = '';

  @Index()
  String customerName = '';

  String customerPhone = '';

  /// Số lượng người chơi.
  int guestCount = 1;

  /// Mã bàn đặt (có thể null nếu khách chưa chọn bàn cụ thể).
  String? tableId;

  /// Loại bàn đặt (nếu chưa chọn bàn cụ thể).
  String? tableType;

  DateTime? expectedArrival;

  /// Số tiền đặt cọc.
  double deposit = 0;

  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();

  @enumerated
  BidaReservationStatus status = BidaReservationStatus.PENDING;
}

import 'package:isar/isar.dart';

part 'payment.g.dart';

@collection
class XeOmPayment {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;
  
  String? bookingUuid;
  String? customerUuid;
  String? driverUuid;
  
  double? amount; // Tổng số tiền khách phải trả
  double? driverCommission; // Hoa hồng nền tảng thu từ tài xế (VD: 20%)
  
  @enumerated
  PaymentMethod method = PaymentMethod.cash;
  
  @enumerated
  PaymentStatus status = PaymentStatus.pending;
  
  String? transactionReference; // Mã giao dịch Momo/VNPay (nếu có)
  String? notes;
  
  DateTime? paidAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted = false;
  int syncVersion = 1;
}

enum PaymentMethod {
  cash,
  qr,
  momo,
  zaloPay,
  vnpay,
  bankTransfer
}

enum PaymentStatus {
  pending,
  completed,
  failed,
  refunded
}

import 'package:isar/isar.dart';
import 'restaurant_table.dart';

part 'restaurant_order.g.dart';

enum RestaurantOrderStatus {
  SERVING('Đang phục vụ'),
  COMPLETED('Đã thanh toán');

  final String label;
  const RestaurantOrderStatus(this.label);
}

enum RestaurantOrderItemStatus {
  PENDING('Chờ nấu'),
  COOKING('Đang nấu'),
  DONE('Hoàn thành');

  final String label;
  const RestaurantOrderItemStatus(this.label);
}

enum RestaurantPaymentMethod {
  CASH('Tiền mặt'),
  QR('QR'),
  BANK_TRANSFER('Chuyển khoản'),
  CARD('Thẻ'),
  E_WALLET('Ví điện tử'),
  DEBT('Công nợ');

  final String label;
  const RestaurantPaymentMethod(this.label);
}

@embedded
class RestaurantOrderPayment {
  @enumerated
  RestaurantPaymentMethod method = RestaurantPaymentMethod.CASH;
  double amount = 0;
}

@embedded
class RestaurantOrderDetail {
  String detailId = ''; // To uniquely identify the item in KDS
  String itemId = '';
  String itemName = '';
  double price = 0.0;
  int quantity = 0;
  String note = ''; // e.g., Ít cay, Không hành

  @enumerated
  RestaurantOrderItemStatus status = RestaurantOrderItemStatus.PENDING;
}

@collection
class RestaurantOrder {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String orderId = '';

  final table = IsarLink<RestaurantTable>();

  List<RestaurantOrderDetail> details = [];

  double totalAmount = 0.0; // Tạm tính trước giảm giá
  double discountAmount = 0.0; // Tổng khuyến mãi/giảm giá
  String promotionName = ''; // Tên KM áp dụng (nếu có)

  /// Thanh toán: hỗ trợ kết hợp nhiều phương thức (tiền mặt + QR + thẻ...)
  List<RestaurantOrderPayment> payments = [];

  // Thông tin khách hàng (tùy chọn) — phục vụ tích điểm & công nợ
  String customerId = '';
  String customerName = '';
  String customerPhone = '';
  int earnedPoints = 0;

  @enumerated
  RestaurantOrderStatus status = RestaurantOrderStatus.SERVING;

  DateTime? createdAt;
  DateTime? closedAt;

  double get finalAmount => totalAmount - discountAmount;
}

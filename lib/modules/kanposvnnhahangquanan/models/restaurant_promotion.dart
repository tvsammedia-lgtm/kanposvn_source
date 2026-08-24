import 'package:isar/isar.dart';

part 'restaurant_promotion.g.dart';

enum RestaurantPromotionType {
  PERCENT('Giảm %'),
  FIXED_AMOUNT('Giảm tiền'),
  BUY_X_GET_Y('Mua X tặng Y');

  final String label;
  const RestaurantPromotionType(this.label);
}

/// Khuyến mãi: Happy Hour, giảm %, giảm tiền, voucher, mua 2 tặng 1, combo.
@collection
class RestaurantPromotion {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String promoId = '';

  String name = ''; // VD: Happy Hour Bia 17h-19h, Voucher 50K

  @enumerated
  RestaurantPromotionType type = RestaurantPromotionType.PERCENT;

  /// PERCENT: phần trăm (0-100). FIXED_AMOUNT: số tiền giảm.
  /// BUY_X_GET_Y: không dùng (tặng theo buyQty/getQty).
  double value = 0;

  /// BUY_X_GET_Y: mua buyQty món tặng getQty món cùng loại.
  int buyQty = 2;
  int getQty = 1;

  /// Ràng buộc áp dụng cho 1 món cụ thể (itemId). Rỗng = áp dụng toàn bill.
  String itemId = '';
  String itemName = '';

  /// Happy Hour: phút trong ngày (VD: 1020 = 17:00, 1140 = 19:00).
  /// -1 = không giới hạn giờ.
  int happyHourStartMinute = -1;
  int happyHourEndMinute = -1;

  bool isActive = true;
}

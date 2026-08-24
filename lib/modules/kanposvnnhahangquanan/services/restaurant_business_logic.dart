import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_promotion.dart';

/// Logic nghiệp vụ thuần (không phụ thuộc DB) — dùng chung cho POS/Thu ngân
/// và unit test.
class RestaurantBusinessLogic {
  /// Gộp công thức kho của các món con trong combo thành recipe của combo.
  /// Dùng để tự động trừ kho khi bếp hoàn thành món combo.
  static List<RestaurantRecipeItem> computeComboRecipe(
    RestaurantMenuItem combo,
    List<RestaurantMenuItem> allMenu,
  ) {
    if (!combo.isCombo) return combo.recipe;
    final byIngredient = <String, RestaurantRecipeItem>{};
    for (final c in combo.comboItems) {
      final sub = allMenu.cast<RestaurantMenuItem?>().firstWhere(
            (m) => m != null && m.itemId == c.itemId,
            orElse: () => null,
          );
      if (sub == null) continue;
      for (final r in sub.recipe) {
        final existing = byIngredient[r.ingredientId];
        if (existing == null) {
          byIngredient[r.ingredientId] = RestaurantRecipeItem()
            ..ingredientId = r.ingredientId
            ..ingredientName = r.ingredientName
            ..quantity = r.quantity * c.quantity;
        } else {
          existing.quantity += r.quantity * c.quantity;
        }
      }
    }
    return byIngredient.values.toList();
  }

  /// Kiểm tra khuyến mãi có đang áp dụng được tại [now] không
  /// (bật/tắt + Happy Hour theo giờ trong ngày).
  static bool isPromotionActive(RestaurantPromotion promo, DateTime now) {
    if (!promo.isActive) return false;
    if (promo.happyHourStartMinute < 0 || promo.happyHourEndMinute < 0) {
      return true;
    }
    final minuteOfDay = now.hour * 60 + now.minute;
    // Hỗ trợ khung giờ quá nửa đêm (VD 22:00 -> 02:00)
    if (promo.happyHourEndMinute <= promo.happyHourStartMinute) {
      return minuteOfDay >= promo.happyHourStartMinute ||
          minuteOfDay <= promo.happyHourEndMinute;
    }
    return minuteOfDay >= promo.happyHourStartMinute &&
        minuteOfDay <= promo.happyHourEndMinute;
  }

  /// Tính số tiền giảm giá cho bill.
  ///
  /// - PERCENT: subtotal * value% (làm tròn xuống 100đ).
  /// - FIXED_AMOUNT: giảm thẳng, không vượt subtotal.
  /// - BUY_X_GET_Y: tặng getQty đơn giá thấp nhất mỗi buyQty+getQty phần
  ///   của món [promo.itemId] (nếu rỗng thì tính trên toàn bill).
  static double calculateDiscount({
    required RestaurantPromotion? promotion,
    required double subtotal,
    required List<RestaurantOrderDetail> details,
    DateTime? now,
  }) {
    if (promotion == null || subtotal <= 0) return 0;
    if (!isPromotionActive(promotion, now ?? DateTime.now())) return 0;

    switch (promotion.type) {
      case RestaurantPromotionType.PERCENT:
        final d = (subtotal * promotion.value / 100 / 100).floorToDouble() * 100;
        return d.clamp(0, subtotal);

      case RestaurantPromotionType.FIXED_AMOUNT:
        return promotion.value.clamp(0, subtotal);

      case RestaurantPromotionType.BUY_X_GET_Y:
        if (promotion.buyQty <= 0 || promotion.getQty <= 0) return 0;
        final groupSize = promotion.buyQty + promotion.getQty;
        // Số phần (unit) đủ điều kiện
        int units;
        double cheapestPrice;
        if (promotion.itemId.isEmpty) {
          units = details.fold<int>(0, (s, d) => s + d.quantity);
          cheapestPrice = details.isEmpty
              ? 0
              : details.map((d) => d.price).reduce((a, b) => a < b ? a : b);
        } else {
          final target = details.where((d) => d.itemId == promotion.itemId);
          units = target.fold<int>(0, (s, d) => s + d.quantity);
          cheapestPrice = target.isEmpty
              ? 0
              : target.map((d) => d.price).reduce((a, b) => a < b ? a : b);
        }
        final freeUnits = (units ~/ groupSize) * promotion.getQty;
        final d = freeUnits * cheapestPrice;
        return d.clamp(0, subtotal);
    }
  }

  /// Tổng tiền khách trả qua các phương thức.
  static double totalPaid(List<RestaurantOrderPayment> payments) =>
      payments.fold<double>(0, (s, p) => s + p.amount);

  /// Hóa đơn hợp lệ khi tổng tiền thu >= số phải thu (cho phép thừa -> trả lại).
  static bool isPaymentSufficient({
    required double finalAmount,
    required List<RestaurantOrderPayment> payments,
  }) =>
      totalPaid(payments) + 1 >= finalAmount;

  /// Tiền thừa trả khách (âm = khách còn thiếu).
  static double changeDue({
    required double finalAmount,
    required List<RestaurantOrderPayment> payments,
  }) =>
      totalPaid(payments) - finalAmount;

  /// Điểm thưởng tích lũy: cứ mỗi 10.000đ được 1 điểm.
  static int pointsEarnedFor(double amount) => (amount / 10000).floor();

  /// Tính lại tổng tiền order từ danh sách món.
  static double recalculateTotal(List<RestaurantOrderDetail> details) =>
      details.fold<double>(0, (sum, d) => sum + d.price * d.quantity);

  /// Chuyển bàn: đổi link bàn của order sang [newTable].
  /// Trả về true nếu hợp lệ (bàn đích không có order đang phục vụ khác).
  static bool canTransferToTable({
    required RestaurantOrder? newTableActiveOrder,
    required String currentOrderId,
  }) =>
      newTableActiveOrder == null ||
      newTableActiveOrder.orderId == currentOrderId;

  /// Tách hóa đơn: chia danh sách món thành 2 phần theo [detailIdsToMove].
  static (List<RestaurantOrderDetail>, List<RestaurantOrderDetail>) splitDetails(
    List<RestaurantOrderDetail> details,
    Set<String> detailIdsToMove,
  ) {
    final moved = <RestaurantOrderDetail>[];
    final kept = <RestaurantOrderDetail>[];
    for (final d in details) {
      if (detailIdsToMove.contains(d.detailId)) {
        moved.add(d);
      } else {
        kept.add(d);
      }
    }
    return (kept, moved);
  }

  /// Gộp chi tiết món của [source] vào [target] (gộp bàn / gộp hóa đơn).
  /// Món trùng (cùng itemId + note + status PENDING) sẽ cộng số lượng.
  /// [target.totalAmount] được tính lại từ toàn bộ món; phần giảm giá cũ
  /// bị xóa (caller có thể áp dụng lại KM mới sau khi gộp).
  static void mergeDetails({
    required RestaurantOrder source,
    required RestaurantOrder target,
  }) {
    for (final d in source.details) {
      final idx = target.details.indexWhere((t) =>
          t.itemId == d.itemId &&
          t.note == d.note &&
          t.status == RestaurantOrderItemStatus.PENDING &&
          d.status == RestaurantOrderItemStatus.PENDING);
      if (idx >= 0) {
        target.details[idx].quantity += d.quantity;
      } else {
        target.details.add(d);
      }
    }
    target.discountAmount = 0;
    target.promotionName = '';
    target.totalAmount = recalculateTotal(target.details);
  }
}

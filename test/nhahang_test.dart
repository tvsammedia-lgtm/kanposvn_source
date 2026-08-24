import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_menu_item.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_order.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_promotion.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/services/restaurant_business_logic.dart';

RestaurantMenuItem item(String id, String name, double price,
        {List<RestaurantRecipeItem> recipe = const [],
        bool isCombo = false,
        List<RestaurantComboItem> comboItems = const []}) =>
    RestaurantMenuItem()
      ..itemId = id
      ..name = name
      ..price = price
      ..unit = 'Phần'
      ..recipe = List.from(recipe)
      ..isCombo = isCombo
      ..comboItems = List.from(comboItems);

RestaurantOrderDetail detail(String itemId, String name, double price, int qty,
        {String note = ''}) =>
    RestaurantOrderDetail()
      ..detailId = 'd-$itemId-$note'
      ..itemId = itemId
      ..itemName = name
      ..price = price
      ..quantity = qty
      ..note = note;

void main() {
  group('XXVI/XI. Combo - công thức gộp từ món con', () {
    test('Cộng đúng định lượng nguyên liệu của các món con', () {
      final biaTiger =
          item('bia', 'Bia Tiger', 22000, recipe: [
        RestaurantRecipeItem()
          ..ingredientId = 'ing-bia'
          ..ingredientName = 'Bia Tiger Nâu'
          ..quantity = 1,
      ]);
      final cua = item('cua', 'Cua hấp', 650000);
      final combo = item('combo', 'Combo HS', 795000,
          isCombo: true,
          comboItems: [
            RestaurantComboItem()..itemId = 'cua'..quantity = 1,
            RestaurantComboItem()..itemId = 'bia'..quantity = 2,
          ]);

      final recipe = RestaurantBusinessLogic.computeComboRecipe(
          combo, [cua, biaTiger]);

      expect(recipe.length, 1); // Cua không có công thức -> chỉ có bia
      expect(recipe.first.ingredientId, 'ing-bia');
      expect(recipe.first.quantity, 2.0); // 2 lon bia
    });

    test('Gộp trùng nguyên liệu giữa các món con', () {
      final monA = item('a', 'Mực xào', 100000, recipe: [
        RestaurantRecipeItem()
          ..ingredientId = 'ing-muc'
          ..ingredientName = 'Mực'
          ..quantity = 0.3,
      ]);
      final monB = item('b', 'Mực nướng', 120000, recipe: [
        RestaurantRecipeItem()
          ..ingredientId = 'ing-muc'
          ..ingredientName = 'Mực'
          ..quantity = 0.2,
      ]);
      final combo = item('combo2', 'Combo mực', 200000,
          isCombo: true,
          comboItems: [
            RestaurantComboItem()..itemId = 'a'..quantity = 1,
            RestaurantComboItem()..itemId = 'b'..quantity = 1,
          ]);

      final recipe =
          RestaurantBusinessLogic.computeComboRecipe(combo, [monA, monB]);
      expect(recipe.single.quantity, closeTo(0.5, 0.0001));
    });

    test('Không phải combo -> giữ nguyên công thức', () {
      final mon = item('x', 'Lẩu', 385000, recipe: [
        RestaurantRecipeItem()
          ..ingredientId = 'i'
          ..ingredientName = 'X'
          ..quantity = 0.3,
      ]);
      expect(RestaurantBusinessLogic.computeComboRecipe(mon, [mon]).single
          .quantity, 0.3);
    });
  });

  group('XX. Khuyến mãi', () {
    final details = [
      detail('lau', 'Lẩu Thái', 385000, 1),
      detail('bia', 'Bia Tiger', 22000, 4),
    ];
    final subtotal = 385000 + 4 * 22000.0;

    test('Giảm % đúng và làm tròn 100đ', () {
      final promo = RestaurantPromotion()
        ..name = 'Happy Hour'
        ..type = RestaurantPromotionType.PERCENT
        ..value = 20;
      // subtotal = 473.000đ -> 20% = 94.600 -> floor về bội 100 = 94.600
      final d = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo, subtotal: subtotal, details: details);
      expect(d, 94600);
      // Làm tròn xuống bội số 100
      final dOdd = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo,
          subtotal: 99999,
          details: [detail('x', 'X', 99999, 1)]);
      expect(dOdd, (99999 * 0.2) ~/ 100 * 100);
    });

    test('Giảm tiền mặt không vượt tạm tính', () {
      final promo = RestaurantPromotion()
        ..type = RestaurantPromotionType.FIXED_AMOUNT
        ..value = 50000;
      expect(
          RestaurantBusinessLogic.calculateDiscount(
              promotion: promo, subtotal: subtotal, details: details),
          50000);

      final bigPromo = RestaurantPromotion()
        ..type = RestaurantPromotionType.FIXED_AMOUNT
        ..value = 999999999;
      expect(
          RestaurantBusinessLogic.calculateDiscount(
              promotion: bigPromo, subtotal: subtotal, details: details),
          subtotal);
    });

    test('Happy Hour ngoài khung giờ -> không giảm', () {
      final promo = RestaurantPromotion()
        ..type = RestaurantPromotionType.PERCENT
        ..value = 20
        ..happyHourStartMinute = 17 * 60
        ..happyHourEndMinute = 19 * 60;
      // 10:00 sáng -> ngoài khung
      final d = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo,
          subtotal: subtotal,
          details: details,
          now: DateTime(2026, 8, 23, 10, 0));
      expect(d, 0);
      // 18:00 -> trong khung
      final d2 = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo,
          subtotal: subtotal,
          details: details,
          now: DateTime(2026, 8, 23, 18, 0));
      expect(d2, greaterThan(0));
    });

    test('Khung giờ quá nửa đêm (22h -> 2h)', () {
      final promo = RestaurantPromotion()
        ..type = RestaurantPromotionType.PERCENT
        ..value = 10
        ..happyHourStartMinute = 22 * 60
        ..happyHourEndMinute = 2 * 60;
      expect(
        RestaurantBusinessLogic.isPromotionActive(
            promo, DateTime(2026, 8, 23, 23, 30)),
        isTrue,
      );
      expect(
        RestaurantBusinessLogic.isPromotionActive(
            promo, DateTime(2026, 8, 23, 1, 30)),
        isTrue,
      );
      expect(
        RestaurantBusinessLogic.isPromotionActive(
            promo, DateTime(2026, 8, 23, 12, 0)),
        isFalse,
      );
    });

    test('Mua 2 tặng 1 nước ép cam', () {
      final epCam = detail('epcam', 'Nước ép cam', 45000, 5);
      final promo = RestaurantPromotion()
        ..type = RestaurantPromotionType.BUY_X_GET_Y
        ..buyQty = 2
        ..getQty = 1
        ..itemId = 'epcam'
        ..itemName = 'Nước ép cam';

      // 5 ly: nhóm đủ điều kiện = 5 ~/= 3 = 1 nhóm -> tặng 1 ly
      final d = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo, subtotal: 225000, details: [epCam]);
      expect(d, 45000);

      // Chỉ 2 ly -> chưa đủ nhóm 3 -> không tặng
      final d2 = RestaurantBusinessLogic.calculateDiscount(
          promotion: promo,
          subtotal: 90000,
          details: [detail('epcam', 'Nước ép cam', 45000, 2)]);
      expect(d2, 0);
    });
  });

  group('XVIII. Thu ngân - thanh toán kết hợp', () {
    test('Tổng tiền thu & tiền thừa', () {
      final pays = [
        RestaurantOrderPayment()
          ..method = RestaurantPaymentMethod.CARD
          ..amount = 300000,
        RestaurantOrderPayment()
          ..method = RestaurantPaymentMethod.CASH
          ..amount = 100000,
      ];
      expect(RestaurantBusinessLogic.totalPaid(pays), 400000);
      expect(
        RestaurantBusinessLogic.changeDue(finalAmount: 373000, payments: pays),
        27000,
      );
      expect(
        RestaurantBusinessLogic.changeDue(finalAmount: 500000, payments: pays),
        -100000,
      );
    });

    test('Hợp lệ khi trả đủ, không hợp lệ khi trả thiếu', () {
      final pays = [
        RestaurantOrderPayment()
          ..method = RestaurantPaymentMethod.QR
          ..amount = 200000,
      ];
      expect(
        RestaurantBusinessLogic.isPaymentSufficient(
            finalAmount: 200000, payments: pays),
        isTrue,
      );
      expect(
        RestaurantBusinessLogic.isPaymentSufficient(
            finalAmount: 250000, payments: pays),
        isFalse,
      );
    });
  });

  test('XV. Tích điểm: mỗi 10.000đ = 1 điểm', () {
    expect(RestaurantBusinessLogic.pointsEarnedFor(473000), 47);
    expect(RestaurantBusinessLogic.pointsEarnedFor(9999), 0);
    expect(RestaurantBusinessLogic.pointsEarnedFor(0), 0);
  });

  group('XVI. POS - tính tiền & thao tác hóa đơn', () {
    test('Tính lại tổng từ danh sách món', () {
      final d = [
        detail('a', 'A', 50000, 2),
        detail('b', 'B', 15000, 3),
      ];
      expect(RestaurantBusinessLogic.recalculateTotal(d), 145000);
      expect(RestaurantBusinessLogic.recalculateTotal([]), 0);
    });

    test('Chuyển bàn: chặn khi bàn đích đang có order khác', () {
      final otherOrder = RestaurantOrder()..orderId = 'order-2';
      expect(
        RestaurantBusinessLogic.canTransferToTable(
            newTableActiveOrder: otherOrder, currentOrderId: 'order-1'),
        isFalse,
      );
      expect(
        RestaurantBusinessLogic.canTransferToTable(
            newTableActiveOrder: null, currentOrderId: 'order-1'),
        isTrue,
      );
      // Tự chuyển về chính order cũ vẫn hợp lệ
      final sameOrder = RestaurantOrder()..orderId = 'order-1';
      expect(
        RestaurantBusinessLogic.canTransferToTable(
            newTableActiveOrder: sameOrder, currentOrderId: 'order-1'),
        isTrue,
      );
    });

    test('XIX. Tách hóa đơn theo mã món đã chọn', () {
      final all = [
        detail('a', 'A', 50000, 2),
        detail('b', 'B', 15000, 1),
        detail('c', 'C', 22000, 3),
      ];
      final (kept, moved) = RestaurantBusinessLogic.splitDetails(
          all, {'d-b-', 'd-c-'});
      expect(moved.map((d) => d.itemId), ['b', 'c']);
      expect(kept.map((d) => d.itemId), ['a']);
      // Không cho tách hết
      final (_, movedAll) =
          RestaurantBusinessLogic.splitDetails(all, {'d-a-', 'd-b-', 'd-c-'});
      expect(movedAll.length, 3);
    });

    test('XIX. Gộp bàn: cộng số lượng món trùng đang chờ nấu', () {
      final source = RestaurantOrder()
        ..orderId = 'src'
        ..details = [
          detail('bia', 'Bia Tiger', 22000, 2),
          detail('lau', 'Lẩu', 385000, 1, note: 'Ít cay'),
        ];
      final target = RestaurantOrder()
        ..orderId = 'tgt'
        ..discountAmount = 50000
        ..totalAmount = 100000
        ..details = [
          detail('bia', 'Bia Tiger', 22000, 3),
          detail('com', 'Cơm trắng', 15000, 2),
        ];

      RestaurantBusinessLogic.mergeDetails(source: source, target: target);

      expect(target.details.length, 3);
      final bia = target.details.firstWhere((d) => d.itemId == 'bia');
      expect(bia.quantity, 5); // 3 + 2 gộp
      final lau = target.details.firstWhere((d) => d.itemId == 'lau');
      expect(lau.note, 'Ít cay');
      expect(target.totalAmount,
          RestaurantBusinessLogic.recalculateTotal(target.details));
    });

    test('finalAmount = tổng - giảm giá', () {
      final o = RestaurantOrder()
        ..totalAmount = 500000
        ..discountAmount = 50000;
      expect(o.finalAmount, 450000);
    });
  });
}

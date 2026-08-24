import 'package:uuid/uuid.dart';
import 'restaurant_isar_service.dart';
import 'restaurant_business_logic.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_inventory_models.dart';
import '../models/restaurant_reservation.dart';
import '../models/restaurant_promotion.dart';
import '../models/restaurant_partner_models.dart';
import '../models/restaurant_expense_model.dart';

/// Bộ dữ liệu mẫu đầy đủ theo PRD nhahang.md:
/// Khu vực/Bàn - Nguyên liệu - Thực đơn (Hải sản, Đồ rừng, Bò, Gà, Heo, Cá,
/// Lẩu, Nướng, Chiên, Xào, Cơm, Mì, Cháo, Rau, Tráng miệng) - Đồ uống
/// (Bia, Rượu, Vang, Nước ngọt, Nước suối, Nước ép, Sinh tố, Cafe) -
/// Combo - Khuyến mãi - Khách hàng - Nhà cung cấp - Chi phí - Đặt bàn -
/// Hóa đơn trải đều 30 ngày để test báo cáo.
class RestaurantSeedData {
  static Future<void> seedIfEmpty(RestaurantIsarService isarService) async {
    final db = await isarService.db;
    final tableCount = await db.restaurantTables.count();
    if (tableCount > 0) return;

    await db.writeTxn(() async {
      final now = DateTime.now();

      // ============ XII. KHO NGUYÊN LIỆU ============
      final ing = <String, RestaurantIngredient>{};
      void ingredient(String name, String unit, double stock) {
        ing[name] = RestaurantIngredient()
          ..ingredientId = const Uuid().v4()
          ..name = name
          ..unit = unit
          ..stock = stock;
      }

      // Thịt / Đồ rừng
      ingredient('Heo rừng', 'Kg', 25);
      ingredient('Nai', 'Kg', 12);
      ingredient('Gà rừng', 'Kg', 18);
      ingredient('Dúi', 'Kg', 8);
      ingredient('Chồn', 'Kg', 6);
      ingredient('Chim', 'Con', 30);
      ingredient('Thỏ', 'Kg', 10);
      ingredient('Bò Mỹ', 'Kg', 20);
      ingredient('Bò Úc', 'Kg', 15);
      ingredient('Gà ta', 'Con', 25);
      ingredient('Heo quay', 'Kg', 12);
      // Hải sản
      ingredient('Tôm hùm', 'Con', 15);
      ingredient('Cua Cà Mau', 'Con', 20);
      ingredient('Ghẹ', 'Kg', 22);
      ingredient('Mực', 'Kg', 18);
      ingredient('Bạch tuộc', 'Kg', 10);
      ingredient('Hàu', 'Con', 60);
      ingredient('Sò huyết', 'Kg', 14);
      ingredient('Cá mú', 'Kg', 16);
      ingredient('Cá chình', 'Kg', 9);
      ingredient('Cá bóp', 'Kg', 8);
      // Rau & Gia vị
      ingredient('Rau ăn kèm', 'Kg', 20);
      ingredient('Rau muống', 'Kg', 15);
      ingredient('Gia vị lẩu', 'Gói', 50);
      ingredient('Sa tế', 'Hũ', 10);
      // Đồ uống
      ingredient('Bia Tiger Nâu', 'Lon', 240);
      ingredient('Bia Heineken', 'Lon', 180);
      ingredient('Bia Larue', 'Lon', 120);
      ingredient('Bia Sài Gòn', 'Lon', 120);
      ingredient('Budweiser', 'Lon', 60);
      ingredient('Chivas 18', 'Chai', 8);
      ingredient('Ballantines', 'Chai', 6);
      ingredient('Hennessy', 'Chai', 4);
      ingredient('Johnnie Walker Red', 'Chai', 7);
      ingredient('Vang Chile', 'Chai', 15);
      ingredient('Vang Pháp', 'Chai', 10);
      ingredient('Vang Ý', 'Chai', 8);
      ingredient('Nước ngọt', 'Lon', 150);
      ingredient('Nước suối', 'Chai', 100);
      ingredient('Cam tươi', 'Kg', 20);
      ingredient('Xoài', 'Kg', 12);
      ingredient('Dưa hấu', 'Kg', 18);
      ingredient('Sinh tố bơ', 'Phần nguyên liệu', 40);
      ingredient('Cafe rang xay', 'Kg', 5);
      // Vật tư
      ingredient('Đá viên', 'Kg', 200);
      ingredient('Gas', 'Bình', 6);
      ingredient('Than củi', 'Kg', 80);
      await db.restaurantIngredients.putAll(ing.values.toList());

      RestaurantRecipeItem r(String name, double qty) =>
          RestaurantRecipeItem()
            ..ingredientId = ing[name]!.ingredientId
            ..ingredientName = name
            ..quantity = qty;

      // ============ IV/V. KHU VỰC + BÀN ============
      final tables = <RestaurantTable>[];
      void t(String name, String zone, int capacity,
          [RestaurantTableStatus st = RestaurantTableStatus.EMPTY]) {
        tables.add(RestaurantTable()
          ..tableId = const Uuid().v4()
          ..name = name
          ..zone = zone
          ..capacity = capacity
          ..status = st);
      }

      for (int i = 1; i <= 5; i++) {
        t('Bàn ${i.toString().padLeft(2, '0')}', 'Tầng 1', i <= 2 ? 4 : 6);
      }
      t('Bàn T2-01', 'Tầng 2', 8);
      t('Bàn T2-02', 'Tầng 2', 6);
      t('Bàn T2-03', 'Tầng 2', 4);
      t('Bàn SV01', 'Sân vườn', 8);
      t('Bàn SV02', 'Sân vườn', 6);
      t('Bàn SV03', 'Sân vườn', 10);
      t('Bàn VIP1', 'VIP', 10);
      t('Bàn VIP2', 'VIP', 12);
      t('Phòng lạnh 1', 'Phòng lạnh', 10);
      t('Phòng lạnh 2', 'Phòng lạnh', 8);
      t('Bàn NT01', 'Ngoài trời', 4);
      await db.restaurantTables.putAll(tables);

      final tableByName = {for (final tb in tables) tb.name: tb};

      // ============ VII/VIII/IX/X. THỰC ĐƠN + COMBO ============
      RestaurantMenuItem mi(
        String name,
        String category,
        double price,
        String unit, {
        List<RestaurantRecipeItem>? recipe,
        String barcode = '',
        String description = '',
      }) =>
          RestaurantMenuItem()
            ..itemId = const Uuid().v4()
            ..barcode = barcode
            ..name = name
            ..category = category
            ..price = price
            ..unit = unit
            ..recipe = recipe ?? []
            ..description = description;

      final menu = <RestaurantMenuItem>[
        // ---- Hải sản ----
        mi('Tôm hùm nướng phô mai', 'Hải sản', 1250000, 'Con',
            recipe: [r('Tôm hùm', 1), r('Than củi', 0.5)],
            barcode: '8934563000011'),
        mi('Cua Cà Mau hấp', 'Hải sản', 650000, 'Con',
            recipe: [r('Cua Cà Mau', 1)], barcode: '8934563000028'),
        mi('Ghẹ hấp sả', 'Hải sản', 420000, 'Kg',
            recipe: [r('Ghẹ', 1)]),
        mi('Mực sữa chiên mắm', 'Hải sản', 165000, 'Đĩa',
            recipe: [r('Mực', 0.3)]),
        mi('Bạch tuộc nướng', 'Hải sản', 220000, 'Đĩa',
            recipe: [r('Bạch tuộc', 0.4), r('Than củi', 0.3)]),
        mi('Hàu nướng phô mai', 'Hải sản', 28000, 'Con',
            recipe: [r('Hàu', 1), r('Than củi', 0.1)]),
        mi('Sò huyết tái chanh', 'Hải sản', 35000, 'Con',
            recipe: [r('Sò huyết', 0.05)]),
        mi('Cá mú hấp gừng', 'Hải sản', 480000, 'Kg',
            recipe: [r('Cá mú', 1)]),
        mi('Cá chình nướng muối ớt', 'Hải sản', 550000, 'Kg',
            recipe: [r('Cá chình', 1), r('Than củi', 0.6)]),
        mi('Cá bóp trộn thính', 'Hải sản', 260000, 'Đĩa',
            recipe: [r('Cá bóp', 0.3)]),
        // ---- Đồ rừng ----
        mi('Heo rừng xào lăn', 'Đồ rừng', 210000, 'Đĩa',
            recipe: [r('Heo rừng', 0.25)]),
        mi('Heo rừng nướng muối ớt', 'Đồ rừng', 230000, 'Đĩa',
            recipe: [r('Heo rừng', 0.3), r('Than củi', 0.4)]),
        mi('Nai nướng lá lốt', 'Đồ rừng', 250000, 'Đĩa',
            recipe: [r('Nai', 0.25)]),
        mi('Gà rừng nướng muối', 'Đồ rừng', 320000, 'Con',
            recipe: [r('Gà rừng', 0.8), r('Than củi', 0.5)]),
        mi('Dúi rô ti', 'Đồ rừng', 280000, 'Đĩa',
            recipe: [r('Dúi', 0.4)]),
        mi('Chồn hấp sả', 'Đồ rừng', 350000, 'Đĩa',
            recipe: [r('Chồn', 0.5)]),
        mi('Chim quay', 'Đồ rừng', 45000, 'Con',
            recipe: [r('Chim', 1)]),
        mi('Thỏ nướng chấm chẩm chéo', 'Đồ rừng', 290000, 'Đĩa',
            recipe: [r('Thỏ', 0.4)]),
        // ---- Bò ----
        mi('Bò Mỹ nướng', 'Bò', 395000, 'Đĩa',
            recipe: [r('Bò Mỹ', 0.25), r('Đá viên', 0.2)]),
        mi('Bò Úc lắc', 'Bò', 295000, 'Đĩa',
            recipe: [r('Bò Úc', 0.2)]),
        mi('Wagyu sukiyaki', 'Bò', 890000, 'Đĩa',
            recipe: [r('Bò Mỹ', 0.15)]),
        // ---- Gà / Heo ----
        mi('Gà ta luộc lá chanh', 'Gà', 280000, 'Con',
            recipe: [r('Gà ta', 1)]),
        mi('Gà chiên mắm', 'Gà', 260000, 'Con',
            recipe: [r('Gà ta', 1)]),
        mi('Heo quay da giòn', 'Heo', 195000, 'Đĩa',
            recipe: [r('Heo quay', 0.3)]),
        // ---- Cá ----
        mi('Cá kho tộ', 'Cá', 185000, 'Nồi',
            recipe: [r('Cá mú', 0.35)]),
        mi('Cá chiên xù sốt chanh dây', 'Cá', 175000, 'Con',
            recipe: [r('Cá bóp', 0.4)]),
        // ---- Lẩu ----
        mi('Lẩu Thái Hải Sản', 'Lẩu', 385000, 'Nồi',
            recipe: [
              r('Mực', 0.3),
              r('Sò huyết', 0.5),
              r('Rau ăn kèm', 0.4),
              r('Gia vị lẩu', 1),
            ],
            description: 'Lẩu thái chua cay hải sản'),
        mi('Lẩu bò Mỹ', 'Lẩu', 425000, 'Nồi',
            recipe: [r('Bò Mỹ', 0.3), r('Rau ăn kèm', 0.4), r('Gia vị lẩu', 1)]),
        mi('Lẩu gà nấm', 'Lẩu', 315000, 'Nồi',
            recipe: [r('Gà ta', 1), r('Rau ăn kèm', 0.3), r('Gia vị lẩu', 1)]),
        // ---- Nướng ----
        mi('Sườn nướng chao', 'Nướng', 145000, 'Đĩa',
            recipe: [r('Heo rừng', 0.2), r('Than củi', 0.3)]),
        mi('Mực nhồi thịt nướng', 'Nướng', 195000, 'Đĩa',
            recipe: [r('Mực', 0.3), r('Than củi', 0.3)]),
        // ---- Chiên ----
        mi('Nem rán Hà Nội', 'Chiên', 65000, 'Phần'),
        mi('Chả giò hải sản', 'Chiên', 85000, 'Phần',
            recipe: [r('Mực', 0.1)]),
        // ---- Xào ----
        mi('Rau muống xào tỏi', 'Xào', 45000, 'Đĩa',
            recipe: [r('Rau muống', 0.3)]),
        mi('Bò xào cần tỏi', 'Xào', 155000, 'Đĩa',
            recipe: [r('Bò Mỹ', 0.15)]),
        // ---- Cơm / Mì / Cháo ----
        mi('Cơm trắng', 'Cơm', 15000, 'Tô'),
        mi('Cơm chiên hải sản', 'Cơm', 95000, 'Phần',
            recipe: [r('Mực', 0.08)]),
        mi('Cơm cháy chà bông', 'Cơm', 75000, 'Đĩa'),
        mi('Mì xào hải sản', 'Mì', 105000, 'Phần',
            recipe: [r('Mực', 0.1)]),
        mi('Cháo hải sản', 'Cháo', 85000, 'Tô',
            recipe: [r('Mực', 0.06)]),
        mi('Cháo gà', 'Cháo', 65000, 'Tô',
            recipe: [r('Gà ta', 0.2)]),
        // ---- Tráng miệng ----
        mi('Trái cây dĩa', 'Tráng miệng', 85000, 'Dĩa',
            recipe: [r('Dưa hấu', 0.5), r('Xoài', 0.3)]),
        mi('Chè Thái', 'Tráng miệng', 35000, 'Ly'),

        // ---- Bia ----
        mi('Bia Tiger Nâu', 'Bia', 22000, 'Lon',
            recipe: [r('Bia Tiger Nâu', 1)],
            barcode: '8934637001234'),
        mi('Bia Tiger Bạc', 'Bia', 25000, 'Lon',
            recipe: [r('Bia Tiger Nâu', 1)],
            barcode: '8934637001241'),
        mi('Bia Heineken', 'Bia', 28000, 'Lon',
            recipe: [r('Bia Heineken', 1)],
            barcode: '8710398501102'),
        mi('Bia Larue', 'Bia', 18000, 'Lon',
            recipe: [r('Bia Larue', 1)]),
        mi('Bia Sài Gòn', 'Bia', 17000, 'Lon',
            recipe: [r('Bia Sài Gòn', 1)]),
        mi('Budweiser', 'Bia', 35000, 'Lon',
            recipe: [r('Budweiser', 1)]),
        // ---- Rượu ----
        mi('Chivas 18', 'Rượu', 1450000, 'Chai',
            recipe: [r('Chivas 18', 1)]),
        mi('Ballantines 21', 'Rượu', 1850000, 'Chai',
            recipe: [r('Ballantines', 1)]),
        mi('Hennessy VSOP', 'Rượu', 2450000, 'Chai',
            recipe: [r('Hennessy', 1)]),
        mi('Johnnie Walker Red', 'Rượu', 680000, 'Chai',
            recipe: [r('Johnnie Walker Red', 1)]),
        // ---- Vang ----
        mi('Vang Chile Reserva', 'Vang', 420000, 'Chai',
            recipe: [r('Vang Chile', 1)]),
        mi('Vang Pháp Bordeaux', 'Vang', 780000, 'Chai',
            recipe: [r('Vang Pháp', 1)]),
        mi('Vang Ý Chianti', 'Vang', 650000, 'Chai',
            recipe: [r('Vang Ý', 1)]),
        // ---- Nước ngọt / suối ----
        mi('Coca / Sprite / Sting', 'Nước ngọt', 15000, 'Lon',
            recipe: [r('Nước ngọt', 1)]),
        mi('Nước dừa xiêm', 'Nước ngọt', 35000, 'Quả'),
        mi('Aquafina 500ml', 'Nước suối', 12000, 'Chai',
            recipe: [r('Nước suối', 1)]),
        mi('Lavie 500ml', 'Nước suối', 10000, 'Chai',
            recipe: [r('Nước suối', 1)]),
        // ---- Nước ép / Sinh tố ----
        mi('Nước ép cam', 'Nước ép', 45000, 'Ly',
            recipe: [r('Cam tươi', 0.3)]),
        mi('Nước ép xoài', 'Nước ép', 45000, 'Ly',
            recipe: [r('Xoài', 0.25)]),
        mi('Nước ép dưa hấu', 'Nước ép', 40000, 'Ly',
            recipe: [r('Dưa hấu', 0.3)]),
        mi('Sinh tố bơ', 'Sinh tố', 50000, 'Ly',
            recipe: [r('Sinh tố bơ', 1)]),
        mi('Sinh tố xoài', 'Sinh tố', 45000, 'Ly',
            recipe: [r('Xoài', 0.3)]),
        // ---- Cafe ----
        mi('Cafe đen', 'Cafe', 30000, 'Ly',
            recipe: [r('Cafe rang xay', 0.02)]),
        mi('Cafe sữa đá', 'Cafe', 35000, 'Ly',
            recipe: [r('Cafe rang xay', 0.02)]),
        mi('Bạc xỉu', 'Cafe', 35000, 'Ly',
            recipe: [r('Cafe rang xay', 0.02)]),

        // ---- X. COMBO ----
        mi('Combo Hải Sản 2 người', 'Combo', 795000, 'Combo',
            description: '1 Cua Cà Mau hấp + 1 Ghẹ hấp sả + 2 Bia Tiger Nâu'),
        mi('Combo Gia Đình 4 người', 'Combo', 1250000, 'Combo',
            description:
                '1 Lẩu Thái Hải Sản + Heo rừng xào lăn + Cơm chiên + 4 nước ngọt'),
        mi('Combo Sinh Nhật', 'Combo', 1490000, 'Combo',
            description:
                'Vang Chile + Tôm hùm phô mai + Trái cây dĩa + 2 nước ép cam'),
      ];
      await db.restaurantMenuItems.putAll(menu);

      // Combo cần gắn món con + recipe tổng hợp từ công thức các món con.
      final menuByName = {for (final m in menu) m.name: m};
      String comboChild(String comboName, String childName, int qty) {
        final c = menuByName[comboName]!;
        final child = menuByName[childName]!;
        c.comboItems.add(RestaurantComboItem()
          ..itemId = child.itemId
          ..itemName = childName
          ..quantity = qty);
        return child.itemId;
      }

      final comboHS = menuByName['Combo Hải Sản 2 người']!;
      comboChild(comboHS.name, 'Cua Cà Mau hấp', 1);
      comboChild(comboHS.name, 'Ghẹ hấp sả', 1);
      comboChild(comboHS.name, 'Bia Tiger Nâu', 2);

      final comboGD = menuByName['Combo Gia Đình 4 người']!;
      comboChild(comboGD.name, 'Lẩu Thái Hải Sản', 1);
      comboChild(comboGD.name, 'Heo rừng xào lăn', 1);
      comboChild(comboGD.name, 'Cơm chiên hải sản', 1);
      comboChild(comboGD.name, 'Coca / Sprite / Sting', 4);

      final comboSN = menuByName['Combo Sinh Nhật']!;
      comboChild(comboSN.name, 'Vang Chile Reserva', 1);
      comboChild(comboSN.name, 'Tôm hùm nướng phô mai', 1);
      comboChild(comboSN.name, 'Trái cây dĩa', 1);
      comboChild(comboSN.name, 'Nước ép cam', 2);

      // Sửa công thức Lẩu Thái: bỏ dòng tôm hùm quantity=0 (đặt nhầm)
      menuByName['Lẩu Thái Hải Sản']!.recipe.removeWhere((x) => x.quantity <= 0);

      for (final combo in [comboHS, comboGD, comboSN]) {
        combo.isCombo = true;
        combo.recipe =
            RestaurantBusinessLogic.computeComboRecipe(combo, menu);
      }
      await db.restaurantMenuItems.putAll([comboHS, comboGD, comboSN]);
      await db.restaurantMenuItems.put(menuByName['Lẩu Thái Hải Sản']!);

      // ============ XX. KHUYẾN MÃI ============
      final promos = [
        RestaurantPromotion()
          ..promoId = const Uuid().v4()
          ..name = 'Happy Hour Bia giảm 20% (17h-19h)'
          ..type = RestaurantPromotionType.PERCENT
          ..value = 20
          ..happyHourStartMinute = 17 * 60
          ..happyHourEndMinute = 19 * 60
          ..isActive = true,
        RestaurantPromotion()
          ..promoId = const Uuid().v4()
          ..name = 'Voucher giảm 50.000đ'
          ..type = RestaurantPromotionType.FIXED_AMOUNT
          ..value = 50000
          ..isActive = true,
        RestaurantPromotion()
          ..promoId = const Uuid().v4()
          ..name = 'Mua 2 tặng 1 Nước ép cam'
          ..type = RestaurantPromotionType.BUY_X_GET_Y
          ..buyQty = 2
          ..getQty = 1
          ..itemId = menuByName['Nước ép cam']!.itemId
          ..itemName = 'Nước ép cam'
          ..isActive = true,
      ];
      await db.restaurantPromotions.putAll(promos);

      // ============ XV. KHÁCH HÀNG ============
      final customers = [
        RestaurantCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Nguyễn Văn An'
          ..phone = '0903123456'
          ..points = 120
          ..birthday = DateTime(now.year - 1, 5, 15),
        RestaurantCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Trần Thị Bình'
          ..phone = '0918765432'
          ..points = 45
          ..debt = 250000
          ..birthday = DateTime(now.year - 1, 8, 30),
        RestaurantCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Lê Hoàng Cường'
          ..phone = '0972111222'
          ..points = 10,
        RestaurantCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Phạm Minh Đức'
          ..phone = '0988333444'
          ..points = 300
          ..hasVoucher = true
          ..voucherValue = 100000
          ..birthday = DateTime(now.year - 1, 1, 20),
        RestaurantCustomer()
          ..customerId = const Uuid().v4()
          ..name = 'Đỗ Thị Em'
          ..phone = '0977555666'
          ..points = 60
          ..debt = 180000,
      ];
      await db.restaurantCustomers.putAll(customers);

      // ============ XIV. NHÀ CUNG CẤP ============
      await db.restaurantSuppliers.putAll([
        RestaurantSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Hải sản Phú Quốc'
          ..phone = '0913777888'
          ..address = 'Q.1, TP.HCM'
          ..taxCode = '0301122334'
          ..debt = 15500000,
        RestaurantSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Bia Sài Gòn - AlcoBev'
          ..phone = '0912444555'
          ..address = 'Q.Tân Bình, TP.HCM'
          ..taxCode = '0305566778'
          ..debt = 42000000,
        RestaurantSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Rau củ Đà Lạt'
          ..phone = '0971333444'
          ..address = 'Đà Lạt, Lâm Đồng'
          ..taxCode = '5801122999'
          ..debt = 0,
        RestaurantSupplier()
          ..supplierId = const Uuid().v4()
          ..name = 'Đồ rừng Tây Nguyên'
          ..phone = '0905999000'
          ..address = 'Buôn Ma Thuột, Đắk Lắk'
          ..taxCode = '6001199887'
          ..debt = 8200000,
      ]);

      // ============ XXV. CHI PHÍ THÁNG NÀY ============
      RestaurantExpense exp(RestaurantExpenseCategory cat, double amount,
              String note, int dayOffset) =>
          RestaurantExpense()
            ..expenseId = const Uuid().v4()
            ..category = cat
            ..amount = amount
            ..note = note
            ..createdAt =
                DateTime(now.year, now.month, now.day).subtract(Duration(days: dayOffset));
      await db.restaurantExpenses.putAll([
        exp(RestaurantExpenseCategory.RENT, 30000000, 'Thuê mặt bằng tháng này', 10),
        exp(RestaurantExpenseCategory.SALARY, 45000000, 'Lương nhân viên kỳ 1', 5),
        exp(RestaurantExpenseCategory.ELECTRICITY, 6500000, 'Tiền điện kỳ trước', 8),
        exp(RestaurantExpenseCategory.WATER, 2200000, 'Tiền nước kỳ trước', 8),
        exp(RestaurantExpenseCategory.GAS, 3800000, 'Đổi gas công nghiệp x2', 4),
        exp(RestaurantExpenseCategory.OTHER, 2400000, 'Mua than củi nướng', 2),
        exp(RestaurantExpenseCategory.INTERNET, 900000, 'Wifi + camera', 12),
        exp(RestaurantExpenseCategory.MARKETING, 5000000, 'Booking + Facebook Ads', 6),
        exp(RestaurantExpenseCategory.DEPRECIATION, 4000000, 'Khấu hao máy POS, tủ đông', 1),
        exp(RestaurantExpenseCategory.TAX, 7000000, 'Thuế môn bài + VAT quý', 3),
      ]);

      // ============ VI. ĐẶT BÀN ============
      DateTime todayAt(int hour, int minute) =>
          DateTime(now.year, now.month, now.day, hour, minute);

      final vip1 = tableByName['Bàn VIP1']!;
      final res1 = RestaurantReservation()
        ..reservationId = const Uuid().v4()
        ..tableId = vip1.tableId
        ..tableName = vip1.name
        ..customerName = 'Nguyễn Thị Bích'
        ..phone = '0908888999'
        ..time = todayAt(19, 0)
        ..guests = 10
        ..deposit = 500000
        ..note = 'Sinh nhật, cần bánh kem và loa nhạc'
        ..status = RestaurantReservationStatus.BOOKED;

      final pl1 = tableByName['Phòng lạnh 1']!;
      final res2 = RestaurantReservation()
        ..reservationId = const Uuid().v4()
        ..tableId = pl1.tableId
        ..tableName = pl1.name
        ..customerName = 'Trần Văn Cường'
        ..phone = '0977111000'
        ..time = todayAt(11, 30)
        ..guests = 8
        ..deposit = 300000
        ..note = 'Tiệc tất thiệp công ty'
        ..status = RestaurantReservationStatus.BOOKED;
      await db.restaurantReservations.putAll([res1, res2]);
      vip1.status = RestaurantTableStatus.RESERVED; // đặt tối nay -> đánh dấu

      // Trạng thái bàn ban đầu cho demo
      tableByName['Bàn 04']!.status = RestaurantTableStatus.CLEANING;
      await db.restaurantTables.putAll(tables);

      // ============ XIII. PHIẾU NHẬP KHO ĐẦU KỲ ============
      final importTxs = <RestaurantInventoryTx>[];
      for (final i in ing.values) {
        importTxs.add(RestaurantInventoryTx()
          ..ingredientId = i.ingredientId
          ..ingredientName = i.name
          ..quantity = i.stock
          ..type = RestaurantInventoryTxType.IMPORT
          ..note = 'Nhập kho đầu kỳ'
          ..createdAt = now.subtract(const Duration(days: 5)));
      }
      await db.restaurantInventoryTxs.putAll(importTxs);

      // ============ XVI/XVIII. HÓA ĐƠN MẪU ============
      final orders = <RestaurantOrder>[];

      RestaurantOrderDetail detail(RestaurantMenuItem item, int qty,
              {String note = '',
              RestaurantOrderItemStatus status = RestaurantOrderItemStatus.DONE}) =>
          RestaurantOrderDetail()
            ..detailId = const Uuid().v4()
            ..itemId = item.itemId
            ..itemName = item.name
            ..price = item.price
            ..quantity = qty
            ..note = note
            ..status = status;

      void addOrder({
        required RestaurantTable? table,
        required DateTime createdAt,
        DateTime? closedAt,
        List<RestaurantOrderDetail> details = const [],
        RestaurantOrderStatus status = RestaurantOrderStatus.COMPLETED,
        List<RestaurantOrderPayment> payments = const [],
        double discountAmount = 0,
        String promotionName = '',
        RestaurantCustomer? customer,
      }) {
        final o = RestaurantOrder()
          ..orderId = const Uuid().v4()
          ..createdAt = createdAt
          ..closedAt = closedAt
          ..details = List.from(details)
          ..status = status
          ..payments = List.from(payments)
          ..discountAmount = discountAmount
          ..promotionName = promotionName;
        if (customer != null) {
          o.customerId = customer.customerId;
          o.customerName = customer.name;
          o.customerPhone = customer.phone;
        }
        o.totalAmount =
            o.details.fold<double>(0, (sum, d) => sum + d.price * d.quantity);
        if (status == RestaurantOrderStatus.COMPLETED && customer != null) {
          o.earnedPoints = (o.totalAmount / 10000).floor();
        }
        if (table != null) o.table.value = table;
        orders.add(o);
      }

      final lauThai = menuByName['Lẩu Thái Hải Sản']!;
      final tiger = menuByName['Bia Tiger Nâu']!;
      final heineken = menuByName['Bia Heineken']!;
      final heoRung = menuByName['Heo rừng xào lăn']!;
      final mucSua = menuByName['Mực sữa chiên mắm']!;
      final epCam = menuByName['Nước ép cam']!;
      final comTrang = menuByName['Cơm trắng']!;
      final rauMuong = menuByName['Rau muống xào tỏi']!;
      final boMy = menuByName['Bò Mỹ nướng']!;
      final tomHum = menuByName['Tôm hùm nướng phô mai']!;
      final comboHSItem = comboHS;
      final vangChile = menuByName['Vang Chile Reserva']!;

      // --- Hóa đơn 30 ngày qua (test báo cáo doanh thu/tháng/năm, top món) ---
      final payCycle = [
        [RestaurantPaymentMethod.CASH],
        [RestaurantPaymentMethod.QR],
        [RestaurantPaymentMethod.CARD],
        [RestaurantPaymentMethod.E_WALLET],
        [RestaurantPaymentMethod.BANK_TRANSFER],
      ];
      final lunchSet = [
        [lauThai, comTrang, rauMuong],
        [heoRung, tiger, comTrang],
        [boMy, heineken, rauMuong],
        [comboHSItem],
        [mucSua, tiger, comTrang, epCam],
      ];
      final dinnerSet = [
        [tomHum, tiger, tiger, tiger],
        [menuByName['Combo Gia Đình 4 người']!, heineken, heineken],
        [vangChile, boMy, lauThai],
        [menuByName['Cá mú hấp gừng']!, menuByName['Sườn nướng chao']!, tiger],
        [menuByName['Gà rừng nướng muối']!, menuByName['Cháo gà']!, heineken],
      ];
      int orderIdx = 0;
      for (int d = 30; d >= 1; d--) {
        final day = now.subtract(Duration(days: d));
        final setA = lunchSet[orderIdx % lunchSet.length];
        final setC = dinnerSet[orderIdx % dinnerSet.length];
        orderIdx++;
        final paysA = payCycle[orderIdx % payCycle.length]
            .map((m) => RestaurantOrderPayment()..method = m)
            .toList();
        addOrder(
          table: null,
          createdAt: DateTime(day.year, day.month, day.day, 12, 15),
          closedAt: DateTime(day.year, day.month, day.day, 13, 20),
          details: [
            for (final m in setA) detail(m, 1 + (orderIdx % 2)),
          ],
          payments: paysA,
        );
        final paysC = payCycle[(orderIdx + 2) % payCycle.length]
            .map((m) => RestaurantOrderPayment()..method = m)
            .toList();
        addOrder(
          table: null,
          createdAt: DateTime(day.year, day.month, day.day, 18, 40),
          closedAt: DateTime(day.year, day.month, day.day, 20, 5),
          details: [
            for (final m in setC) detail(m, 1),
          ],
          payments: paysC,
        );
      }

      // --- Hôm nay: 3 hóa đơn đã thanh toán ---
      // 1) Tiền mặt, có khách hàng tích điểm
      addOrder(
        table: null,
        createdAt: todayAt(11, 40),
        closedAt: todayAt(12, 55),
        details: [detail(lunchSet[0][0], 1), detail(comTrang, 2), detail(rauMuong, 1)],
        payments: [
          RestaurantOrderPayment()
            ..method = RestaurantPaymentMethod.CASH
            ..amount = 0, // amount=0 -> tự điền bằng total khi lưu seed
        ],
        customer: customers[0],
      );
      orders.last.payments.first.amount = orders.last.totalAmount;

      // 2) QR thuần
      addOrder(
        table: null,
        createdAt: todayAt(12, 10),
        closedAt: todayAt(13, 30),
        details: [detail(mucSua, 2, note: 'Ít mắm'), detail(tiger, 4)],
        payments: [
          RestaurantOrderPayment()
            ..method = RestaurantPaymentMethod.QR
            ..amount = 0,
        ],
      );
      orders.last.payments.first.amount = orders.last.totalAmount;

      // 3) Voucher 50K + khách VIP trả kết hợp Thẻ + Tiền mặt, mua 2 tặng 1 nước ép
      final subtotal3 = epCam.price * 3 +
          comboHS.price +
          heineken.price * 2;
      final voucher = promos[1];
      addOrder(
        table: null,
        createdAt: todayAt(18, 5),
        closedAt: todayAt(19, 25),
        details: [
          detail(epCam, 3),
          detail(comboHSItem, 1),
          detail(heineken, 2),
        ],
        discountAmount: voucher.value,
        promotionName: voucher.name,
        payments: [
          RestaurantOrderPayment()
            ..method = RestaurantPaymentMethod.CARD
            ..amount = subtotal3 - voucher.value - 100000,
          RestaurantOrderPayment()
            ..method = RestaurantPaymentMethod.CASH
            ..amount = 100000,
        ],
        customer: customers[3],
      );

      // --- Hôm nay: 2 bàn đang phục vụ (test POS/KDS) ---
      final serving1 = tableByName['Bàn 01']!;
      serving1.status = RestaurantTableStatus.SERVING;
      addOrder(
        table: serving1,
        status: RestaurantOrderStatus.SERVING,
        createdAt: now.subtract(const Duration(minutes: 35)),
        details: [
          detail(lauThai, 1, status: RestaurantOrderItemStatus.COOKING),
          detail(tiger, 3, note: 'Đá riêng'),
          detail(rauMuong, 1),
        ],
      );

      final serving2 = tableByName['Bàn SV01']!;
      serving2.status = RestaurantTableStatus.SERVING;
      addOrder(
        table: serving2,
        status: RestaurantOrderStatus.SERVING,
        createdAt: now.subtract(const Duration(minutes: 20)),
        details: [
          detail(mucSua, 2, note: 'Ít cay', status: RestaurantOrderItemStatus.PENDING),
          detail(tiger, 2, status: RestaurantOrderItemStatus.DONE),
        ],
      );

      // --- Hôm nay: 1 bàn chờ thanh toán ---
      final waiting = tableByName['Bàn 02']!;
      waiting.status = RestaurantTableStatus.WAITING_PAYMENT;
      addOrder(
        table: waiting,
        status: RestaurantOrderStatus.SERVING,
        createdAt: now.subtract(const Duration(hours: 1, minutes: 10)),
        details: [detail(comboHSItem, 1), detail(epCam, 2)],
      );

      await db.restaurantOrders.putAll(orders);
      // Lưu link bàn (không đọc lại .value trong transaction - Isar
      // không cho phép loadSync lồng nhau).
      for (final o in orders) {
        await o.table.save();
      }
      // Cập nhật trạng thái bàn đang phục vụ / chờ thanh toán
      await db.restaurantTables.putAll(tables);
    });
  }
}

import 'dart:io';
import 'dart:ffi' show Abi;

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_expense_model.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_inventory_models.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_menu_item.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_order.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_partner_models.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_promotion.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_reservation.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/models/restaurant_table.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/services/restaurant_isar_service.dart';
import 'package:kanposvn/modules/kanposvnnhahangquanan/services/restaurant_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Stub path_provider để mở Isar trong môi trường test.
class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late RestaurantIsarService service;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Dùng isar.dll đóng gói sẵn trong pub cache (không cần tải mạng).
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir =
        await Directory.systemTemp.createTemp('nhahang_seed_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDownAll(() async {
    try {
      final isar = await service.db;
      await isar.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Seed dữ liệu mẫu đầy đủ theo nhahang.md', () async {
    service = RestaurantIsarService();
    final db = await service.db;

    // ===== Lần 1: seed rỗng -> tạo toàn bộ =====
    await RestaurantSeedData.seedIfEmpty(service);
    expect(await db.restaurantTables.count(), greaterThanOrEqualTo(14),
        reason: 'IV. Đủ khu vực: Tầng 1/2, Sân vườn, VIP, Phòng lạnh, Ngoài trời');
    expect(await db.restaurantMenuItems.count(), greaterThanOrEqualTo(60),
        reason: 'VII+VIII+X. Thực đơn đủ nhóm + đồ uống + combo');
    expect(await db.restaurantIngredients.count(), greaterThanOrEqualTo(40),
        reason: 'XII. Kho nguyên liệu theo PRD');
    expect(await db.restaurantOrders.count(), greaterThanOrEqualTo(60),
        reason: 'Hóa đơn trải 30 ngày + hôm nay');
    expect(await db.restaurantPromotions.count(), 3,
        reason: 'XX. Happy hour + voucher + mua 2 tặng 1');
    expect(await db.restaurantCustomers.count(), 5,
        reason: 'XV. Khách hàng tích điểm/công nợ');
    expect(await db.restaurantSuppliers.count(), 4,
        reason: 'XIV. Nhà cung cấp công nợ');
    expect(await db.restaurantExpenses.count(), 10,
        reason: 'XXV. Chi phí vận hành');
    expect(await db.restaurantReservations.count(), 2,
        reason: 'VI. Đặt bàn + đặt cọc');

    // ===== Kiểm tra chất lượng dữ liệu =====
    // Combo có recipe gộp đúng
    final combos = await db.restaurantMenuItems
        .filter()
        .isComboEqualTo(true)
        .findAll();
    expect(combos.length, 3);
    for (final c in combos) {
      expect(c.comboItems.length, greaterThanOrEqualTo(3),
          reason: '${c.name} phải có món con');
      expect(c.recipe.isNotEmpty, isTrue,
          reason: '${c.name} phải có công thức kho để tự trừ');
    }

    // Mọi order đều có tổng = tổng các dòng
    final orders = await db.restaurantOrders.where().findAll();
    for (final o in orders) {
      final calc =
          o.details.fold<double>(0, (s, d) => s + d.price * d.quantity);
      expect(o.totalAmount, closeTo(calc, 0.01),
          reason: 'Order ${o.orderId} tổng sai');
      if (o.status == RestaurantOrderStatus.COMPLETED) {
        expect(o.closedAt, isNotNull);
        expect(o.payments, isNotEmpty,
            reason: 'Hóa đơn hoàn tất phải có phương thức thanh toán');
        expect(o.discountAmount <= o.totalAmount, isTrue);
      }
    }

    // Có hóa đơn hôm nay (dashboard) và có hóa đơn các ngày trước (báo cáo)
    final now = DateTime.now();
    final startToday = DateTime(now.year, now.month, now.day);
    final todayCount = orders
        .where((o) =>
            o.status == RestaurantOrderStatus.COMPLETED &&
            o.closedAt != null &&
            !o.closedAt!.isBefore(startToday))
        .length;
    expect(todayCount, greaterThanOrEqualTo(3));
    final pastDays = orders
        .map((o) => o.closedAt ?? o.createdAt)
        .whereType<DateTime>()
        .where((d) => d.isBefore(startToday))
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();
    expect(pastDays.length, greaterThanOrEqualTo(25),
        reason: 'Doanh thu trải đều nhiều ngày để test biểu đồ/báo cáo tháng');

    // Bàn đang phục vụ có order SERVING tương ứng
    final tables = await db.restaurantTables.where().findAll();
    final servingTables = tables
        .where((t) =>
            t.status == RestaurantTableStatus.SERVING ||
            t.status == RestaurantTableStatus.WAITING_PAYMENT)
        .toList();
    expect(servingTables.length, greaterThanOrEqualTo(2));
    for (final t in servingTables) {
      final hasActive = orders.any((o) =>
          o.status == RestaurantOrderStatus.SERVING && o.table.value?.id == t.id);
      expect(hasActive, isTrue,
          reason: '${t.name} trạng thái ${t.status.label} nhưng không có order');
    }

    // Nguyên liệu tồn kho khớp với phiếu nhập đầu kỳ
    final ingredients = await db.restaurantIngredients.where().findAll();
    final txs = await db.restaurantInventoryTxs.where().findAll();
    expect(txs.length, ingredients.length);
    for (final i in ingredients) {
      final sum = txs
          .where((t) => t.ingredientId == i.ingredientId)
          .fold<double>(0, (s, t) => s + t.quantity);
      expect(sum, closeTo(i.stock, 0.01),
          reason: 'Tồn ${i.name} lệch với phiếu nhập');
    }

    // ===== Lần 2: seed lại -> không nhân đôi =====
    await RestaurantSeedData.seedIfEmpty(service);
    expect(await db.restaurantTables.count(),
        await db.restaurantTables.filter().deletedAtIsNull().count());
    final tableCount2 = await db.restaurantTables.count();
    expect(tableCount2, greaterThanOrEqualTo(14));
    expect(await db.restaurantMenuItems.count(),
        greaterThanOrEqualTo(60));
    // Không tăng thêm
    final menuAgain = await db.restaurantMenuItems.count();
    await RestaurantSeedData.seedIfEmpty(service);
    expect(await db.restaurantMenuItems.count(), menuAgain);
  });
}

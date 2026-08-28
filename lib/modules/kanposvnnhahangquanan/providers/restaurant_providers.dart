import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_reservation.dart';
import '../models/restaurant_promotion.dart';
import '../models/restaurant_partner_models.dart';
import '../models/restaurant_expense_model.dart';
import '../services/restaurant_isar_service.dart';
import '../services/restaurant_business_logic.dart';
import '../services/restaurant_einvoice_settings.dart';

final restaurantIsarServiceProvider = Provider((ref) => RestaurantIsarService());

// Settings
final restaurantEinvoiceSettingsProvider =
    ChangeNotifierProvider<RestaurantEinvoiceSettingsStore>((ref) {
  final store = RestaurantEinvoiceSettingsStore();
  store.load();
  return store;
});

// Tables
class RestaurantTablesNotifier
    extends StateNotifier<AsyncValue<List<RestaurantTable>>> {
  final RestaurantIsarService _isarService;
  RestaurantTablesNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadTables();
  }

  Future<void> loadTables() async {
    try {
      await _isarService.run((db) async {
        state = const AsyncValue.loading();
        final data = await db.restaurantTables.where().findAll();
        data.sort((a, b) => a.name.compareTo(b.name));
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setTableStatus(
      RestaurantTable table, RestaurantTableStatus status) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        table.status = status;
        await db.restaurantTables.put(table);
      });
    });
    await loadTables();
  }
}
final restaurantTablesProvider =
    StateNotifierProvider<RestaurantTablesNotifier, AsyncValue<List<RestaurantTable>>>(
        (ref) {
  return RestaurantTablesNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Menu Items
class RestaurantMenuNotifier
    extends StateNotifier<AsyncValue<List<RestaurantMenuItem>>> {
  final RestaurantIsarService _isarService;
  RestaurantMenuNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadMenu();
  }

  Future<void> loadMenu() async {
    try {
      await _isarService.run((db) async {
        state = const AsyncValue.loading();
        final data = await db.restaurantMenuItems.where().findAll();
        data.sort((a, b) => a.category.compareTo(b.category));
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantMenuProvider =
    StateNotifierProvider<RestaurantMenuNotifier, AsyncValue<List<RestaurantMenuItem>>>(
        (ref) {
  return RestaurantMenuNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Promotions
class RestaurantPromotionsNotifier
    extends StateNotifier<AsyncValue<List<RestaurantPromotion>>> {
  final RestaurantIsarService _isarService;
  RestaurantPromotionsNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      await _isarService.run((db) async {
        final data = await db.restaurantPromotions.where().findAll();
        state = AsyncValue.data(data.where((p) => p.isActive).toList());
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantPromotionsProvider = StateNotifierProvider<
    RestaurantPromotionsNotifier,
    AsyncValue<List<RestaurantPromotion>>>((ref) {
  return RestaurantPromotionsNotifier(ref.watch(restaurantIsarServiceProvider));
});

// Orders
class RestaurantOrdersNotifier
    extends StateNotifier<AsyncValue<List<RestaurantOrder>>> {
  final RestaurantIsarService _isarService;
  RestaurantOrdersNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadOrders();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadOrders() async {
    try {
      await _isarService.run((db) async {
        state = const AsyncValue.loading();
        final data = await db.restaurantOrders.where().findAll();
        // Load table links for each order
        for (var order in data) {
          await order.table.load();
        }
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Lưu order + đồng bộ trạng thái bàn.
  Future<void> updateOrder(RestaurantOrder order) async {
    try {
      await _isarService.run((db) async {
        await db.writeTxn(() async {
          RestaurantTable? table = order.table.value;
          if (table != null) {
            await db.restaurantTables.put(table);
            if (order.status == RestaurantOrderStatus.COMPLETED &&
                table.status != RestaurantTableStatus.CLEANING &&
                table.status != RestaurantTableStatus.RESERVED) {
              table.status = RestaurantTableStatus.EMPTY;
            } else if (order.status == RestaurantOrderStatus.SERVING &&
                table.status != RestaurantTableStatus.WAITING_PAYMENT &&
                table.status != RestaurantTableStatus.RESERVED) {
              table.status = RestaurantTableStatus.SERVING;
            }
            await db.restaurantTables.put(table);
          }
          await db.restaurantOrders.put(order);
          // Bắt buộc lưu link bàn cho order mới tạo (Isar yêu cầu save() link)
          if (table != null) {
            await order.table.save();
          }
        });
      });
      await loadOrders();
      ref.read(restaurantTablesProvider.notifier).loadTables();
      ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Xóa order rác (không có món) khi khách mở bàn rồi bỏ đi.
  Future<void> discardIfEmpty(RestaurantOrder order) async {
    if (order.details.isNotEmpty) return;
    final saved = await _isarService.run((db) async {
      final s = await db.restaurantOrders
          .filter()
          .orderIdEqualTo(order.orderId)
          .findFirst();
      if (s != null) {
        await db.writeTxn(() async {
          await db.restaurantOrders.delete(s.id);
        });
      }
      return s;
    });
    if (saved == null) return; // chưa từng lưu xuống DB
    await loadOrders();
    ref.read(restaurantTablesProvider.notifier).loadTables();
  }

  /// XIX. Chuyển bàn: dời order sang bàn khác.
  Future<bool> transferTable(
      RestaurantOrder order, RestaurantTable newTable) async {
    final active = await findActiveOrderOnTable(newTable);
    if (!RestaurantBusinessLogic.canTransferToTable(
        newTableActiveOrder: active, currentOrderId: order.orderId)) {
      return false;
    }
    await _isarService.run((isar) async {
      final oldTable = order.table.value;
      await isar.writeTxn(() async {
        order.table.value = newTable;
        await isar.restaurantOrders.put(order);
        await order.table.save();

        newTable.status = RestaurantTableStatus.SERVING;
        await isar.restaurantTables.put(newTable);
        if (oldTable != null && oldTable.id != newTable.id) {
          oldTable.status = RestaurantTableStatus.EMPTY;
          await isar.restaurantTables.put(oldTable);
        }
      });
    });
    await loadOrders();
    ref.read(restaurantTablesProvider.notifier).loadTables();
    return true;
  }

  /// XIX. Gộp bàn: gộp toàn bộ món của [source] vào [target], xóa [source].
  Future<void> mergeOrders(
      RestaurantOrder source, RestaurantOrder target) async {
    await _isarService.run((db) async {
      final sourceTable = source.table.value;
      await db.writeTxn(() async {
        RestaurantBusinessLogic.mergeDetails(source: source, target: target);
        target.totalAmount = RestaurantBusinessLogic.recalculateTotal(target.details);
        target.discountAmount = 0;
        target.promotionName = '';
        await db.restaurantOrders.put(target);
        final savedSource =
            await db.restaurantOrders.filter().orderIdEqualTo(source.orderId).findFirst();
        if (savedSource != null) await db.restaurantOrders.delete(savedSource.id);
        if (sourceTable != null &&
            sourceTable.id != target.table.value?.id) {
          sourceTable.status = RestaurantTableStatus.EMPTY;
          await db.restaurantTables.put(sourceTable);
        }
        await db.restaurantTables.put(target.table.value!);
      });
    });
    await loadOrders();
    ref.read(restaurantTablesProvider.notifier).loadTables();
  }

  /// XIX. Tách hóa đơn: chuyển các món được chọn sang order mới cùng bàn.
  Future<RestaurantOrder?> splitOrder(
      RestaurantOrder order, Set<String> detailIdsToMove) async {
    if (detailIdsToMove.isEmpty || order.details.length <= 1) return null;
    final (kept, moved) = RestaurantBusinessLogic.splitDetails(
        order.details, detailIdsToMove);
    if (kept.isEmpty || moved.isEmpty) return null;

    final newOrder = RestaurantOrder()
      ..orderId = const Uuid().v4()
      ..createdAt = DateTime.now()
      ..status = RestaurantOrderStatus.SERVING
      ..details = moved;
    newOrder.table.value = order.table.value;
    newOrder.totalAmount = RestaurantBusinessLogic.recalculateTotal(moved);

    await _isarService.run((db) async {
      await db.writeTxn(() async {
        order.details = kept;
        order.totalAmount = RestaurantBusinessLogic.recalculateTotal(kept);
        order.discountAmount = 0;
        order.promotionName = '';
        await db.restaurantOrders.put(order);
        await db.restaurantOrders.put(newOrder);
        await newOrder.table.save();
      });
    });
    await loadOrders();
    ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    return newOrder;
  }

  Future<RestaurantOrder?> findActiveOrderOnTable(RestaurantTable table) async {
    final all = await _isarService.run((db) async {
      return db.restaurantOrders.filter().statusEqualTo(RestaurantOrderStatus.SERVING).findAll();
    });
    for (final o in all) {
      await o.table.load();
      if (o.table.value?.id == table.id) return o;
    }
    return null;
  }

  /// XVIII. Thu ngân: hoàn tất thanh toán với nhiều phương thức + khuyến mãi +
  /// tích điểm/công nợ khách hàng.
  Future<void> checkout({
    required RestaurantOrder order,
    List<RestaurantOrderPayment> payments = const [],
    double discountAmount = 0,
    String promotionName = '',
    RestaurantCustomer? customer,
  }) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        order.discountAmount = discountAmount.clamp(0, order.totalAmount);
        order.promotionName = promotionName;
        order.payments = List.from(payments);
        order.status = RestaurantOrderStatus.COMPLETED;
        order.closedAt = DateTime.now();

        if (customer != null) {
          order.customerId = customer.customerId;
          order.customerName = customer.name;
          order.customerPhone = customer.phone;
          final finalAmount = order.totalAmount - order.discountAmount;
          order.earnedPoints =
              RestaurantBusinessLogic.pointsEarnedFor(finalAmount);
          customer.points += order.earnedPoints;

          // Thanh toán bằng công nợ -> tăng nợ khách nếu trả thiếu
          final paidViaDebt = payments
              .where((p) => p.method == RestaurantPaymentMethod.DEBT)
              .fold<double>(0, (s, p) => s + p.amount);
          if (paidViaDebt > 0) {
            customer.debt += paidViaDebt;
          }
          await db.restaurantCustomers.put(customer);
        }
        RestaurantTable? table = order.table.value;
        if (table != null) {
          await db.restaurantTables.put(table);
          table.status = RestaurantTableStatus.EMPTY;
          await db.restaurantTables.put(table);
        }
        await db.restaurantOrders.put(order);
      });
    });
    await loadOrders();
    ref.read(restaurantTablesProvider.notifier).loadTables();
    ref.read(restaurantDashboardProvider.notifier).loadDashboard();
    ref.read(restaurantCustomersProvider.notifier).loadCustomers();
  }
}
final restaurantOrdersProvider =
    StateNotifierProvider<RestaurantOrdersNotifier, AsyncValue<List<RestaurantOrder>>>(
        (ref) {
  final notifier =
      RestaurantOrdersNotifier(ref.watch(restaurantIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// VI. Đặt bàn
class RestaurantReservationsNotifier
    extends StateNotifier<AsyncValue<List<RestaurantReservation>>> {
  final RestaurantIsarService _isarService;
  RestaurantReservationsNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    load();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> load() async {
    try {
      await _isarService.run((db) async {
        final data = await db.restaurantReservations.where().sortByTime().findAll();
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReservation({
    required RestaurantTable table,
    required String customerName,
    required String phone,
    required DateTime time,
    int guests = 2,
    double deposit = 0,
    String note = '',
  }) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        final res = RestaurantReservation()
          ..reservationId = const Uuid().v4()
          ..tableId = table.tableId
          ..tableName = table.name
          ..customerName = customerName
          ..phone = phone
          ..time = time
          ..guests = guests
          ..deposit = deposit
          ..note = note
          ..status = RestaurantReservationStatus.BOOKED;
        await db.restaurantReservations.put(res);

        // Bàn trống & giờ đặt trong hôm nay -> đánh dấu Đặt trước
        final now = DateTime.now();
        final isToday = time.year == now.year && time.month == now.month && time.day == now.day;
        if (isToday && table.status == RestaurantTableStatus.EMPTY) {
          table.status = RestaurantTableStatus.RESERVED;
          await db.restaurantTables.put(table);
        }
      });
    });
    await load();
    ref.read(restaurantTablesProvider.notifier).loadTables();
  }

  Future<void> setStatus(
      RestaurantReservation res, RestaurantReservationStatus status) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        res.status = status;
        await db.restaurantReservations.put(res);
        // Hủy / no-show -> trả bàn về trống nếu vẫn đang RESERVED
        if (status == RestaurantReservationStatus.CANCELLED ||
            status == RestaurantReservationStatus.NO_SHOW ||
            status == RestaurantReservationStatus.SEATED) {
          final table = await db.restaurantTables
              .filter()
              .tableIdEqualTo(res.tableId)
              .findFirst();
          if (table != null && table.status == RestaurantTableStatus.RESERVED) {
            table.status = status == RestaurantReservationStatus.SEATED
                ? RestaurantTableStatus.SERVING
                : RestaurantTableStatus.EMPTY;
            await db.restaurantTables.put(table);
          }
        }
      });
    });
    await load();
    ref.read(restaurantTablesProvider.notifier).loadTables();
  }
}
final restaurantReservationsProvider = StateNotifierProvider<
    RestaurantReservationsNotifier,
    AsyncValue<List<RestaurantReservation>>>((ref) {
  final notifier = RestaurantReservationsNotifier(
      ref.watch(restaurantIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// XV. Khách hàng
class RestaurantCustomersNotifier
    extends StateNotifier<AsyncValue<List<RestaurantCustomer>>> {
  final RestaurantIsarService _isarService;
  RestaurantCustomersNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      await _isarService.run((db) async {
        final data = await db.restaurantCustomers.where().findAll();
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(RestaurantCustomer customer) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        await db.restaurantCustomers.put(customer);
      });
    });
    await loadCustomers();
  }

  /// Khách trả bớt/trả hết công nợ.
  Future<void> payDebt(RestaurantCustomer customer, double amount) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        customer.debt = (customer.debt - amount).clamp(0, double.maxFinite);
        await db.restaurantCustomers.put(customer);
      });
    });
    await loadCustomers();
  }
}
final restaurantCustomersProvider = StateNotifierProvider<
    RestaurantCustomersNotifier,
    AsyncValue<List<RestaurantCustomer>>>((ref) {
  return RestaurantCustomersNotifier(ref.watch(restaurantIsarServiceProvider));
});

// XIV. Nhà cung cấp
class RestaurantSuppliersNotifier
    extends StateNotifier<AsyncValue<List<RestaurantSupplier>>> {
  final RestaurantIsarService _isarService;
  RestaurantSuppliersNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadSuppliers();
  }

  Future<void> loadSuppliers() async {
    try {
      await _isarService.run((db) async {
        final data = await db.restaurantSuppliers.where().findAll();
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(RestaurantSupplier supplier) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        await db.restaurantSuppliers.put(supplier);
      });
    });
    await loadSuppliers();
  }

  Future<void> payDebt(RestaurantSupplier supplier, double amount) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        supplier.debt = (supplier.debt - amount).clamp(0, double.maxFinite);
        await db.restaurantSuppliers.put(supplier);
      });
    });
    await loadSuppliers();
  }
}
final restaurantSuppliersProvider = StateNotifierProvider<
    RestaurantSuppliersNotifier,
    AsyncValue<List<RestaurantSupplier>>>((ref) {
  return RestaurantSuppliersNotifier(ref.watch(restaurantIsarServiceProvider));
});

// XXV. Chi phí
class RestaurantExpensesNotifier
    extends StateNotifier<AsyncValue<List<RestaurantExpense>>> {
  final RestaurantIsarService _isarService;
  RestaurantExpensesNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadExpenses();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadExpenses() async {
    try {
      await _isarService.run((db) async {
        final data =
            await db.restaurantExpenses.where().sortByCreatedAtDesc().findAll();
        state = AsyncValue.data(data);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addExpense(RestaurantExpenseCategory category, double amount,
      String note) async {
    await _isarService.run((db) async {
      await db.writeTxn(() async {
        final e = RestaurantExpense()
          ..expenseId = const Uuid().v4()
          ..category = category
          ..amount = amount
          ..note = note
          ..createdAt = DateTime.now();
        await db.restaurantExpenses.put(e);
      });
    });
    await loadExpenses();
    ref.read(restaurantDashboardProvider.notifier).loadDashboard();
  }
}
final restaurantExpensesProvider = StateNotifierProvider<
    RestaurantExpensesNotifier,
    AsyncValue<List<RestaurantExpense>>>((ref) {
  final notifier =
      RestaurantExpensesNotifier(ref.watch(restaurantIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// III. Dashboard theo PRD: hôm nay / tháng / năm
class RestaurantDashboardNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final RestaurantIsarService _isarService;
  RestaurantDashboardNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      await _isarService.run((db) async {
        final orders = await db.restaurantOrders.where().findAll();
        final tables = await db.restaurantTables.where().findAll();
        final expenses = await db.restaurantExpenses.where().findAll();
        final customers = await db.restaurantCustomers.where().findAll();
        final now = DateTime.now();
        final startToday = DateTime(now.year, now.month, now.day);
        final startMonth = DateTime(now.year, now.month, 1);
        final startYear = DateTime(now.year, 1, 1);

        double revToday = 0, revMonth = 0, revAll = 0;
        double cashToday = 0, bankToday = 0, debtPaidToday = 0;
        int completedToday = 0, completedMonth = 0, completedYear = 0;
        double expenseMonth = 0;

        for (var o in orders) {
          if (o.status != RestaurantOrderStatus.COMPLETED) continue;
          final closed = o.closedAt ?? o.createdAt;
          if (closed == null) continue;
          final net = o.totalAmount - o.discountAmount;
          revAll += net;
          if (!closed.isBefore(startYear)) completedYear++;
          if (!closed.isBefore(startMonth)) {
            revMonth += net;
            completedMonth++;
          }
          if (!closed.isBefore(startToday)) {
            revToday += net;
            completedToday++;
            for (final p in o.payments) {
              switch (p.method) {
                case RestaurantPaymentMethod.CASH:
                  cashToday += p.amount;
                  break;
                case RestaurantPaymentMethod.DEBT:
                  debtPaidToday += p.amount;
                  break;
                default:
                  bankToday += p.amount;
              }
            }
          }
        }
        for (var e in expenses) {
          if (!e.createdAt.isBefore(startMonth)) expenseMonth += e.amount;
        }

        final servingCount = tables
            .where((t) =>
                t.status == RestaurantTableStatus.SERVING ||
                t.status == RestaurantTableStatus.WAITING_PAYMENT)
            .length;
        final reservedCount =
            tables.where((t) => t.status == RestaurantTableStatus.RESERVED).length;
        final totalDebt =
            customers.fold<double>(0, (s, c) => s + c.debt);

        state = AsyncValue.data({
          'revenue': revToday,
          'completedOrders': completedToday,
          'cashToday': cashToday,
          'bankToday': bankToday,
          'debtToday': debtPaidToday,
          'servingTables': servingCount,
          'reservedTables': reservedCount,
          'customerDebt': totalDebt,
          'revenueMonth': revMonth,
          'completedMonth': completedMonth,
          'expenseMonth': expenseMonth,
          'profitMonth': revMonth - expenseMonth,
          'completedYear': completedYear,
          'revenueAll': revAll,
        });
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final restaurantDashboardProvider = StateNotifierProvider<
    RestaurantDashboardNotifier,
    AsyncValue<Map<String, dynamic>>>((ref) {
  return RestaurantDashboardNotifier(ref.watch(restaurantIsarServiceProvider));
});

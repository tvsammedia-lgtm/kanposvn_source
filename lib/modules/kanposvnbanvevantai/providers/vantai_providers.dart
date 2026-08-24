import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_driver.dart';
import '../models/vantai_supplier.dart';
import '../models/vantai_cashbook.dart';
import '../services/vantai_isar_service.dart';

final vantaiIsarServiceProvider = Provider((ref) => VantaiIsarService());

// Routes Provider
class VantaiRoutesNotifier extends StateNotifier<AsyncValue<List<VantaiRoute>>> {
  final VantaiIsarService _isarService;
  VantaiRoutesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiRoutes.where().findAll();
      data.sort((a, b) => a.routeName.compareTo(b.routeName));
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(VantaiRoute route) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiRoutes.put(route);
    });
    await loadRoutes();
  }

  Future<void> delete(VantaiRoute route) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      route.deletedAt = DateTime.now();
      await db.vantaiRoutes.put(route);
    });
    await loadRoutes();
  }
}
final vantaiRoutesProvider = StateNotifierProvider<VantaiRoutesNotifier, AsyncValue<List<VantaiRoute>>>((ref) {
  return VantaiRoutesNotifier(ref.watch(vantaiIsarServiceProvider));
});

// Vehicles Provider
class VantaiVehiclesNotifier extends StateNotifier<AsyncValue<List<VantaiVehicle>>> {
  final VantaiIsarService _isarService;
  VantaiVehiclesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadVehicles();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadVehicles() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiVehicles.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(VantaiVehicle vehicle) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiVehicles.put(vehicle);
    });
    await loadVehicles();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiVehiclesProvider = StateNotifierProvider<VantaiVehiclesNotifier, AsyncValue<List<VantaiVehicle>>>((ref) {
  final n = VantaiVehiclesNotifier(ref.watch(vantaiIsarServiceProvider));
  n.setRef(ref);
  return n;
});

// Drivers Provider (tài xế + phụ xe)
class VantaiDriversNotifier extends StateNotifier<AsyncValue<List<VantaiDriver>>> {
  final VantaiIsarService _isarService;
  VantaiDriversNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDrivers();
  }

  Future<void> loadDrivers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiDrivers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(VantaiDriver driver) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiDrivers.put(driver);
    });
    await loadDrivers();
  }
}
final vantaiDriversProvider = StateNotifierProvider<VantaiDriversNotifier, AsyncValue<List<VantaiDriver>>>((ref) {
  return VantaiDriversNotifier(ref.watch(vantaiIsarServiceProvider));
});

// Customers Provider
class VantaiCustomersNotifier extends StateNotifier<AsyncValue<List<VantaiCustomer>>> {
  final VantaiIsarService _isarService;
  VantaiCustomersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiCustomers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(VantaiCustomer customer) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiCustomers.put(customer);
    });
    await loadCustomers();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }

  /// Mục 16: khách trả nợ -> ghi thu quỹ tiền mặt.
  Future<void> payDebt(VantaiCustomer customer, double amount) async {
    if (amount <= 0 || amount > customer.currentDebt) return;
    final db = await _isarService.db;
    await db.writeTxn(() async {
      customer.currentDebt -= amount;
      await db.vantaiCustomers.put(customer);
      await db.vantaiCashTxs.put(VantaiCashTx()
        ..txId = const Uuid().v4()
        ..type = CashTxType.THU
        ..account = CashAccount.CASH
        ..amount = amount
        ..note = 'Thu nợ khách ${customer.name}'
        ..refCode = customer.customerId.substring(0, 8)
        ..createdAt = DateTime.now());
    });
    await loadCustomers();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiCustomersProvider = StateNotifierProvider<VantaiCustomersNotifier, AsyncValue<List<VantaiCustomer>>>((ref) {
  final n = VantaiCustomersNotifier(ref.watch(vantaiIsarServiceProvider));
  n.setRef(ref);
  return n;
});

// Suppliers Provider
class VantaiSuppliersNotifier extends StateNotifier<AsyncValue<List<VantaiSupplier>>> {
  final VantaiIsarService _isarService;
  VantaiSuppliersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSuppliers();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadSuppliers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiSuppliers.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> upsert(VantaiSupplier supplier) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiSuppliers.put(supplier);
    });
    await loadSuppliers();
  }

  /// Mục 17: trả nợ NCC -> ghi chi quỹ.
  Future<void> payDebt(VantaiSupplier supplier, double amount) async {
    if (amount <= 0 || amount > supplier.debt) return;
    final db = await _isarService.db;
    await db.writeTxn(() async {
      supplier.debt -= amount;
      await db.vantaiSuppliers.put(supplier);
      await db.vantaiCashTxs.put(VantaiCashTx()
        ..txId = const Uuid().v4()
        ..type = CashTxType.CHI
        ..account = CashAccount.BANK
        ..amount = amount
        ..note = 'Trả nợ ${supplier.name}'
        ..refCode = supplier.supplierId.substring(0, 8)
        ..createdAt = DateTime.now());
    });
    await loadSuppliers();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
  }
}
final vantaiSuppliersProvider = StateNotifierProvider<VantaiSuppliersNotifier, AsyncValue<List<VantaiSupplier>>>((ref) {
  final n = VantaiSuppliersNotifier(ref.watch(vantaiIsarServiceProvider));
  n.setRef(ref);
  return n;
});

// Tickets Provider
class VantaiTicketsNotifier extends StateNotifier<AsyncValue<List<VantaiTicket>>> {
  final VantaiIsarService _isarService;
  VantaiTicketsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTickets();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadTickets() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiTickets.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> bookTicket(VantaiTicket ticket) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vantaiTickets.put(ticket);
        await ticket.trip.save();
        await ticket.route.save();
        await ticket.vehicle.save();
        if (ticket.customer.value != null) {
          // Tái sử dụng khách đã có theo SĐT để gộp lịch sử/công nợ
          final phone = ticket.customer.value!.phone.trim();
          VantaiCustomer? existing;
          if (phone.isNotEmpty) {
            existing = await db.vantaiCustomers
                .filter()
                .phoneEqualTo(phone)
                .findFirst();
          }
          final cust = existing ?? ticket.customer.value!;
          if (cust.name.isEmpty) cust.name = ticket.passengerName;
          await db.vantaiCustomers.put(cust);

          // Mục 7/16: vé công nợ -> tăng nợ khách
          if (ticket.paymentMethod == TicketPaymentMethod.DEBT &&
              ticket.status == TicketStatus.PAID) {
            cust.currentDebt += ticket.price;
            await db.vantaiCustomers.put(cust);
          }
          ticket.customer.value = cust;
          await ticket.customer.save();
        }
      });
      await loadTickets();
      ref.read(vantaiDashboardProvider.notifier).loadDashboard();
      ref.read(vantaiCustomersProvider.notifier).loadCustomers();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Hủy vé -> nhả ghế (ghế có thể bán lại).
  Future<void> cancelTicket(VantaiTicket ticket) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      ticket.status = TicketStatus.CANCELLED;
      await db.vantaiTickets.put(ticket);
    });
    await loadTickets();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }

  /// Giữ chỗ -> thanh toán tại quầy.
  Future<void> markPaid(
      VantaiTicket ticket, TicketPaymentMethod method) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      ticket.status = TicketStatus.PAID;
      ticket.paymentMethod = method;
      await db.vantaiTickets.put(ticket);
      if (method == TicketPaymentMethod.DEBT) {
        final c = ticket.customer.value;
        if (c != null) {
          c.currentDebt += ticket.price;
          await db.vantaiCustomers.put(c);
        }
      } else {
        await db.vantaiCashTxs.put(VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.THU
          ..account =
              method == TicketPaymentMethod.CASH ? CashAccount.CASH : CashAccount.BANK
          ..amount = ticket.price
          ..note = 'Thu vé ${ticket.seatNumber} mã ${ticket.ticketCode}'
          ..refCode = ticket.ticketCode
          ..createdAt = DateTime.now());
      }
    });
    await loadTickets();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiTicketsProvider = StateNotifierProvider<VantaiTicketsNotifier, AsyncValue<List<VantaiTicket>>>((ref) {
  final notifier = VantaiTicketsNotifier(ref.watch(vantaiIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Trips Provider
class VantaiTripsNotifier extends StateNotifier<AsyncValue<List<VantaiTrip>>> {
  final VantaiIsarService _isarService;
  VantaiTripsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTrips();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadTrips() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiTrips.where().findAll();
      data.sort((a, b) =>
          (a.departureTime ?? DateTime(2000)).compareTo(b.departureTime ?? DateTime(2000)));
      for (final t in data) {
        await t.route.load();
        await t.vehicle.load();
        await t.driver.load();
        await t.assistant.load();
      }
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createTrip({
    required VantaiTrip trip,
  }) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiTrips.put(trip);
      await trip.route.save();
      await trip.vehicle.save();
      await trip.driver.save();
      if (trip.assistant.value != null) await trip.assistant.save();
    });
    await loadTrips();
  }

  Future<void> updateStatus(TripStatus status, VantaiTrip trip,
      {DateTime? arrival}) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      trip.status = status;
      if (arrival != null) trip.arrivalTime = arrival;
      await db.vantaiTrips.put(trip);
    });
    await loadTrips();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiTripsProvider = StateNotifierProvider<VantaiTripsNotifier, AsyncValue<List<VantaiTrip>>>((ref) {
  final notifier = VantaiTripsNotifier(ref.watch(vantaiIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Shipments Provider
class VantaiShipmentsNotifier extends StateNotifier<AsyncValue<List<VantaiShipment>>> {
  final VantaiIsarService _isarService;
  VantaiShipmentsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadShipments();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadShipments() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiShipments.where().findAll();
      data.sort((a, b) =>
          (b.createdAt ?? DateTime(2000)).compareTo(a.createdAt ?? DateTime(2000)));
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createShipment(VantaiShipment shipment) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiShipments.put(shipment);
      await shipment.route.save();
    });
    await loadShipments();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }

  /// Mục 10-11: chuyển trạng thái Đang nhận -> Đang đi -> Kho -> Đã giao.
  /// Khi giao thành công có thu hộ COD -> ghi thu quỹ.
  Future<void> updateStatus(VantaiShipment s, ShipmentStatus status) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      s.status = status;
      await db.vantaiShipments.put(s);
      if (status == ShipmentStatus.DELIVERED && s.codAmount > 0) {
        await db.vantaiCashTxs.put(VantaiCashTx()
          ..txId = const Uuid().v4()
          ..type = CashTxType.THU
          ..account = CashAccount.CASH
          ..amount = s.codAmount
          ..note = 'Thu hộ COD đơn ${s.shipmentCode} (${s.receiverName})'
          ..refCode = s.shipmentCode
          ..createdAt = DateTime.now());
      }
    });
    await loadShipments();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiShipmentsProvider = StateNotifierProvider<VantaiShipmentsNotifier, AsyncValue<List<VantaiShipment>>>((ref) {
  final notifier = VantaiShipmentsNotifier(ref.watch(vantaiIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Expenses Provider
class VantaiExpensesNotifier extends StateNotifier<AsyncValue<List<VantaiExpense>>> {
  final VantaiIsarService _isarService;
  VantaiExpensesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadExpenses();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadExpenses() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiExpenses.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addExpense(VantaiExpense expense) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      expense.date ??= DateTime.now();
      await db.vantaiExpenses.put(expense);
      await expense.trip.save();
      // Chi phí -> tự động ghi chi quỹ tương ứng
      await db.vantaiCashTxs.put(VantaiCashTx()
        ..txId = const Uuid().v4()
        ..type = CashTxType.CHI
        ..account = CashAccount.CASH
        ..amount = expense.amount
        ..note = '${expense.category.label}: ${expense.description}'
        ..createdAt = DateTime.now());
    });
    await loadExpenses();
    ref.read(vantaiCashTxProvider.notifier).loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiExpensesProvider = StateNotifierProvider<VantaiExpensesNotifier, AsyncValue<List<VantaiExpense>>>((ref) {
  final notifier = VantaiExpensesNotifier(ref.watch(vantaiIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Cashbook Provider (mục 18-19)
class VantaiCashTxNotifier extends StateNotifier<AsyncValue<List<VantaiCashTx>>> {
  final VantaiIsarService _isarService;
  VantaiCashTxNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTx();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;

  Future<void> loadTx() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiCashTxs.where().sortByCreatedAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addManual(CashTxType type, CashAccount account, double amount,
      String note) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.vantaiCashTxs.put(VantaiCashTx()
        ..txId = const Uuid().v4()
        ..type = type
        ..account = account
        ..amount = amount
        ..note = note
        ..createdAt = DateTime.now());
    });
    await loadTx();
    ref.read(vantaiDashboardProvider.notifier).loadDashboard();
  }
}
final vantaiCashTxProvider = StateNotifierProvider<VantaiCashTxNotifier, AsyncValue<List<VantaiCashTx>>>((ref) {
  final n = VantaiCashTxNotifier(ref.watch(vantaiIsarServiceProvider));
  n.setRef(ref);
  return n;
});

// Dashboard Notifier — mục 1 PRD
class VantaiDashboardNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final VantaiIsarService _isarService;
  VantaiDashboardNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;

      final tickets = await db.vantaiTickets.where().findAll();
      double revToday = 0, revMonth = 0;
      int soldToday = 0, soldMonth = 0;
      final now = DateTime.now();
      final startToday = DateTime(now.year, now.month, now.day);
      final startMonth = DateTime(now.year, now.month, 1);
      int paidCount = 0;
      for (final t in tickets) {
        if (t.status != TicketStatus.PAID) continue;
        paidCount++;
        final d = t.bookingDate ?? t.departureTime;
        if (d == null) continue;
        if (!d.isBefore(startToday)) {
          revToday += t.price;
          soldToday++;
        }
        if (!d.isBefore(startMonth)) {
          revMonth += t.price;
          soldMonth++;
        }
      }

      // FIX: doanh thu hàng hóa chỉ tính đơn KHÔNG hủy (bản cũ cộng cả PENDING/CANCELLED)
      final shipments = await db.vantaiShipments.where().findAll();
      double shipRevAll = 0;
      int shipActive = 0; // đang vận chuyển / ở kho
      for (final s in shipments) {
        if (s.status == ShipmentStatus.CANCELLED) continue;
        shipRevAll += s.shippingFee;
        if (s.status == ShipmentStatus.IN_TRANSIT ||
            s.status == ShipmentStatus.AT_WAREHOUSE) {
          shipActive++;
        }
      }
      double codCollected = shipments
          .where((s) =>
              s.status == ShipmentStatus.DELIVERED && s.codAmount > 0)
          .fold<double>(0, (sum, s) => sum + s.codAmount);

      final trips = await db.vantaiTrips.where().findAll();
      final tripsRunning = trips.where((t) => t.status == TripStatus.RUNNING).length;
      final tripsScheduledToday = trips
          .where((t) =>
              t.status == TripStatus.SCHEDULED &&
              t.departureTime != null &&
              !t.departureTime!.isBefore(startToday))
          .length;

      final vehicles = await db.vantaiVehicles.where().findAll();
      final vMaintenance =
          vehicles.where((v) => v.status == VehicleStatus.MAINTENANCE).length;
      final vRepair = vehicles.where((v) => v.status == VehicleStatus.REPAIR).length;

      final customers = await db.vantaiCustomers.where().findAll();
      final debtKH = customers.fold<double>(0, (s, c) => s + c.currentDebt);
      final suppliers = await db.vantaiSuppliers.where().findAll();
      final debtNCC = suppliers.fold<double>(0, (s, x) => s + x.debt);

      final expenses = await db.vantaiExpenses.where().findAll();
      double expMonth = 0, expAll = 0;
      for (final e in expenses) {
        expAll += e.amount;
        final d = e.date;
        if (d != null && !d.isBefore(startMonth)) expMonth += e.amount;
      }

      // Doanh thu theo tuyến (biểu đồ)
      final revenueByRoute = <String, double>{};
      for (final t in tickets.where((x) => x.status == TicketStatus.PAID)) {
        final rn = t.route.value?.routeName;
        if (rn != null) revenueByRoute[rn] = (revenueByRoute[rn] ?? 0) + t.price;
      }
      for (final s in shipments.where((x) => x.status != ShipmentStatus.CANCELLED)) {
        final rn = s.route.value?.routeName;
        if (rn != null) revenueByRoute[rn] = (revenueByRoute[rn] ?? 0) + s.shippingFee;
      }

      final totalRevenueAll = revMonth + shipRevAll;

      state = AsyncValue.data({
        'revToday': revToday,
        'soldToday': soldToday,
        'revMonth': revMonth,
        'soldMonth': soldMonth,
        'paidTotal': paidCount,
        'tripsRunning': tripsRunning,
        'tripsScheduledToday': tripsScheduledToday,
        'vehiclesMaintenance': vMaintenance,
        'vehiclesRepair': vRepair,
        'shipmentsActive': shipActive,
        'codCollected': codCollected,
        'debtKH': debtKH,
        'debtNCC': debtNCC,
        'expMonth': expMonth,
        'expAll': expAll,
        'totalRevenue': totalRevenueAll,
        'netProfit': totalRevenueAll - expAll,
        'revenueByRoute': revenueByRoute,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final vantaiDashboardProvider = StateNotifierProvider<VantaiDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return VantaiDashboardNotifier(ref.watch(vantaiIsarServiceProvider));
});

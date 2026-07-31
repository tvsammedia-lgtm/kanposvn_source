import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
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
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
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
}
final vantaiVehiclesProvider = StateNotifierProvider<VantaiVehiclesNotifier, AsyncValue<List<VantaiVehicle>>>((ref) {
  return VantaiVehiclesNotifier(ref.watch(vantaiIsarServiceProvider));
});

// Tickets Provider
class VantaiTicketsNotifier extends StateNotifier<AsyncValue<List<VantaiTicket>>> {
  final VantaiIsarService _isarService;
  VantaiTicketsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTickets();
  }

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
        await ticket.route.save();
        await ticket.vehicle.save();
        await ticket.trip.save();
        if (ticket.customer.value != null) {
           await db.vantaiCustomers.put(ticket.customer.value!);
           await ticket.customer.save();
        }
      });
      await loadTickets();
      ref.read(vantaiDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  
  // Dirty hack to update dashboard, we can pass ref or use a dashboard notifier
  late Ref ref;
  void setRef(Ref r) => ref = r;
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

  Future<void> loadTrips() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiTrips.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final vantaiTripsProvider = StateNotifierProvider<VantaiTripsNotifier, AsyncValue<List<VantaiTrip>>>((ref) {
  return VantaiTripsNotifier(ref.watch(vantaiIsarServiceProvider));
});

// Shipments Provider
class VantaiShipmentsNotifier extends StateNotifier<AsyncValue<List<VantaiShipment>>> {
  final VantaiIsarService _isarService;
  VantaiShipmentsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadShipments();
  }

  Future<void> loadShipments() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.vantaiShipments.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createShipment(VantaiShipment shipment) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vantaiShipments.put(shipment);
        await shipment.route.save();
      });
      await loadShipments();
      ref.read(vantaiDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
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
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        await db.vantaiExpenses.put(expense);
        await expense.trip.save();
      });
      await loadExpenses();
      ref.read(vantaiDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
}
final vantaiExpensesProvider = StateNotifierProvider<VantaiExpensesNotifier, AsyncValue<List<VantaiExpense>>>((ref) {
  final notifier = VantaiExpensesNotifier(ref.watch(vantaiIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Dashboard Notifier
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
      double ticketRevenue = 0;
      int ticketCount = 0;
      for (var t in tickets) {
        if (t.status == TicketStatus.PAID) {
          ticketRevenue += t.price;
          ticketCount++;
        }
      }
      
      final shipments = await db.vantaiShipments.where().findAll();
      double shipmentRevenue = 0;
      int shipmentCount = 0;
      for (var s in shipments) {
        shipmentRevenue += s.shippingFee;
        shipmentCount++;
      }
      
      final expenses = await db.vantaiExpenses.where().findAll();
      double totalExpenses = 0;
      for (var e in expenses) {
        totalExpenses += e.amount;
      }
      
      final totalRevenue = ticketRevenue + shipmentRevenue;
      final netProfit = totalRevenue - totalExpenses;
      
      state = AsyncValue.data({
        'ticketRevenue': ticketRevenue,
        'ticketCount': ticketCount,
        'shipmentRevenue': shipmentRevenue,
        'shipmentCount': shipmentCount,
        'totalRevenue': totalRevenue,
        'totalExpenses': totalExpenses,
        'netProfit': netProfit,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final vantaiDashboardProvider = StateNotifierProvider<VantaiDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return VantaiDashboardNotifier(ref.watch(vantaiIsarServiceProvider));
});


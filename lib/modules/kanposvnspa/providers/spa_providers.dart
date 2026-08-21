import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_session.dart';
import '../models/spa_customer.dart';
import '../models/spa_inventory_models.dart';
import '../models/spa_combo.dart';
import '../services/spa_isar_service.dart';
import '../services/spa_neon_sync_service.dart';

final spaIsarServiceProvider = Provider((ref) => SpaIsarService());

final spaNeonSyncServiceProvider = Provider<SpaNeonSyncService>((ref) {
  final isarService = ref.watch(spaIsarServiceProvider);
  return SpaNeonSyncService(isarService);
});

// Beds
class SpaBedsNotifier extends StateNotifier<AsyncValue<List<SpaBed>>> {
  final SpaIsarService _isarService;
  SpaBedsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadBeds();
  }

  Future<void> loadBeds() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaBeds.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateBedStatus(SpaBed bed, SpaBedStatus status) async {
    final db = await _isarService.db;
    bed.status = status;
    bed.updatedAt = DateTime.now();
    await db.writeTxn(() async => db.spaBeds.put(bed));
    await loadBeds();
    ref.read(spaDashboardProvider.notifier).loadDashboard();
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
}
final spaBedsProvider = StateNotifierProvider<SpaBedsNotifier, AsyncValue<List<SpaBed>>>((ref) {
  final notifier = SpaBedsNotifier(ref.watch(spaIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Services
class SpaServicesNotifier extends StateNotifier<AsyncValue<List<SpaServiceModel>>> {
  final SpaIsarService _isarService;
  SpaServicesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadServices();
  }

  Future<void> loadServices() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaServiceModels.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaServicesProvider = StateNotifierProvider<SpaServicesNotifier, AsyncValue<List<SpaServiceModel>>>((ref) {
  return SpaServicesNotifier(ref.watch(spaIsarServiceProvider));
});

// Techs
class SpaTechsNotifier extends StateNotifier<AsyncValue<List<SpaTechnician>>> {
  final SpaIsarService _isarService;
  SpaTechsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTechs();
  }

  Future<void> loadTechs() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaTechnicians.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaTechsProvider = StateNotifierProvider<SpaTechsNotifier, AsyncValue<List<SpaTechnician>>>((ref) {
  return SpaTechsNotifier(ref.watch(spaIsarServiceProvider));
});

// Sessions
class SpaSessionsNotifier extends StateNotifier<AsyncValue<List<SpaSession>>> {
  final SpaIsarService _isarService;
  SpaSessionsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSessions();
  }

  Future<void> loadSessions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaSessions.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> openSession(SpaBed bed, SpaServiceModel service, SpaTechnician tech, SpaCustomer customer) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        bed.status = SpaBedStatus.PLAYING;
        await db.spaBeds.put(bed);

        final session = SpaSession()
          ..sessionId = DateTime.now().millisecondsSinceEpoch.toString()
          ..startTime = DateTime.now()
          ..status = SpaSessionStatus.IN_PROGRESS
          ..totalAmount = service.price;
        
        session.bed.value = bed;
        session.service.value = service;
        session.technician.value = tech;
        session.customer.value = customer;
        
        await db.spaSessions.put(session);
        await session.bed.save();
        await session.service.save();
        await session.technician.save();
        await session.customer.save();
      });
      await loadSessions();
      ref.read(spaBedsProvider.notifier).loadBeds();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Hoàn thành session: đa phương thức (§14), tip (§7),
  /// tự động xuất kho theo định mức (§11), trừ combo (§9).
  Future<void> checkoutSession(
    SpaSession session, {
    List<Map<String, dynamic>>? payments,
    double tip = 0,
  }) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        session.status = SpaSessionStatus.COMPLETED;
        session.endTime = DateTime.now();
        session.tipAmount = tip;
        if (payments != null) {
          session.paymentInfo = jsonEncode(payments);
          // Cộng thêm tiền tip/dịch vụ chưa nằm trong totalAmount
          session.totalAmount += tip;
        }
        await db.spaSessions.put(session);

        if (session.bed.value != null) {
          final bed = session.bed.value!;
          bed.status = SpaBedStatus.CLEANING; // Chờ vệ sinh (spec §5)
          await db.spaBeds.put(bed);
        }

        // §11: Khi hoàn thành dịch vụ → kho tự động xuất định mức
        final svc = session.service.value;
        final cus = session.customer.value;
        if (svc != null && svc.consumptions.isNotEmpty) {
          for (final line in svc.consumptions) {
            final parts = line.split('|');
            if (parts.length < 3) continue;
            final productId = parts[0];
            final qty = int.tryParse(parts[2]) ?? 0;
            if (qty <= 0) continue;
            final product = await db.spaProducts
                .filter()
                .productIdEqualTo(productId)
                .findFirst();
            if (product == null) continue;
            final tx = SpaInventoryTx()
              ..productId = product.productId
              ..productName = product.name
              ..quantity = -qty
              ..type = SpaInventoryTxType.EXPORT
              ..note = 'Định mức - ${svc.name}'
              ..createdAt = DateTime.now();
            await db.spaInventoryTxs.put(tx);
            product.stock -= qty;
            await db.spaProducts.put(product);
          }
        }

        // §9: Trừ 1 buổi combo nếu khách có combo phù hợp
        if (cus != null && svc != null) {
          final combos = await db.spaCombos
              .filter()
              .customerIdEqualTo(cus.customerId)
              .serviceIdEqualTo(svc.serviceId)
              .findAll();
          combos.sort((a, b) => (a.expiryDate ?? DateTime(9999))
              .compareTo(b.expiryDate ?? DateTime(9999)));
          for (final c in combos) {
            if (!c.isExpired && c.remaining > 0) {
              c.usedCount++;
              await db.spaCombos.put(c);
              // Khách dùng combo: không tính doanh thu tiền mặt
              session.totalAmount -= svc.price;
              await db.spaSessions.put(session);
              break;
            }
          }
          // Điểm tích lũy: 1 điểm / 10.000đ
          if (session.totalAmount > 0) {
            cus.loyaltyPoints += (session.totalAmount / 10000).round();
            await db.spaCustomers.put(cus);
          }
        }
      });
      await loadSessions();
      ref.read(spaBedsProvider.notifier).loadBeds();
      ref.read(spaDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
}
final spaSessionsProvider = StateNotifierProvider<SpaSessionsNotifier, AsyncValue<List<SpaSession>>>((ref) {
  final notifier = SpaSessionsNotifier(ref.watch(spaIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Dashboard (spec §22 — thời gian thực)
class SpaDashboardNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final SpaIsarService _isarService;
  SpaDashboardNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final monthStart = DateTime(now.year, now.month, 1);

      final sessions = await db.spaSessions.where().findAll();
      final beds = await db.spaBeds.where().findAll();
      final customers = await db.spaCustomers.where().findAll();
      final products = await db.spaProducts.where().findAll();

      double revenueToday = 0, revenueMonth = 0;
      int completedToday = 0;
      final serviceCount = <String, int>{};
      final techRevenue = <String, double>{};

      for (final s in sessions) {
        if (s.status != SpaSessionStatus.COMPLETED) continue;
        if (s.totalAmount <= 0 && s.tipAmount <= 0) continue;
        final st = s.startTime;
        if (st == null) continue;
        final inToday = !st.isBefore(todayStart);
        if (inToday) {
          revenueToday += s.totalAmount;
          completedToday++;
          final svcName = s.service.value?.name ?? 'Khác';
          serviceCount[svcName] = (serviceCount[svcName] ?? 0) + 1;
          final techName = s.technician.value?.name ?? 'Chưa gán';
          techRevenue[techName] = (techRevenue[techName] ?? 0) + s.totalAmount;
        }
        if (!st.isBefore(monthStart)) {
          revenueMonth += s.totalAmount;
        }
      }

      String topService = '—';
      var topServiceCount = 0;
      serviceCount.forEach((k, v) {
        if (v > topServiceCount) { topService = k; topServiceCount = v; }
      });
      String topTech = '—';
      var topTechRevenue = 0.0;
      techRevenue.forEach((k, v) {
        if (v > topTechRevenue) { topTech = k; topTechRevenue = v; }
      });

      final serving = sessions
          .where((s) => s.status == SpaSessionStatus.IN_PROGRESS)
          .length;
      final bedsInUse = beds.where((b) => b.status == SpaBedStatus.PLAYING).length;
      final bedsEmpty = beds.where((b) => b.status == SpaBedStatus.EMPTY).length;
      final newCustomers =
          customers.where((c) => !c.createdAt.isBefore(todayStart)).length;
      final lowStock =
          products.where((p) => p.stock <= 5).map((p) => p.name).toList();
      final totalDebt =
          customers.fold<double>(0, (sum, c) => sum + c.debtAmount);

      state = AsyncValue.data({
        'revenueToday': revenueToday,
        'revenueMonth': revenueMonth,
        'completedToday': completedToday,
        'servingCustomers': serving,
        'bedsInUse': bedsInUse,
        'bedsEmpty': bedsEmpty,
        'bedTotal': beds.length,
        'customerTotal': customers.length,
        'newCustomersToday': newCustomers,
        'returningCustomers': customers.length - newCustomers,
        'topService': topService,
        'topTechnician': topTech,
        'lowStockProducts': lowStock,
        'totalDebt': totalDebt,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaDashboardProvider = StateNotifierProvider<SpaDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return SpaDashboardNotifier(ref.watch(spaIsarServiceProvider));
});

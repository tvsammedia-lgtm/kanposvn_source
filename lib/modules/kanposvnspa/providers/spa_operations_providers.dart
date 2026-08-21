import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/spa_appointment.dart';
import '../models/spa_combo.dart';
import '../models/spa_expense.dart';
import '../models/spa_session.dart';
import '../models/spa_technician.dart';
import '../services/spa_isar_service.dart';
import 'spa_providers.dart';

// ================= LỊCH HẸN (spec §4) =================
class SpaAppointmentsNotifier
    extends StateNotifier<AsyncValue<List<SpaAppointment>>> {
  final SpaIsarService _isarService;
  SpaAppointmentsNotifier(this._isarService)
      : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data =
          await db.spaAppointments.where().sortByStartTime().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> add(SpaAppointment apt) async {
    final db = await _isarService.db;
    await db.writeTxn(() async => db.spaAppointments.put(apt));
    await load();
  }

  Future<void> updateStatus(SpaAppointment apt, SpaAppointmentStatus status) async {
    final db = await _isarService.db;
    apt.status = status;
    apt.updatedAt = DateTime.now();
    await db.writeTxn(() async => db.spaAppointments.put(apt));
    await load();
  }
}

final spaAppointmentsProvider = StateNotifierProvider<SpaAppointmentsNotifier,
    AsyncValue<List<SpaAppointment>>>((ref) {
  return SpaAppointmentsNotifier(ref.watch(spaIsarServiceProvider));
});

// ================= COMBO (spec §9) =================
class SpaCombosNotifier extends StateNotifier<AsyncValue<List<SpaCombo>>> {
  final SpaIsarService _isarService;
  SpaCombosNotifier(this._isarService) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaCombos.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> add(SpaCombo combo) async {
    final db = await _isarService.db;
    await db.writeTxn(() async => db.spaCombos.put(combo));
    await load();
  }

  /// Dùng 1 buổi combo khi hoàn thành dịch vụ tương ứng.
  Future<bool> useSession(String customerId, String serviceId) async {
    final db = await _isarService.db;
    final combos = await db.spaCombos
        .filter()
        .customerIdEqualTo(customerId)
        .serviceIdEqualTo(serviceId)
        .findAll();
    // Ưu tiên combo sắp hết hạn còn hiệu quả
    combos.sort((a, b) => (a.expiryDate ?? DateTime(9999))
        .compareTo(b.expiryDate ?? DateTime(9999)));
    for (final c in combos) {
      if (!c.isExpired && c.remaining > 0) {
        c.usedCount++;
        c.updatedAt = DateTime.now();
        await db.writeTxn(() async => db.spaCombos.put(c));
        await load();
        return true;
      }
    }
    return false;
  }
}

final spaCombosProvider =
    StateNotifierProvider<SpaCombosNotifier, AsyncValue<List<SpaCombo>>>((ref) {
  return SpaCombosNotifier(ref.watch(spaIsarServiceProvider));
});

// ================= THU CHI / CHI PHÍ (spec §17-§18) =================
class SpaExpensesNotifier extends StateNotifier<AsyncValue<List<SpaExpense>>> {
  final SpaIsarService _isarService;
  SpaExpensesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.spaExpenses.where().sortBySpentAtDesc().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> add(SpaExpense exp) async {
    final db = await _isarService.db;
    await db.writeTxn(() async => db.spaExpenses.put(exp));
    await load();
    // ignore: use_build_context_synchronously
    ref?.read(spaDashboardProvider.notifier).loadDashboard();
  }

  Ref? ref;
}

final spaExpensesProvider =
    StateNotifierProvider<SpaExpensesNotifier, AsyncValue<List<SpaExpense>>>(
        (ref) {
  final n = SpaExpensesNotifier(ref.watch(spaIsarServiceProvider));
  n.ref = ref;
  return n;
});

// ================= THỐNG KÊ KTV (spec §7) =================
class TechnicianStat {
  final SpaTechnician tech;
  final int sessionCount;
  final double revenue;
  final double commission; // hoa hồng 10%
  final double tips;

  TechnicianStat({
    required this.tech,
    required this.sessionCount,
    required this.revenue,
    required this.commission,
    required this.tips,
  });
}

final spaTechnicianStatsProvider =
    FutureProvider<List<TechnicianStat>>((ref) async {
  final isarService = ref.watch(spaIsarServiceProvider);
  final sessionsAsync = ref.watch(spaSessionsProvider);
  final sessions = sessionsAsync.value ?? [];
  final db = await isarService.db;
  final techs = await db.spaTechnicians.where().findAll();

  return techs.map((t) {
    final mine = sessions
        .where((s) =>
            s.technician.value?.techId == t.techId &&
            s.status == SpaSessionStatus.COMPLETED)
        .toList();
    final revenue = mine.fold<double>(0, (sum, s) => sum + s.totalAmount);
    final tips = mine.fold<double>(0, (sum, s) => sum + s.tipAmount);
    return TechnicianStat(
      tech: t,
      sessionCount: mine.length,
      revenue: revenue,
      commission: revenue * 0.10,
      tips: tips,
    );
  }).toList()
    ..sort((a, b) => b.revenue.compareTo(a.revenue));
});

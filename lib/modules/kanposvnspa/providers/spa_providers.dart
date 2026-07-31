import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_session.dart';
import '../models/spa_customer.dart';
import '../services/spa_isar_service.dart';

final spaIsarServiceProvider = Provider((ref) => SpaIsarService());

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
}
final spaBedsProvider = StateNotifierProvider<SpaBedsNotifier, AsyncValue<List<SpaBed>>>((ref) {
  return SpaBedsNotifier(ref.watch(spaIsarServiceProvider));
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

  Future<void> checkoutSession(SpaSession session) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        session.status = SpaSessionStatus.COMPLETED;
        session.endTime = DateTime.now();
        await db.spaSessions.put(session);

        if (session.bed.value != null) {
          final bed = session.bed.value!;
          bed.status = SpaBedStatus.EMPTY;
          await db.spaBeds.put(bed);
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

// Dashboard
class SpaDashboardNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final SpaIsarService _isarService;
  SpaDashboardNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final sessions = await db.spaSessions.where().findAll();
      
      double revenue = 0;
      int completedSessions = 0;
      
      for (var s in sessions) {
        if (s.status == SpaSessionStatus.COMPLETED) {
          revenue += s.totalAmount;
          completedSessions++;
        }
      }
      
      state = AsyncValue.data({
        'revenue': revenue,
        'completedSessions': completedSessions,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final spaDashboardProvider = StateNotifierProvider<SpaDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return SpaDashboardNotifier(ref.watch(spaIsarServiceProvider));
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../services/bida_isar_service.dart';

final bidaIsarServiceProvider = Provider((ref) => BidaIsarService());

// Tables Provider
class BidaTablesNotifier extends StateNotifier<AsyncValue<List<BidaTable>>> {
  final BidaIsarService _isarService;
  BidaTablesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadTables();
  }

  Future<void> loadTables() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaTables.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final bidaTablesProvider = StateNotifierProvider<BidaTablesNotifier, AsyncValue<List<BidaTable>>>((ref) {
  return BidaTablesNotifier(ref.watch(bidaIsarServiceProvider));
});

// Items Provider
class BidaItemsNotifier extends StateNotifier<AsyncValue<List<BidaItem>>> {
  final BidaIsarService _isarService;
  BidaItemsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaItems.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final bidaItemsProvider = StateNotifierProvider<BidaItemsNotifier, AsyncValue<List<BidaItem>>>((ref) {
  return BidaItemsNotifier(ref.watch(bidaIsarServiceProvider));
});

// Sessions Provider
class BidaSessionsNotifier extends StateNotifier<AsyncValue<List<BidaSession>>> {
  final BidaIsarService _isarService;
  BidaSessionsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSessions();
  }

  Future<void> loadSessions() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final data = await db.bidaSessions.where().findAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> openTable(BidaTable table) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        table.status = BidaTableStatus.PLAYING;
        await db.bidaTables.put(table);

        final session = BidaSession()
          ..sessionId = DateTime.now().millisecondsSinceEpoch.toString()
          ..startTime = DateTime.now()
          ..status = BidaSessionStatus.OPEN
          ..hourlyPrice = table.hourlyPrice;
        session.table.value = table;
        
        await db.bidaSessions.put(session);
        await session.table.save();
      });
      await loadSessions();
      ref.read(bidaTablesProvider.notifier).loadTables();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  
  Future<void> addItemToSession(BidaSession session, BidaItem item) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        bool found = false;
        // Convert to mutable list just in case
        final updatedLines = List<BidaOrderLine>.from(session.orderLines);
        for (var line in updatedLines) {
          if (line.itemId == item.itemId) {
            line.quantity += 1;
            found = true;
            break;
          }
        }
        if (!found) {
          updatedLines.add(BidaOrderLine()
            ..itemId = item.itemId
            ..itemName = item.name
            ..price = item.price
            ..quantity = 1);
        }
        session.orderLines = updatedLines;
        await db.bidaSessions.put(session);
        
        item.stock -= 1;
        await db.bidaItems.put(item);
      });
      await loadSessions();
      ref.read(bidaItemsProvider.notifier).loadItems();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> checkoutSession(BidaSession session, double totalTimeCost) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        session.status = BidaSessionStatus.PAID;
        session.endTime = DateTime.now();
        session.totalTimeCost = totalTimeCost;
        await db.bidaSessions.put(session);

        if (session.table.value != null) {
          final table = session.table.value!;
          table.status = BidaTableStatus.EMPTY;
          await db.bidaTables.put(table);
        }
      });
      await loadSessions();
      ref.read(bidaTablesProvider.notifier).loadTables();
      ref.read(bidaDashboardProvider.notifier).loadDashboard();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> transferTable(BidaSession session, BidaTable newTable) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        final oldTable = session.table.value;
        if (oldTable != null) {
          oldTable.status = BidaTableStatus.EMPTY;
          await db.bidaTables.put(oldTable);
        }

        newTable.status = BidaTableStatus.PLAYING;
        await db.bidaTables.put(newTable);

        session.table.value = newTable;
        await session.table.save();
      });
      await loadSessions();
      ref.read(bidaTablesProvider.notifier).loadTables();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> mergeTables(BidaSession sourceSession, BidaSession targetSession, double sourceTimeCost) async {
    try {
      final db = await _isarService.db;
      await db.writeTxn(() async {
        // 1. Add time cost as a special item in target
        final updatedLines = List<BidaOrderLine>.from(targetSession.orderLines);
        updatedLines.add(BidaOrderLine()
          ..itemId = 'MERGE_TIME_${sourceSession.sessionId}'
          ..itemName = 'Tiền giờ ghép từ ${sourceSession.table.value?.name ?? "bàn khác"}'
          ..price = sourceTimeCost
          ..quantity = 1);
          
        // 2. Add all items from source to target
        for (var line in sourceSession.orderLines) {
           bool found = false;
           for (var tLine in updatedLines) {
             if (tLine.itemId == line.itemId) {
               tLine.quantity += line.quantity;
               found = true;
               break;
             }
           }
           if (!found) {
             updatedLines.add(BidaOrderLine()
              ..itemId = line.itemId
              ..itemName = line.itemName
              ..price = line.price
              ..quantity = line.quantity);
           }
        }
        
        targetSession.orderLines = updatedLines;
        await db.bidaSessions.put(targetSession);

        // 3. Close source session and free source table
        sourceSession.status = BidaSessionStatus.CANCELLED; // or MERGED
        sourceSession.endTime = DateTime.now();
        await db.bidaSessions.put(sourceSession);
        
        final sourceTable = sourceSession.table.value;
        if (sourceTable != null) {
          sourceTable.status = BidaTableStatus.EMPTY;
          await db.bidaTables.put(sourceTable);
        }
      });
      await loadSessions();
      ref.read(bidaTablesProvider.notifier).loadTables();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  late Ref ref;
  void setRef(Ref r) => ref = r;
}
final bidaSessionsProvider = StateNotifierProvider<BidaSessionsNotifier, AsyncValue<List<BidaSession>>>((ref) {
  final notifier = BidaSessionsNotifier(ref.watch(bidaIsarServiceProvider));
  notifier.setRef(ref);
  return notifier;
});

// Dashboard Notifier
class BidaDashboardNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final BidaIsarService _isarService;
  BidaDashboardNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final sessions = await db.bidaSessions.where().findAll();
      
      double timeRevenue = 0;
      double itemRevenue = 0;
      
      for (var s in sessions) {
        if (s.status == BidaSessionStatus.PAID) {
          timeRevenue += s.totalTimeCost;
          itemRevenue += s.totalItemCost;
        }
      }
      
      state = AsyncValue.data({
        'timeRevenue': timeRevenue,
        'itemRevenue': itemRevenue,
        'totalRevenue': timeRevenue + itemRevenue,
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
final bidaDashboardProvider = StateNotifierProvider<BidaDashboardNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return BidaDashboardNotifier(ref.watch(bidaIsarServiceProvider));
});

import 'package:isar/isar.dart';
import '../models/error_log.dart';
import 'crm_isar_service.dart';

class CrmErrorLogService {
  final CrmIsarService _isarService;

  CrmErrorLogService(this._isarService);

  Future<List<CrmErrorLog>> getLogs({String? module, String? level}) async {
    final isar = await _isarService.db;
    var query = isar.crmErrorLogs.filter().deletedAtIsNull();
    if (module != null && module.isNotEmpty) {
      query = query.moduleEqualTo(module);
    }
    if (level != null && level.isNotEmpty) {
      query = query.levelEqualTo(level);
    }
    return await query.sortByCreatedAtDesc().findAll();
  }

  Future<void> saveLog(CrmErrorLog log) async {
    final isar = await _isarService.db;
    await isar.writeTxn(() async {
      await isar.crmErrorLogs.put(log);
    });
  }

  Future<void> deleteLog(int isarId) async {
    final isar = await _isarService.db;
    await isar.writeTxn(() async {
      await isar.crmErrorLogs.delete(isarId);
    });
  }

  Future<void> clearSyncedLogs() async {
    final isar = await _isarService.db;
    final synced = await isar.crmErrorLogs.filter().isSyncedEqualTo(true).findAll();
    final ids = synced.map((e) => e.isarId).toList();
    await isar.writeTxn(() async {
      await isar.crmErrorLogs.deleteAll(ids);
    });
  }

  Future<int> getUnsyncedCount() async {
    final isar = await _isarService.db;
    return await isar.crmErrorLogs.filter().isSyncedEqualTo(false).count();
  }

  Future<void> syncAllUnsynced() async {
    final isar = await _isarService.db;
    final unsynced = await isar.crmErrorLogs.filter().isSyncedEqualTo(false).findAll();
    if (unsynced.isEmpty) return;
    await isar.writeTxn(() async {
      for (final log in unsynced) {
        log.isSynced = true;
        log.updatedAt = DateTime.now();
        await isar.crmErrorLogs.put(log);
      }
    });
  }
}

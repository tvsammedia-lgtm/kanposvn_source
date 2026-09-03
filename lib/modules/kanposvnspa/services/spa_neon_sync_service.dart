import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/spa_bed.dart';
import '../models/spa_customer.dart';
import '../models/spa_inventory_models.dart';
import '../models/spa_service_model.dart';
import '../models/spa_session.dart';
import '../models/spa_technician.dart';
import 'spa_isar_service.dart';

class SyncLogEntry {
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({required this.action, required this.success, required this.message});
}

class SpaNeonSyncService {
  final SpaIsarService _isarService;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  SpaNeonSyncService(this._isarService);

  void addLog(String action, bool success, String message) {
    _syncLogs.insert(0, SyncLogEntry(action: action, success: success, message: message));
    if (_syncLogs.length > 100) _syncLogs.removeLast();
  }

  Future<bool> triggerSync(String vercelApiUrl, String apiKey, {String? branchId}) async {
    if (_isSyncing) return false;
    _isSyncing = true;
    try {
      addLog('Bắt đầu đồng bộ', true, 'Đang đồng bộ full snapshot lên Vercel API (Neon DB)...');

      final isar = await _isarService.db;
      final engine = SnapshotSyncEngine(
        apiClient: VercelApiClient(
          pushUrl: '$vercelApiUrl/api/sync/push',
          pullUrl: '$vercelApiUrl/api/sync/pull',
          apiKey: apiKey,
        ),
        appCode: 'kanposvnspa',
        branchId: branchId,
        collections: [
          SnapshotSyncCollection(collection: isar.spaBeds, keyField: 'bedId'),
          SnapshotSyncCollection(collection: isar.spaServiceModels, keyField: 'serviceId'),
          SnapshotSyncCollection(collection: isar.spaTechnicians, keyField: 'techId'),
          SnapshotSyncCollection(collection: isar.spaSessions, keyField: 'sessionId'),
          SnapshotSyncCollection(collection: isar.spaCustomers, keyField: 'customerId'),
          SnapshotSyncCollection(collection: isar.spaProducts, keyField: 'productId'),
          SnapshotSyncCollection(collection: isar.spaInventoryTxs),
        ],
      );

      final result = await engine.sync();

      if (result.success) {
        addLog('Hoàn tất', true, result.message);
        return true;
      } else {
        addLog('Lỗi đồng bộ', false, result.message);
        return false;
      }
    } catch (e) {
      addLog('Lỗi đồng bộ', false, e.toString());
      return false;
    } finally {
      _isSyncing = false;
    }
  }
}

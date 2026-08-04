import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/bida_inventory_tx.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../models/bida_table.dart';
import 'bida_isar_service.dart';

class SyncLogEntry {
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({required this.action, required this.success, required this.message});
}

class BidaNeonSyncService {
  final BidaIsarService _isarService;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  BidaNeonSyncService(this._isarService);

  void addLog(String action, bool success, String message) {
    _syncLogs.insert(0, SyncLogEntry(action: action, success: success, message: message));
    if (_syncLogs.length > 100) _syncLogs.removeLast();
  }

  Future<bool> triggerSync(String vercelApiUrl, String apiKey) async {
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
        appCode: 'kanposvnbida',
        collections: [
          SnapshotSyncCollection(collection: isar.bidaTables, keyField: 'tableId'),
          SnapshotSyncCollection(collection: isar.bidaItems, keyField: 'itemId'),
          SnapshotSyncCollection(collection: isar.bidaSessions, keyField: 'sessionId'),
          SnapshotSyncCollection(collection: isar.bidaInventoryTxs),
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

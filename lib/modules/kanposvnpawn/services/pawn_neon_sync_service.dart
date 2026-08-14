import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/pawn_contract.dart';
import 'pawn_isar_service.dart';

class SyncLogEntry {
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({required this.action, required this.success, required this.message});
}

class PawnNeonSyncService {
  final PawnIsarService _isarService;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  PawnNeonSyncService(this._isarService);

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
        appCode: 'kanposvnpawn',
        collections: [
          SnapshotSyncCollection(collection: isar.customers, keyField: 'customerCode'),
          SnapshotSyncCollection(collection: isar.products, keyField: 'name'),
          SnapshotSyncCollection(collection: isar.pawnContracts, keyField: 'contractNumber'),
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

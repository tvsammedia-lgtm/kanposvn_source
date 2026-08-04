import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/vlxd_finance.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_product.dart';
import 'vlxd_isar_service.dart';

class SyncLogEntry {
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({required this.action, required this.success, required this.message});
}

class VlxdNeonSyncService {
  final VlxdIsarService _isarService;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  VlxdNeonSyncService(this._isarService);

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
        appCode: 'kanposvnvlxd',
        collections: [
          SnapshotSyncCollection(collection: isar.vlxdProductCategorys, keyField: 'categoryId'),
          SnapshotSyncCollection(collection: isar.vlxdProducts, keyField: 'productId'),
          SnapshotSyncCollection(collection: isar.vlxdWarehouses, keyField: 'warehouseId'),
          SnapshotSyncCollection(collection: isar.vlxdInventoryStocks, keyField: 'stockId'),
          SnapshotSyncCollection(collection: isar.vlxdInventoryTransactions, keyField: 'transactionId'),
          SnapshotSyncCollection(collection: isar.vlxdInventoryTransactionDetails),
          SnapshotSyncCollection(collection: isar.vlxdCustomers, keyField: 'customerId'),
          SnapshotSyncCollection(collection: isar.vlxdSuppliers, keyField: 'supplierId'),
          SnapshotSyncCollection(collection: isar.vlxdOrders, keyField: 'orderId'),
          SnapshotSyncCollection(collection: isar.vlxdOrderDetails),
          SnapshotSyncCollection(collection: isar.vlxdDeliveryTickets, keyField: 'ticketId'),
          SnapshotSyncCollection(collection: isar.vlxdFinanceTransactions, keyField: 'transactionId'),
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

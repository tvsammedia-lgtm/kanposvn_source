import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/broker.dart';
import '../models/customer.dart';
import '../models/property.dart';
import '../models/transaction.dart';
import '../repositories/isar_db.dart';

class SyncService {
  Future<void> syncAll() async {
    try {
      final isar = await KanBatDongSanIsarDB.getInstance();
      final engine = SnapshotSyncEngine(
        apiClient: VercelApiClient(),
        appCode: 'kanposvnnbatdongsan',
        collections: [
          SnapshotSyncCollection(collection: isar.propertys, keyField: 'remoteId'),
          SnapshotSyncCollection(collection: isar.customers, keyField: 'remoteId'),
          SnapshotSyncCollection(collection: isar.transactionRecords, keyField: 'remoteId'),
          SnapshotSyncCollection(collection: isar.brokers, keyField: 'remoteId'),
        ],
      );

      await engine.sync();
    } catch (e) {
      // Sync errors are handled by application state or upstream logging.
    }
  }

  Future<void> syncProperties() => syncAll();
}

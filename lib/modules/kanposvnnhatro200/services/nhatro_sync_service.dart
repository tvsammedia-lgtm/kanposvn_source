import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/contract.dart';
import '../models/hostel.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../repositories/nhatro_isar_db.dart';

class NhaTroSyncService {
  Future<void> syncAll() async {
    try {
      final isar = await NhaTroIsarDB.getInstance();
      final engine = SnapshotSyncEngine(
        apiClient: VercelApiClient(),
        appCode: 'kanposvnnhatro200',
        collections: [
          SnapshotSyncCollection(collection: isar.hostels, keyField: 'uuid'),
          SnapshotSyncCollection(collection: isar.rooms, keyField: 'uuid'),
          SnapshotSyncCollection(collection: isar.tenants, keyField: 'uuid'),
          SnapshotSyncCollection(collection: isar.contracts, keyField: 'uuid'),
        ],
      );

      await engine.sync();
    } catch (e) {
      // Sync errors are handled by application state or upstream logging.
    }
  }
}

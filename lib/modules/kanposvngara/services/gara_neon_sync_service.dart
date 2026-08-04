import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/gara_customer.dart';
import '../models/gara_finance.dart';
import '../models/gara_inventory.dart';
import '../models/gara_product.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_supplier.dart';
import '../models/gara_vehicle.dart';
import 'gara_isar_service.dart';

class GaraNeonSyncService {
  final GaraIsarService _isarService;

  GaraNeonSyncService(this._isarService);

  Future<void> triggerSync(String apiUrl, String apiKey) async {
    final isar = await _isarService.db;

    final engine = SnapshotSyncEngine(
      apiClient: VercelApiClient(
        pushUrl: '$apiUrl/api/sync/push',
        pullUrl: '$apiUrl/api/sync/pull',
        apiKey: apiKey,
      ),
      appCode: 'kanposvngara',
      collections: [
        SnapshotSyncCollection(collection: isar.garaCustomers, keyField: 'customerId'),
        SnapshotSyncCollection(collection: isar.garaVehicles, keyField: 'vehicleId'),
        SnapshotSyncCollection(collection: isar.garaProducts, keyField: 'productId'),
        SnapshotSyncCollection(collection: isar.garaRepairOrders, keyField: 'orderId'),
        SnapshotSyncCollection(collection: isar.garaRepairDetails),
        SnapshotSyncCollection(collection: isar.garaSuppliers, keyField: 'supplierId'),
        SnapshotSyncCollection(collection: isar.garaInventoryTransactions, keyField: 'transactionId'),
        SnapshotSyncCollection(collection: isar.garaInventoryDetails),
        SnapshotSyncCollection(collection: isar.garaFinanceTransactions, keyField: 'transactionId'),
      ],
    );

    await engine.sync();
  }
}

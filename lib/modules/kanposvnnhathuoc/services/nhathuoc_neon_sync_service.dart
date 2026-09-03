import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_prescription.dart';
import '../models/nhathuoc_purchase.dart';
import '../models/nhathuoc_supplier.dart';
import 'nhathuoc_isar_service.dart';

class NhathuocNeonSyncService {
  final NhathuocIsarService _isarService;

  NhathuocNeonSyncService(this._isarService);

  Future<void> triggerSync(String apiUrl, String apiKey, {String? branchId}) async {
    final isar = await _isarService.db;

    final engine = SnapshotSyncEngine(
      apiClient: VercelApiClient(
        pushUrl: '$apiUrl/api/sync/push',
        pullUrl: '$apiUrl/api/sync/pull',
        apiKey: apiKey,
      ),
      appCode: 'kanposvnnhathuoc',
      branchId: branchId,
      collections: [
        SnapshotSyncCollection(collection: isar.nhathuocMedicines, keyField: 'medicineId'),
        SnapshotSyncCollection(collection: isar.nhathuocPatients, keyField: 'patientId'),
        SnapshotSyncCollection(collection: isar.nhathuocSuppliers, keyField: 'supplierId'),
        SnapshotSyncCollection(collection: isar.nhathuocOrders, keyField: 'orderId'),
        SnapshotSyncCollection(collection: isar.nhathuocOrderDetails),
        SnapshotSyncCollection(collection: isar.nhathuocPurchases, keyField: 'purchaseId'),
        SnapshotSyncCollection(collection: isar.nhathuocPurchaseDetails),
        SnapshotSyncCollection(collection: isar.nhathuocPrescriptionTemplates, keyField: 'templateId'),
        SnapshotSyncCollection(collection: isar.nhathuocPrescriptionTemplateDetails),
      ],
    );

    await engine.sync();
  }
}

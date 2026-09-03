import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_route.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_vehicle.dart';
import 'vantai_isar_service.dart';

class VantaiNeonSyncService {
  final VantaiIsarService _isarService;

  VantaiNeonSyncService(this._isarService);

  Future<void> triggerSync(String apiUrl, String apiKey, {String? branchId}) async {
    final isar = await _isarService.db;

    final engine = SnapshotSyncEngine(
      apiClient: VercelApiClient(
        pushUrl: '$apiUrl/api/sync/push',
        pullUrl: '$apiUrl/api/sync/pull',
        apiKey: apiKey,
      ),
      appCode: 'kanposvnbanvevantai',
      branchId: branchId,
      collections: [
        SnapshotSyncCollection(collection: isar.vantaiRoutes, keyField: 'routeId'),
        SnapshotSyncCollection(collection: isar.vantaiVehicles, keyField: 'vehicleId'),
        SnapshotSyncCollection(collection: isar.vantaiCustomers, keyField: 'customerId'),
        SnapshotSyncCollection(collection: isar.vantaiTickets, keyField: 'ticketId'),
        SnapshotSyncCollection(collection: isar.vantaiTrips, keyField: 'tripId'),
        SnapshotSyncCollection(collection: isar.vantaiShipments, keyField: 'shipmentId'),
        SnapshotSyncCollection(collection: isar.vantaiExpenses, keyField: 'expenseId'),
      ],
    );

    await engine.sync();
  }
}

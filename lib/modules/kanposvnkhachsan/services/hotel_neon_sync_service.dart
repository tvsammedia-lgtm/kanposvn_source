import 'package:http/http.dart' as http;

import '../../../core/sync/snapshot_sync_engine.dart';
import '../../../core/sync/vercel_api_client.dart';
import '../models/hotel_booking.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_customer_supplier.dart';
import '../models/hotel_finance_accounting.dart';
import '../models/hotel_inventory.dart';
import '../models/hotel_room.dart';
import '../models/hotel_service.dart';
import 'hotel_isar_service.dart';

class SyncLogEntry {
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({required this.action, required this.success, required this.message});
}

class HotelNeonSyncService {
  final HotelIsarService _isarService;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  HotelNeonSyncService(this._isarService);

  void addLog(String action, bool success, String message) {
    _syncLogs.insert(0, SyncLogEntry(action: action, success: success, message: message));
    if (_syncLogs.length > 100) _syncLogs.removeLast();
  }

  Future<bool> testConnection(String vercelApiUrl, String apiKey) async {
    try {
      final uri = Uri.parse('$vercelApiUrl/api/health');
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        addLog('Kiểm tra kết nối Vercel API', true, 'Kết nối Vercel API & Neon DB thành công!');
        return true;
      } else {
        addLog('Kiểm tra kết nối Vercel API', false, 'Vercel Endpoint trả về HTTP ${response.statusCode}');
        return false;
      }
    } catch (e) {
      addLog('Kiểm tra kết nối Vercel API', false, 'Lỗi kết nối hoặc ngoại mạng: $e (Sẽ chạy chế độ Offline First)');
      return false;
    }
  }

  Future<bool> triggerSync(String vercelApiUrl, String apiKey, {String? branchId}) async {
    if (_isSyncing) return false;
    _isSyncing = true;
    try {
      addLog('Bắt đầu đồng bộ', true, 'Đang đồng bộ full snapshot lên Vercel Serverless API...');

      final isar = await _isarService.db;
      final engine = SnapshotSyncEngine(
        apiClient: VercelApiClient(
          pushUrl: '$vercelApiUrl/api/sync/push',
          pullUrl: '$vercelApiUrl/api/sync/pull',
          apiKey: apiKey,
        ),
        appCode: 'kanposvnkhachsan',
        branchId: branchId,
        collections: [
          SnapshotSyncCollection(collection: isar.hotelRooms, keyField: 'roomId'),
          SnapshotSyncCollection(collection: isar.roomTypes, keyField: 'typeCode'),
          SnapshotSyncCollection(collection: isar.hotelFloors, keyField: 'floorCode'),
          SnapshotSyncCollection(collection: isar.roomReservations, keyField: 'reservationId'),
          SnapshotSyncCollection(collection: isar.roomCheckIns, keyField: 'checkInId'),
          SnapshotSyncCollection(collection: isar.hotelServiceItems, keyField: 'itemId'),
          SnapshotSyncCollection(collection: isar.roomServiceOrderItems, keyField: 'orderItemId'),
          SnapshotSyncCollection(collection: isar.hotelInventoryItems, keyField: 'itemId'),
          SnapshotSyncCollection(collection: isar.hotelInventoryTransactions, keyField: 'transactionId'),
          SnapshotSyncCollection(collection: isar.hotelCustomers, keyField: 'customerId'),
          SnapshotSyncCollection(collection: isar.hotelSuppliers, keyField: 'supplierId'),
          SnapshotSyncCollection(collection: isar.hotelCashTransactions, keyField: 'transactionId'),
          SnapshotSyncCollection(collection: isar.hotelShiftReports, keyField: 'reportId'),
          SnapshotSyncCollection(collection: isar.hotelAccountingSummarys, keyField: 'summaryDate'),
        ],
      );

      final result = await engine.sync();

      if (result.success) {
        addLog('Hoàn tất đồng bộ', true, result.message);
        return true;
      } else {
        addLog('Lỗi đồng bộ', false, result.message);
        return false;
      }
    } catch (e) {
      addLog('Lỗi đồng bộ', false, 'Thao tác thất bại: $e');
      return false;
    } finally {
      _isSyncing = false;
    }
  }
}

import 'package:flutter/foundation.dart';
import '../db/database_service.dart';
import 'api_config.dart';
import 'vercel_api_client.dart';

class SyncEngine extends ChangeNotifier {
  final DatabaseService dbService;
  final VercelApiClient apiClient;
  final String appCode;

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  DateTime? _lastSyncTime;
  DateTime? get lastSyncTime => _lastSyncTime;

  String _lastSyncStatus = 'Sẵn sàng đồng bộ';
  String get lastSyncStatus => _lastSyncStatus;

  int _pendingCount = 0;
  int get pendingCount => _pendingCount;

  List<String> _syncLogs = [];
  List<String> get syncLogs => List.unmodifiable(_syncLogs);

  SyncEngine({
    required this.dbService,
    required this.apiClient,
    required this.appCode,
  });

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  /// Bỏ qua thông báo nếu engine đã bị dispose (async đang chạy dở
  /// sau khi app/hot-restart) — tránh lỗi "used after being disposed".
  void _notify() {
    if (_disposed) return;
    notifyListeners();
  }

  void setOnlineStatus(bool online) {
    _isOnline = online;
    _notify();
  }

  void refreshPendingCount() {
    _pendingCount = dbService.pendingSyncCount;
    _notify();
  }

  Future<bool> triggerSync({String? branchId}) async {
    if (_isSyncing || _disposed) return false;
    _isSyncing = true;
    _lastSyncStatus = 'Đang đồng bộ...';
    _addLog('Bắt đầu đồng bộ lên Neon DB');
    _notify();

    try {
      await _pushChanges(branchId: branchId);
      await _pullChanges(branchId: branchId);

      _lastSyncTime = DateTime.now();
      _pendingCount = dbService.pendingSyncCount;
      _lastSyncStatus = 'Đồng bộ hoàn tất';
      _addLog('Hoàn tất đồng bộ');
    } catch (e) {
      _lastSyncStatus = 'Lỗi: $e';
      _addLog('Ngoại lệ: $e');
    } finally {
      _isSyncing = false;
      _notify();
    }
    return true;
  }

  Future<void> _pushChanges({String? branchId}) async {
    final queueItems = dbService.syncQueue;
    if (queueItems.isEmpty) {
      _addLog('Push: không có thay đổi');
      return;
    }

    _addLog('Push: gửi ${queueItems.length} bản ghi...');

    var remaining = queueItems;
    while (remaining.isNotEmpty) {
      final batch = remaining.take(ApiConfig.maxBatchSize).toList();
      remaining = remaining.skip(ApiConfig.maxBatchSize).toList();

      final items = batch.map((item) => {
        'operationId': item.id,
        'collectionName': item.entityName,
        'operationType': item.operation,
        'payload': item.data,
        'createdAt': item.timestamp.toIso8601String(),
      }).toList();

      final result = await apiClient.pushData(appCode: appCode, items: items, branchId: branchId);

      if (result.success) {
        dbService.markSyncQueueProcessed(result.syncedIds);
        _addLog('Push: ${result.syncedIds.length} bản ghi OK');
      } else {
        _addLog('Push lỗi: ${result.message}');
        break;
      }
    }
  }

  Future<void> _pullChanges({String? branchId}) async {
    _addLog('Pull: kiểm tra dữ liệu từ Neon DB...');

    final result = await apiClient.pullData(
      appCode: appCode,
      since: _lastSyncTime,
      branchId: branchId,
    );

    if (!result.success) {
      _addLog('Pull lỗi: ${result.message}');
      return;
    }

    final records = result.pulledRecords;
    if (records.isEmpty) {
      _addLog('Pull: không có dữ liệu mới');
      return;
    }

    _addLog('Pull: nhận ${records.length} bản ghi, đang merge...');
    int merged = 0;

    for (final record in records) {
      try {
        final collection = record['collection'] as String?;
        final itemId = record['itemId'] as String?;
        final data = record['data'] as Map<String, dynamic>?;
        final operation = record['operation'] as String? ?? 'UPSERT';

        if (collection == null || data == null) continue;

        if (operation == 'DELETE') {
          dbService.deleteItem(collection, itemId ?? '', triggerSync: false);
        } else {
          data['isSynced'] = true;
          data['pulledFromCloud'] = true;
          await dbService.saveItem(collection, itemId ?? data['id'] as String, data, triggerSync: false);
        }
        merged++;
      } catch (e) {
        // ignore merge errors
      }
    }

    _addLog('Pull: đã merge $merged/${records.length} bản ghi');
  }

  void _addLog(String log) {
    final ts = DateTime.now().toString().split('.').first;
    _syncLogs.insert(0, '[$ts] $log');
    if (_syncLogs.length > 50) _syncLogs = _syncLogs.sublist(0, 50);
  }
}

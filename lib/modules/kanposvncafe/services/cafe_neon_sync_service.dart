import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/db/database_service.dart';
import '../models/cafe_sync_model.dart';
import 'cafe_isar_service.dart';

class CafeNeonSyncService {
  final CafeIsarService _isarService = CafeIsarService();
  final DatabaseService _db = DatabaseService.instance;

  final List<SyncLogEntry> _syncLogs = [];
  List<SyncLogEntry> get syncLogs => List.unmodifiable(_syncLogs);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  void addLog(String action, bool success, String message) {
    _syncLogs.insert(
      0,
      SyncLogEntry(action: action, success: success, message: message),
    );
    if (_syncLogs.length > 100) _syncLogs.removeLast();
  }

  Future<void> _pullChanges(CafeSyncConfig config) async {
    try {
      final uri = Uri.parse(
        '${config.vercelApiUrl}/api/sync/pull?appCode=kanposvncafe&apiKey=${config.apiKey}',
      );
      final response = await http
          .get(
            uri,
            headers: {
              'Authorization': 'Bearer ${config.apiKey}',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 7));

      if (response.statusCode != 200) {
        addLog(
          'Đồng bộ Pull',
          false,
          'Endpoint đồng bộ trả về HTTP ${response.statusCode}',
        );
        return;
      }

      final res = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final records = (res['records'] as List<dynamic>?) ?? [];

      if (records.isEmpty) {
        addLog('Đồng bộ Pull', true, 'Không có dữ liệu mới từ Cloud');
        return;
      }

      int merged = 0;
      for (final raw in records) {
        try {
          final record = raw as Map<String, dynamic>;
          final collection = record['collection'] as String?;
          final itemId = record['itemId'] as String?;
          final data = record['data'] as Map<String, dynamic>?;
          final operation = record['operation'] as String? ?? 'UPSERT';

          if (collection == null || data == null) continue;

          if (operation == 'DELETE') {
            await _db.deleteItem(collection, itemId ?? '', triggerSync: false);
          } else {
            data['isSynced'] = true;
            data['pulledFromCloud'] = true;
            await _db.saveItem(
              collection,
              itemId ?? data['id'] as String,
              data,
              triggerSync: false,
            );
          }
          merged++;
        } catch (e) {
          // ignore merge errors
        }
      }
      addLog('Đồng bộ Pull', true, 'Đã merge $merged/${records.length} bản ghi từ Cloud');
    } catch (e) {
      addLog(
        'Đồng bộ Pull',
        false,
        'Lỗi kết nối khi pull: $e (giữ chế độ Offline First)',
      );
    }
  }

  Future<bool> testConnection(CafeSyncConfig config) async {
    try {
      final uri = Uri.parse('${config.vercelApiUrl}/api/health');
      final response = await http
          .get(
            uri,
            headers: {
              'Authorization': 'Bearer ${config.apiKey}',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        addLog(
          'Kiểm tra kết nối Cloud',
          true,
          'Kết nối Cloud thành công!',
        );
        return true;
      } else {
        // Fallback simulation mode indicator if server endpoint is offline
        addLog(
          'Kiểm tra kết nối Cloud',
          false,
          'Endpoint đồng bộ trả về HTTP ${response.statusCode}',
        );
        return false;
      }
    } catch (e) {
      addLog(
        'Kiểm tra kết nối Cloud',
        false,
        'Lỗi kết nối hoặc ngoại mạng: $e (Sẽ chạy chế độ Offline First)',
      );
      return false;
    }
  }

  Future<bool> triggerSync() async {
    if (_isSyncing) return false;
    _isSyncing = true;
    try {
      final config = _isarService.getSyncConfig();
      addLog(
        'Bắt đầu đồng bộ',
        true,
        'Đang gửi bản ghi lên Cloud...',
      );

      final pendingItems = _db.syncQueue
          .where((i) => i.status == 'Pending')
          .toList();
      var pushOk = true;
      if (pendingItems.isEmpty) {
        addLog(
          'Đồng bộ Push',
          true,
          'Không có thay đổi nào mới cần đẩy lên Cloud',
        );
      } else {
        // Prepare Push Payload
        final payload = {
          'appCode': 'kanposvncafe',
          'apiKey': config.apiKey,
          'timestamp': DateTime.now().toIso8601String(),
          'items': pendingItems
              .map(
                (i) => {
                  'operationId': i.id,
                  'collectionName': i.entityName,
                  'operationType': i.operation,
                  'payload': i.data,
                  'createdAt': i.timestamp.toIso8601String(),
                },
              )
              .toList(),
        };

        bool pushSuccess = false;
        try {
          final uri = Uri.parse('${config.vercelApiUrl}/api/sync/push');
          final res = await http
              .post(
                uri,
                headers: {
                  'Authorization': 'Bearer ${config.apiKey}',
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(payload),
              )
              .timeout(const Duration(seconds: 7));

          if (res.statusCode == 200 || res.statusCode == 201) {
            pushSuccess = true;
          } else {
            pushOk = false;
            addLog(
              'Đồng bộ Push',
              false,
              'Endpoint đồng bộ trả về HTTP ${res.statusCode}',
            );
          }
        } catch (e) {
          pushOk = false;
          addLog(
            'Đồng bộ Push',
            false,
            'Lỗi kết nối khi push: $e (giữ trong queue để thử lại)',
          );
        }

        if (pushSuccess) {
          final processedIds = pendingItems.map((e) => e.id).toList();
          _db.markSyncQueueProcessed(processedIds);
          addLog(
            'Đồng bộ Push thành công',
            true,
            'Đã đẩy thành công ${pendingItems.length} thao tác lên Cloud',
          );
        } else {
          addLog(
            'Đồng bộ Push',
            false,
            'Đẩy lên thất bại: ${pendingItems.length} thao tác giữ trong hàng chờ',
          );
        }
      }

      // Pull updates step
      addLog(
        'Đồng bộ Pull',
        true,
        'Đang kiểm tra dữ liệu mới từ Cloud...',
      );
      await _pullChanges(config);
      final updatedConfig = config.copyWith(lastSyncedAt: DateTime.now());
      await _isarService.saveSyncConfig(updatedConfig);
      addLog(
        'Hoàn tất đồng bộ',
        true,
        'Đã cập nhật trạng thái đồng bộ thành công vào ${DateTime.now().hour}:${DateTime.now().minute}',
      );

      return pushOk;
    } catch (e) {
      addLog('Lỗi đồng bộ', false, 'Thao tác thất bại: $e');
      return false;
    } finally {
      _isSyncing = false;
    }
  }
}

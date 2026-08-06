import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/sync_model.dart';
import 'taphoa_isar_service.dart';

class TapHoaNeonSyncService {
  final TapHoaIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  TapHoaNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      // 1. Get sync config
      final isar = await _isarService.db;
      var config = await isar.tapHoaSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = TapHoaSyncConfig();
        await isar.writeTxn(() async {
          await isar.tapHoaSyncConfigs.put(config!);
        });
      }

      // 2. Lấy dữ liệu Queue (pending changes)
      final queueItems = await isar.tapHoaSyncQueues.where().findAll();
      
      if (queueItems.isNotEmpty) {
        // Post to Vercel API
        final payload = queueItems.map((q) => {
          'id': q.id,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          // Xóa queue sau khi đồng bộ thành công
          await isar.writeTxn(() async {
            await isar.tapHoaSyncQueues.clear();
          });
        }
      }

      // 3. Kéo dữ liệu mới từ Server (Sync Down)
      final lastSyncStr = config.lastSyncTime?.toIso8601String() ?? '2000-01-01T00:00:00Z';
      final downResponse = await _dio.get(
        '${config.vercelApiUrl}/api/sync/down',
        queryParameters: {'since': lastSyncStr},
        options: Options(headers: {'x-api-key': config.apiKey}),
      );

      if (downResponse.statusCode == 200) {
        // TODO: Xử lý lưu các dữ liệu tải về từ Server vào Isar
        
        // Cập nhật thời gian đồng bộ cuối
        await isar.writeTxn(() async {
          config!.lastSyncTime = DateTime.now();
          await isar.tapHoaSyncConfigs.put(config);
        });
      }

    } catch (e) {
      // Bỏ qua lỗi kết nối (Offline First)
      print('Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

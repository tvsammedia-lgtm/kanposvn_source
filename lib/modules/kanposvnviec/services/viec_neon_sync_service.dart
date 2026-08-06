import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/viec_sync.dart';
import 'viec_isar_service.dart';

class ViecNeonSyncService {
  final ViecIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  ViecNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.viecSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = ViecSyncConfig();
        await isar.writeTxn(() async {
          await isar.viecSyncConfigs.put(config!);
        });
      }

      final queueItems = await isar.viecSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/viec/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.viecSyncQueues.clear();
          });
        }
      }
    } catch (e) {
      print('KanViec Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

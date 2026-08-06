import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/crm_sync.dart';
import 'crm_isar_service.dart';

class CrmNeonSyncService {
  final CrmIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  CrmNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.crmSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = CrmSyncConfig();
        await isar.writeTxn(() async {
          await isar.crmSyncConfigs.put(config!);
        });
      }

      // 1. Sync Up
      final queueItems = await isar.crmSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/crm/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.crmSyncQueues.clear();
          });
        }
      }

      // 2. Sync Down
      final lastSyncStr = config.lastSyncTime?.toIso8601String() ?? '2000-01-01T00:00:00Z';
      final downResponse = await _dio.get(
        '${config.vercelApiUrl}/api/crm/sync/down',
        queryParameters: {'since': lastSyncStr},
        options: Options(headers: {'x-api-key': config.apiKey}),
      );

      if (downResponse.statusCode == 200) {
        // Cập nhật lastSyncTime
        await isar.writeTxn(() async {
          config!.lastSyncTime = DateTime.now();
          await isar.crmSyncConfigs.put(config);
        });
      }
    } catch (e) {
      print('CRM Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

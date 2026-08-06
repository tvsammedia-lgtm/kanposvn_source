import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/eshop_sync.dart';
import 'eshop_isar_service.dart';

class EshopNeonSyncService {
  final EshopIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  EshopNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.kanShopSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = KanShopSyncConfig();
        await isar.writeTxn(() async {
          await isar.kanShopSyncConfigs.put(config!);
        });
      }

      final queueItems = await isar.kanShopSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/eshop/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.kanShopSyncQueues.clear();
          });
        }
      }
    } catch (e) {
      print('KanShop Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

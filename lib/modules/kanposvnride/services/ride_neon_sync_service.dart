import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/ride_sync.dart';
import 'ride_isar_service.dart';

class RideNeonSyncService {
  final RideIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  RideNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.kanRideSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = KanRideSyncConfig();
        await isar.writeTxn(() async {
          await isar.kanRideSyncConfigs.put(config!);
        });
      }

      final queueItems = await isar.kanRideSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/ride/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.kanRideSyncQueues.clear();
          });
        }
      }
    } catch (e) {
      print('KanRide Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

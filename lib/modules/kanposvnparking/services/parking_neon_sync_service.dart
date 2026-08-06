import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/parking_sync.dart';
import 'parking_isar_service.dart';

class ParkingNeonSyncService {
  final ParkingIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  ParkingNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.parkingSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = ParkingSyncConfig();
        await isar.writeTxn(() async {
          await isar.parkingSyncConfigs.put(config!);
        });
      }

      final queueItems = await isar.parkingSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/parking/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.parkingSyncQueues.clear();
          });
        }
      }
    } catch (e) {
      print('Parking Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}

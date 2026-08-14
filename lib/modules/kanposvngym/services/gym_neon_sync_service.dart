import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../models/gym_sync.dart';
import 'gym_isar_service.dart';

class GymNeonSyncService {
  final GymIsarService _isarService;
  final Dio _dio = Dio();
  bool _isSyncing = false;

  GymNeonSyncService(this._isarService);

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      var config = await isar.gymSyncConfigs.filter().configIdEqualTo('default').findFirst();
      
      if (config == null) {
        config = GymSyncConfig();
        await isar.writeTxn(() async {
          await isar.gymSyncConfigs.put(config!);
        });
      }

      // Sync Up
      final queueItems = await isar.gymSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final payload = queueItems.map((q) => {
          'id': q.isarId,
          'operation': q.operation,
          'collection': q.collectionName,
          'recordId': q.recordId,
          'data': jsonDecode(q.dataJson),
        }).toList();

        final response = await _dio.post(
          '${config.vercelApiUrl}/api/gym/sync/up',
          options: Options(headers: {'x-api-key': config.apiKey}),
          data: {'changes': payload},
        );

        if (response.statusCode == 200) {
          await isar.writeTxn(() async {
            await isar.gymSyncQueues.clear();
          });
        }
      }
    } catch (e) {
      debugPrint('GYM Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}


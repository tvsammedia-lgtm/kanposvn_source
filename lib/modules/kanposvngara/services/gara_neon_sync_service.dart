import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'gara_isar_service.dart';
import '../models/gara_sync_model.dart';

class GaraNeonSyncService {
  final GaraIsarService _isarService;
  final Dio _dio = Dio();

  GaraNeonSyncService(this._isarService);

  Future<void> triggerSync(String apiUrl, String apiKey) async {
    final db = await _isarService.db;
    
    final queue = await db.garaSyncQueues.where().filter().isSyncedEqualTo(false).findAll();
    
    for (var item in queue) {
      try {
        final payload = jsonDecode(item.payload);
        final endpoint = '$apiUrl/gara/${item.entityType}';
        
        if (item.action == 'INSERT' || item.action == 'UPDATE') {
           await _dio.post(endpoint, data: payload, options: Options(headers: {'Authorization': 'Bearer $apiKey'}));
        } else if (item.action == 'DELETE') {
           await _dio.delete('$endpoint/${item.entityId}', options: Options(headers: {'Authorization': 'Bearer $apiKey'}));
        }
        
        await db.writeTxn(() async {
          item.isSynced = true;
          await db.garaSyncQueues.put(item);
        });
      } catch (e) {
        await db.writeTxn(() async {
          item.retryCount += 1;
          item.lastError = e.toString();
          await db.garaSyncQueues.put(item);
        });
      }
    }
  }
}

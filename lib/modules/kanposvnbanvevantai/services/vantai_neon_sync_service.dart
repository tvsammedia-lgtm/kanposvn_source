import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'vantai_isar_service.dart';
import '../models/vantai_sync_model.dart';

class VantaiNeonSyncService {
  final VantaiIsarService _isarService;
  final Dio _dio = Dio();

  VantaiNeonSyncService(this._isarService);

  Future<void> triggerSync(String apiUrl, String apiKey) async {
    final db = await _isarService.db;
    
    final queue = await db.vantaiSyncQueues.where().filter().isSyncedEqualTo(false).findAll();
    
    for (var item in queue) {
      try {
        final payload = jsonDecode(item.payload);
        final endpoint = '$apiUrl/vantai/${item.entityType}';
        
        if (item.action == 'INSERT' || item.action == 'UPDATE') {
           await _dio.post(endpoint, data: payload, options: Options(headers: {'Authorization': 'Bearer $apiKey'}));
        } else if (item.action == 'DELETE') {
           await _dio.delete('$endpoint/${item.entityId}', options: Options(headers: {'Authorization': 'Bearer $apiKey'}));
        }
        
        await db.writeTxn(() async {
          item.isSynced = true;
          await db.vantaiSyncQueues.put(item);
        });
      } catch (e) {
        await db.writeTxn(() async {
          item.retryCount += 1;
          item.lastError = e.toString();
          await db.vantaiSyncQueues.put(item);
        });
      }
    }
  }
}

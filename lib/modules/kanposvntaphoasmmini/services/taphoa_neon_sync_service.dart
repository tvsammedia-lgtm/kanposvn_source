import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../models/sync_model.dart';
import 'taphoa_isar_service.dart';

class TapHoaNeonSyncService {
  TapHoaNeonSyncService(this._isarService);

  static const String apiBaseUrl = 'https://kanposvn-admin.vercel.app';
  static const String apiKey = 'kanposvn_sync_2026';
  static const String appCode = 'kanposvntaphoasmmini';

  final TapHoaIsarService _isarService;
  bool _isSyncing = false;

  /// Láº¥y config, tá»± táº¡o hoáº·c tá»± sá»­a vá» Ä‘Ãºng server admin-web
  /// (demo cÅ© cÃ²n lÆ°u URL/Key sai trong Isar).
  Future<TapHoaSyncConfig> _ensureConfig(
      Isar isar, TapHoaSyncConfig? config) async {
    if (config == null) {
      final c = TapHoaSyncConfig()
        ..vercelApiUrl = apiBaseUrl
        ..apiKey = apiKey;
      await isar.writeTxn(() async {
        await isar.tapHoaSyncConfigs.put(c);
      });
      return c;
    }
    if (config.vercelApiUrl != apiBaseUrl || config.apiKey != apiKey) {
      await isar.writeTxn(() async {
        config.vercelApiUrl = apiBaseUrl;
        config.apiKey = apiKey;
        await isar.tapHoaSyncConfigs.put(config);
      });
    }
    return config;
  }

  Future<void> triggerSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final isar = await _isarService.db;
      final existing =
          await isar.tapHoaSyncConfigs.filter().configIdEqualTo('default').findFirst();
      final config = await _ensureConfig(isar, existing);

      // 1. Push queue lÃªn /api/sync/push
      final queueItems = await isar.tapHoaSyncQueues.where().findAll();
      if (queueItems.isNotEmpty) {
        final items = queueItems.map((q) {
          return {
            'operationId': q.id.toString(),
            'collectionName': q.collectionName,
            'operationType': q.operation,
            'payload': jsonDecode(q.dataJson),
          };
        }).toList();

        final response = await http.post(
          Uri.parse('$apiBaseUrl/api/sync/push'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'appCode': appCode,
            'apiKey': apiKey,
            'items': items,
          }),
        );

        if (response.statusCode == 200) {
          // XÃ³a queue sau khi push thÃ nh cÃ´ng
          await isar.writeTxn(() async {
            await isar.tapHoaSyncQueues.clear();
          });
        } else {
          debugPrint('Sync push failed: ${response.statusCode} ${response.body}');
        }
      }

      // 2. KÃ©o dá»¯ liá»‡u má»›i tá»« server (Sync Down)
      final since = config.lastSyncTime?.toIso8601String() ??
          '2000-01-01T00:00:00Z';
      final downResponse = await http.get(
        Uri.parse(
          '$apiBaseUrl/api/sync/pull'
          '?appCode=${Uri.encodeComponent(appCode)}'
          '&apiKey=${Uri.encodeComponent(apiKey)}'
          '&since=${Uri.encodeComponent(since)}',
        ),
      );

      if (downResponse.statusCode == 200) {
        final body = jsonDecode(downResponse.body) as Map<String, dynamic>;
        final records = body['records'] as List<dynamic>? ?? [];
        // TODO: Ã¡p dá»¥ng dá»¯ liá»‡u master (products/customers/suppliers) do admin chá»‰nh

        await isar.writeTxn(() async {
          config.lastSyncTime = DateTime.now().toUtc();
          await isar.tapHoaSyncConfigs.put(config);
        });
        debugPrint('Sync pull ok: ${records.length} records');
      } else {
        debugPrint('Sync pull failed: ${downResponse.statusCode} ${downResponse.body}');
      }

    } catch (e) {
      // Bá» qua lá»—i káº¿t ná»‘i (Offline First), queue Ä‘Æ°á»£c giá»¯ láº¡i Ä‘á»ƒ thá»­ láº§n sau
      debugPrint('Sync Error: $e');
    } finally {
      _isSyncing = false;
    }
  }
}


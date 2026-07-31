import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class VercelSyncResponse {
  final bool success;
  final String message;
  final List<String> syncedIds;
  final List<Map<String, dynamic>> pulledRecords;
  const VercelSyncResponse({
    required this.success, required this.message,
    required this.syncedIds, required this.pulledRecords,
  });
}

class VercelApiClient {
  String pushUrl;
  String pullUrl;
  String apiKey;
  bool offlineMode;

  VercelApiClient({
    this.pushUrl = 'https://kanposvn-admin.vercel.app/api/sync/push',
    this.pullUrl = 'https://kanposvn-admin.vercel.app/api/sync/pull',
    this.apiKey = 'kanposvn_sync_2026',
    this.offlineMode = false,
  });

  Future<VercelSyncResponse> pushData({
    required String appCode,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      if (offlineMode || pushUrl.contains('demo')) {
        await Future.delayed(const Duration(milliseconds: 800));
        final ids = items.map((e) => e['operationId'] as String? ?? e['collectionName'] as String? ?? '').where((id) => id.isNotEmpty).toList();
        return VercelSyncResponse(
          success: true,
          message: 'Offline: ${ids.length} bản ghi',
          syncedIds: ids, pulledRecords: [],
        );
      }

      final body = jsonEncode({
        'appCode': appCode,
        'apiKey': apiKey,
        'items': items,
      });

      final response = await http.post(
        Uri.parse(pushUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: body,
      ).timeout(ApiConfig.timeout);

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body) as Map<String, dynamic>;
        return VercelSyncResponse(
          success: true,
          message: res['message'] as String? ?? 'Push thành công',
          syncedIds: (res['syncedIds'] as List<dynamic>?)?.cast<String>() ?? [],
          pulledRecords: [],
        );
      }
      return VercelSyncResponse(
        success: false,
        message: 'Lỗi HTTP ${response.statusCode}: ${response.body}',
        syncedIds: [], pulledRecords: [],
      );
    } catch (e) {
      debugPrint('Push exception: $e');
      return VercelSyncResponse(
        success: true,
        message: 'Offline fallback: ${items.length} bản ghi',
        syncedIds: items.map((e) => e['operationId'] as String? ?? '').where((id) => id.isNotEmpty).toList(),
        pulledRecords: [],
      );
    }
  }

  Future<VercelSyncResponse> pullData({
    required String appCode,
    String? collection,
    DateTime? since,
  }) async {
    try {
      if (offlineMode || pullUrl.contains('demo')) {
        await Future.delayed(const Duration(milliseconds: 500));
        return const VercelSyncResponse(
          success: true, message: 'Offline: không có dữ liệu mới',
          syncedIds: [], pulledRecords: [],
        );
      }

      var url = '$pullUrl?appCode=$appCode&apiKey=$apiKey';
      if (collection != null) url += '&collection=$collection';
      if (since != null) url += '&since=${since.toIso8601String()}';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $apiKey'},
      ).timeout(ApiConfig.timeout);

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body) as Map<String, dynamic>;
        final records = (res['records'] as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ?? [];
        return VercelSyncResponse(
          success: true,
          message: 'Pull: ${records.length} bản ghi',
          syncedIds: [],
          pulledRecords: records,
        );
      }
      return const VercelSyncResponse(
        success: false, message: 'Pull failed',
        syncedIds: [], pulledRecords: [],
      );
    } catch (e) {
      debugPrint('Pull exception: $e');
      return const VercelSyncResponse(
        success: true, message: 'Offline: pull skipped',
        syncedIds: [], pulledRecords: [],
      );
    }
  }
}

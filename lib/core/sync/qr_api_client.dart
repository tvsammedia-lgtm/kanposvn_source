import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'qr_catalog.dart';

class QrApiException implements Exception {
  final String message;
  QrApiException(this.message);

  @override
  String toString() => message;
}

/// Client gọi các endpoint QR của kanposvn-admin (không login).
class QrApiClient {
  final http.Client _client = http.Client();

  Map<String, String> get _jsonHeaders => {'Content-Type': 'application/json'};

  Map<String, dynamic> _decode(http.Response resp) {
    try {
      final decoded = jsonDecode(resp.body);
      if (decoded is Map<String, dynamic>) return decoded;
      return {'error': resp.body};
    } catch (_) {
      return {'error': resp.body};
    }
  }

  String _messageOf(Map<String, dynamic> data, http.Response resp) {
    final msg = data['message'] ?? data['error'];
    if (msg != null) return '$msg';
    return 'HTTP ${resp.statusCode}';
  }

  /// Đồng bộ bàn + menu lên web; server sinh QR token cho từng bàn.
  Future<QrPublishResult> publish({
    required String appCode,
    String? branchId,
    String? branchCode,
    required String branchName,
    required List<Map<String, dynamic>> tables,
    required List<Map<String, dynamic>> categories,
    required List<Map<String, dynamic>> items,
  }) async {
    final resp = await _client
        .post(
          Uri.parse('${ApiConfig.baseUrl}/api/qr/publish'),
          headers: _jsonHeaders,
          body: jsonEncode({
            'apiKey': ApiConfig.syncApiKey,
            'appCode': appCode,
            if (branchId != null && branchId.isNotEmpty) 'branchId': branchId,
            if (branchCode != null && branchCode.isNotEmpty)
              'branchCode': branchCode,
            'branchName': branchName,
            'tables': tables,
            'categories': categories,
            'items': items,
          }),
        )
        .timeout(ApiConfig.timeout);
    final data = _decode(resp);
    if (resp.statusCode >= 400) {
      throw QrApiException(_messageOf(data, resp));
    }
    return QrPublishResult.fromJson(data);
  }

  /// Kéo đơn online (kèm bàn + item) chưa POS xử lý.
  Future<List<QrRemoteOrder>> fetchOrders({
    required String appCode,
    required String branchId,
    String updatedAfter = '',
  }) async {
    var url =
        '${ApiConfig.baseUrl}/api/sync/orders?app_code=$appCode&branch_id=$branchId';
    if (updatedAfter.isNotEmpty) {
      url += '&updated_after=${Uri.encodeQueryComponent(updatedAfter)}';
    }
    final resp = await _client
        .get(Uri.parse(url))
        .timeout(ApiConfig.timeout);
    final data = _decode(resp);
    if (resp.statusCode >= 400) {
      throw QrApiException(_messageOf(data, resp));
    }
    final list = (data['orders'] as List?) ?? [];
    return list
        .whereType<Map>()
        .map((e) => QrRemoteOrder.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  /// Đổi trạng thái đơn online (POS xác nhận/hủy/bát...).
  Future<bool> updateStatus({
    required String appCode,
    required String orderId,
    required String status,
  }) async {
    final resp = await _client
        .post(
          Uri.parse('${ApiConfig.baseUrl}/api/qr/orders/status'),
          headers: _jsonHeaders,
          body: jsonEncode({
            'apiKey': ApiConfig.syncApiKey,
            'app_code': appCode,
            'order_id': orderId,
            'status': status,
          }),
        )
        .timeout(ApiConfig.timeout);
    final data = _decode(resp);
    if (resp.statusCode >= 400) {
      throw QrApiException(_messageOf(data, resp));
    }
    return true;
  }
}
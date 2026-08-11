import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/sync/api_config.dart';

/// Dịch vụ đọc/ghi dữ liệu CRM từ admin-web (cùng server với phần còn lại
/// của app). Dùng token Cloud đang đăng nhập (Bearer) để xác thực admin.
///
/// - Khách hàng: /api/crm/customers (user đã đăng ký + license + đơn)
/// - Sản phẩm bán: /api/crm/products (các module POS trên admin-web)
/// - Đơn bán đơn giản: /api/crm/sales
class CrmCloudService {
  final String? _token;

  CrmCloudService({String? token}) : _token = token;

  Map<String, String> get _headers {
    final token = _token;
    return {
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  Uri _uri(String path) => Uri.parse('${ApiConfig.baseUrl}$path');

  Future<List<Map<String, dynamic>>> fetchCustomers() async {
    final res = await http
        .get(_uri('/api/crm/customers'), headers: _headers)
        .timeout(ApiConfig.timeout);
    if (res.statusCode == 200) {
      final data = jsonDecode(utf8.decode(res.bodyBytes));
      return List<Map<String, dynamic>>.from(data as List);
    }
    throw Exception('Lỗi tải khách hàng: ${res.statusCode}');
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final res = await http
        .get(_uri('/api/crm/products'), headers: _headers)
        .timeout(ApiConfig.timeout);
    if (res.statusCode == 200) {
      final data = jsonDecode(utf8.decode(res.bodyBytes));
      return List<Map<String, dynamic>>.from(data as List);
    }
    throw Exception('Lỗi tải sản phẩm: ${res.statusCode}');
  }

  Future<List<Map<String, dynamic>>> fetchSales() async {
    final res = await http
        .get(_uri('/api/crm/sales'), headers: _headers)
        .timeout(ApiConfig.timeout);
    if (res.statusCode == 200) {
      final data = jsonDecode(utf8.decode(res.bodyBytes));
      return List<Map<String, dynamic>>.from(data as List);
    }
    throw Exception('Lỗi tải đơn bán: ${res.statusCode}');
  }

  Future<Map<String, dynamic>> createSale({
    String? userId,
    required String customerName,
    required String customerPhone,
    required String productCode,
    required String productName,
    required int amount,
    String note = '',
  }) async {
    final res = await http
        .post(
          _uri('/api/crm/sales'),
          headers: _headers,
          body: jsonEncode({
            'user_id': userId,
            'customer_name': customerName,
            'customer_phone': customerPhone,
            'product_code': productCode,
            'product_name': productName,
            'amount': amount,
            'note': note,
          }),
        )
        .timeout(ApiConfig.timeout);
    final data = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 201 || res.statusCode == 200) {
      return data as Map<String, dynamic>;
    }
    throw Exception((data['error'] as String?) ?? 'Lỗi tạo đơn bán');
  }
}

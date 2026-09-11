import 'dart:convert';
import 'package:http/http.dart' as http;

class GiaphaSyncService {
  final String baseUrl = 'https://api.kanposvn.com/v1'; // Thay bằng URL thật sau
  
  // POST: Đồng bộ dữ liệu local lên server
  Future<void> pushLocalChangesToServer(String accessToken) async {
    final url = Uri.parse('$baseUrl/sync/push');
    
    // TODO: Lấy dữ liệu từ Isar (những record có syncStatus == PENDING)
    final Map<String, dynamic> payload = {
      'persons': [],
      'relationships': [],
      'events': []
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // TODO: Update syncStatus thành 'SYNCED' trong Isar
        print('Đồng bộ lên server thành công!');
      } else {
        print('Lỗi đồng bộ: ${response.body}');
      }
    } catch (e) {
      print('Không thể kết nối đến server: $e');
    }
  }

  // GET: Kéo dữ liệu mới từ server về local
  Future<void> pullRemoteChangesFromServer(String familyId, int lastVersion, String accessToken) async {
    final url = Uri.parse('$baseUrl/sync/pull?familyId=$familyId&sinceVersion=$lastVersion');
    
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        
        // TODO: Ghi đè (Upsert) dữ liệu mới vào Isar bằng writeTxn
        // isar.writeTxnSync(() { ... });
        
        print('Đồng bộ từ server về thành công! Tải được ${data.length} bản ghi.');
      } else {
        print('Lỗi kéo dữ liệu: ${response.body}');
      }
    } catch (e) {
      print('Không thể kết nối đến server: $e');
    }
  }
}

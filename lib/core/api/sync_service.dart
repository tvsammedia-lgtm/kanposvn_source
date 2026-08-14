import 'package:uuid/uuid.dart';

import '../../modules/kanposvnvideocall/models/message.dart';

class SyncService {
  static const String baseUrl = 'https://your-vercel-api.app/api';

  /// Đẩy các tin nhắn chưa được đồng bộ (pending) lên Vercel Server
  /// Hàm này giả lập độ trễ mạng và mô phỏng phản hồi từ server.
  static Future<List<Map<String, dynamic>>> pushMessages(List<VideoCallMessage> pendingMessages) async {
    if (pendingMessages.isEmpty) return [];

    // Giả lập độ trễ API
    await Future.delayed(const Duration(milliseconds: 800));

    // Giả lập Server tạo server_id và trả về
    final uuid = const Uuid();
    List<Map<String, dynamic>> syncResults = [];

    for (var msg in pendingMessages) {
      // Mô phỏng server phản hồi thành công
      syncResults.add({
        'clientMessageId': msg.clientMessageId,
        'serverId': 'SVR-${uuid.v4().substring(0, 8)}',
        'status': 'sent'
      });
    }

    return syncResults;
  }
}

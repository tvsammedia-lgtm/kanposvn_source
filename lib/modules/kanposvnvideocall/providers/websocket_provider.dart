import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'videocall_isar_provider.dart';
import 'message_provider.dart';
import '../models/message.dart';
import '../models/user.dart';
import '../../../core/api/websocket_service.dart';

final typingStateProvider = StateProvider<bool>((ref) => false);

final webSocketProvider = Provider<WebSocketManager>((ref) {
  final isar = ref.watch(videoCallIsarProvider);
  return WebSocketManager(ref, isar);
});

class WebSocketManager {
  final Ref ref;
  final dynamic isar; // Truyền Isar trực tiếp vì Riverpod v2 có thể hạn chế đọc Provider trong hàm async
  late final WebSocketService _service;

  WebSocketManager(this.ref, this.isar) {
    _service = WebSocketService();
    _initListener();
  }

  void connect() {
    _service.connect();
  }

  void disconnect() {
    _service.disconnect();
  }

  void _initListener() {
    _service.eventStream.listen((event) async {
      if (event.type == 'typing') {
        final isTyping = event.data['isTyping'] as bool;
        ref.read(typingStateProvider.notifier).state = isTyping;
      } 
      else if (event.type == 'new_message') {
        // Ghi tin nhắn mới vào CSDL Isar
        final uuid = const Uuid();
        final msg = VideoCallMessage()
          ..clientMessageId = uuid.v4()
          ..conversationUuid = event.data['conversationUuid']
          ..senderUuid = event.data['senderUuid']
          ..content = event.data['content']
          ..status = MessageStatus.delivered
          ..syncStatus = SyncStatus.synced // Tin nhắn từ server về mặc định là đã sync
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await isar.writeTxn(() async {
          await isar.videoCallMessages.put(msg);
        });

        // Kích hoạt load lại danh sách tin nhắn trên UI
        ref.read(messageListProvider(event.data['conversationUuid']).notifier).loadMessages();
      }
      else if (event.type == 'incoming_call') {
        // Trong thực tế sẽ đẩy ra một Modal / Notification gọi điện
        print("CÓ CUỘC GỌI ĐẾN TỪ: ${event.data['callerName']}");
      }
    });
  }
}

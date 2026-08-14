import 'package:flutter/foundation.dart';
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
  final dynamic isar; // Truyá»n Isar trá»±c tiáº¿p vÃ¬ Riverpod v2 cÃ³ thá»ƒ háº¡n cháº¿ Ä‘á»c Provider trong hÃ m async
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
        // Ghi tin nháº¯n má»›i vÃ o CSDL Isar
        final uuid = const Uuid();
        final msg = VideoCallMessage()
          ..clientMessageId = uuid.v4()
          ..conversationUuid = event.data['conversationUuid']
          ..senderUuid = event.data['senderUuid']
          ..content = event.data['content']
          ..status = MessageStatus.delivered
          ..syncStatus = SyncStatus.synced // Tin nháº¯n tá»« server vá» máº·c Ä‘á»‹nh lÃ  Ä‘Ã£ sync
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await isar.writeTxn(() async {
          await isar.videoCallMessages.put(msg);
        });

        // KÃ­ch hoáº¡t load láº¡i danh sÃ¡ch tin nháº¯n trÃªn UI
        ref.read(messageListProvider(event.data['conversationUuid']).notifier).loadMessages();
      }
      else if (event.type == 'incoming_call') {
        // Trong thá»±c táº¿ sáº½ Ä‘áº©y ra má»™t Modal / Notification gá»i Ä‘iá»‡n
        debugPrint("CÃ“ CUá»˜C Gá»ŒI Äáº¾N Tá»ª: ${event.data['callerName']}");
      }
    });
  }
}


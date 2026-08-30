import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/message.dart';
import '../models/conversation.dart';
import '../models/user.dart';
import 'videocall_isar_provider.dart';
import 'package:uuid/uuid.dart';

// Provider này nhận vào uuid của conversation để load riêng tin nhắn của cuộc trò chuyện đó
final messageListProvider = StateNotifierProvider.family<MessageNotifier, AsyncValue<List<VideoCallMessage>>, String>((ref, conversationUuid) {
  final isar = ref.watch(videoCallIsarProvider);
  return MessageNotifier(isar, conversationUuid);
});

class MessageNotifier extends StateNotifier<AsyncValue<List<VideoCallMessage>>> {
  final Isar isar;
  final String conversationUuid;
  final uuid = const Uuid();

  MessageNotifier(this.isar, this.conversationUuid) : super(const AsyncValue.loading()) {
    loadMessages();
  }

  Future<void> loadMessages() async {
    try {
      state = const AsyncValue.loading();
      final messages = await isar.videoCallMessages
          .where()
          .conversationUuidEqualTo(conversationUuid)
          .sortByCreatedAt() // Cũ ở trên, mới ở dưới
          .findAll();
      if (!mounted) return;
      state = AsyncValue.data(messages);
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> sendMessage(String text, String senderUuid) async {
    try {
      final msg = VideoCallMessage()
        ..clientMessageId = uuid.v4()
        ..conversationUuid = conversationUuid
        ..senderUuid = senderUuid
        ..content = text
        ..status = MessageStatus.pending
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..syncStatus = SyncStatus.pending;

      await isar.writeTxn(() async {
        await isar.videoCallMessages.put(msg);
        
        // Cập nhật lại Last message của conversation
        final conv = await isar.videoCallConversations.where().uuidEqualTo(conversationUuid).findFirst();
        if (conv != null) {
          conv.lastMessageId = msg.clientMessageId;
          conv.lastMessageContent = text;
          conv.lastMessageAt = msg.createdAt;
          await isar.videoCallConversations.put(conv);
        }
      });
      
      await loadMessages();
      
      // Ở đây sẽ trigger logic gọi hàm Sync lên Server thông qua WebSocket / API (Giai đoạn sau)
      
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }
}

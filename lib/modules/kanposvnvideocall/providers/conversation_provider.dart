import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/conversation.dart';
import '../models/user.dart';
import 'videocall_isar_provider.dart';
import 'package:uuid/uuid.dart';

final conversationProvider = StateNotifierProvider<ConversationNotifier, AsyncValue<List<VideoCallConversation>>>((ref) {
  final isar = ref.watch(videoCallIsarProvider);
  return ConversationNotifier(isar);
});

class ConversationNotifier extends StateNotifier<AsyncValue<List<VideoCallConversation>>> {
  final Isar isar;
  final uuid = const Uuid();

  ConversationNotifier(this.isar) : super(const AsyncValue.loading()) {
    loadConversations();
  }

  Future<void> loadConversations() async {
    try {
      state = const AsyncValue.loading();
      // Sắp xếp theo tin nhắn mới nhất
      final convs = await isar.videoCallConversations.where().sortByLastMessageAtDesc().findAll();
      if (!mounted) return;
      state = AsyncValue.data(convs);
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addConversation(VideoCallConversation conversation) async {
    try {
      if (conversation.uuid == null || conversation.uuid!.isEmpty) {
        conversation.uuid = uuid.v4();
      }
      conversation.createdAt = DateTime.now();
      conversation.updatedAt = DateTime.now();
      conversation.syncStatus = SyncStatus.pending;
      
      await isar.writeTxn(() async {
        await isar.videoCallConversations.put(conversation);
      });
      await loadConversations();
    } catch (e, st) {
      if (!mounted) return;
      state = AsyncValue.error(e, st);
    }
  }
}

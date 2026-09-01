import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/conversation_provider.dart';
import '../models/conversation.dart';
import 'chat_screen.dart';

class ConversationListScreen extends ConsumerWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convState = ref.watch(conversationProvider);

    return Scaffold(
      body: convState.when(
        data: (convs) {
          if (convs.isEmpty) {
            return const Center(child: Text('Chưa có tin nhắn nào.'));
          }
          return ListView.builder(
            itemCount: convs.length,
            itemBuilder: (context, index) {
              final conv = convs[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(conv.type == ConversationType.group ? Icons.group : Icons.person),
                ),
                title: Text(conv.name ?? 'Trò chuyện'),
                subtitle: Text(conv.lastMessageContent ?? 'Chưa có tin nhắn', maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: conv.lastMessageAt != null 
                    ? Text('${conv.lastMessageAt!.hour}:${conv.lastMessageAt!.minute}') 
                    : null,
                onTap: () {
                  if (conv.uuid != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(conversationUuid: conv.uuid!, title: conv.name ?? 'Trò chuyện')));
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'videocall_fab_conversations',
        onPressed: () {
          // Tạo nhóm chat / Bắt đầu trò chuyện mới
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}

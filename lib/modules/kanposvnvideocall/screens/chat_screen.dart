import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/message_provider.dart';
import '../providers/websocket_provider.dart';
import '../models/message.dart';
import 'video_call_screen.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String conversationUuid;
  final String title;

  const ChatScreen({super.key, required this.conversationUuid, required this.title});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _textCtrl = TextEditingController();

  void _sendMsg() {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;

    // Tạm gọi senderUuid là 'ME'
    ref.read(messageListProvider(widget.conversationUuid).notifier).sendMessage(text, 'ME');
    _textCtrl.clear();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final msgState = ref.watch(messageListProvider(widget.conversationUuid));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => VideoCallScreen(contactName: widget.title)));
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: msgState.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return const Center(child: Text('Bắt đầu cuộc trò chuyện.'));
                }
                return ListView.builder(
                  reverse: true, // Thường app chat mới nhất ở dưới, ta sẽ đảo ngược mảng hoặc dùng reverse
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[messages.length - 1 - index]; // Lật ngược mảng
                    final isMe = msg.senderUuid == 'ME';
                    
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              msg.content ?? '',
                              style: TextStyle(color: isMe ? Colors.white : Colors.black, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Icon(
                              msg.status == MessageStatus.pending ? Icons.schedule : Icons.check, 
                              size: 12, 
                              color: isMe ? Colors.white70 : Colors.black54,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isTyping = ref.watch(typingStateProvider);
              if (isTyping) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Đối phương đang nhập...', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.attach_file, color: Colors.grey), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.image, color: Colors.grey), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: _textCtrl,
                      decoration: InputDecoration(
                        hintText: 'Nhập tin nhắn...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.send, color: Colors.blue), onPressed: _sendMsg),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

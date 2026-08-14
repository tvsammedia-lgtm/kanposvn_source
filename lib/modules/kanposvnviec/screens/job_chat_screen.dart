import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/job_chat_provider.dart';

class JobChatScreen extends ConsumerStatefulWidget {
  final String jobUuid;
  final String jobTitle;
  final String company;
  
  const JobChatScreen({super.key, required this.jobUuid, required this.jobTitle, required this.company});

  @override
  ConsumerState<JobChatScreen> createState() => _JobChatScreenState();
}

class _JobChatScreenState extends ConsumerState<JobChatScreen> {
  final _msgCtrl = TextEditingController();

  void _send() {
    if (_msgCtrl.text.trim().isEmpty) return;
    ref.read(jobChatProvider(widget.jobUuid).notifier).sendMessage(_msgCtrl.text);
    _msgCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(jobChatProvider(widget.jobUuid));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nhân sự - ${widget.company}', style: const TextStyle(fontSize: 16)),
            Text('Ứng tuyển: ${widget.jobTitle}', style: const TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lỗi: $e')),
              data: (msgs) {
                if (msgs.isEmpty) {
                  return const Center(child: Text('Hồ sơ của bạn đã được gửi. Đang đợi bộ phận Nhân sự phản hồi...'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    final msg = msgs[index];
                    final isUser = msg.sender == 'USER';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.teal.shade100 : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(msg.message ?? '', style: const TextStyle(fontSize: 15)),
                      ),
                    );
                  },
                );
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgCtrl,
                    decoration: InputDecoration(
                      hintText: 'Nhắn tin cho nhà tuyển dụng...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _send,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

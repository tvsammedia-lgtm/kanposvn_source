import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/call_history_provider.dart';
import '../models/call_history.dart';

class CallHistoryScreen extends ConsumerWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.watch(callHistoryProvider);

    return Scaffold(
      body: historyState.when(
        data: (histories) {
          if (histories.isEmpty) {
            return const Center(child: Text('Chưa có cuộc gọi nào.'));
          }
          return ListView.builder(
            itemCount: histories.length,
            itemBuilder: (context, index) {
              final call = histories[index];
              final isVideo = call.type == CallType.video;
              
              IconData statusIcon;
              Color statusColor;
              if (call.status == CallHistoryStatus.missed) {
                statusIcon = Icons.call_missed;
                statusColor = Colors.red;
              } else if (call.callerUuid == 'ME') {
                statusIcon = Icons.call_made;
                statusColor = Colors.green;
              } else {
                statusIcon = Icons.call_received;
                statusColor = Colors.blue;
              }

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(isVideo ? Icons.videocam : Icons.call, color: Colors.black54),
                ),
                title: Text(call.callerUuid == 'ME' ? 'Bạn -> Người lạ' : 'Người lạ -> Bạn', style: TextStyle(color: call.status == CallHistoryStatus.missed ? Colors.red : Colors.black)),
                subtitle: Row(
                  children: [
                    Icon(statusIcon, color: statusColor, size: 16),
                    const SizedBox(width: 4),
                    Text('${call.startedAt?.hour}:${call.startedAt?.minute} - ${call.durationSeconds ?? 0}s'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.blue),
                  onPressed: () {},
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'videocall_fab_call_history',
        onPressed: () {
          ref.read(callHistoryProvider.notifier).addMockCall();
        },
        child: const Icon(Icons.add_ic_call),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/assignment_provider.dart';

class AssignmentListScreen extends ConsumerWidget {
  const AssignmentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentState = ref.watch(ngoaiNguAssignmentProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bài tập về nhà')),
      body: assignmentState.when(
        data: (assignments) {
          if (assignments.isEmpty) {
            return const Center(child: Text('Chưa có bài tập nào được giao.'));
          }
          return ListView.builder(
            itemCount: assignments.length,
            itemBuilder: (context, index) {
              final hw = assignments[index];
              return ListTile(
                leading: const Icon(Icons.assignment),
                title: Text(hw.title ?? 'Bài tập không tên'),
                subtitle: Text('Hạn nộp: ${hw.dueDate?.toLocal().toString().split(' ')[0] ?? "Không có"}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Xem chi tiết bài tập
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Giao bài tập mới
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

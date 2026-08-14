import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/class_provider.dart';

class ClassListScreen extends ConsumerWidget {
  const ClassListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classState = ref.watch(ngoaiNguClassProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lớp học'),
      ),
      body: classState.when(
        data: (classes) {
          if (classes.isEmpty) {
            return const Center(child: Text('Chưa có lớp học nào.'));
          }
          return ListView.builder(
            itemCount: classes.length,
            itemBuilder: (context, index) {
              final cls = classes[index];
              return ListTile(
                title: Text(cls.className ?? 'Không tên'),
                subtitle: Text('Sĩ số: ${cls.maxStudents} - Trạng thái: ${cls.status.name}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create class screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

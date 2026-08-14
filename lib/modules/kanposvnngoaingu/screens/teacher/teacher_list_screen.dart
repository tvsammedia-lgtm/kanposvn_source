import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/teacher_provider.dart';

class TeacherListScreen extends ConsumerWidget {
  const TeacherListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherState = ref.watch(ngoaiNguTeacherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giáo viên'),
      ),
      body: teacherState.when(
        data: (teachers) {
          if (teachers.isEmpty) {
            return const Center(child: Text('Chưa có giáo viên nào.'));
          }
          return ListView.builder(
            itemCount: teachers.length,
            itemBuilder: (context, index) {
              final teacher = teachers[index];
              return ListTile(
                leading: CircleAvatar(child: Text(teacher.fullName?.substring(0, 1) ?? '')),
                title: Text(teacher.fullName ?? 'Không tên'),
                subtitle: Text('Môn: ${teacher.teachingLanguage ?? ""} - Chuyên môn: ${teacher.specialization ?? ""}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create teacher screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

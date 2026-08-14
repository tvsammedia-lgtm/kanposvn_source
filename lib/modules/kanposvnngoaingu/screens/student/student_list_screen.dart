import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/student_provider.dart';

class StudentListScreen extends ConsumerWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentState = ref.watch(ngoaiNguStudentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Học viên Ngoại Ngữ'),
      ),
      body: studentState.when(
        data: (students) {
          if (students.isEmpty) {
            return const Center(child: Text('Chưa có học viên nào.'));
          }
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                leading: CircleAvatar(child: Text(student.fullName?.substring(0, 1) ?? '')),
                title: Text(student.fullName ?? 'Không tên'),
                subtitle: Text('Ngôn ngữ: ${student.learningLanguage ?? ""} - Cấp độ: ${student.currentLevel ?? ""}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create student screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

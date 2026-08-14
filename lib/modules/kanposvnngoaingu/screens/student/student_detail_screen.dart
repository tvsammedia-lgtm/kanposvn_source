import 'package:flutter/material.dart';
import '../../models/student.dart';

class StudentDetailScreen extends StatelessWidget {
  final NgoaiNguStudent student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.fullName ?? 'Chi tiết học viên')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 40,
            child: Text(student.fullName?.substring(0, 1) ?? '', style: const TextStyle(fontSize: 40)),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Mã Học Viên'),
            subtitle: Text(student.studentCode ?? 'Chưa cập nhật'),
          ),
          ListTile(
            title: const Text('Điện thoại'),
            subtitle: Text(student.phone ?? 'Chưa cập nhật'),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(student.email ?? 'Chưa cập nhật'),
          ),
          const Divider(),
          const Text('Tiến trình học tập', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(
            title: const Text('Ngôn ngữ'),
            subtitle: Text(student.learningLanguage ?? 'N/A'),
          ),
          ListTile(
            title: const Text('Trình độ hiện tại'),
            subtitle: Text(student.currentLevel ?? 'N/A'),
          ),
          ListTile(
            title: const Text('Mục tiêu'),
            subtitle: Text(student.targetGoal ?? 'N/A'),
          ),
        ],
      ),
    );
  }
}

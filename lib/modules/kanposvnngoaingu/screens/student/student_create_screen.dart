import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/student_provider.dart';
import '../../models/student.dart';

class StudentCreateScreen extends ConsumerStatefulWidget {
  const StudentCreateScreen({super.key});

  @override
  ConsumerState<StudentCreateScreen> createState() => _StudentCreateScreenState();
}

class _StudentCreateScreenState extends ConsumerState<StudentCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _langCtrl = TextEditingController();
  final _levelCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _langCtrl.dispose();
    _levelCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final student = NgoaiNguStudent()
        ..fullName = _nameCtrl.text
        ..phone = _phoneCtrl.text
        ..email = _emailCtrl.text
        ..learningLanguage = _langCtrl.text
        ..currentLevel = _levelCtrl.text
        ..enrollmentDate = DateTime.now()
        ..status = StudentStatus.active;

      ref.read(ngoaiNguStudentProvider.notifier).addStudent(student);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thêm học viên thành công!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm Học Viên Mới')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Họ và tên'),
              validator: (v) => v!.isEmpty ? 'Vui lòng nhập họ tên' : null,
            ),
            TextFormField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            const Text('Thông tin học tập', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _langCtrl,
              decoration: const InputDecoration(labelText: 'Ngôn ngữ (VD: English, Japanese)'),
            ),
            TextFormField(
              controller: _levelCtrl,
              decoration: const InputDecoration(labelText: 'Cấp độ mục tiêu (VD: B1, N3)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Lưu Học Viên'),
            )
          ],
        ),
      ),
    );
  }
}

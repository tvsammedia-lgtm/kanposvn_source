import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/job.dart';
import '../providers/job_provider.dart';

class JobCreateScreen extends ConsumerStatefulWidget {
  const JobCreateScreen({super.key});

  @override
  ConsumerState<JobCreateScreen> createState() => _JobCreateScreenState();
}

class _JobCreateScreenState extends ConsumerState<JobCreateScreen> {
  final _titleCtrl = TextEditingController();
  final _companyCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _salaryCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  void _submit() {
    if (_titleCtrl.text.isEmpty || _salaryCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng điền đủ thông tin')));
      return;
    }

    final job = JobLocal()
      ..title = _titleCtrl.text
      ..company = _companyCtrl.text
      ..address = _addressCtrl.text
      ..salary = double.tryParse(_salaryCtrl.text)
      ..salaryType = 'VND/tháng'
      ..description = _descCtrl.text;
      
    ref.read(jobSearchProvider.notifier).createJob(job);
    
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đăng tin tuyển dụng thành công!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng Tin Tuyển Dụng'), backgroundColor: Colors.orange.shade800),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _titleCtrl, decoration: const InputDecoration(labelText: 'Tiêu đề công việc', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _companyCtrl, decoration: const InputDecoration(labelText: 'Tên công ty/Cửa hàng', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Địa chỉ làm việc', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _salaryCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Mức lương (VNĐ)', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _descCtrl, maxLines: 4, decoration: const InputDecoration(labelText: 'Mô tả chi tiết', border: OutlineInputBorder())),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800),
                child: const Text('ĐĂNG TIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

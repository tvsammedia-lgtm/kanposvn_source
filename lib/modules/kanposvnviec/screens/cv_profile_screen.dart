import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cv_profile.dart';
import '../providers/cv_provider.dart';

class CvProfileScreen extends ConsumerStatefulWidget {
  const CvProfileScreen({super.key});

  @override
  ConsumerState<CvProfileScreen> createState() => _CvProfileScreenState();
}

class _CvProfileScreenState extends ConsumerState<CvProfileScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _posCtrl = TextEditingController();
  final _salaryCtrl = TextEditingController();
  final _expCtrl = TextEditingController();
  final _skillsCtrl = TextEditingController();

  bool _isInit = false;

  @override
  Widget build(BuildContext context) {
    final cvState = ref.watch(cvProvider);

    if (cvState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!_isInit && cvState.value != null) {
      final cv = cvState.value!;
      _nameCtrl.text = cv.fullName ?? '';
      _phoneCtrl.text = cv.phone ?? '';
      _posCtrl.text = cv.desiredPosition ?? '';
      _salaryCtrl.text = (cv.expectedSalary ?? '').toString();
      _expCtrl.text = cv.experience ?? '';
      _skillsCtrl.text = cv.skills ?? '';
      _isInit = true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Hồ Sơ Của Tôi (CV)'), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.teal, child: Icon(Icons.person, size: 40, color: Colors.white)),
            const SizedBox(height: 24),
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Họ và tên', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _posCtrl, decoration: const InputDecoration(labelText: 'Vị trí mong muốn (VD: Thu ngân)', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _salaryCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Mức lương mong muốn (VNĐ)', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _expCtrl, maxLines: 3, decoration: const InputDecoration(labelText: 'Kinh nghiệm làm việc', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            TextField(controller: _skillsCtrl, maxLines: 2, decoration: const InputDecoration(labelText: 'Kỹ năng nổi bật', border: OutlineInputBorder())),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final cv = cvState.value ?? CvProfile();
                  cv.fullName = _nameCtrl.text;
                  cv.phone = _phoneCtrl.text;
                  cv.desiredPosition = _posCtrl.text;
                  cv.expectedSalary = double.tryParse(_salaryCtrl.text);
                  cv.experience = _expCtrl.text;
                  cv.skills = _skillsCtrl.text;
                  
                  ref.read(cvProvider.notifier).saveCv(cv);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lưu CV thành công!')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('LƯU HỒ SƠ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

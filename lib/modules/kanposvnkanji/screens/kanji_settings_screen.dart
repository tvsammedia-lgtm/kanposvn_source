import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverprof.dart';

class KanjiSettingsScreen extends ConsumerStatefulWidget {
  const KanjiSettingsScreen({super.key});
  @override ConsumerState<KanjiSettingsScreen> createState() => _KanjiSettingsScreenState();
}

class _KanjiSettingsScreenState extends ConsumerState<KanjiSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CÀI ĐẶT KANJI'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () => ref.read(authServiceprovider).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CÀI ĐẶT KANJI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Chọn level muốn học:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              _buildLevelOption('Level 1 - Cơ bản'),
              const SizedBox(height: 12),
              _buildLevelOption('Level 2 - Trung cấp'),
              const SizedBox(height: 12),
              _buildLevelOption('Level 3 - Nâng cao'),
              const SizedBox(height: 32),
              const Text(
                'Tổng cộng 997 Kanji được phân theo 3 cấp độ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelOption(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Xử lý chọn level
        },
      ),
    );
  }
}
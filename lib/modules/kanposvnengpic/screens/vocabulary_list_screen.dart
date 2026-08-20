import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/module_selector_screen.dart';

class VocabularyListScreen extends ConsumerStatefulWidget {
  const VocabularyListScreen({super.key});
  @override  ConsumerState<VocabularyListScreen> createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends ConsumerState<VocabularyListScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TỰ DIỆN'),
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
            onPressed: () => ref.read(authServiceProvider).signOut(),
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
                'Từ vựng phổ biến',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...ListTile.divideTiles(
                context: context,
                tiles: const [
                  ListTile(
                    title: Text('Kanji 1: 一'),
                    subtitle: Text('Một'),
                  ),
                  ListTile(
                    title: Text('Kanji 2: 二'),
                    subtitle: Text('Hai'),
                  ),
                  ListTile(
                    title: Text('Kanji 3: 三'),
                    subtitle: Text('Ba'),
                  ),
                ],
              ).toList(),
              const SizedBox(height: 32),
              const Text(
                'Tổng cộng từ vựng: 997 từ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
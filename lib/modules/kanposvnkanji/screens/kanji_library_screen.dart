import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverprof.dart';
import '../../data/db/kanji_db.dart';

class KanjiLibraryScreen extends ConsumerStatefulWidget {
  const KanjiLibraryScreen({super.key});
  @override ConsumerState<KanjiLibraryScreen> createState() => _KanjiLibraryScreenState();
}

class _KanjiLibraryScreenState extends ConsumerState<KanjiLibraryScreen> {
  late Future<List<Map<String, dynamic>>> _kanjiFuture;

  @override
  void initState() {
    super.initState();
    _kanjiFuture = KanjiDb.getKanjiSeedData();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('THƯ VIỆN KANJI'),
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
                'Thư viện Kanji',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tổng cộng: 997 Kanji đã học',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ...ListTile.divideTiles(
                context: context,
                tiles: const [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('一'),
                    ),
                    title: Text('一 - One'),
                    subtitle: Text('Radical: 一'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('二'),
                    ),
                    title: Text('二 - Two'),
                    subtitle: Text('Radical: 二'),
                  ),
                ],
              ).toList(),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Sử dụng thanh tìm kiếm để nhanh chóng tìm Kanji',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
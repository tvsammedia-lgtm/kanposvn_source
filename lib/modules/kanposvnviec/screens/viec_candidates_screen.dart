import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/viec_providers.dart';
import '../models/candidate.dart';

class ViecCandidatesScreen extends ConsumerWidget {
  const ViecCandidatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candidates = ref.watch(viecCandidatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Hồ sơ Ứng Viên'),
        backgroundColor: const Color(0xFF6366F1),
      ),
      body: candidates.isEmpty
          ? const Center(child: Text('Chưa có ứng viên nào'))
          : ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                final c = candidates[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF6366F1),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(c.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${c.phone} - Lương mong muốn: ${c.desiredSalary}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCandidateDialog(context, ref),
        backgroundColor: const Color(0xFF6366F1),
        child: const Icon(Icons.person_add),
      ),
    );
  }

  void _showAddCandidateDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final salaryCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Thêm Ứng Viên Mới'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Họ tên'),
              ),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Số điện thoại'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: salaryCtrl,
                decoration: const InputDecoration(labelText: 'Mức lương mong muốn'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                final candidate = ViecCandidate()
                  ..candidateId = 'CAND_${DateTime.now().millisecondsSinceEpoch}'
                  ..fullName = nameCtrl.text
                  ..phone = phoneCtrl.text
                  ..desiredSalary = double.tryParse(salaryCtrl.text) ?? 0;
                  
                ref.read(viecCandidatesProvider.notifier).saveCandidate(candidate);
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1)),
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    );
  }
}

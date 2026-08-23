import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gym_providers.dart';
import '../models/member.dart';

class GymMembersScreen extends ConsumerWidget {
  const GymMembersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(gymMembersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Hội Viên'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: members.isEmpty
          ? const Center(child: Text('Chưa có hội viên nào'))
          : ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                final m = members[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF1E3A8A),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(m.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${m.phone} - ${m.gender}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMemberDialog(context, ref),
        backgroundColor: const Color(0xFF1E3A8A),
        child: const Icon(Icons.person_add),
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Thêm Hội Viên Mới'),
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.trim().isEmpty) return;
                final phone = phoneCtrl.text.trim();
                final member = GymMember()
                  ..memberId = 'MEM_${DateTime.now().millisecondsSinceEpoch}'
                  ..fullName = nameCtrl.text.trim()
                  ..phone = phone
                  // Mã QR check-in duy nhất: GYM + SĐT (hoặc timestamp nếu trống).
                  ..qrCode = phone.isNotEmpty
                      ? 'GYM$phone'
                      : 'GYM${DateTime.now().millisecondsSinceEpoch}';

                ref.read(gymMembersProvider.notifier).saveMember(member);
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A)),
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      }
    );
  }
}

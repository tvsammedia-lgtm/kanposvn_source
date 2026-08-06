import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crm_providers.dart';

class CrmTicketScreen extends ConsumerWidget {
  const CrmTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(crmTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Ticket Hỗ Trợ'),
        backgroundColor: const Color(0xFFE11D48),
      ),
      body: tickets.isEmpty
          ? const Center(child: Text('Không có ticket nào cần xử lý.'))
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final t = tickets[index];
                return ListTile(
                  leading: const Icon(Icons.support_agent, color: Colors.blue),
                  title: Text(t.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Khách: ${t.customerName} - Trạng thái: ${t.status}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Xem chi tiết ticket
                  },
                );
              },
            ),
    );
  }
}

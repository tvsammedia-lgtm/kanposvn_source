import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/customer_provider.dart';

class CustomerListScreen extends ConsumerWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerState = ref.watch(customerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Khách Hàng')),
      body: customerState.when(
        data: (customers) {
          if (customers.isEmpty) {
            return const Center(child: Text('Chưa có khách hàng nào.'));
          }
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final c = customers[index];
              final debt = c.debtAmount ?? 0;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _tierColor(c.membershipTier).withOpacity(0.15),
                    child: Text(
                      (c.fullName ?? '?')[0],
                      style: TextStyle(color: _tierColor(c.membershipTier), fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(c.fullName ?? 'Không tên', style: const TextStyle(fontSize: 14)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SĐT: ${c.phone ?? ""} · CCCD: ${c.cccd ?? ""}', style: const TextStyle(fontSize: 11)),
                      Row(
                        children: [
                          if (c.membershipTier != null)
                            Chip(
                              label: Text(c.membershipTier!, style: const TextStyle(fontSize: 9, color: Colors.white)),
                              backgroundColor: _tierColor(c.membershipTier),
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          const SizedBox(width: 4),
                          Text('Tích lũy: ${c.rewardPoints ?? 0}đ', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                  trailing: debt > 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Nợ', style: TextStyle(fontSize: 10, color: Colors.red)),
                            Text(_fmt(debt), style: const TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold)),
                          ],
                        )
                      : null,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Color _tierColor(String? tier) {
    switch (tier) {
      case 'Vip':
        return Colors.amber;
      case 'Vàng':
        return Colors.orange;
      case 'Bạc':
        return Colors.blueGrey;
      case 'Đồng':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  String _fmt(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return '${buf}đ';
  }
}

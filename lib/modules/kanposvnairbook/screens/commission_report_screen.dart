import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/airbook_booking_provider.dart';

class CommissionReportScreen extends ConsumerWidget {
  const CommissionReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsState = ref.watch(myBookingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo cáo doanh thu & Hoa hồng'), backgroundColor: Colors.purple.shade800),
      backgroundColor: Colors.grey.shade200,
      body: bookingsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
        data: (bookings) {
          double totalSales = 0;
          double totalCommission = 0;
          
          for (var b in bookings) {
            totalSales += b.totalAmount ?? 0;
            totalCommission += b.commission ?? 0;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        title: 'Tổng doanh số',
                        amount: totalSales,
                        color: Colors.blue,
                        icon: Icons.trending_up,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _StatCard(
                        title: 'Hoa hồng nhận',
                        amount: totalCommission,
                        color: Colors.green,
                        icon: Icons.account_balance_wallet,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Align(alignment: Alignment.centerLeft, child: Text('Lịch sử bán vé', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                const SizedBox(height: 8),
                if (bookings.isEmpty)
                  const Text('Chưa bán được vé nào.')
                else
                  ...bookings.map((b) => Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.purple, child: Icon(Icons.flight, color: Colors.white)),
                      title: Text('PNR: ${b.pnrCode}'),
                      subtitle: Text(DateFormat('dd/MM/yyyy').format(b.createdAt!)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+ ${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(b.commission)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          Text('Giá: ${NumberFormat.compact().format(b.totalAmount)}đ', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ))
              ],
            ),
          );
        }
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;
  final IconData icon;

  const _StatCard({required this.title, required this.amount, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(color: color.withOpacity(0.8), fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            NumberFormat.compactCurrency(locale: 'vi_VN', symbol: '').format(amount),
            style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

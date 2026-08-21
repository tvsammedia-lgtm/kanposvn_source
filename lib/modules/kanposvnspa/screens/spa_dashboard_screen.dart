import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/spa_providers.dart';
import '../../../core/widgets/owner_info_bar.dart';

/// Dashboard thời gian thực (spec §22).
class SpaDashboardScreen extends ConsumerWidget {
  const SpaDashboardScreen({super.key});

  static final _currency = NumberFormat.currency(
      locale: 'vi_VN', symbol: '₫', decimalDigits: 0);

  Widget _metric(String title, String value, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: color),
                textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(title,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(spaDashboardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo Doanh Thu Spa')),
      body: dashboardAsync.when(
        data: (m) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const OwnerInfoBar(),
              const SizedBox(height: 12),
              const Text('TỔNG QUAN HÔM NAY',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: [
                  _metric('Doanh thu hôm nay',
                      _currency.format(m['revenueToday'] ?? 0), Colors.pink,
                      Icons.attach_money),
                  _metric('Doanh thu tháng',
                      _currency.format(m['revenueMonth'] ?? 0), Colors.deepPurple,
                      Icons.calendar_month),
                  _metric('Ca hoàn thành', '${m['completedToday'] ?? 0} ca',
                      Colors.green, Icons.check_circle),
                  _metric('Đang phục vụ', '${m['servingCustomers'] ?? 0} khách',
                      Colors.orange, Icons.self_improvement),
                ],
              ),
              const SizedBox(height: 16),
              const Text('GIƯỜNG & KHÁCH HÀNG',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: [
                  _metric('Giường đang dùng',
                      '${m['bedsInUse'] ?? 0}/${m['bedTotal'] ?? 0}',
                      Colors.purple, Icons.bed),
                  _metric('Giường trống', '${m['bedsEmpty'] ?? 0}',
                      Colors.teal, Icons.event_seat),
                  _metric('Khách mới hôm nay',
                      '${m['newCustomersToday'] ?? 0}', Colors.blue,
                      Icons.person_add),
                  _metric('Tổng khách hàng', '${m['customerTotal'] ?? 0}',
                      Colors.indigo, Icons.groups),
                ],
              ),
              const SizedBox(height: 16),
              const Text('PHÂN TÍCH',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.star, color: Colors.amber),
                      title: const Text('Dịch vụ bán chạy'),
                      trailing: Text('${m['topService'] ?? '—'}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading:
                          const Icon(Icons.emoji_events, color: Colors.orange),
                      title: const Text('KTV doanh thu cao nhất'),
                      trailing: Text('${m['topTechnician'] ?? '—'}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.account_balance_wallet,
                          color: Colors.red),
                      title: const Text('Tổng công nợ'),
                      trailing: Text(_currency.format(m['totalDebt'] ?? 0),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                    ),
                  ],
                ),
              ),
              if (((m['lowStockProducts'] as List?) ?? []).isNotEmpty) ...[
                const SizedBox(height: 16),
                Card(
                  color: Colors.red.shade50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.red.shade700),
                          const SizedBox(width: 8),
                          Text('Cảnh báo tồn kho thấp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade700)),
                        ]),
                        const SizedBox(height: 6),
                        ...((m['lowStockProducts'] as List)
                            .map((n) => Text('• $n'))),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Màn hình Tổng quan — 9 chỉ số theo PRD kanbatdongsan.md mục 4.1.
class BatDongSanHomeScreen extends ConsumerWidget {
  const BatDongSanHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(dashboardMetricsProvider);
    final txsAsync = ref.watch(transactionsProvider);
    final propsAsync = ref.watch(propertiesProvider);
    final customersAsync = ref.watch(customersProvider);
    final brokersAsync = ref.watch(brokersProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(dashboardMetricsProvider);
        ref.invalidate(transactionsProvider);
      },
      child: metricsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (m) {
          final txs = txsAsync.value ?? [];
          final props = propsAsync.value ?? [];
          final custs = customersAsync.value ?? [];
          final brks = brokersAsync.value ?? [];

          // Giao dịch gần đây (5).
          final recent = txs.take(5).toList();

          // Top môi giới theo KPI.
          final rankings = BdsBusinessLogic.brokerRankings(brks, txs);
          final topBrokers = rankings.take(3).toList();

          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.6,
                children: [
                  _MetricCard(
                    label: 'Tổng bất động sản',
                    value: m['totalProperties']!.toInt().toString(),
                    icon: Icons.home_work,
                    color: const Color(0xFF0284C7),
                  ),
                  _MetricCard(
                    label: 'Khách mua',
                    value: m['totalBuyers']!.toInt().toString(),
                    icon: Icons.shopping_cart,
                    color: const Color(0xFF059669),
                  ),
                  _MetricCard(
                    label: 'Khách bán',
                    value: m['totalSellers']!.toInt().toString(),
                    icon: Icons.sell,
                    color: const Color(0xFF7C3AED),
                  ),
                  _MetricCard(
                    label: 'Giao dịch hôm nay',
                    value: m['todayTransactions']!.toInt().toString(),
                    icon: Icons.today,
                    color: const Color(0xFFDC2626),
                  ),
                  _MetricCard(
                    label: 'Giao dịch tháng',
                    value: m['monthTransactions']!.toInt().toString(),
                    icon: Icons.calendar_month,
                    color: const Color(0xFFEA580C),
                  ),
                  _MetricCard(
                    label: 'Doanh thu sàn',
                    value: BdsBusinessLogic.formatMoney(m['revenue']),
                    icon: Icons.trending_up,
                    color: const Color(0xFF0891B2),
                  ),
                  _MetricCard(
                    label: 'Hoa hồng',
                    value: BdsBusinessLogic.formatMoney(m['commission']),
                    icon: Icons.percent,
                    color: const Color(0xFF16A34A),
                  ),
                  _MetricCard(
                    label: 'Phí sàn',
                    value: BdsBusinessLogic.formatMoney(m['floorFee']),
                    icon: Icons.storefront,
                    color: const Color(0xFF9333EA),
                  ),
                  _MetricCard(
                    label: 'Lợi nhuận',
                    value: BdsBusinessLogic.formatMoney(m['profit']),
                    icon: Icons.savings,
                    color: const Color(0xFFB45309),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _RecentTxCard(recent: recent),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _TopBrokersCard(topBrokers: topBrokers),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _PropertyStatusSummary(properties: props, customers: custs),
            ],
          );
        },
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600])),
                  Text(value,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentTxCard extends StatelessWidget {
  final List<dynamic> recent;

  const _RecentTxCard({required this.recent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giao dịch gần đây',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            if (recent.isEmpty)
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Chưa có giao dịch'),
              ),
            for (final t in recent.take(5))
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.handshake, size: 18),
                title: Text('${t.transactionCode ?? '-'} · '
                    '${BdsBusinessLogic.formatMoney(t.finalPrice)}'),
                subtitle: Text(_statusLabel(t.status)),
              ),
          ],
        ),
      ),
    );
  }

  static String _statusLabel(dynamic status) {
    switch (status.index) {
      case 0:
        return 'Đang đàm phán';
      case 1:
        return 'Đặt cọc';
      case 2:
        return 'Đã công chứng';
      case 3:
        return 'Hoàn thành';
      default:
        return 'Đã hủy';
    }
  }
}

class _TopBrokersCard extends StatelessWidget {
  final List<BrokerRanking> topBrokers;

  const _TopBrokersCard({required this.topBrokers});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Môi giới xuất sắc (KPI)',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            if (topBrokers.isEmpty)
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Chưa có dữ liệu'),
              ),
            for (var i = 0; i < topBrokers.length; i++)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      [Colors.amber, Colors.grey, Colors.brown][i],
                  child: Text('#${i + 1}',
                      style: const TextStyle(fontSize: 10, color: Colors.white)),
                ),
                title: Text(topBrokers[i].broker.fullName ?? '-'),
                subtitle: Text(
                    '${topBrokers[i].dealCount} GD · KPI ${topBrokers[i].kpiScore.toStringAsFixed(0)}'),
              ),
          ],
        ),
      ),
    );
  }
}

class _PropertyStatusSummary extends StatelessWidget {
  final List<dynamic> properties;
  final List<dynamic> customers;

  const _PropertyStatusSummary({required this.properties, required this.customers});

  @override
  Widget build(BuildContext context) {
    var available = 0;
    var inProgress = 0;
    var sold = 0;
    for (final p in properties) {
      switch (p.status.index) {
        case 0:
          available++;
          break;
        case 1:
        case 2:
          inProgress++;
          break;
        default:
          sold++;
      }
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _chip('Đang rao', available, Colors.blue),
            _chip('Đang giao dịch', inProgress, Colors.orange),
            _chip('Đã bán', sold, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, int count, Color color) {
    return Column(
      children: [
        Text('$count',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}

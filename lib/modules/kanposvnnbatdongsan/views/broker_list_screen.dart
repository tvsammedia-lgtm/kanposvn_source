import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/broker.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';
import 'broker_form_screen.dart';

/// Danh sách môi giới + theo dõi số GD / doanh thu / hoa hồng / KPI
/// theo PRD kanbatdongsan.md mục 4.2.
class BrokerListScreen extends ConsumerWidget {
  const BrokerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingsAsync = ref.watch(brokerRankingsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (_) => const BrokerFormScreen()));
          ref.invalidate(brokersProvider);
        },
        child: const Icon(Icons.add),
      ),
      body: rankingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (rankings) {
          if (rankings.isEmpty) {
            return const Center(child: Text('Chưa có môi giới'));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 88),
            itemCount: rankings.length,
            itemBuilder: (context, i) {
              final r = rankings[i];
              final b = r.broker;
              final statusColor = switch (b.status) {
                BrokerStatus.active => Colors.green,
                BrokerStatus.inactive => Colors.grey,
                BrokerStatus.suspended => Colors.red,
              };
              final statusLabel = switch (b.status) {
                BrokerStatus.active => 'Đang làm',
                BrokerStatus.inactive => 'Nghỉ',
                BrokerStatus.suspended => 'Đình chỉ',
              };
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BrokerFormScreen(broker: b)));
                    ref.invalidate(brokersProvider);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xFF0284C7)
                                .withOpacity(0.12),
                            child: Text(
                              (b.fullName ?? '?').substring(0, 1),
                              style: const TextStyle(color: Color(0xFF0284C7)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${b.brokerCode ?? '-'} · ${b.fullName ?? '-'}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                                Text('${b.phone ?? '-'} · ${b.branch ?? '-'}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600])),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(statusLabel,
                                style: TextStyle(
                                    fontSize: 11, color: statusColor)),
                          ),
                        ]),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _stat('${r.dealCount}', 'GD hoàn thành'),
                            _stat(BdsBusinessLogic.formatMoney(r.salesValue),
                                'Doanh số'),
                            _stat(
                                BdsBusinessLogic.formatMoney(
                                    r.commissionEarned),
                                'Hoa hồng nhận'),
                            _stat(r.kpiScore.toStringAsFixed(0), 'KPI',
                                highlight: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _stat(String value, String label, {bool highlight = false}) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: highlight ? const Color(0xFFB45309) : null,
            )),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/bida_session.dart';
import '../providers/bida_providers.dart';
import 'bida_pos_screen.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: '');

/// Tab "Đang chơi" — liệt kê các buổi OPEN đang hoạt động.
class BidaActiveSessionsScreen extends ConsumerWidget {
  const BidaActiveSessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(bidaSessionsProvider);

    return sessionsAsync.when(
        data: (sessions) {
          final active = sessions
              .where((s) => s.status == BidaSessionStatus.OPEN)
              .toList();
          if (active.isEmpty) {
            return const Center(
              child: Text('Không có buổi nào đang chơi.\nHãy mở bàn từ Sơ đồ Bàn.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: active.length,
            itemBuilder: (ctx, i) => _ActiveSessionCard(session: active[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      );
  }
}

class _ActiveSessionCard extends ConsumerWidget {
  final BidaSession session;
  const _ActiveSessionCard({required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final start = session.startTime ?? now;
    final elapsed = now.difference(start);
    final hours = elapsed.inHours;
    final mins = elapsed.inMinutes % 60;
    final elapsedStr = '${hours}h ${mins.toString().padLeft(2, '0')}m';

    final price = session.hourlyPrice;
    final hoursCharged = elapsed.inMinutes / 60.0;
    final timeCost = (hoursCharged * price).ceilToDouble();

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BidaPosScreen(table: session.table.value!),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      session.table.value?.name ?? '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.table.value?.type.label ?? '',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                        if (session.customerName.isNotEmpty)
                          Text(
                            session.customerName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      elapsedStr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giờ vào: ${DateFormat('HH:mm').format(start)}'),
                  Text('${_currency.format(price)}đ/giờ'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tiền bàn ước tính:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '${_currency.format(timeCost)}đ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              if (session.orderLines.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  '${session.orderLines.length} món đã gọi · ${_currency.format(session.totalItemCost)}đ',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.point_of_sale, color: Colors.white),
                  label: const Text('Mở POS', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BidaPosScreen(table: session.table.value!),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

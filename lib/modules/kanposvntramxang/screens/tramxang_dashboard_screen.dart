import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';

/// Dashboard trạm xăng: chỉ số nhanh + menu điều hướng tới các tab chức năng.
class TramXangDashboardScreen extends ConsumerStatefulWidget {
  final ValueChanged<String>? onNavigate;
  final bool seeding;

  const TramXangDashboardScreen({super.key, this.onNavigate, this.seeding = false});

  @override
  ConsumerState<TramXangDashboardScreen> createState() =>
      _TramXangDashboardScreenState();
}

class _TramXangDashboardScreenState
    extends ConsumerState<TramXangDashboardScreen> {
  String _money(double v) {
    return v.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  }

  Future<Map<String, Object?>> _loadStats() async {
    final service = ref.read(tramXangIsarServiceProvider);
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = now.add(const Duration(minutes: 1));
    final today = await service.getSalesTotalsBetween(start, end);
    final tanks = await service.getTanks();
    final products = await service.getProducts();
    final lines = await service.getInventoryTransactions();

    final stockMap = <String, double>{};
    for (final tx in lines) {
      stockMap[tx.productId] =
          (stockMap[tx.productId] ?? 0) + tx.inQty - tx.outQty;
    }

    final lowTanks =
        tanks.where((t) => t.currentQuantity <= t.criticalLevelLiter).length;
    var lowProducts = 0;
    for (final p in products) {
      if (p.trackInventory && (stockMap[p.productId] ?? 0) <= p.minStock) {
        lowProducts++;
      }
    }

    return {
      'total': today.total,
      'count': today.count,
      'cash': today.cash,
      'nonCash': today.nonCash,
      'debt': today.debt,
      'lowTanks': lowTanks,
      'lowProducts': lowProducts,
    };
  }

  @override
  Widget build(BuildContext context) {
    final activeShift = ref.watch(tramXangActiveShiftProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Trạm Xăng Dashboard')),
      body: FutureBuilder(
        future: _loadStats(),
        builder: (context, snap) {
          final stats = snap.data;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (widget.seeding)
                const LinearProgressIndicator(),
              if (activeShift != null)
                Card(
                  color: const Color(0xFFE8F5E9),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle,
                        color: Colors.green),
                    title: const Text('Ca đang mở'),
                    subtitle: Text(
                        'Mở lúc ${_d(activeShift.openedAt)} · Tiền mặt đầu ca ${_money(activeShift.openingCash)} đ'),
                  ),
                )
              else
                Card(
                  color: const Color(0xFFFFF3E0),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.orange),
                        const SizedBox(width: 8),
                        const Expanded(child: Text('Chưa mở ca bán hàng.')),
                        TextButton(
                          onPressed: () =>
                              widget.onNavigate?.call('shift'),
                          child: const Text('MỞ CA'),
                        ),
                      ],
                    ),
                  ),
                ),
              if (stats != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Doanh thu hôm nay',
                          '${_money(stats['total'] as double)} đ',
                          Icons.attach_money, Colors.green),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Hóa đơn',
                          '${stats['count']}', Icons.receipt_long,
                          Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Tiền mặt',
                          '${_money(stats['cash'] as double)} đ',
                          Icons.payments, Colors.teal),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Công nợ',
                          '${_money(stats['debt'] as double)} đ',
                          Icons.account_balance_wallet, Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Bồn cạn sắp hết',
                          '${stats['lowTanks']} bồn',
                          Icons.warning_amber, Colors.red),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Mặt hàng sắp hết',
                          '${stats['lowProducts']}',
                          Icons.inventory, Colors.purple),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.15,
                children: [
                  _menu(context, 'POS Bán Hàng', Icons.point_of_sale,
                      Colors.green, 'pos'),
                  _menu(context, 'Bán Xăng Tại Vòi', Icons.local_gas_station,
                      Colors.orange, 'fuel'),
                  _menu(context, 'Quản Lý Bồn', Icons.propane_tank,
                      Colors.teal, 'tank'),
                  _menu(context, 'Ca Bán Hàng', Icons.schedule,
                      Colors.indigo, 'shift'),
                  _menu(context, 'Báo Cáo', Icons.bar_chart, Colors.brown,
                      'report'),
                  _menu(context, 'Nạp Lại Dữ Liệu Mẫu', Icons.restore,
                      Colors.deepOrange, 'seed'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  String _d(DateTime t) {
    return '${t.day}/${t.month} ${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
  }

  Widget _kpi(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
            Text(label,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _menu(
      BuildContext context, String title, IconData icon, Color color, String id) {
    return Card(
      color: color.withValues(alpha: 0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (id == 'seed') {
            _confirmReseed(context);
            return;
          }
          widget.onNavigate?.call(id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmReseed(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nạp lại dữ liệu mẫu?'),
        content: const Text(
            'Xóa toàn bộ dữ liệu hiện tại và tạo lại dữ liệu mẫu ban đầu.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Đồng ý')),
        ],
      ),
    );
    if (confirmed == true) {
      await ref
          .read(tramXangBootstrapProvider.notifier)
          .seedAndRefresh(force: true);
      ref.read(tramXangSalesProvider.notifier).loadSales();
      ref.read(tramXangActiveShiftProvider.notifier).loadActiveShift();
    }
  }
}
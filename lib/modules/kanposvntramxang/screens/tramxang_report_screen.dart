import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tramxang_providers.dart';
import '../services/tramxang_isar_service.dart';

/// Báo cáo: doanh thu theo kỳ + đối chiếu bồn chứa + lịch sử bán hàng.
class TramXangReportScreen extends ConsumerStatefulWidget {
  const TramXangReportScreen({super.key});

  @override
  ConsumerState<TramXangReportScreen> createState() =>
      _TramXangReportScreenState();
}

class _TramXangReportScreenState extends ConsumerState<TramXangReportScreen> {
  String _period = 'TODAY'; // TODAY, WEEK, MONTH

  String _money(double v) {
    return v.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  }

  (DateTime, DateTime) _range() {
    final now = DateTime.now();
    switch (_period) {
      case 'WEEK':
        final start = now.subtract(Duration(days: now.weekday - 1));
        return (
          DateTime(start.year, start.month, start.day),
          now.add(const Duration(minutes: 1))
        );
      case 'MONTH':
        return (
          DateTime(now.year, now.month, 1),
          now.add(const Duration(minutes: 1))
        );
      default:
        return (
          DateTime(now.year, now.month, now.day),
          now.add(const Duration(minutes: 1))
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final (start, end) = _range();
    final service = ref.watch(tramXangIsarServiceProvider);
    final reconAsync = ref.watch(tramXangTankReconProvider);
    final sales = ref.watch(tramXangSalesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(tramXangSalesProvider.notifier).loadSales();
          ref.invalidate(tramXangTankReconProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Wrap(
              spacing: 8,
              children: [
                for (final p in [
                  ('TODAY', 'Hôm nay'),
                  ('WEEK', 'Tuần này'),
                  ('MONTH', 'Tháng này'),
                ])
                  ChoiceChip(
                    label: Text(p.$2),
                    selected: _period == p.$1,
                    onSelected: (_) => setState(() => _period = p.$1),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            FutureBuilder(
              future: service.getSalesTotalsBetween(start, end),
              builder: (context, snap) => _buildRevenueCard(snap),
            ),
            FutureBuilder(
              future: service.getCostOfGoodsBetween(start, end),
              builder: (context, costSnap) {
                final cost = costSnap.data ?? 0;
                return FutureBuilder(
                  future: service.getSalesTotalsBetween(start, end),
                  builder: (context, snap) {
                    final total = snap.data?.total ?? 0;
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.savings,
                            color: Colors.teal),
                        title: const Text('Lợi nhuận gộp (ước tính)'),
                        trailing: Text(
                          '${_money(total - cost)} đ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const Text('Đối chiếu bồn chứa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            if (reconAsync is AsyncData && reconAsync.value != null)
              Card(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Bồn')),
                    DataColumn(label: Text('Đầu')),
                    DataColumn(label: Text('Nhập')),
                    DataColumn(label: Text('Bán')),
                    DataColumn(label: Text('Lý thuyết')),
                    DataColumn(label: Text('Thực tế')),
                    DataColumn(label: Text('Lệch')),
                  ],
                  rows: [
                    for (final r in reconAsync.value!)
                      DataRow(
                        cells: [
                          DataCell(Text(r.tank.name)),
                          DataCell(Text(_money(r.opening))),
                          DataCell(Text(_money(r.imported))),
                          DataCell(Text(_money(r.sold))),
                          DataCell(Text(_money(r.theoretical))),
                          DataCell(Text(_money(r.actual))),
                          DataCell(Text(
                            _money(r.diff),
                            style: TextStyle(
                                color: r.diff.abs() > 1
                                    ? Colors.red
                                    : Colors.green),
                          )),
                        ],
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            const Text('Giao dịch gần đây',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            if (sales.isEmpty)
              const Card(child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Chưa có giao dịch nào.')))
            else
              for (final s in sales.take(30))
                Card(
                  child: ListTile(
                    leading: Icon(
                      s.saleType == 'FUEL'
                          ? Icons.local_gas_station
                          : Icons.shopping_bag,
                      color: s.saleType == 'FUEL'
                          ? Colors.orange
                          : Colors.teal,
                    ),
                    title: Text(
                        '${s.saleNo} - ${_money(s.total)} đ'),
                    subtitle: Text(
                        '${_d(s.createdAt)} | ${_method(s.paymentMethod)} | ${s.status}'),
                    trailing: s.debt > 0
                        ? Text('Nợ ${_money(s.debt)}',
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold))
                        : null,
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(AsyncSnapshot<TramXangShiftTotals> snap) {
    final data = snap.data;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Doanh thu kỳ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            if (data == null)
              const Center(child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator()))
            else ...[
              _row('Số hóa đơn', '${data.count}'),
              _row('Doanh thu', '${_money(data.total)} đ'),
              _row('Tiền mặt', '${_money(data.cash)} đ',
                  color: Colors.green),
              _row('Chuyển khoản', '${_money(data.transfer)} đ',
                  color: Colors.blue),
              _row('QR Code', '${_money(data.qr)} đ', color: Colors.purple),
              _row('Công nợ', '${_money(data.debt)} đ',
                  color: Colors.orange),
              _row('Thuế GTGT', '${_money(data.tax)} đ', color: Colors.grey),
            ],
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color)),
        ],
      ),
    );
  }

  String _d(DateTime t) {
    return '${t.day}/${t.month}/${t.year} ${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
  }

  String _method(String m) {
    return switch (m) {
      'CASH' => 'Tiền mặt',
      'TRANSFER' => 'Chuyển khoản',
      'QR' => 'QR',
      'DEBT' => 'Ghi nợ',
      _ => m,
    };
  }
}
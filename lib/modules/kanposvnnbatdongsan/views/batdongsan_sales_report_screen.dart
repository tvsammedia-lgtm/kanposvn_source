import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/customer.dart';
import '../models/property.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Báo cáo theo PRD kanbatdongsan.md mục 15 — 6 nhóm báo cáo.
class BatDongSanSalesReportScreen extends ConsumerWidget {
  const BatDongSanSalesReportScreen({super.key});

  static const _tabs = [
    Tab(text: 'Giao dịch'),
    Tab(text: 'Doanh thu'),
    Tab(text: 'Lợi nhuận'),
    Tab(text: 'Môi giới'),
    Tab(text: 'BĐS'),
    Tab(text: 'Khách hàng'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[50],
            foregroundColor: Colors.black87,
            elevation: 0,
            bottom: TabBar(
              isScrollable: true,
              tabs: _tabs,
              labelColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TxMonthReport(),
            RevenueReport(),
            ProfitReportTab(),
            BrokerReportTab(),
            PropertyReportTab(),
            CustomerReportTab(),
          ],
        ),
      ),
    );
  }
}

// ================= 1. BÁO CÁO GIAO DỊCH THÁNG =================

class TxMonthReport extends ConsumerStatefulWidget {
  const TxMonthReport({super.key});

  @override
  ConsumerState<TxMonthReport> createState() => _TxMonthReportState();
}

class _TxMonthReportState extends ConsumerState<TxMonthReport> {
  late DateTime _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = DateTime(now.year, now.month);
  }

  Future<void> _pickMonth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(_month.year, _month.month, 1),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) {
      setState(() => _month = DateTime(picked.year, picked.month));
    }
  }

  @override
  Widget build(BuildContext context) {
    final txsAsync = ref.watch(transactionsProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [
          Text('Tháng ${_month.month}/${_month.year}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          IconButton(
              onPressed: _pickMonth, icon: const Icon(Icons.calendar_month)),
        ]),
        const SizedBox(height: 8),
        txsAsync.maybeWhen(
          data: (txs) {
            final r = BdsBusinessLogic.monthlyTransactionReport(
                txs, _month.year, _month.month);
            return Column(children: [
              Row(children: [
                Expanded(
                    child: _card('Tổng giao dịch', '${r.total}',
                        const Color(0xFF0284C7))),
                const SizedBox(width: 8),
                Expanded(
                    child: _card('Tổng giá trị',
                        '${BdsBusinessLogic.formatMoney(r.totalValue)} đ',
                        Colors.purple)),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: _card(
                        'Thành công', '${r.successCount}', Colors.green)),
                const SizedBox(width: 8),
                Expanded(
                    child:
                        _card('Hủy', '${r.cancelledCount}', Colors.red)),
              ]),
            ]);
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }

  Widget _card(String label, String value, Color color) => Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            Text(value,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ]),
        ),
      );
}

// ================= 2. BÁO CÁO DOANH THU =================

class RevenueReport extends ConsumerStatefulWidget {
  const RevenueReport({super.key});

  @override
  ConsumerState<RevenueReport> createState() => _RevenueReportState();
}

class _RevenueReportState extends ConsumerState<RevenueReport> {
  int _mode = 2; // 0=tháng, 1=quý, 2=năm
  late int _year;
  int? _quarter;
  int? _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = now.year;
    _quarter = ((now.month - 1) ~/ 3 + 1);
    _month = now.month;
  }

  @override
  Widget build(BuildContext context) {
    final txsAsync = ref.watch(transactionsProvider);
    final feesAsync = ref.watch(floorFeesProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 0, label: Text('Tháng')),
            ButtonSegment(value: 1, label: Text('Quý')),
            ButtonSegment(value: 2, label: Text('Năm')),
          ],
          selected: {_mode},
          onSelectionChanged: (s) => setState(() => _mode = s.first),
        ),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (_mode == 0)
            DropdownButton<int>(
              value: (_month ?? 1).clamp(1, 12),
              items: List.generate(12, (i) => i + 1)
                  .map((n) =>
                      DropdownMenuItem(value: n, child: Text('T$n')))
                  .toList(),
              onChanged: (v) => setState(() => _month = v),
            ),
          if (_mode == 1)
            DropdownButton<int>(
              value: (_quarter ?? 1).clamp(1, 4),
              items: List.generate(4, (i) => i + 1)
                  .map((n) =>
                      DropdownMenuItem(value: n, child: Text('Q$n')))
                  .toList(),
              onChanged: (v) => setState(() => _quarter = v),
            ),
          if (_mode < 2) const SizedBox(width: 12),
          DropdownButton<int>(
            value: _year,
            items: [2023, 2024, 2025, 2026]
                .map((y) => DropdownMenuItem(value: y, child: Text('$y')))
                .toList(),
            onChanged: (v) => setState(() => _year = v ?? _year),
          ),
        ]),
        const SizedBox(height: 12),
        (txsAsync.value != null && feesAsync.value != null)
            ? () {
                final r = BdsBusinessLogic.profitReport(
                  txsAsync.value!,
                  feesAsync.value!,
                  year: _year,
                  quarter: _mode == 1 ? _quarter : null,
                  month: _mode == 0 ? _month : null,
                );
                return Column(children: [
                  _bigRow('Doanh thu', r.revenue, Colors.green),
                  const SizedBox(height: 8),
                  _line('· Phí sàn + hoa hồng (GD hoàn thành)',
                      r.transactionIncome),
                  _line('· Phí quảng cáo/dịch vụ/hồ sơ', r.feeIncome),
                  const Divider(),
                  _bigRow('Chi phí', -r.expense, Colors.red),
                  const SizedBox(height: 8),
                  _line('· Hoa hồng trả môi giới', -r.brokerPayout),
                  _line('· Chi phí khác', -r.otherExpense),
                  const Divider(thickness: 2),
                  _bigRow('LỢI NHUẬN', r.profit,
                      r.profit >= 0 ? Colors.green : Colors.red),
                ]);
              }()
            : const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 20),
        // Doanh số theo tháng trong năm (biểu đồ cột).
        Text('Doanh số theo tháng ($_year)',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        txsAsync.maybeWhen(data: (txs) {
          final series =
              BdsBusinessLogic.monthlySalesSeries(txs, _year);
          final maxV =
              series.fold<double>(0.001, (m, v) => v > m ? v : m);
          return SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < 12; i++)
                  Expanded(
                    child: Tooltip(
                      message: 'T${i + 1}: '
                          '${BdsBusinessLogic.formatMoney(series[i])} đ',
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 100 *
                                      (series[i] / maxV).clamp(0, 1) +
                                  2,
                              color: const Color(0xFF0284C7)
                                  .withOpacity(series[i] > 0 ? 0.7 : 0.15),
                            ),
                            const SizedBox(height: 4),
                            Text('${i + 1}',
                                style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }, orElse: () => const SizedBox.shrink()),
      ],
    );
  }

  Widget _bigRow(String label, double value, Color color) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600)),
          Text('${BdsBusinessLogic.formatMoney(value)} đ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color)),
        ],
      );

  Widget _line(String label, double value) => Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 13)),
            Text('${BdsBusinessLogic.formatMoney(value)} đ',
                style: const TextStyle(fontSize: 13)),
          ],
        ),
      );
}

// ================= 3. BÁO CÁO LỢI NHUẬN =================

class ProfitReportTab extends ConsumerWidget {
  const ProfitReportTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profitAsync = ref.watch(profitReportProvider);

    return profitAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (r) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: r.profit >= 0
                  ? Colors.green.withOpacity(0.06)
                  : Colors.red.withOpacity(0.06),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(r.profit >= 0 ? 'Lợi nhuận' : 'Thua lỗ',
                      style: const TextStyle(fontSize: 14)),
                  Text(
                    '${BdsBusinessLogic.formatMoney(r.profit.abs())} đ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:
                            r.profit >= 0 ? Colors.green : Colors.red),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 12),
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              children: [
                _row(['Khoản mục', 'Giá trị'], header: true),
                _row([
                  'Doanh thu GD hoàn thành (phí sàn + hoa hồng)',
                  BdsBusinessLogic.formatMoney(r.transactionIncome)
                ]),
                _row([
                  'Thu phí quảng cáo/dịch vụ/hồ sơ',
                  BdsBusinessLogic.formatMoney(r.feeIncome)
                ]),
                _row([
                  'Trả môi giới (thực nhận)',
                  '-${BdsBusinessLogic.formatMoney(r.brokerPayout)}'
                ]),
                _row([
                  'Chi phí khác',
                  '-${BdsBusinessLogic.formatMoney(r.otherExpense)}'
                ]),
                _row(['= Lợi nhuận', BdsBusinessLogic.formatMoney(r.profit)],
                    header: true),
              ],
            ),
          ]),
    );
  }

  TableRow _row(List<String> cells, {bool header = false}) => TableRow(
        decoration:
            header ? const BoxDecoration(color: Color(0xFFF5F5F5)) : null,
        children: cells
            .map((c) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(c,
                      style: TextStyle(
                          fontWeight: header
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 13)),
                ))
            .toList(),
      );
}

// ================= 4. BÁO CÁO MÔI GIỚI =================

class BrokerReportTab extends ConsumerWidget {
  const BrokerReportTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingsAsync = ref.watch(brokerRankingsProvider);

    return rankingsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (rankings) {
        if (rankings.isEmpty) {
          return const Center(child: Text('Chưa có môi giới'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: rankings.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final r = rankings[i];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      i == 0 ? Colors.amber : const Color(0xFF0284C7),
                  child: Text('#${i + 1}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12)),
                ),
                title: Text(
                    '${r.broker.brokerCode ?? ''} · ${r.broker.fullName ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                    '${r.dealCount} GD hoàn thành · Doanh số '
                    '${BdsBusinessLogic.formatMoney(r.salesValue)} đ · '
                    'HH nhận ${BdsBusinessLogic.formatMoney(r.commissionEarned)} đ'),
                trailing: Chip(
                  label: Text('KPI ${r.kpiScore.toStringAsFixed(0)}'),
                  backgroundColor: Colors.orange.withOpacity(0.12),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ================= 5. BÁO CÁO BẤT ĐỘNG SẢN =================

class PropertyReportTab extends ConsumerWidget {
  const PropertyReportTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propsAsync = ref.watch(propertiesProvider);

    return propsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (props) {
        var available = 0, negotiating = 0, deposited = 0, sold = 0;
        for (final p in props) {
          switch (p.status) {
            case PropertyStatus.available:
              available++;
            case PropertyStatus.negotiating:
              negotiating++;
            case PropertyStatus.deposited:
              deposited++;
            case PropertyStatus.sold:
              sold++;
          }
        }
        final byCategory = <String, int>{};
        for (final p in props) {
          final cat =
              BdsBusinessLogic.propertyCategory(p.propertyType);
          byCategory[cat] = (byCategory[cat] ?? 0) + 1;
        }
        final byDistrict = <String, int>{};
        for (final p in props) {
          final d = p.district ?? 'Khác';
          byDistrict[d] = (byDistrict[d] ?? 0) + 1;
        }
        final districtEntries = byDistrict.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Theo trạng thái',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child:
                      _statCard('Chưa bán', '$available', Colors.blue)),
              const SizedBox(width: 6),
              Expanded(
                  child: _statCard('Đang GD',
                      '${negotiating + deposited}', Colors.orange)),
              const SizedBox(width: 6),
              Expanded(
                  child: _statCard('Đã bán', '$sold', Colors.green)),
            ]),
            const SizedBox(height: 16),
            const Text('Theo phân loại',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            ...byCategory.entries.map((e) =>
                _bar(e.key, e.value, props.length, Colors.indigo)),
            const SizedBox(height: 16),
            const Text('Theo khu vực (Quận/Huyện)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            ...districtEntries.map((e) =>
                _bar(e.key, e.value, props.length, Colors.teal)),
          ],
        );
      },
    );
  }

  Widget _statCard(String l, String v, Color c) => Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Text(v,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: c)),
            Text(l, style: const TextStyle(fontSize: 11)),
          ]),
        ),
      );

  Widget _bar(String label, int count, int total, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(children: [
        SizedBox(
            width: 110,
            child: Text(label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12))),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: total > 0 ? count / total : 0,
              minHeight: 14,
              backgroundColor: Colors.grey[200],
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
            width: 24,
            child: Text('$count',
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 12))),
      ]),
    );
  }
}

// ================= 6. BÁO CÁO KHÁCH HÀNG =================

class CustomerReportTab extends ConsumerWidget {
  const CustomerReportTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(customersProvider);
    final txsAsync = ref.watch(transactionsProvider);

    return customersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (customers) {
        final report = BdsBusinessLogic.customerReport(
            customers, txsAsync.value ?? []);
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(children: [
              Expanded(
                  child: _card('Khách mua mới (tháng này)',
                      '${report.newBuyersThisMonth}', Colors.blue)),
              const SizedBox(width: 8),
              Expanded(
                  child: _card('Khách bán mới (tháng này)',
                      '${report.newSellersThisMonth}', Colors.purple)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: _card('Đang giao dịch',
                      '${report.buyersInTransaction}', Colors.orange)),
              const SizedBox(width: 8),
              Expanded(
                  child: _card('Khách VIP', '${report.vipCount}',
                      Colors.deepOrange)),
            ]),
            const SizedBox(height: 20),
            const Text('Khách hàng VIP',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ...customers
                .where((c) => c.isVip && c.deletedAt == null)
                .map((c) => ListTile(
                      dense: true,
                      leading: const Icon(Icons.star,
                          color: Colors.amber, size: 20),
                      title: Text(c.name ?? '-'),
                      subtitle: Text(
                          '${c.type == CustomerType.buyer ? "Khách mua" : "Khách bán"} · ${c.phone ?? "-"}'),
                    )),
          ],
        );
      },
    );
  }

  Widget _card(String label, String value, Color color) => Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            Text(value,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color)),
            const SizedBox(height: 4),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11)),
          ]),
        ),
      );
}

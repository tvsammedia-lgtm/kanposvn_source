import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/bida_providers.dart';
import '../providers/bida_partner_providers.dart';
import '../services/bida_business_logic.dart';

final _fmt = NumberFormat.currency(locale: 'vi_VN', symbol: '');

/// Tab "Báo cáo" — tổng hợp doanh thu / chi phí / lợi nhuận / tồn kho / công nợ.
class BidaReportsScreen extends ConsumerStatefulWidget {
  const BidaReportsScreen({super.key});

  @override
  ConsumerState<BidaReportsScreen> createState() => _BidaReportsScreenState();
}

enum _ReportType { revenue, expense, profit, inventory, debt }

class _BidaReportsScreenState extends ConsumerState<BidaReportsScreen> {
  _ReportType _selected = _ReportType.revenue;
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Hôm nay';

  @override
  void initState() {
    super.initState();
    _setTodayFilter();
  }

  void _setTodayFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, now.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Hôm nay';
    });
  }

  void _setWeekFilter() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    setState(() {
      _startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Tuần này';
    });
  }

  void _setMonthFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, 1);
      _endDate = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
      _filterPeriod = 'Tháng này';
    });
  }

  Future<void> _selectDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: now,
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: _endDate!)
          : null,
    );
    if (picked != null && mounted) {
      setState(() {
        _startDate = picked.start;
        _endDate = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
        _filterPeriod = 'Tùy chỉnh';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _buildFilterBar(),
          _buildReportTypeBar(),
          const Divider(height: 1),
          Expanded(child: _buildReportContent()),
        ],
      );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip('Hôm nay', _filterPeriod == 'Hôm nay', _setTodayFilter),
          const SizedBox(width: 6),
          _chip('Tuần này', _filterPeriod == 'Tuần này', _setWeekFilter),
          const SizedBox(width: 6),
          _chip('Tháng này', _filterPeriod == 'Tháng này', _setMonthFilter),
          const SizedBox(width: 6),
          _chip('Tùy chỉnh', _filterPeriod == 'Tùy chỉnh', _selectDateRange),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return FilterChip(
      label: Text(label, style: TextStyle(fontSize: 11.5, color: selected ? Colors.white : const Color(0xFF059669))),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: const Color(0xFF059669),
      checkmarkColor: Colors.white,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildReportTypeBar() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            _reportTab('Doanh thu', Icons.trending_up, _ReportType.revenue),
            _reportTab('Chi phí', Icons.money_off, _ReportType.expense),
            _reportTab('Lợi nhuận', Icons.account_balance, _ReportType.profit),
            _reportTab('Tồn kho', Icons.inventory_2, _ReportType.inventory),
            _reportTab('Công nợ', Icons.handshake, _ReportType.debt),
          ],
        ),
      ),
    );
  }

  Widget _reportTab(String label, IconData icon, _ReportType type) {
    final selected = _selected == type;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        avatar: Icon(icon, size: 18, color: selected ? Colors.white : const Color(0xFF059669)),
        label: Text(label, style: TextStyle(fontSize: 12, color: selected ? Colors.white : const Color(0xFF059669))),
        selected: selected,
        onSelected: (_) => setState(() => _selected = type),
        selectedColor: const Color(0xFF059669),
        checkmarkColor: Colors.white,
      ),
    );
  }

  Widget _buildReportContent() {
    switch (_selected) {
      case _ReportType.revenue:
        return _RevenueReport(from: _startDate!, to: _endDate!);
      case _ReportType.expense:
        return _ExpenseReport(from: _startDate!, to: _endDate!);
      case _ReportType.profit:
        return _ProfitReport(from: _startDate!, to: _endDate!);
      case _ReportType.inventory:
        return const _InventoryReport();
      case _ReportType.debt:
        return const _DebtReport();
    }
  }
}

// ─────────────────── Doanh thu ───────────────────

class _RevenueReport extends ConsumerWidget {
  final DateTime from, to;
  const _RevenueReport({required this.from, required this.to});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Map<String, double>>(
      future: ref.read(bidaIsarServiceProvider).db.then(
        (db) => BidaBusinessLogic.revenueReport(db, from, to),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final data = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard('Tổng doanh thu', data['total'] ?? 0, Colors.green),
            const SizedBox(height: 12),
            _detailRow('Tiền bàn', data['time'] ?? 0),
            _detailRow('Đồ uống', data['drink'] ?? 0),
            _detailRow('Bia', data['beer'] ?? 0),
            _detailRow('Đồ ăn', data['food'] ?? 0),
            _detailRow('Thuốc lá', data['tobacco'] ?? 0),
            _detailRow('Khác', data['other'] ?? 0),
          ],
        );
      },
    );
  }
}

// ─────────────────── Chi phí ───────────────────

class _ExpenseReport extends ConsumerWidget {
  final DateTime from, to;
  const _ExpenseReport({required this.from, required this.to});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Map<String, double>>(
      future: ref.read(bidaIsarServiceProvider).db.then(
        (db) => BidaBusinessLogic.expenseReport(db, from, to),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final data = snapshot.data!;
        final total = data.values.fold<double>(0, (s, v) => s + v);
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard('Tổng chi phí', total, Colors.red),
            const SizedBox(height: 12),
            for (final e in data.entries)
              _detailRow(e.key, e.value),
            if (data.isEmpty) const Text('Không có chi phí trong kỳ'),
          ],
        );
      },
    );
  }
}

// ─────────────────── Lợi nhuận ───────────────────

class _ProfitReport extends ConsumerWidget {
  final DateTime from, to;
  const _ProfitReport({required this.from, required this.to});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Map<String, double>>(
      future: ref.read(bidaIsarServiceProvider).db.then(
        (db) => BidaBusinessLogic.profitReport(db, from, to),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final data = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard('Doanh thu', data['revenue'] ?? 0, Colors.green),
            const SizedBox(height: 8),
            _summaryCard('Giá vốn (COGS)', data['cogs'] ?? 0, Colors.orange),
            const SizedBox(height: 8),
            _summaryCard('Chi phí', data['expenses'] ?? 0, Colors.red),
            const SizedBox(height: 12),
            const Divider(),
            _summaryCard('Lợi nhuận ròng', data['net'] ?? 0,
                (data['net'] ?? 0) >= 0 ? Colors.blue : Colors.red),
          ],
        );
      },
    );
  }
}

// ─────────────────── Tồn kho (dùng provider có sẵn) ───────────────────

class _InventoryReport extends ConsumerWidget {
  const _InventoryReport();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(bidaItemsProvider);
    return itemsAsync.when(
      data: (items) {
        final totalValue = items.fold<double>(0, (s, i) => s + i.stock * i.costPrice);
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _summaryCard('Tổng giá trị tồn kho', totalValue, Colors.blue),
            const SizedBox(height: 12),
            for (final item in items)
              Card(
                margin: const EdgeInsets.only(bottom: 6),
                child: ListTile(
                  title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${item.stock} ${item.category.label} · Giá vốn: ${_fmt.format(item.costPrice)}đ'),
                  trailing: Text(
                    '${_fmt.format(item.stock * item.costPrice)}đ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

// ─────────────────── Công nợ (dùng provider có sẵn) ───────────────────

class _DebtReport extends ConsumerWidget {
  const _DebtReport();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(bidaCustomersProvider);
    final suppliersAsync = ref.watch(bidaSuppliersProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        customersAsync.when(
          data: (customers) {
            final customerDebt = customers.fold<double>(0, (s, c) => s + c.debtBalance);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _summaryCard('Phải thu (KH)', customerDebt, Colors.green),
                const SizedBox(height: 12),
                const Text('KH có nợ:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                for (final c in customers.where((c) => c.debtBalance > 0))
                  Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: ListTile(
                      title: Text(c.name),
                      trailing: Text(
                        '${_fmt.format(c.debtBalance)}đ',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (customers.every((c) => c.debtBalance <= 0))
                  const Padding(padding: EdgeInsets.all(8), child: Text('Không có khách nợ')),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
        ),
        const SizedBox(height: 16),
        const Divider(),
        suppliersAsync.when(
          data: (suppliers) {
            final supplierDebt = suppliers.fold<double>(0, (s, c) => s + c.debtBalance);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _summaryCard('Phải chi (NCC)', supplierDebt, Colors.red),
                const SizedBox(height: 12),
                const Text('NCC có nợ:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                for (final s in suppliers.where((s) => s.debtBalance > 0))
                  Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: ListTile(
                      title: Text(s.name),
                      trailing: Text(
                        '${_fmt.format(s.debtBalance)}đ',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (suppliers.every((s) => s.debtBalance <= 0))
                  const Padding(padding: EdgeInsets.all(8), child: Text('Không có NCC nợ')),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
        ),
      ],
    );
  }
}

// ─────────────────── Helpers ───────────────────

Widget _summaryCard(String title, double value, Color color) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700]))),
          Text(
            '${_fmt.format(value)}đ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    ),
  );
}

Widget _detailRow(String label, double value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text('${_fmt.format(value)}đ', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    ),
  );
}

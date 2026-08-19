import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../providers/isar_provider.dart';
import '../models/pawn_contract.dart';
import '../models/pawn_cash_transaction.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../../../core/widgets/owner_info_bar.dart';

class PawnDashboardScreen extends ConsumerStatefulWidget {
  const PawnDashboardScreen({super.key});

  @override
  ConsumerState<PawnDashboardScreen> createState() => _PawnDashboardScreenState();
}

class _PawnDashboardScreenState extends ConsumerState<PawnDashboardScreen> {
  Map<String, dynamic> _metrics = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    setState(() => _loading = true);
    try {
      final isarService = ref.read(pawnIsarServiceProvider);
      final isar = await isarService.db;
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final monthStart = DateTime(now.year, now.month, 1);

      // Pawn contracts
      final allContracts = await isar.pawnContracts.where().findAll();
      final activeContracts = allContracts.where((c) => c.status == PawnStatus.active).toList();
      final overdueContracts = allContracts.where((c) => c.status == PawnStatus.overdue).toList();
      final redeemedContracts = allContracts.where((c) => c.status == PawnStatus.redeemed).toList();
      final liquidatedContracts = allContracts.where((c) => c.status == PawnStatus.liquidated).toList();

      // Cash transactions
      final allTxns = await isar.pawnCashTransactions.where().findAll();
      final todayTxns = allTxns.where((t) => t.createdAt != null && t.createdAt!.isAfter(todayStart)).toList();
      final monthTxns = allTxns.where((t) => t.createdAt != null && t.createdAt!.isAfter(monthStart)).toList();

      final todayIncome = todayTxns.where((t) => t.type == TransactionType.income).fold<double>(0, (s, t) => s + (t.amount ?? 0));
      final todayExpense = todayTxns.where((t) => t.type == TransactionType.expense).fold<double>(0, (s, t) => s + (t.amount ?? 0));
      final monthIncome = monthTxns.where((t) => t.type == TransactionType.income).fold<double>(0, (s, t) => s + (t.amount ?? 0));
      final monthExpense = monthTxns.where((t) => t.type == TransactionType.expense).fold<double>(0, (s, t) => s + (t.amount ?? 0));

      // Interest collected today
      final interestToday = todayTxns
          .where((t) => t.category == 'Thu lãi cầm đồ' && t.type == TransactionType.income)
          .fold<double>(0, (s, t) => s + (t.amount ?? 0));

      // Customers & Products
      final customerCount = await isar.customers.count();
      final productCount = await isar.products.count();
      final totalInventoryValue = (await isar.products.where().findAll())
          .fold<double>(0, (s, p) => s + ((p.costPrice ?? 0) * (p.stock ?? 0)));

      // Customer debt
      final customers = await isar.customers.where().findAll();
      final totalDebt = customers.fold<double>(0, (s, c) => s + (c.debtAmount ?? 0));

      setState(() {
        _metrics = {
          'todayIncome': todayIncome,
          'todayExpense': todayExpense,
          'monthIncome': monthIncome,
          'monthExpense': monthExpense,
          'profit': monthIncome - monthExpense,
          'interestToday': interestToday,
          'activeCount': activeContracts.length,
          'overdueCount': overdueContracts.length,
          'redeemedCount': redeemedContracts.length,
          'liquidatedCount': liquidatedContracts.length,
          'totalContracts': allContracts.length,
          'customerCount': customerCount,
          'productCount': productCount,
          'inventoryValue': totalInventoryValue,
          'totalDebt': totalDebt,
        };
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
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

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    return RefreshIndicator(
      onRefresh: _loadMetrics,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const OwnerInfoBar(),
          const SizedBox(height: 8),

          // DOANH THU HÔM NAY
          _sectionTitle('DOANH THU HÔM NAY', Colors.blue),
          Row(children: [
            _metricCard('Thu hôm nay', _fmt(_metrics['todayIncome'] ?? 0), Colors.green, Icons.trending_up),
            _metricCard('Chi hôm nay', _fmt(_metrics['todayExpense'] ?? 0), Colors.red, Icons.trending_down),
            _metricCard('Lãi net', _fmt((_metrics['todayIncome'] ?? 0) - (_metrics['todayExpense'] ?? 0)),
                (_metrics['todayIncome'] ?? 0) >= (_metrics['todayExpense'] ?? 0) ? Colors.green : Colors.red,
                Icons.account_balance_wallet),
          ]),

          const SizedBox(height: 12),

          // LÃI CẦM ĐỒ
          _sectionTitle('LÃI CẦM ĐỒ', Colors.orange),
          Row(children: [
            _metricCard('Lãi thu hôm nay', _fmt(_metrics['interestToday'] ?? 0), Colors.orange, Icons.savings),
            _metricCard('Phiếu active', '${_metrics['activeCount'] ?? 0}', Colors.blue, Icons.description),
            _metricCard('Quá hạn', '${_metrics['overdueCount'] ?? 0}', Colors.red, Icons.warning_amber),
          ]),

          const SizedBox(height: 12),

          // TỔNG QUAN
          _sectionTitle('TỔNG QUAN', Colors.deepPurple),
          Row(children: [
            _metricCard('Tổng HĐ', '${_metrics['totalContracts'] ?? 0}', Colors.deepPurple, Icons.receipt_long),
            _metricCard('Đã chuộc', '${_metrics['redeemedCount'] ?? 0}', Colors.green, Icons.check_circle),
            _metricCard('Đã thanh lý', '${_metrics['liquidatedCount'] ?? 0}', Colors.brown, Icons.sell),
          ]),

          const SizedBox(height: 12),

          // KHO & CÔNG NỢ
          _sectionTitle('KHO & CÔNG NỢ', Colors.indigo),
          Row(children: [
            _metricCard('Tồn kho', '${_metrics['productCount'] ?? 0}', Colors.indigo, Icons.inventory_2),
            _metricCard('Giá trị tồn', _fmt(_metrics['inventoryValue'] ?? 0), Colors.indigo, Icons.attach_money),
            _metricCard('Công nợ KH', _fmt(_metrics['totalDebt'] ?? 0), Colors.red, Icons.people),
          ]),

          const SizedBox(height: 12),

          // THU CHI THÁNG
          _sectionTitle('THU CHI THÁNG', Colors.teal),
          Row(children: [
            _metricCard('Thu tháng', _fmt(_metrics['monthIncome'] ?? 0), Colors.teal, Icons.show_chart),
            _metricCard('Chi tháng', _fmt(_metrics['monthExpense'] ?? 0), Colors.orange, Icons.bar_chart),
            _metricCard('Lợi nhuận', _fmt(_metrics['profit'] ?? 0),
                (_metrics['profit'] ?? 0) >= 0 ? Colors.green : Colors.red, Icons.pie_chart),
          ]),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _metricCard(String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
              const SizedBox(height: 2),
              Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../../../core/reports/crystal_report_widgets.dart';
import '../models/tt_product.dart';
import '../providers/tt_providers.dart';
import '../services/tt_report_service.dart';

/// Tab "Báo cáo chung" — mô phỏng báo cáo Crystal (.rpt) của KANPOSVN TRUYỀN THỐNG.
class TtReportsScreen extends ConsumerStatefulWidget {
  const TtReportsScreen({super.key});

  @override
  ConsumerState<TtReportsScreen> createState() => _TtReportsScreenState();
}

enum _ReportGroup { cash, sales, pnl, stock, debt }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;

  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

class _TtReportsScreenState extends ConsumerState<TtReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_book', 'Sổ quỹ tiền mặt', Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('revenue_day', 'Doanh thu theo ngày', Icons.today, _ReportGroup.sales),
    _ReportDescriptor('revenue_month', 'Doanh thu theo tháng', Icons.calendar_month, _ReportGroup.sales),
    _ReportDescriptor('revenue_product', 'Doanh thu theo sản phẩm', Icons.local_grocery_store, _ReportGroup.sales),
    _ReportDescriptor('revenue_customer', 'Doanh thu theo khách hàng', Icons.people, _ReportGroup.sales),
    _ReportDescriptor('expense', 'Báo cáo chi phí', Icons.payments_outlined, _ReportGroup.sales),
    _ReportDescriptor('profit_loss', 'Báo cáo lãi / lỗ', Icons.assessment, _ReportGroup.pnl),
    _ReportDescriptor('balance', 'Cân đối doanh thu - chi phí', Icons.balance, _ReportGroup.pnl),
    _ReportDescriptor('stock_summary', 'Tổng hợp nhập - xuất - tồn', Icons.inventory, _ReportGroup.stock),
    _ReportDescriptor('stock_detail', 'Chi tiết nhập - xuất - tồn', Icons.menu_book, _ReportGroup.stock),
    _ReportDescriptor('count', 'Báo cáo kiểm kê', Icons.checklist, _ReportGroup.stock),
    _ReportDescriptor('expiry', 'Hàng tồn nguy cơ hư hỏng', Icons.event_busy, _ReportGroup.stock),
    _ReportDescriptor('fastest', 'Hàng bán chạy', Icons.local_fire_department, _ReportGroup.stock),
    _ReportDescriptor('slowest', 'Hàng chậm bán', Icons.snowing, _ReportGroup.stock),
    _ReportDescriptor('debt_customer', 'Công nợ khách hàng - tổng hợp', Icons.person_search, _ReportGroup.debt),
    _ReportDescriptor('detail_customer', 'Công nợ khách hàng - chi tiết', Icons.person, _ReportGroup.debt),
    _ReportDescriptor('debt_supplier', 'Công nợ nhà cung cấp', Icons.local_shipping, _ReportGroup.debt),
  ];

  static const _groupNames = {
    _ReportGroup.cash: 'Tiền mặt',
    _ReportGroup.sales: 'Doanh thu / Chi phí',
    _ReportGroup.pnl: 'Lãi lỗ',
    _ReportGroup.stock: 'Kho hàng',
    _ReportGroup.debt: 'Công nợ',
  };

  DateTime _from = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _to = DateTime.now();
  String _periodLabel = 'Tháng này';
  String _selectedId = 'revenue_day';
  bool _loading = false;
  CrystalReportModel? _report;
  String? _error;

  List<TtProduct> _products = [];
  String? _selectedProductId;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    String? name, address, tax;
    try {
      final storeName = await AuthService.loadSavedStoreName();
      if (storeName != null && storeName.isNotEmpty) name = storeName;
      address = await AuthService.loadSavedPhoneAddress();
    } catch (_) {}
    TtReportService.configureCompany(name: name, address: address, taxCode: tax);
    final db = await ref.read(ttIsarServiceProvider).db;
    _products = await db.ttProducts.where().findAll();
    _products.removeWhere((p) => p.deletedAt != null);
    if (_products.isNotEmpty) _selectedProductId = _products.first.productId;
    if (mounted) setState(() {});
    await _runReport();
  }

  Future<void> _runReport() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final service = TtReportService(ref.read(ttIsarServiceProvider));
      final from = _from;
      final to = _to;
      CrystalReportModel result;
      switch (_selectedId) {
        case 'cash_book':
          result = await service.buildCashBook(from: from, to: to);
          break;
        case 'revenue_day':
          result = await service.buildRevenueByDay(from: from, to: to);
          break;
        case 'revenue_month':
          result = await service.buildRevenueByMonth(from: from, to: to);
          break;
        case 'revenue_product':
          result = await service.buildRevenueByProduct(from: from, to: to);
          break;
        case 'revenue_customer':
          result = await service.buildRevenueByCustomer(from: from, to: to);
          break;
        case 'expense':
          result = await service.buildExpenseByCategory(from: from, to: to);
          break;
        case 'profit_loss':
          result = await service.buildProfitLoss(from: from, to: to);
          break;
        case 'balance':
          result = await service.buildRevenueExpenseBalance(from: from, to: to);
          break;
        case 'stock_summary':
          result = await service.buildStockSummary(from: from, to: to);
          break;
        case 'stock_detail':
          result = await service.buildStockDetail(from: from, to: to, productId: _selectedProductId);
          break;
        case 'count':
          result = await service.buildStockCountReport(from: from, to: to);
          break;
        case 'expiry':
          result = await service.buildExpiryRisk(from: _to.subtract(const Duration(days: 7)), to: _to);
          break;
        case 'fastest':
          result = await service.buildFastestSlowest(from: from, to: to, fastest: true);
          break;
        case 'slowest':
          result = await service.buildFastestSlowest(from: from, to: to, fastest: false);
          break;
        case 'debt_customer':
          result = await service.buildCustomerDebtSummary(from: from, to: to);
          break;
        case 'detail_customer':
          result = await service.buildCustomerDebtDetail(from: from, to: to);
          break;
        case 'debt_supplier':
          result = await service.buildSupplierDebtSummary(from: from, to: to);
          break;
        default:
          result = await service.buildRevenueByDay(from: from, to: to);
      }
      if (mounted) {
        setState(() {
          _report = result;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = '$e';
          _loading = false;
        });
      }
    }
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final start = await showDatePicker(
      context: context,
      initialDate: _from,
      firstDate: DateTime(2020),
      lastDate: now,
      helpText: 'Từ ngày',
    );
    if (start == null) return;
    final end = await showDatePicker(
      context: context,
      initialDate: _to.isBefore(start) ? start : _to,
      firstDate: start,
      lastDate: now.add(const Duration(days: 1)),
      helpText: 'Đến ngày',
    );
    if (end == null) return;
    setState(() {
      _from = start;
      _to = end;
      _periodLabel = '${formatDate(start)} → ${formatDate(end)}';
    });
    await _runReport();
  }

  Future<void> _quickPeriod(String label, DateTime from, DateTime to) async {
    setState(() {
      _from = from;
      _to = to;
      _periodLabel = label;
    });
    await _runReport();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final groups = _ReportGroup.values;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Báo Cáo Chung (.rpt)', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cột trái: danh sách báo cáo
          Container(
            width: 300,
            decoration: const BoxDecoration(
              color: Color(0xFFF6F7F9),
              border: Border(right: BorderSide(color: Colors.black12)),
            ),
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                for (final g in groups) ...[
                  ReportSectionHeader(title: _groupNames[g]!, icon: Icons.folder),
                  for (final r in _reports.where((x) => x.group == g))
                    ReportListItem(
                      title: r.title,
                      icon: r.icon,
                      selected: _selectedId == r.id,
                      onTap: () {
                        setState(() => _selectedId = r.id);
                        _runReport();
                      },
                    ),
                ],
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Cột phải: bộ lọc + nội dung
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.black12))),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      IconButton(
                        tooltip: 'Chọn khoảng ngày',
                        icon: const Icon(Icons.date_range),
                        onPressed: _pickRange,
                      ),
                      TextButton(onPressed: () => _quickPeriod('Hôm nay', now, now), child: const Text('Hôm nay')),
                      TextButton(onPressed: () => _quickPeriod('Hôm qua', now.subtract(const Duration(days: 1)), now.subtract(const Duration(days: 1))), child: const Text('Hôm qua')),
                      TextButton(
                        onPressed: () => _quickPeriod('Tuần này', DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1)), now),
                        child: const Text('Tuần này'),
                      ),
                      TextButton(
                        onPressed: () => _quickPeriod('Tháng này', DateTime(now.year, now.month, 1), now),
                        child: const Text('Tháng này'),
                      ),
                      TextButton(
                        onPressed: () => _quickPeriod('Tháng trước', DateTime(now.year, now.month - 1, 1), DateTime(now.year, now.month, 0)),
                        child: const Text('Tháng trước'),
                      ),
                      TextButton(
                        onPressed: () => _quickPeriod('Năm nay', DateTime(now.year, 1, 1), now),
                        child: const Text('Năm nay'),
                      ),
                      const SizedBox(width: 12),
                      Text(_periodLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: _loading
                      ? const Center(child: CircularProgressIndicator())
                      : _error != null
                          ? Center(child: Text('Lỗi: $_error'))
                          : _report == null
                              ? const Center(child: Text('Chọn báo cáo'))
                              : SingleChildScrollView(
                                  padding: const EdgeInsets.all(16),
                                  child: CrystalReportView(report: _report!),
                                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
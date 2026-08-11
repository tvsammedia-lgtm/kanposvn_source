import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../core/auth/auth_service.dart';
import '../models/hotel_inventory.dart';
import '../models/hotel_report_models.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_report_service.dart';
import '../widgets/crystal_report_widgets.dart';

/// Tab "Báo cáo chung" — mô phỏng các báo cáo Crystal (.rpt) của KANHOT.
class HotelReportsScreen extends ConsumerStatefulWidget {
  const HotelReportsScreen({super.key});

  @override
  ConsumerState<HotelReportsScreen> createState() => _HotelReportsScreenState();
}

enum _ReportGroup { cash, revenue, stock, debt }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;

  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

class _HotelReportsScreenState extends ConsumerState<HotelReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_ledger', 'Sổ cái TK 1111 (Tổng hợp)', Icons.menu_book, _ReportGroup.cash),
    _ReportDescriptor('cash_book', 'Sổ quỹ tiền mặt (Chi tiết)', Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('receipt', 'Báo cáo phiếu thu', Icons.assignment_return, _ReportGroup.cash),
    _ReportDescriptor('payment', 'Báo cáo phiếu chi', Icons.assignment_outlined, _ReportGroup.cash),
    _ReportDescriptor('revenue', 'Doanh thu theo ngày', Icons.trending_up, _ReportGroup.revenue),
    _ReportDescriptor('shift', 'Thu - chi theo ca', Icons.access_time, _ReportGroup.revenue),
    _ReportDescriptor('menu_sold', 'Số lượng món bán ra', Icons.fastfood, _ReportGroup.revenue),
    _ReportDescriptor('stock_ledger', 'Sổ chi tiết vật tư (S10-DN)', Icons.inventory, _ReportGroup.stock),
    _ReportDescriptor('stock_summary', 'Tổng hợp Nhập - Xuất - Tồn', Icons.warehouse, _ReportGroup.stock),
    _ReportDescriptor('supplier_debt', 'Sổ thanh toán người bán', Icons.credit_score, _ReportGroup.debt),
  ];

  String _selectedId = 'cash_book';
  String? _stockItemId;
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Hôm nay';

  List<HotelInventoryItem> _stockItems = [];
  bool _stockLoaded = false;

  @override
  void initState() {
    super.initState();
    _setTodayFilter();
    _loadCompanyInfo();
    _loadStockItems();
  }

  Future<void> _loadCompanyInfo() async {
    final name = await AuthService.loadSavedStoreName();
    final phone = await AuthService.loadSavedStorePhone();
    HotelReportService.configureCompany(name: name, address: phone != null ? 'Điện thoại: $phone' : null);
  }

  Future<void> _loadStockItems() async {
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    final items = await db.hotelInventoryItems.where().sortByItemName().findAll();
    if (mounted) {
      setState(() {
        _stockItems = items;
        _stockLoaded = true;
        if (_stockItems.isNotEmpty) _stockItemId ??= _stockItems.first.itemId;
      });
    }
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
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
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
          ? DateTimeRange(start: _startDate!, end: DateTime(_endDate!.year, _endDate!.month, _endDate!.day))
          : null,
    );
    if (picked != null && mounted) {
      setState(() {
        _startDate = DateTime(picked.start.year, picked.start.month, picked.start.day);
        _endDate = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
        _filterPeriod = 'Tùy chỉnh';
      });
    }
  }

  Future<CrystalReportModel> _buildReport() async {
    final service = HotelReportService(ref.read(hotelIsarServiceProvider));
    final from = _startDate!;
    final to = _endDate!;
    switch (_selectedId) {
      case 'cash_ledger':
        return service.buildCashLedger(from: from, to: to);
      case 'cash_book':
        return service.buildCashBook(from: from, to: to);
      case 'receipt':
        return service.buildReceiptPayment(from: from, to: to, isReceipt: true);
      case 'payment':
        return service.buildReceiptPayment(from: from, to: to, isReceipt: false);
      case 'revenue':
        return service.buildRevenueByDate(from: from, to: to);
      case 'shift':
        return service.buildShiftReport(from: from, to: to);
      case 'menu_sold':
        return service.buildMenuSold(from: from, to: to);
      case 'stock_ledger':
        return service.buildStockLedger(from: from, to: to, itemId: _stockItemId ?? '');
      case 'stock_summary':
        return service.buildStockSummary(from: from, to: to);
      case 'supplier_debt':
        return service.buildSupplierDebt(from: from, to: to);
      default:
        return service.buildCashBook(from: from, to: to);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _reports.firstWhere((r) => r.id == _selectedId);
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo cáo chung'),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
      ),
      body: isDesktop ? _buildDesktop(selected) : _buildMobile(selected),
    );
  }

  // ---------------------------------------------------------------------------
  // Desktop: danh sách trái + báo cáo phải
  // ---------------------------------------------------------------------------

  Widget _buildDesktop(_ReportDescriptor selected) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 280,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black12)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final group in _ReportGroup.values) ...[
                  ReportSectionHeader(
                    title: _groupTitle(group),
                    icon: _groupIcon(group),
                  ),
                  for (final r in _reports.where((r) => r.group == group))
                    ReportListItem(
                      title: r.title,
                      icon: r.icon,
                      selected: r.id == _selectedId,
                      onTap: () => setState(() => _selectedId = r.id),
                    ),
                ],
              ],
            ),
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _buildReportArea(selected)),
      ],
    );
  }

  Widget _buildMobile(_ReportDescriptor selected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButton<String>(
            value: _selectedId,
            isExpanded: true,
            onChanged: (v) => setState(() => _selectedId = v!),
            items: [
              for (final group in _ReportGroup.values) ...[
                for (final r in _reports.where((r) => r.group == group))
                  DropdownMenuItem(value: r.id, child: Text('${_groupTitle(group)}: ${r.title}')),
              ],
            ],
          ),
        ),
        Expanded(child: _buildReportArea(selected)),
      ],
    );
  }

  Widget _buildReportArea(_ReportDescriptor selected) {
    final needItem = selected.id == 'stock_ledger';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildFilterChip('Hôm nay', _setTodayFilter),
                  const SizedBox(width: 6),
                  _buildFilterChip('Tuần này', _setWeekFilter),
                  const SizedBox(width: 6),
                  _buildFilterChip('Tháng này', _setMonthFilter),
                  const SizedBox(width: 6),
                  _buildFilterChip('Tùy chỉnh', _selectDateRange),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Kỳ báo cáo: ${formatDate(_startDate!)} - ${formatDate(_endDate!)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5),
              ),
              if (needItem) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Vật tư / hàng hóa: ', style: TextStyle(fontSize: 12.5)),
                    Expanded(
                      child: _stockLoaded
                          ? DropdownButton<String>(
                              value: _stockItemId,
                              isExpanded: true,
                              isDense: true,
                              items: [
                                for (final it in _stockItems)
                                  DropdownMenuItem(
                                    value: it.itemId,
                                    child: Text('${it.itemName} (${it.unit.isEmpty ? 'Cái' : it.unit})'),
                                  ),
                              ],
                              onChanged: (v) => setState(() => _stockItemId = v),
                            )
                          : const Text('Đang tải danh mục vật tư...', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: FutureBuilder<CrystalReportModel>(
            future: _buildReport(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Lỗi tạo báo cáo: ${snapshot.error}'));
              }
              final report = snapshot.data!;
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(12),
                      child: CrystalReportView(report: report),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, VoidCallback onTap) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 11.5)),
      selected: _filterPeriod == label,
      onSelected: (_) => onTap(),
      selectedColor: const Color(0xFF0284C7),
      checkmarkColor: Colors.white,
      visualDensity: VisualDensity.compact,
    );
  }

  String _groupTitle(_ReportGroup g) {
    switch (g) {
      case _ReportGroup.cash:
        return 'QUỸ TIỀN MẶT';
      case _ReportGroup.revenue:
        return 'DOANH THU';
      case _ReportGroup.stock:
        return 'KHO HÀNG';
      case _ReportGroup.debt:
        return 'CÔNG NỢ';
    }
  }

  IconData _groupIcon(_ReportGroup g) {
    switch (g) {
      case _ReportGroup.cash:
        return Icons.payments;
      case _ReportGroup.revenue:
        return Icons.point_of_sale;
      case _ReportGroup.stock:
        return Icons.inventory_2;
      case _ReportGroup.debt:
        return Icons.handshake;
    }
  }
}

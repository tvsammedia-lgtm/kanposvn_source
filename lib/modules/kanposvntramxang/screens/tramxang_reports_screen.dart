import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/reports/crystal_report_models.dart';
import '../../../core/reports/crystal_report_widgets.dart';
import '../models/product.dart';
import '../providers/tramxang_providers.dart';
import '../services/tramxang_einvoice_settings.dart';
import '../services/tramxang_report_service.dart';

/// Màn hình báo cáo mô phỏng Crystal Reports (.rpt) — bản sao của
/// "Báo Cáo Chung" trong KanPosVN VLXD, ánh xạ sang dữ liệu Trạm Xăng.
///
/// Layout master-detail: danh sách báo cáo bên trái, bản xem trước bên phải.
class TramXangReportsScreen extends ConsumerStatefulWidget {
  const TramXangReportsScreen({super.key});

  @override
  ConsumerState<TramXangReportsScreen> createState() =>
      _TramXangReportsScreenState();
}

enum _ReportGroup { cash, sales, stock, debt }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;
  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

const _groupNames = {
  _ReportGroup.cash: 'Tiền mặt',
  _ReportGroup.sales: 'Bán hàng',
  _ReportGroup.stock: 'Kho & bồn',
  _ReportGroup.debt: 'Công nợ',
};

const _reports = [
  _ReportDescriptor('cash_summary', 'Báo cáo tổng hợp quỹ tiền mặt', Icons.account_balance, _ReportGroup.cash),
  _ReportDescriptor('cash_book', 'Sổ quỹ tiền mặt', Icons.account_balance_wallet, _ReportGroup.cash),
  _ReportDescriptor('receipt', 'Báo cáo phiếu thu', Icons.assignment_return, _ReportGroup.cash),
  _ReportDescriptor('payment', 'Báo cáo phiếu chi', Icons.assignment_outlined, _ReportGroup.cash),
  _ReportDescriptor('shift', 'Báo cáo ca bán hàng', Icons.access_time, _ReportGroup.sales),
  _ReportDescriptor('profit_loss', 'Báo cáo lãi lỗ', Icons.assessment, _ReportGroup.sales),
  _ReportDescriptor('sales_detail', 'Báo cáo chi tiết bán hàng', Icons.receipt_long, _ReportGroup.sales),
  _ReportDescriptor('sales_summary', 'Báo cáo tổng hợp bán hàng', Icons.trending_up, _ReportGroup.sales),
  _ReportDescriptor('tank_stock', 'Đối chiếu bồn chứa xăng dầu', Icons.propane_tank, _ReportGroup.stock),
  _ReportDescriptor('stock_summary', 'Báo cáo tổng hợp nhập - xuất - tồn', Icons.inventory, _ReportGroup.stock),
  _ReportDescriptor('stock_ledger', 'Sổ chi tiết nhập - xuất - tồn', Icons.menu_book, _ReportGroup.stock),
  _ReportDescriptor('debt_customer', 'Sổ tổng hợp thanh toán với người mua', Icons.person_search, _ReportGroup.debt),
  _ReportDescriptor('debt_supplier', 'Sổ tổng hợp thanh toán với người bán', Icons.local_shipping, _ReportGroup.debt),
  _ReportDescriptor('detail_customer', 'Sổ chi tiết thanh toán người mua', Icons.person, _ReportGroup.debt),
  _ReportDescriptor('detail_supplier', 'Sổ chi tiết thanh toán người bán', Icons.support_agent, _ReportGroup.debt),
];

class _TramXangReportsScreenState extends ConsumerState<TramXangReportsScreen> {
  String _selectedId = 'cash_summary';
  String _period = 'MONTH';
  DateTime _from = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _to = DateTime.now().add(const Duration(minutes: 1));
  String? _selectedProductId;
  String? _selectedPartnerId;
  bool _isCustomerPartner = true;
  bool _loading = false;
  CrystalReportModel? _report;

  bool get _needsProductSelector => _selectedId == 'stock_ledger';
  bool get _needsPartnerSelector =>
      _selectedId == 'detail_customer' || _selectedId == 'detail_supplier';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final einvoice = await TramXangEinvoiceSettingsStore.loadOnce();
    TramXangReportService.configureCompany(
      name: einvoice.companyName.isNotEmpty ? einvoice.companyName : null,
      address: einvoice.address.isNotEmpty ? einvoice.address : null,
      taxCode: einvoice.taxCode.isNotEmpty ? einvoice.taxCode : null,
    );
    await _runReport();
  }

  Future<void> _runReport() async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      final service = TramXangReportService(ref.read(tramXangIsarServiceProvider));
      final from = _from;
      final to = _to;
      final report = switch (_selectedId) {
        'cash_summary' => await service.buildCashFundSummary(from: from, to: to),
        'cash_book' => await service.buildCashBook(from: from, to: to),
        'receipt' => await service.buildReceiptPayment(from: from, to: to, isReceipt: true),
        'payment' => await service.buildReceiptPayment(from: from, to: to, isReceipt: false),
        'shift' => await service.buildShiftReport(from: from, to: to),
        'profit_loss' => await service.buildProfitLoss(from: from, to: to),
        'sales_detail' => await service.buildSalesDetail(from: from, to: to),
        'sales_summary' => await service.buildSalesSummary(from: from, to: to),
        'tank_stock' => await service.buildTankStockSummary(from: from, to: to),
        'stock_summary' => await service.buildStockSummary(from: from, to: to),
        'stock_ledger' => await service.buildStockLedger(
            from: from, to: to, productId: _selectedProductId ?? ''),
        'debt_customer' => await service.buildCustomerDebt(from: from, to: to),
        'debt_supplier' => await service.buildSupplierDebt(from: from, to: to),
        'detail_customer' => await service.buildPaymentDetail(
            from: from, to: to, forCustomer: true, partnerId: _selectedPartnerId ?? ''),
        'detail_supplier' => await service.buildPaymentDetail(
            from: from, to: to, forCustomer: false, partnerId: _selectedPartnerId ?? ''),
        _ => await service.buildCashFundSummary(from: from, to: to),
      };
      if (!mounted) return;
      setState(() => _report = report);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _selectReport(String id) {
    if (_selectedPartnerId == null && _needsPartnerSelector) {}
    setState(() {
      _selectedId = id;
      if (id == 'detail_customer') {
        _isCustomerPartner = true;
        _selectedPartnerId = null;
      }
      if (id == 'detail_supplier') {
        _isCustomerPartner = false;
        _selectedPartnerId = null;
      }
    });
    _runReport();
  }

  void _applyPeriod(DateTime from, DateTime to) {
    setState(() {
      _from = from;
      _to = to;
    });
    _runReport();
  }

  void _setToday() {
    final now = DateTime.now();
    _applyPeriod(
      DateTime(now.year, now.month, now.day),
      now.add(const Duration(minutes: 1)),
    );
  }

  void _setWeek() {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday - 1));
    _applyPeriod(
      DateTime(start.year, start.month, start.day),
      now.add(const Duration(minutes: 1)),
    );
  }

  void _setMonth() {
    final now = DateTime.now();
    _applyPeriod(
      DateTime(now.year, now.month, 1),
      now.add(const Duration(minutes: 1)),
    );
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(now.year + 2, 12, 31),
      initialDateRange:
          DateTimeRange(start: _from, end: _to.subtract(const Duration(minutes: 1))),
    );
    if (picked != null) {
      _applyPeriod(picked.start, picked.end.add(const Duration(minutes: 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(tramXangProductsProvider);
    final customers = ref.watch(tramXangCustomersProvider);
    final suppliers = ref.watch(tramXangSuppliersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Chung (.rpt)'),
        backgroundColor: const Color(0xFFF59E0B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildPeriodBar(),
          if (_needsProductSelector) _buildProductSelector(products),
          if (_needsPartnerSelector)
            _buildPartnerSelector(
              partners: _isCustomerPartner ? customers : suppliers,
              placeholder: _isCustomerPartner ? 'Chọn khách hàng' : 'Chọn nhà cung cấp',
            ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 250, child: _buildReportList()),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: _buildPreview()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodBar() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('Hôm nay'),
            selected: _period == 'TODAY',
            onSelected: (_) {
              setState(() => _period = 'TODAY');
              _setToday();
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Tuần này'),
            selected: _period == 'WEEK',
            onSelected: (_) {
              setState(() => _period = 'WEEK');
              _setWeek();
            },
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Tháng này'),
            selected: _period == 'MONTH',
            onSelected: (_) {
              setState(() => _period = 'MONTH');
              _setMonth();
            },
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: _pickRange,
            icon: const Icon(Icons.date_range, size: 18),
            label: Text('${formatDate(_from)} → ${formatDate(_to)}'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSelector(List<TramXangProduct> products) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      alignment: Alignment.centerLeft,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedProductId,
          isExpanded: false,
          hint: const Text('Chọn mặt hàng'),
          items: [
            for (final p in products)
              DropdownMenuItem(value: p.productId, child: Text(p.name)),
          ],
          onChanged: (v) {
            setState(() => _selectedProductId = v);
            _runReport();
          },
        ),
      ),
    );
  }

  Widget _buildPartnerSelector({
    required List<dynamic> partners,
    required String placeholder,
  }) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      alignment: Alignment.centerLeft,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedPartnerId,
          isExpanded: false,
          hint: Text(placeholder),
          items: [
            for (final p in partners)
              DropdownMenuItem(
                value: p.customerId ?? p.supplierId,
                child: Text(p.name ?? ''),
              ),
          ],
          onChanged: (v) {
            setState(() => _selectedPartnerId = v);
            _runReport();
          },
        ),
      ),
    );
  }

  Widget _buildReportList() {
    final groups = _ReportGroup.values;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (final g in groups) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              _groupNames[g]!,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          for (final r in _reports.where((r) => r.group == g))
            ListTile(
              dense: true,
              leading: Icon(r.icon, size: 20),
              title: Text(r.title, style: const TextStyle(fontSize: 13)),
              selected: _selectedId == r.id,
              selectedTileColor: const Color(0xFFFFF3E0),
              onTap: () => _selectReport(r.id),
            ),
        ],
      ],
    );
  }

  Widget _buildPreview() {
    if (_loading && _report == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_report == null) {
      return const Center(child: Text('Chưa có dữ liệu'));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 1200,
          child: CrystalReportView(report: _report!),
        ),
      ),
    );
  }
}
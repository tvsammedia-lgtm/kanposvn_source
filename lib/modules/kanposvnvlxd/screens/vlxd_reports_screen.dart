import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../core/auth/auth_service.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_product.dart';
import '../models/vlxd_report_models.dart';
import '../providers/vlxd_providers.dart';
import '../services/vlxd_einvoice_settings.dart';
import '../services/vlxd_report_service.dart';
import '../widgets/crystal_report_widgets.dart';

/// Tab "Báo cáo chung" — mô phỏng các báo cáo Crystal (.rpt) của KANVLXD.
class VlxdReportsScreen extends ConsumerStatefulWidget {
  const VlxdReportsScreen({super.key});

  @override
  ConsumerState<VlxdReportsScreen> createState() => _VlxdReportsScreenState();
}

enum _ReportGroup { cash, sales, stock, debt }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;

  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

class _VlxdReportsScreenState extends ConsumerState<VlxdReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_book', 'Sổ quỹ tiền mặt',
        Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('receipt', 'Báo cáo phiếu thu',
        Icons.assignment_return, _ReportGroup.cash),
    _ReportDescriptor('payment', 'Báo cáo phiếu chi',
        Icons.assignment_outlined, _ReportGroup.cash),
    _ReportDescriptor('shift', 'Thu - chi theo ca',
        Icons.access_time, _ReportGroup.cash),
    _ReportDescriptor('sales_detail', 'Báo cáo chi tiết bán hàng',
        Icons.receipt_long, _ReportGroup.sales),
    _ReportDescriptor('sales_summary', 'Báo cáo tổng hợp bán hàng',
        Icons.trending_up, _ReportGroup.sales),
    _ReportDescriptor('loss', 'Báo cáo hao hụt hàng hóa',
        Icons.warning_amber, _ReportGroup.sales),
    _ReportDescriptor('stock_ledger', 'Sổ chi tiết nhập - xuất - tồn',
        Icons.menu_book, _ReportGroup.stock),
    _ReportDescriptor('stock_summary', 'Báo cáo tổng hợp nhập - xuất - tồn',
        Icons.inventory, _ReportGroup.stock),
    _ReportDescriptor('debt_customer', 'Sổ tổng hợp thanh toán với người mua',
        Icons.person_search, _ReportGroup.debt),
    _ReportDescriptor('debt_supplier', 'Sổ tổng hợp thanh toán với người bán',
        Icons.local_shipping, _ReportGroup.debt),
    _ReportDescriptor('detail_customer', 'Sổ chi tiết thanh toán người mua',
        Icons.person, _ReportGroup.debt),
    _ReportDescriptor('detail_supplier', 'Sổ chi tiết thanh toán người bán',
        Icons.support_agent, _ReportGroup.debt),
  ];

  static const _groupNames = {
    _ReportGroup.cash: 'Tiền mặt',
    _ReportGroup.sales: 'Bán hàng',
    _ReportGroup.stock: 'Kho hàng',
    _ReportGroup.debt: 'Công nợ',
  };

  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now();
  String _periodLabel = 'Hôm nay';
  String _selectedId = 'cash_book';
  bool _loading = false;
  CrystalReportModel? _report;
  String? _error;

  List<VlxdProduct> _products = [];
  List<VlxdCustomer> _customers = [];
  List<VlxdSupplier> _suppliers = [];
  String? _selectedProductId;
  String? _selectedPartnerId;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    String? name, address, tax;
    try {
      name = await AuthService.loadSavedStoreName();
    } catch (_) {}
    final einvoice = await VlxdEinvoiceSettingsStore.loadOnce();
    VlxdReportService.configureCompany(
      name: einvoice.companyName.isNotEmpty ? einvoice.companyName : name,
      address: einvoice.address.isNotEmpty ? einvoice.address : address,
      taxCode: einvoice.taxCode.isNotEmpty ? einvoice.taxCode : tax,
    );
    final db = await ref.read(vlxdIsarServiceProvider).db;
    _products = await db.vlxdProducts.where().findAll();
    _customers = await db.vlxdCustomers.where().findAll();
    _suppliers = await db.vlxdSuppliers.where().findAll();
    if (_products.isNotEmpty) _selectedProductId = _products.first.productId;
    if (_customers.isNotEmpty) _selectedPartnerId = _customers.first.customerId;
    if (mounted) setState(() {});
    await _runReport();
  }

  Future<void> _runReport() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final service = VlxdReportService(ref.read(vlxdIsarServiceProvider));
      final from = _from;
      final to = _to;
      CrystalReportModel result;
      switch (_selectedId) {
        case 'cash_book':
          result = await service.buildCashBook(from: from, to: to);
          break;
        case 'receipt':
          result = await service.buildReceiptPayment(from: from, to: to, isReceipt: true);
          break;
        case 'payment':
          result = await service.buildReceiptPayment(from: from, to: to, isReceipt: false);
          break;
        case 'shift':
          result = await service.buildShiftReport(from: from, to: to);
          break;
        case 'sales_detail':
          result = await service.buildSalesDetail(from: from, to: to);
          break;
        case 'sales_summary':
          result = await service.buildSalesSummary(from: from, to: to);
          break;
        case 'loss':
          result = await service.buildLossReport(from: from, to: to);
          break;
        case 'stock_ledger':
          result = await service.buildStockLedger(
            from: from,
            to: to,
            productId: _selectedProductId ?? '',
          );
          break;
        case 'stock_summary':
          result = await service.buildStockSummary(from: from, to: to);
          break;
        case 'debt_customer':
          result = await service.buildCustomerDebt(from: from, to: to);
          break;
        case 'debt_supplier':
          result = await service.buildSupplierDebt(from: from, to: to);
          break;
        case 'detail_customer':
          result = await service.buildPaymentDetail(
            from: from,
            to: to,
            forCustomer: true,
            partnerId: _selectedPartnerId ?? '',
          );
          break;
        case 'detail_supplier':
          result = await service.buildPaymentDetail(
            from: from,
            to: to,
            forCustomer: false,
            partnerId: _selectedPartnerId ?? '',
          );
          break;
        default:
          result = await service.buildCashBook(from: from, to: to);
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

  void _setPeriod(DateTime from, DateTime to, String label) {
    setState(() {
      _from = from;
      _to = to;
      _periodLabel = label;
    });
    _runReport();
  }

  void _selectReport(String id) {
    setState(() {
      _selectedId = id;
    });
    _runReport();
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDateRange: DateTimeRange(start: _from, end: _to),
    );
    if (picked != null) {
      var end = picked.end;
      var start = picked.start;
      end = DateTime(end.year, end.month, end.day, 23, 59, 59);
      start = DateTime(start.year, start.month, start.day, 0, 0, 0);
      _setPeriod(start, end, 'Khoảng chọn');
    }
  }

  bool get _needsProductSelector => _selectedId == 'stock_ledger';

  bool get _needsPartnerSelector =>
      _selectedId == 'detail_customer' || _selectedId == 'detail_supplier';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo cáo chung'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Làm mới',
            onPressed: _loading ? null : _runReport,
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildPeriodBar(context),
        const Divider(height: 1),
        if (_needsProductSelector || _needsPartnerSelector)
          _buildSelectorBar(context),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 290,
                child: _buildReportList(context),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: _buildPreview(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectorBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.colorScheme.surfaceContainerHighest,
      child: _needsProductSelector
          ? _buildProductSelector(theme)
          : _buildPartnerSelector(theme),
    );
  }

  Widget _buildProductSelector(ThemeData theme) {
    return Row(
      children: [
        const Text('Mặt hàng: ', style: TextStyle(fontSize: 13)),
        Expanded(
          child: DropdownButton<String>(
            value: _selectedProductId,
            isExpanded: true,
            items: [
              for (final p in _products)
                DropdownMenuItem(
                  value: p.productId,
                  child: Text(
                    '${p.productCode} - ${p.productName}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
            ],
            onChanged: (v) {
              setState(() {
                _selectedProductId = v;
              });
              _runReport();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPartnerSelector(ThemeData theme) {
    final forCustomer = _selectedId == 'detail_customer';
    final label = forCustomer ? 'Khách hàng: ' : 'Nhà cung cấp: ';
    final options = forCustomer
        ? [
            for (final c in _customers)
              DropdownMenuItem(
                value: c.customerId,
                child: Text(c.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13)),
              ),
          ]
        : [
            for (final s in _suppliers)
              DropdownMenuItem(
                value: s.supplierId,
                child: Text(s.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13)),
              ),
          ];
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 13)),
        Expanded(
          child: DropdownButton<String>(
            value: _selectedPartnerId,
            isExpanded: true,
            items: options,
            onChanged: (v) {
              setState(() {
                _selectedPartnerId = v;
              });
              _runReport();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodBar(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Row(
        children: [
          FilledButton.tonalIcon(
            icon: const Icon(Icons.date_range),
            label: Text(_periodLabel),
            onPressed: _pickDateRange,
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.today),
            label: const Text('Hôm nay'),
            onPressed: () {
              final now = DateTime.now();
              _setPeriod(
                DateTime(now.year, now.month, now.day),
                DateTime(now.year, now.month, now.day, 23, 59, 59),
                'Hôm nay',
              );
            },
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_view_week),
            label: const Text('Tuần này'),
            onPressed: () {
              final now = DateTime.now();
              final start = now.subtract(Duration(days: now.weekday - 1));
              _setPeriod(
                DateTime(start.year, start.month, start.day),
                DateTime(now.year, now.month, now.day, 23, 59, 59),
                'Tuần này',
              );
            },
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_month),
            label: const Text('Tháng này'),
            onPressed: () {
              final now = DateTime.now();
              final start = DateTime(now.year, now.month, 1);
              _setPeriod(
                DateTime(start.year, start.month, start.day),
                DateTime(now.year, now.month + 1, 0, 23, 59, 59),
                'Tháng này',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReportList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (final group in _ReportGroup.values) ..._buildGroup(context, group),
      ],
    );
  }

  List<Widget> _buildGroup(BuildContext context, _ReportGroup group) {
    final items = _reports.where((r) => r.group == group).toList();
    if (items.isEmpty) return const [SizedBox.shrink()];
    final theme = Theme.of(context);
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Text(
          _groupNames[group]!,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      for (final r in items)
        ListTile(
          dense: true,
          leading: Icon(r.icon, size: 20),
          title: Text(r.title, style: const TextStyle(fontSize: 13)),
          selected: _selectedId == r.id,
          selectedTileColor: theme.colorScheme.secondaryContainer,
          onTap: () => _selectReport(r.id),
          trailing:
              _selectedId == r.id ? const Icon(Icons.check_circle, size: 16) : null,
        ),
    ];
  }

  Widget _buildPreview(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 40),
              const SizedBox(height: 12),
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _runReport,
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      );
    }
    final report = _report;
    if (report == null) {
      return const Center(child: Text('Chọn một báo cáo để xem trước.'));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: 1200,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: CrystalReportView(report: report),
          ),
        ),
      ),
    );
  }
}

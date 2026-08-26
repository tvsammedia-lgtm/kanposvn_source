import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_service.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';
import '../../kanposvncafe/widgets/crystal_report_widgets.dart';
import '../providers/nhathuoc_providers.dart';
import '../services/nhathuoc_report_service.dart';

/// Tab "Báo cáo chung" — mô phỏng các báo cáo Crystal (.rpt) của KANCAFE/KANVLXD:
///  - Quỹ tiền mặt (rp1111 / rp1111_Detail)
///  - Xuất nhập tồn kho (rpBaoCaoTongHopXuatNhapTonVatTu)
///  - Công nợ khách hàng
///  - Công nợ nhà cung cấp (rpSoTongHopThanhToanVoiNguoiBan)
///  - Lãi lỗ (rpS10DN)
///  - Hóa đơn bán hàng (rpBill)
///  - Phiếu nhập kho (rpInput)
///  - Hao hụt nguyên vật liệu (rpBaoCaoHaoHutNguyenVatLieuHangHoa)
class NhathuocReportsScreen extends ConsumerStatefulWidget {
  const NhathuocReportsScreen({super.key});

  @override
  ConsumerState<NhathuocReportsScreen> createState() => _NhathuocReportsScreenState();
}

enum _ReportGroup { cash, inventory, debt, finance, sales }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;

  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

class _NhathuocReportsScreenState extends ConsumerState<NhathuocReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_summary', 'Quỹ tiền mặt (tổng hợp)', Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('cash_detail', 'Sổ quỹ tiền mặt (chi tiết)', Icons.menu_book, _ReportGroup.cash),
    _ReportDescriptor('inventory', 'Xuất nhập tồn kho', Icons.inventory_2, _ReportGroup.inventory),
    _ReportDescriptor('shrinkage', 'Hao hụt thuốc / vật tư', Icons.warning_amber, _ReportGroup.inventory),
    _ReportDescriptor('customer_debt', 'Công nợ khách hàng', Icons.people, _ReportGroup.debt),
    _ReportDescriptor('supplier_debt', 'Công nợ nhà cung cấp', Icons.business, _ReportGroup.debt),
    _ReportDescriptor('profit_loss', 'Báo cáo lãi lỗ', Icons.trending_up, _ReportGroup.finance),
    _ReportDescriptor('sales_bills', 'Hóa đơn bán hàng', Icons.receipt_long, _ReportGroup.sales),
    _ReportDescriptor('purchases', 'Phiếu nhập kho', Icons.input, _ReportGroup.sales),
  ];

  static const _groupNames = {
    _ReportGroup.cash: 'Tiền mặt',
    _ReportGroup.inventory: 'Kho hàng',
    _ReportGroup.debt: 'Công nợ',
    _ReportGroup.finance: 'Tài chính',
    _ReportGroup.sales: 'Hóa đơn / Nhập kho',
  };

  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now();
  String _periodLabel = 'Hôm nay';
  String _selectedId = 'cash_summary';
  bool _loading = false;
  CrystalReportModel? _report;
  String? _error;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    String? name;
    String? phone;
    try {
      name = await AuthService.loadSavedStoreName();
      phone = await AuthService.loadSavedStorePhone();
    } catch (_) {}
    NhathuocReportService.configureCompany(name: name, address: phone);
    if (mounted) setState(() {});
    _runReport();
  }

  Future<void> _runReport() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final service = NhathuocReportService(ref.read(nhathuocIsarServiceProvider));
      final from = _from;
      final to = _to;
      CrystalReportModel result;
      switch (_selectedId) {
        case 'cash_summary':
          result = await service.buildCashFundSummary(from: from, to: to);
          break;
        case 'cash_detail':
          result = await service.buildCashFundDetail(from: from, to: to);
          break;
        case 'inventory':
          result = await service.buildInventoryReport(from: from, to: to);
          break;
        case 'shrinkage':
          result = await service.buildShrinkageReport(from: from, to: to);
          break;
        case 'customer_debt':
          result = await service.buildCustomerDebtReport();
          break;
        case 'supplier_debt':
          result = await service.buildSupplierDebtReport();
          break;
        case 'profit_loss':
          result = await service.buildProfitLossReport(from: from, to: to);
          break;
        case 'sales_bills':
          result = await service.buildSalesBillReport(from: from, to: to);
          break;
        case 'purchases':
          result = await service.buildPurchaseReport(from: from, to: to);
          break;
        default:
          result = await service.buildCashFundSummary(from: from, to: to);
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
      final end = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
      final start = DateTime(picked.start.year, picked.start.month, picked.start.day);
      _setPeriod(start, end, 'Khoảng chọn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPeriodBar(context),
        const Divider(height: 1),
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
          trailing: _selectedId == r.id ? const Icon(Icons.check_circle, size: 16) : null,
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

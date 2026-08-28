import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../providers/cafe_providers.dart';
import '../services/cafe_report_service.dart';
import '../../../core/reports/crystal_report_widgets.dart';

/// Tab "Báo cáo chung" — mô phỏng các báo cáo Crystal (.rpt) của KANCAFE:
/// quỹ tiền mặt (rp1111 / rp1111_Detail), sơ đồ tầng bàn,
/// danh mục món ăn, giá món ăn.
class CafeReportsScreen extends ConsumerStatefulWidget {
  const CafeReportsScreen({super.key});

  @override
  ConsumerState<CafeReportsScreen> createState() => _CafeReportsScreenState();
}

enum _ReportGroup { cash, cafe }

class _ReportDescriptor {
  final String id;
  final String title;
  final IconData icon;
  final _ReportGroup group;

  const _ReportDescriptor(this.id, this.title, this.icon, this.group);
}

class _CafeReportsScreenState extends ConsumerState<CafeReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_summary', 'Quỹ tiền mặt (tổng hợp)',
        Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('cash_detail', 'Sổ quỹ tiền mặt (chi tiết)',
        Icons.menu_book, _ReportGroup.cash),
    _ReportDescriptor('profit_loss', 'Báo cáo lãi lỗ',
        Icons.assessment, _ReportGroup.cash),
    _ReportDescriptor('floor', 'Sơ đồ tầng bàn',
        Icons.grid_view, _ReportGroup.cafe),
    _ReportDescriptor('menu_list', 'Danh mục món ăn',
        Icons.restaurant_menu, _ReportGroup.cafe),
    _ReportDescriptor('menu_price', 'Giá món ăn',
        Icons.sell, _ReportGroup.cafe),
  ];

  static const _groupNames = {
    _ReportGroup.cash: 'Tiền mặt',
    _ReportGroup.cafe: 'Quán Cafe - Trà Sữa',
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
    CafeReportService.configureCompany(
      name: name,
      address: phone,
      taxCode: null,
    );
    if (mounted) setState(() {});
    _runReport();
  }

  void _runReport() {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final service = CafeReportService(ref.read(cafeIsarServiceProvider));
      final from = _from;
      final to = _to;
      CrystalReportModel result;
      switch (_selectedId) {
        case 'cash_summary':
          result = service.buildCashFundSummary(from: from, to: to);
          break;
        case 'cash_detail':
          result = service.buildCashFundDetail(from: from, to: to);
          break;
        case 'profit_loss':
          result = service.buildProfitLoss(from: from, to: to);
          break;
        case 'floor':
          result = service.buildTableFloorReport();
          break;
        case 'menu_list':
          result = service.buildMenuCategoryReport();
          break;
        case 'menu_price':
          result = service.buildMenuPriceReport();
          break;
        default:
          result = service.buildCashFundSummary(from: from, to: to);
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
      body: Column(
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
      ),
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

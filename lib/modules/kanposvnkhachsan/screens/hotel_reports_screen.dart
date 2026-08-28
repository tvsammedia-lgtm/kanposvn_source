import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_report_service.dart';
import '../../../core/reports/crystal_report_widgets.dart';

/// Tab "Báo Cáo Chung" — mô phỏng tất cả 20+ báo cáo Crystal (.rpt) từ
/// KANHOT_VS2022_DEMO cho module Khách sạn.
class HotelReportsScreen extends ConsumerStatefulWidget {
  const HotelReportsScreen({super.key});

  @override
  ConsumerState<HotelReportsScreen> createState() => _HotelReportsScreenState();
}

enum _ReportGroup { cash, inventory, debt, finance, bill, room, extra }

class _ReportDescriptor {
  final String id;
  final String title;
  final String rptCode;
  final IconData icon;
  final _ReportGroup group;
  final bool useDateRange;

  const _ReportDescriptor(this.id, this.title, this.rptCode, this.icon, this.group, {this.useDateRange = true});
}

class _HotelReportsScreenState extends ConsumerState<HotelReportsScreen> {
  static const _reports = [
    _ReportDescriptor('cash_summary', 'Quỹ tiền mặt (tổng hợp)', 'rp1111_1', Icons.account_balance_wallet, _ReportGroup.cash),
    _ReportDescriptor('cash_detail', 'Sổ quỹ tiền mặt (chi tiết)', 'rp1111_Detail', Icons.menu_book, _ReportGroup.cash),
    _ReportDescriptor('receipt', 'Phiếu thu tiền', 'rpReceipt', Icons.payments, _ReportGroup.cash),
    _ReportDescriptor('payment', 'Phiếu chi tiền', 'rpPaymentByPaymentID', Icons.money_off, _ReportGroup.cash),
    _ReportDescriptor('inventory', 'Xuất nhập tồn kho', 'rpBaoCaoTongHopXuatNhapTonVatTu', Icons.inventory_2, _ReportGroup.inventory),
    _ReportDescriptor('stock_ledger', 'Sổ chi tiết vật tư (S10-DN)', 'rpS10DN', Icons.list_alt, _ReportGroup.inventory),
    _ReportDescriptor('import_stock', 'Nhập kho', 'rpInput', Icons.input, _ReportGroup.inventory),
    _ReportDescriptor('output_by_shift', 'Xuất kho theo ca', 'rpOutputFromShift', Icons.output, _ReportGroup.inventory),
    _ReportDescriptor('output_by_stock', 'Xuất kho theo mặt hàng', 'rpOutputByStock', Icons.warehouse, _ReportGroup.inventory),
    _ReportDescriptor('shrinkage', 'Hao hụt nguyên vật liệu', 'rpBaoCaoHaoHut', Icons.warning_amber, _ReportGroup.inventory),
    _ReportDescriptor('customer_debt', 'Công nợ khách hàng', '—', Icons.people, _ReportGroup.debt, useDateRange: false),
    _ReportDescriptor('supplier_debt_summary', 'Chi tiêu NCC (tổng hợp)', 'rpSoTongHop', Icons.business, _ReportGroup.debt, useDateRange: false),
    _ReportDescriptor('supplier_debt_detail', 'Chi tiêu NCC (chi tiết)', 'rpSoChiTiet', Icons.list_alt, _ReportGroup.debt),
    _ReportDescriptor('profit_loss', 'Báo cáo lãi lỗ', 'rpS10DN', Icons.trending_up, _ReportGroup.finance),
    _ReportDescriptor('sales_bills', 'Hóa đơn dịch vụ', 'rpBill / rpBillForTax', Icons.receipt_long, _ReportGroup.bill),
    _ReportDescriptor('discount_on_bill', 'Combo / Giảm giá hóa đơn', 'rpBill_DiscountOnBill', Icons.card_giftcard, _ReportGroup.bill),
    _ReportDescriptor('revenue_by_room', 'Doanh thu theo phòng', 'rpBillForField', Icons.meeting_room, _ReportGroup.room),
    _ReportDescriptor('revenue_by_service', 'Doanh thu theo dịch vụ', 'rpBillForField_IsNotUsed', Icons.room_service, _ReportGroup.room),
    _ReportDescriptor('menu_sold', 'Số lượng món bán ra', 'rpSoLuongMonBanRa', Icons.fastfood, _ReportGroup.room),
    _ReportDescriptor('discount_on_item', 'Chi tiết buổi DV / Món bán', 'rpBill_DiscountOnFoodOrDrink', Icons.event_available, _ReportGroup.extra),
    _ReportDescriptor('payment_by_id', 'Chi tiêu theo mã phiếu', 'rpPaymentByPaymentID', Icons.money_off, _ReportGroup.extra),
    _ReportDescriptor('payment_cashier', 'Thu tiền cho thu ngân', 'rpPaymentForCashier', Icons.point_of_sale, _ReportGroup.extra),
    _ReportDescriptor('expense_list', 'Danh sách phiếu thu chi', 'rpListInput', Icons.receipt, _ReportGroup.extra),
    _ReportDescriptor('revenue_by_date', 'Doanh thu theo ngày', 'rpBillByDate', Icons.calendar_today, _ReportGroup.extra),
  ];

  static const _groupNames = {
    _ReportGroup.cash: '★ Quỹ tiền mặt (rp1111)',
    _ReportGroup.inventory: '★ Xuất nhập tồn kho',
    _ReportGroup.debt: '★ Công nợ KH — NCC',
    _ReportGroup.finance: '★ Lãi lỗ',
    _ReportGroup.bill: 'Hóa đơn / Combo',
    _ReportGroup.room: 'Doanh thu theo phòng / DV',
    _ReportGroup.extra: 'Phiếu thu chi / Thanh toán',
  };

  static const _groupIcons = {
    _ReportGroup.cash: Icons.account_balance_wallet,
    _ReportGroup.inventory: Icons.inventory_2,
    _ReportGroup.debt: Icons.handshake,
    _ReportGroup.finance: Icons.trending_up,
    _ReportGroup.bill: Icons.receipt_long,
    _ReportGroup.room: Icons.meeting_room,
    _ReportGroup.extra: Icons.money,
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
    HotelReportService.configureCompany(name: name, address: phone);
    if (mounted) setState(() {});
    _runReport();
  }

  bool _reportNeedsDateRange(String id) {
    final desc = _reports.firstWhere((r) => r.id == id);
    return desc.useDateRange;
  }

  Future<void> _runReport() async {
    setState(() { _loading = true; _error = null; });
    try {
      final service = HotelReportService(ref.read(hotelIsarServiceProvider));
      final from = _from;
      final to = _to;
      CrystalReportModel result;
      switch (_selectedId) {
        case 'cash_summary': result = await service.buildCashLedger(from: from, to: to); break;
        case 'cash_detail': result = await service.buildCashBook(from: from, to: to); break;
        case 'receipt': result = await service.buildReceiptReport(from: from, to: to); break;
        case 'payment': result = await service.buildPaymentByPaymentIdReport(from: from, to: to); break;
        case 'inventory': result = await service.buildStockSummary(from: from, to: to); break;
        case 'stock_ledger': result = await service.buildStockLedger(from: from, to: to, itemId: ''); break;
        case 'import_stock': result = await service.buildImportReport(from: from, to: to); break;
        case 'output_by_shift': result = await service.buildOutputByShiftReport(from: from, to: to); break;
        case 'output_by_stock': result = await service.buildOutputByStockReport(from: from, to: to); break;
        case 'shrinkage': result = await service.buildShrinkageReport(from: from, to: to); break;
        case 'customer_debt': result = await service.buildCustomerDebtReport(); break;
        case 'supplier_debt_summary': result = await service.buildSupplierDebtSummaryReport(); break;
        case 'supplier_debt_detail': result = await service.buildSupplierDebtDetailReport(from: from, to: to); break;
        case 'profit_loss': result = await service.buildProfitLossReport(from: from, to: to); break;
        case 'sales_bills': result = await service.buildSalesBillReport(from: from, to: to); break;
        case 'discount_on_bill': result = await service.buildDiscountOnBillReport(from: from, to: to); break;
        case 'revenue_by_room': result = await service.buildRevenueByStaffReport(from: from, to: to); break;
        case 'revenue_by_service': result = await service.buildRevenueByServiceReport(from: from, to: to); break;
        case 'menu_sold': result = await service.buildMenuSold(from: from, to: to); break;
        case 'discount_on_item': result = await service.buildDiscountOnItemReport(from: from, to: to); break;
        case 'payment_by_id': result = await service.buildPaymentByPaymentIdReport(from: from, to: to); break;
        case 'payment_cashier': result = await service.buildPaymentForCashierReport(from: from, to: to); break;
        case 'expense_list': result = await service.buildExpenseListReport(from: from, to: to); break;
        case 'revenue_by_date': result = await service.buildRevenueByDate(from: from, to: to); break;
        default: result = await service.buildCashLedger(from: from, to: to);
      }
      if (mounted) setState(() { _report = result; _loading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = '$e'; _loading = false; });
    }
  }

  void _setPeriod(DateTime from, DateTime to, String label) {
    setState(() { _from = from; _to = to; _periodLabel = label; });
    _runReport();
  }

  void _selectReport(String id) {
    setState(() { _selectedId = id; });
    _runReport();
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2100), initialDateRange: DateTimeRange(start: _from, end: _to));
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
        Expanded(child: Row(
          children: [
            SizedBox(width: 300, child: _buildReportList(context)),
            const VerticalDivider(width: 1),
            Expanded(child: _buildPreview(context)),
          ],
        )),
      ],
    );
  }

  Widget _buildPeriodBar(BuildContext context) {
    final theme = Theme.of(context);
    final needsDate = _reportNeedsDateRange(_selectedId);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Row(children: [
        if (needsDate) ...[
          FilledButton.tonalIcon(icon: const Icon(Icons.date_range), label: Text(_periodLabel), onPressed: _pickDateRange),
          const SizedBox(width: 12),
          OutlinedButton.icon(icon: const Icon(Icons.today), label: const Text('Hôm nay'), onPressed: () { final now = DateTime.now(); _setPeriod(DateTime(now.year, now.month, now.day), DateTime(now.year, now.month, now.day, 23, 59, 59), 'Hôm nay'); }),
          const SizedBox(width: 8),
          OutlinedButton.icon(icon: const Icon(Icons.calendar_view_week), label: const Text('Tuần này'), onPressed: () { final now = DateTime.now(); final s = now.subtract(Duration(days: now.weekday - 1)); _setPeriod(DateTime(s.year, s.month, s.day), DateTime(now.year, now.month, now.day, 23, 59, 59), 'Tuần này'); }),
          const SizedBox(width: 8),
          OutlinedButton.icon(icon: const Icon(Icons.calendar_month), label: const Text('Tháng này'), onPressed: () { final now = DateTime.now(); _setPeriod(DateTime(now.year, now.month, 1), DateTime(now.year, now.month + 1, 0, 23, 59, 59), 'Tháng này'); }),
        ] else ...[
          Icon(Icons.info_outline, size: 16, color: theme.colorScheme.outline),
          const SizedBox(width: 8),
          Text('Báo cáo tổng hợp — không cần chọn ngày', style: TextStyle(fontSize: 12, color: theme.colorScheme.outline)),
        ],
      ]),
    );
  }

  Widget _buildReportList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [for (final group in _ReportGroup.values) ..._buildGroup(context, group)],
    );
  }

  List<Widget> _buildGroup(BuildContext context, _ReportGroup group) {
    final items = _reports.where((r) => r.group == group).toList();
    if (items.isEmpty) return const [SizedBox.shrink()];
    final theme = Theme.of(context);
    return [
      Padding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 4), child: Row(children: [
        Icon(_groupIcons[group], size: 14, color: theme.colorScheme.primary),
        const SizedBox(width: 6),
        Text(_groupNames[group]!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
      ])),
      for (final r in items)
        ListTile(dense: true, leading: Icon(r.icon, size: 18), title: Text(r.title, style: const TextStyle(fontSize: 13)),
          subtitle: r.rptCode.isNotEmpty ? Text(r.rptCode, style: TextStyle(fontSize: 10, color: theme.colorScheme.outline)) : null,
          selected: _selectedId == r.id, selectedTileColor: theme.colorScheme.secondaryContainer,
          onTap: () => _selectReport(r.id), trailing: _selectedId == r.id ? const Icon(Icons.check_circle, size: 16) : null),
    ];
  }

  Widget _buildPreview(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.error_outline, size: 40), const SizedBox(height: 12), Text(_error!, textAlign: TextAlign.center), const SizedBox(height: 12),
        FilledButton(onPressed: _runReport, child: const Text('Thử lại')),
      ])));
    }
    final report = _report;
    if (report == null) return const Center(child: Text('Chọn một báo cáo để xem trước.'));
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SizedBox(width: 1200, child: Padding(padding: const EdgeInsets.all(24), child: CrystalReportView(report: report))),
    ));
  }
}

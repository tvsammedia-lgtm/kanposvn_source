import 'package:isar/isar.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_supplier.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import '../models/vantai_cashbook.dart';

class VantaiReportDef {
  final String code;
  final String title;
  final String group;
  final bool useDateRange;
  const VantaiReportDef(this.code, this.title, this.group, {this.useDateRange = true});
}

class VantaiReportService {
  final Future<Isar> _isar;
  VantaiReportService(this._isar);

  static const company = {'name': '', 'address': '', 'taxCode': ''};

  static void configureCompany(String name, {String address = '', String taxCode = ''}) {
    company['name'] = name;
    company['address'] = address;
    company['taxCode'] = taxCode;
  }

  static final reportList = [
    const VantaiReportDef('rp1111', 'Quy tien mat - Tong hop', '★ Quy tien mat', useDateRange: false),
    const VantaiReportDef('rp1111_detail', 'Quy tien mat - Chi tiet', '★ Quy tien mat'),
    const VantaiReportDef('rpBaoCaoTongHopXuatNhapTonVatTu', 'Xuat nhap ton kho - Tong hop', '★ Xuat nhap ton kho'),
    const VantaiReportDef('rpBaoCaoHaoHutNguyenVatLieuHangHoa', 'Xuat nhap ton kho - Chi tiet', '★ Xuat nhap ton kho'),
    const VantaiReportDef('rpOutputByStock', 'Hang hoa theo trang thai', '★ Xuat nhap ton kho'),
    const VantaiReportDef('rpOutputFromShift', 'Van don theo tuyen', '★ Xuat nhap ton kho'),
    const VantaiReportDef('rpSoChiTietThanhToanNguoiBan', 'Cong no NCC - Chi tiet', '★ Cong no KH-NCC'),
    const VantaiReportDef('rpSoTongHopThanhToanVoiNguoiBan', 'Cong no KH - Tong hop', '★ Cong no KH-NCC'),
    const VantaiReportDef('rpS10DN', 'Loi loi (P&L)', '★ Loi lo'),
    const VantaiReportDef('rpBill', 'Danh sach ve ban', 'Hoa don'),
    const VantaiReportDef('rpBill_DiscountOnBill', 'Ve da thanh toan', 'Hoa don'),
    const VantaiReportDef('rpBill_DiscountOnFoodOrDrink', 'Chi phi theo tuyen', 'Hoa don'),
    const VantaiReportDef('rpBillForField', 'Doanh thu theo tuyen', 'Hoa don'),
    const VantaiReportDef('rpBillForField_IsNotUsed', 'Doanh thu theo xe', 'Hoa don'),
    const VantaiReportDef('rpBillForTax', 'Hoa don theo phuong thuc TT', 'Hoa don'),
    const VantaiReportDef('rpReceipt', 'Chi tiet hoa don', 'Hoa don'),
    const VantaiReportDef('rpInput', 'Phieu chi tien', 'Thu chi'),
    const VantaiReportDef('rpListInput', 'Tong hop chi phi theo loai', 'Thu chi'),
    const VantaiReportDef('rpPaymentByPaymentID', 'Thu tien theo ma ve', 'Thu chi'),
    const VantaiReportDef('rpPaymentForCashier', 'Phieu thu tien', 'Thu chi'),
  ];

  static void _configureReport(CrystalReportModel report) {}

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return _buildCashFundSummary();
      case 'rp1111_detail': return _buildCashFundDetail(from, to);
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return _buildShipmentInventorySummary(from, to);
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return _buildShipmentInventoryDetail(from, to);
      case 'rpOutputByStock': return _buildShipmentByStatus(from, to);
      case 'rpOutputFromShift': return _buildShipmentByRoute(from, to);
      case 'rpSoChiTietThanhToanNguoiBan': return _buildSupplierDebtDetail(from, to);
      case 'rpSoTongHopThanhToanVoiNguoiBan': return _buildCustomerDebtSummary(from, to);
      case 'rpS10DN': return _buildProfitLoss(from, to);
      case 'rpBill': return _buildTicketList(from, to);
      case 'rpBill_DiscountOnBill': return _buildTicketPaid(from, to);
      case 'rpBill_DiscountOnFoodOrDrink': return _buildExpenseByCategory(from, to);
      case 'rpBillForField': return _buildRevenueByRoute(from, to);
      case 'rpBillForField_IsNotUsed': return _buildRevenueByVehicle(from, to);
      case 'rpBillForTax': return _buildTicketByPaymentMethod(from, to);
      case 'rpReceipt': return _buildTicketDetail(from, to);
      case 'rpInput': return _buildCashTxChi(from, to);
      case 'rpListInput': return _buildExpenseSummary(from, to);
      case 'rpPaymentByPaymentID': return _buildCashTxThuByRef(from, to);
      case 'rpPaymentForCashier': return _buildCashTxThu(from, to);
      default: return _emptyReport(code);
    }
  }

  // ★ QUY TIEN MAT

  Future<CrystalReportModel> _buildCashFundSummary() async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final cashTxs = await db.vantaiCashTxs.where().findAll();

    double tongThu = 0;
    double tongChi = 0;
    final Map<String, double> thuByType = {};
    final Map<String, double> chiByType = {};

    for (final t in cashTxs) {
      if (t.type == CashTxType.THU) {
        tongThu += t.amount;
        final key = t.note.isEmpty ? 'Thu khac' : t.note;
        thuByType[key] = (thuByType[key] ?? 0) + t.amount;
      } else {
        tongChi += t.amount;
        final key = t.note.isEmpty ? 'Chi khac' : t.note;
        chiByType[key] = (chiByType[key] ?? 0) + t.amount;
      }
    }

    for (final tk in tickets) {
      if (tk.status == TicketStatus.PAID && tk.paymentMethod == TicketPaymentMethod.CASH) {
        tongThu += tk.price;
        thuByType['Ban ve tien mat'] = (thuByType['Ban ve tien mat'] ?? 0) + tk.price;
      }
    }

    final rows = <ReportRow>[];
    for (final e in thuByType.entries) {
      rows.add(ReportRow([ReportCell(e.key), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell('Tong thu', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)], isSection: true));
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    for (final e in chiByType.entries) {
      rows.add(ReportRow([ReportCell(e.key), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell('Tong chi', isBold: true), ReportCell(formatMoney(tongChi), align: ReportCellAlign.right, isBold: true)], isSection: true));
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('DU QUY', isBold: true), ReportCell(formatMoney(tongThu - tongChi), align: ReportCellAlign.right, isBold: true)], isSection: true));

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'QUY TIEN MAT - TONG HOP',
      columnFlex: [3, 2],
      headerRows: [[ReportHeaderCell('Dien giai', colspan: 1), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildCashFundDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final cashTxs = await db.vantaiCashTxs.where().findAll();
    final tickets = await db.vantaiTickets.where().findAll();

    final filteredCash = cashTxs.where((t) =>
      t.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      t.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();
    final filteredTickets = tickets.where((t) =>
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double tongThu = 0, tongChi = 0;
    for (final t in filteredCash) {
      final isThu = t.type == CashTxType.THU;
      if (isThu) {
        tongThu += t.amount;
      } else {
        tongChi += t.amount;
      }
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt)),
        ReportCell(t.refCode.isNotEmpty ? t.refCode : '-'),
        ReportCell(t.note.isNotEmpty ? t.note : (isThu ? 'Phieu thu' : 'Phieu chi')),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }
    for (final tk in filteredTickets) {
      if (tk.status == TicketStatus.PAID && tk.paymentMethod == TicketPaymentMethod.CASH) {
        tongThu += tk.price;
        rows.add(ReportRow([
          ReportCell(formatDate(tk.bookingDate!)),
          ReportCell(tk.ticketCode),
          ReportCell('Ban ve ${tk.seatNumber}'),
          ReportCell(formatMoney(tk.price), align: ReportCellAlign.right),
        ]));
      }
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'QUY TIEN MAT - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('Tong thu'), ReportCell(''), ReportCell(''), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)]),
        ReportRow([ReportCell('Tong chi'), ReportCell(''), ReportCell(''), ReportCell(formatMoney(tongChi), align: ReportCellAlign.right, isBold: true)]),
        ReportRow([ReportCell('DU QUY', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(tongThu - tongChi), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  // ★ XUAT NHAP TON KHO

  Future<CrystalReportModel> _buildShipmentInventorySummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final shipments = await db.vantaiShipments.where().findAll();
    final filtered = shipments.where((s) =>
      s.createdAt != null &&
      s.createdAt!.isAfter(from.subtract(const Duration(days: 1))) &&
      s.createdAt!.isBefore(to.add(const Duration(days: 1)))).toList();

    final routeMap = {for (final r in await db.vantaiRoutes.where().findAll()) r.routeId: r.routeName};

    final Map<String, Map<String, dynamic>> byRoute = {};
    for (final s in filtered) {
      final routeId = s.route.value?.routeId ?? '';
      final routeName = routeMap[routeId] ?? 'Khong xac dinh';
      byRoute.putIfAbsent(routeName, () => {'count': 0, 'weight': 0.0, 'fee': 0.0, 'cod': 0.0});
      byRoute[routeName]!['count']++;
      byRoute[routeName]!['weight'] += s.weightKg;
      byRoute[routeName]!['fee'] += s.shippingFee;
      byRoute[routeName]!['cod'] += s.codAmount;
    }

    final rows = <ReportRow>[];
    double totalWeight = 0, totalFee = 0, totalCod = 0;
    for (final e in byRoute.entries) {
      final d = e.value;
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${d['count']}', align: ReportCellAlign.right),
        ReportCell('${formatQty(d['weight'] as double)} kg', align: ReportCellAlign.right),
        ReportCell(formatMoney(d['fee'] as double), align: ReportCellAlign.right),
        ReportCell(formatMoney(d['cod'] as double), align: ReportCellAlign.right),
      ]));
      totalWeight += d['weight'] as double;
      totalFee += d['fee'] as double;
      totalCod += d['cod'] as double;
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 1, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Tuyen'), ReportHeaderCell('SL', align: ReportCellAlign.right), ReportHeaderCell('Khoi luong', align: ReportCellAlign.right), ReportHeaderCell('Phi VC', align: ReportCellAlign.right), ReportHeaderCell('COD', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${filtered.length}', align: ReportCellAlign.right, isBold: true), ReportCell('${formatQty(totalWeight)} kg', align: ReportCellAlign.right, isBold: true), ReportCell(formatMoney(totalFee), align: ReportCellAlign.right, isBold: true), ReportCell(formatMoney(totalCod), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildShipmentInventoryDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final shipments = await db.vantaiShipments.where().findAll();
    final filtered = shipments.where((s) =>
      s.createdAt != null &&
      s.createdAt!.isAfter(from.subtract(const Duration(days: 1))) &&
      s.createdAt!.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    for (final s in filtered) {
      rows.add(ReportRow([
        ReportCell(formatDate(s.createdAt!)),
        ReportCell(s.shipmentCode),
        ReportCell('${s.senderName} -> ${s.receiverName}'),
        ReportCell('${formatQty(s.weightKg)} kg', align: ReportCellAlign.right),
        ReportCell(formatMoney(s.shippingFee), align: ReportCellAlign.right),
        ReportCell(s.status.label),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 1, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma VC'), ReportHeaderCell('Lo trinh'), ReportHeaderCell('KL', align: ReportCellAlign.right), ReportHeaderCell('Phi VC', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildShipmentByStatus(DateTime from, DateTime to) async {
    final db = await _isar;
    final shipments = await db.vantaiShipments.where().findAll();
    final filtered = shipments.where((s) =>
      s.createdAt != null &&
      s.createdAt!.isAfter(from.subtract(const Duration(days: 1))) &&
      s.createdAt!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> byStatus = {};
    final Map<String, double> feeByStatus = {};
    for (final s in filtered) {
      final st = s.status.label;
      byStatus[st] = (byStatus[st] ?? 0) + 1;
      feeByStatus[st] = (feeByStatus[st] ?? 0) + s.shippingFee;
    }

    final rows = <ReportRow>[];
    for (final e in byStatus.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
        ReportCell(formatMoney(feeByStatus[e.key] ?? 0), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HANG HOA THEO TRANG THAI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Trang thai'), ReportHeaderCell('So luong', align: ReportCellAlign.right), ReportHeaderCell('Phi VC', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${filtered.length}', align: ReportCellAlign.right, isBold: true), ReportCell(formatMoney(feeByStatus.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildShipmentByRoute(DateTime from, DateTime to) async {
    final db = await _isar;
    final shipments = await db.vantaiShipments.where().findAll();
    final routes = await db.vantaiRoutes.where().findAll();
    final routeMap = {for (final r in routes) r.routeId: r.routeName};

    final filtered = shipments.where((s) =>
      s.createdAt != null &&
      s.createdAt!.isAfter(from.subtract(const Duration(days: 1))) &&
      s.createdAt!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> byRoute = {};
    for (final s in filtered) {
      final routeName = routeMap[s.route.value?.routeId ?? ''] ?? 'Khong xac dinh';
      byRoute[routeName] = (byRoute[routeName] ?? 0) + 1;
    }

    final rows = <ReportRow>[];
    for (final e in byRoute.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'VAN DON THEO TUYEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 2],
      headerRows: [[ReportHeaderCell('Tuyen'), ReportHeaderCell('So van don', align: ReportCellAlign.right)]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  // ★ CONG NO KH-NCC

  Future<CrystalReportModel> _buildSupplierDebtDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final suppliers = await db.vantaiSuppliers.where().findAll();
    final expenses = await db.vantaiExpenses.where().findAll();

    final filteredExpenses = expenses.where((e) =>
      e.date != null &&
      e.date!.isAfter(from.subtract(const Duration(days: 1))) &&
      e.date!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> debtByCategory = {};
    for (final e in filteredExpenses) {
      final cat = e.category.label;
      debtByCategory[cat] = (debtByCategory[cat] ?? 0) + e.amount;
    }

    final rows = <ReportRow>[];
    for (final s in suppliers) {
      if (s.debt > 0) {
        rows.add(ReportRow([
          ReportCell(s.name),
          ReportCell(s.phone),
          ReportCell(s.category),
          ReportCell(formatMoney(s.debt), align: ReportCellAlign.right),
        ]));
      }
    }

    final totalDebt = suppliers.fold(0.0, (sum, s) => sum + s.debt);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO NCC - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2, 2],
      headerRows: [[ReportHeaderCell('NCC'), ReportHeaderCell('Dien thoai'), ReportHeaderCell('Loai'), ReportHeaderCell('No can tra', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildCustomerDebtSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final customers = await db.vantaiCustomers.where().findAll();

    final debtCustomers = customers.where((c) => c.currentDebt > 0).toList();

    final rows = <ReportRow>[];
    for (final c in debtCustomers) {
      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(c.phone),
        ReportCell(formatMoney(c.currentDebt), align: ReportCellAlign.right),
      ]));
    }

    final totalDebt = debtCustomers.fold(0.0, (sum, c) => sum + c.currentDebt);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO KH - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}', 'So KH con no: ${debtCustomers.length}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Khach hang'), ReportHeaderCell('Dien thoai'), ReportHeaderCell('No phai thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${debtCustomers.length} KH', align: ReportCellAlign.right), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  // ★ LOI LO

  Future<CrystalReportModel> _buildProfitLoss(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final expenses = await db.vantaiExpenses.where().findAll();

    final filteredTickets = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();
    final filteredExpenses = expenses.where((e) =>
      e.date != null &&
      e.date!.isAfter(from.subtract(const Duration(days: 1))) &&
      e.date!.isBefore(to.add(const Duration(days: 1)))).toList();

    double tongVe = 0;
    final Map<String, double> revenueByMethod = {};
    for (final t in filteredTickets) {
      tongVe += t.price;
      final method = t.paymentMethod.label;
      revenueByMethod[method] = (revenueByMethod[method] ?? 0) + t.price;
    }

    double tongChiPhi = 0;
    final Map<String, double> expByCategory = {};
    for (final e in filteredExpenses) {
      tongChiPhi += e.amount;
      final cat = e.category.label;
      expByCategory[cat] = (expByCategory[cat] ?? 0) + e.amount;
    }

    final rows = <ReportRow>[];
    rows.add(ReportRow([ReportCell('DOANH THU VE', isBold: true), ReportCell(formatMoney(tongVe), align: ReportCellAlign.right)], isSection: true));
    for (final e in revenueByMethod.entries) {
      rows.add(ReportRow([ReportCell('  ${e.key}'), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('CHI PHI', isBold: true), ReportCell(formatMoney(tongChiPhi), align: ReportCellAlign.right)], isSection: true));
    for (final e in expByCategory.entries) {
      rows.add(ReportRow([ReportCell('  ${e.key}'), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    final loiNhuan = tongVe - tongChiPhi;
    rows.add(ReportRow([
      ReportCell('LOI NHUAN', isBold: true),
      ReportCell(formatMoney(loiNhuan), align: ReportCellAlign.right, isBold: true),
    ], isSection: true));

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'BAO CAO LOI LO (P&L)',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  // HOA DON

  Future<CrystalReportModel> _buildTicketList(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final routeMap = {for (final r in await db.vantaiRoutes.where().findAll()) r.routeId: r.routeName};

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      final routeName = routeMap[t.route.value?.routeId ?? ''] ?? '-';
      total += t.price;
      rows.add(ReportRow([
        ReportCell(formatDate(t.bookingDate!)),
        ReportCell(t.ticketCode),
        ReportCell(t.passengerName.isNotEmpty ? t.passengerName : '-'),
        ReportCell('${t.seatNumber} / $routeName'),
        ReportCell(formatMoney(t.price), align: ReportCellAlign.right),
        ReportCell(t.status.label),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DANH SACH VE BAN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 3, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma ve'), ReportHeaderCell('HK'), ReportHeaderCell('Ghe / Tuyen'), ReportHeaderCell('Gia ve', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true), ReportCell('${filtered.length} ve', isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildTicketPaid(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final routeMap = {for (final r in await db.vantaiRoutes.where().findAll()) r.routeId: r.routeName};

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      final routeName = routeMap[t.route.value?.routeId ?? ''] ?? '-';
      total += t.price;
      rows.add(ReportRow([
        ReportCell(t.ticketCode),
        ReportCell(t.passengerName.isNotEmpty ? t.passengerName : '-'),
        ReportCell(routeName),
        ReportCell(t.paymentMethod.label),
        ReportCell(formatMoney(t.price), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'VE DA THANH TOAN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma ve'), ReportHeaderCell('HK'), ReportHeaderCell('Tuyen'), ReportHeaderCell('PT TT'), ReportHeaderCell('Gia ve', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildExpenseByCategory(DateTime from, DateTime to) async {
    final db = await _isar;
    final expenses = await db.vantaiExpenses.where().findAll();
    final filtered = expenses.where((e) =>
      e.date != null &&
      e.date!.isAfter(from.subtract(const Duration(days: 1))) &&
      e.date!.isBefore(to.add(const Duration(days: 1)))).toList();

    final routeMap = {for (final r in await db.vantaiRoutes.where().findAll()) r.routeId: r.routeName};

    final Map<String, double> byRoute = {};
    for (final e in filtered) {
      final trip = e.trip.value;
      final routeName = (trip != null) ? (routeMap[trip.route.value?.routeId ?? ''] ?? 'Khong xac dinh') : 'Khong thuoc chuyen';
      byRoute[routeName] = (byRoute[routeName] ?? 0) + e.amount;
    }

    final rows = <ReportRow>[];
    for (final entry in byRoute.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CHI PHI THEO TUYEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Tuyen'), ReportHeaderCell('Chi phi', align: ReportCellAlign.right)]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildRevenueByRoute(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final routes = await db.vantaiRoutes.where().findAll();
    final routeMap = {for (final r in routes) r.routeId: r.routeName};

    final filtered = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byRoute = {};
    for (final t in filtered) {
      final routeName = routeMap[t.route.value?.routeId ?? ''] ?? 'Khong xac dinh';
      byRoute[routeName] = (byRoute[routeName] ?? 0) + t.price;
    }

    final rows = <ReportRow>[];
    for (final entry in byRoute.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DOANH THU THEO TUYEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Tuyen'), ReportHeaderCell('Doanh thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byRoute.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildRevenueByVehicle(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final vehicleMap = {for (final v in await db.vantaiVehicles.where().findAll()) v.vehicleId: v.plateNumber};

    final filtered = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byVehicle = {};
    for (final t in filtered) {
      final plate = vehicleMap[t.vehicle.value?.vehicleId ?? ''] ?? 'Khong xac dinh';
      byVehicle[plate] = (byVehicle[plate] ?? 0) + t.price;
    }

    final rows = <ReportRow>[];
    for (final entry in byVehicle.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DOANH THU THEO XE',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Bien so'), ReportHeaderCell('Doanh thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byVehicle.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildTicketByPaymentMethod(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> countByMethod = {};
    final Map<String, double> amountByMethod = {};
    for (final t in filtered) {
      final method = t.paymentMethod.label;
      countByMethod[method] = (countByMethod[method] ?? 0) + 1;
      amountByMethod[method] = (amountByMethod[method] ?? 0) + t.price;
    }

    final rows = <ReportRow>[];
    for (final entry in countByMethod.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell('${entry.value}', align: ReportCellAlign.right),
        ReportCell(formatMoney(amountByMethod[entry.key] ?? 0), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HOA DON THEO PHUONG THUC TT',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Phuong thuc'), ReportHeaderCell('So luong', align: ReportCellAlign.right), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildTicketDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.vantaiTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.status == TicketStatus.PAID &&
      t.bookingDate != null &&
      t.bookingDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      t.bookingDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final routeMap = {for (final r in await db.vantaiRoutes.where().findAll()) r.routeId: r.routeName};
    final vehicleMap = {for (final v in await db.vantaiVehicles.where().findAll()) v.vehicleId: v.plateNumber};

    final rows = <ReportRow>[];
    for (final t in filtered) {
      final routeName = routeMap[t.route.value?.routeId ?? ''] ?? '-';
      final plate = vehicleMap[t.vehicle.value?.vehicleId ?? ''] ?? '-';
      rows.add(ReportRow([
        ReportCell(t.ticketCode),
        ReportCell(t.passengerName.isNotEmpty ? t.passengerName : '-'),
        ReportCell('${t.seatNumber} / $plate'),
        ReportCell(routeName),
        ReportCell(formatMoney(t.price), align: ReportCellAlign.right),
        ReportCell(t.paymentMethod.label),
        ReportCell(t.departureTime != null ? formatDateTime(t.departureTime!) : '-'),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CHI TIET HOA DON',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma ve'), ReportHeaderCell('HK'), ReportHeaderCell('Ghe/Xe'), ReportHeaderCell('Tuyen'), ReportHeaderCell('Gia ve', align: ReportCellAlign.right), ReportHeaderCell('PT TT'), ReportHeaderCell('Gio khoi hanh')]],
      rows: rows,
    );
    _configureReport(r);
    return r;
  }

  // THU CHI

  Future<CrystalReportModel> _buildCashTxChi(DateTime from, DateTime to) async {
    final db = await _isar;
    final cashTxs = await db.vantaiCashTxs.where().findAll();
    final filtered = cashTxs.where((t) =>
      t.type == CashTxType.CHI &&
      t.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      t.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt)),
        ReportCell(t.refCode.isNotEmpty ? t.refCode : '-'),
        ReportCell(t.note.isNotEmpty ? t.note : 'Phieu chi'),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU CHI TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildExpenseSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final expenses = await db.vantaiExpenses.where().findAll();
    final filtered = expenses.where((e) =>
      e.date != null &&
      e.date!.isAfter(from.subtract(const Duration(days: 1))) &&
      e.date!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byCategory = {};
    for (final e in filtered) {
      final cat = e.category.label;
      byCategory[cat] = (byCategory[cat] ?? 0) + e.amount;
    }

    final rows = <ReportRow>[];
    for (final entry in byCategory.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'TONG HOP CHI PHI THEO LOAI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Loai chi phi'), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byCategory.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildCashTxThuByRef(DateTime from, DateTime to) async {
    final db = await _isar;
    final cashTxs = await db.vantaiCashTxs.where().findAll();
    final filtered = cashTxs.where((t) =>
      t.type == CashTxType.THU &&
      t.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      t.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell(t.refCode.isNotEmpty ? t.refCode : '-'),
        ReportCell(t.note.isNotEmpty ? t.note : 'Phieu thu'),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'THU TIEN THEO MA VE',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 3, 2],
      headerRows: [[ReportHeaderCell('Ma ve'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  Future<CrystalReportModel> _buildCashTxThu(DateTime from, DateTime to) async {
    final db = await _isar;
    final cashTxs = await db.vantaiCashTxs.where().findAll();
    final filtered = cashTxs.where((t) =>
      t.type == CashTxType.THU &&
      t.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      t.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt)),
        ReportCell(t.refCode.isNotEmpty ? t.refCode : '-'),
        ReportCell(t.note.isNotEmpty ? t.note : 'Phieu thu'),
        ReportCell(t.account.label),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU THU TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma'), ReportHeaderCell('Dien giai'), ReportHeaderCell('Tai khoan'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    _configureReport(r);
    return r;
  }

  CrystalReportModel _emptyReport(String code) {
    return CrystalReportModel(
      formLine: '',
      unitName: company['name']!,
      title: 'Bao cao: $code (chua ho tro)',
      columnFlex: [1],
      headerRows: [[ReportHeaderCell('Chua ho tro')]],
      rows: [ReportRow([ReportCell('Bao cao nay chua duoc trien khai.')])],
    );
  }
}

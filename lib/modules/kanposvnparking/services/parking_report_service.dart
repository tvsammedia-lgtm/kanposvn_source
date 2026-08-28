import 'package:isar/isar.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../models/parking_ticket.dart';
import '../models/monthly_ticket.dart';
import '../models/rental.dart';
import '../models/parking_customer.dart';
import '../models/parking_finance.dart';
import '../models/vehicle.dart';

class ParkingReportDef {
  final String code;
  final String title;
  final String group;
  final bool useDateRange;
  const ParkingReportDef(this.code, this.title, this.group, {this.useDateRange = true});
}

class ParkingReportService {
  final Future<Isar> _isar;
  ParkingReportService(this._isar);

  static const company = {'name': '', 'address': '', 'taxCode': ''};

  static void configureCompany(String name, {String address = '', String taxCode = ''}) {
    company['name'] = name;
    company['address'] = address;
    company['taxCode'] = taxCode;
  }

  static final reportList = [
    const ParkingReportDef('rp1111', 'Quy tien mat - Tong hop', '★ Quy tien mat', useDateRange: false),
    const ParkingReportDef('rp1111_detail', 'Quy tien mat - Chi tiet', '★ Quy tien mat'),
    const ParkingReportDef('rpBaoCaoTongHopXuatNhapTonVatTu', 'Xuat nhap ton kho - Tong hop', '★ Xuat nhap ton kho'),
    const ParkingReportDef('rpBaoCaoHaoHutNguyenVatLieuHangHoa', 'Xuat nhap ton kho - Chi tiet', '★ Xuat nhap ton kho'),
    const ParkingReportDef('rpOutputByStock', 'Xe theo trang thai', '★ Xuat nhap ton kho'),
    const ParkingReportDef('rpOutputFromShift', 'Xe theo loai', '★ Xuat nhap ton kho'),
    const ParkingReportDef('rpSoChiTietThanhToanNguoiBan', 'Cong no KH - Chi tiet', '★ Cong no KH-NCC'),
    const ParkingReportDef('rpSoTongHopThanhToanVoiNguoiBan', 'Cong no KH - Tong hop', '★ Cong no KH-NCC'),
    const ParkingReportDef('rpS10DN', 'Loi loi (P&L)', '★ Loi lo'),
    const ParkingReportDef('rpBill', 'Danh sach luot gui', 'Hoa don'),
    const ParkingReportDef('rpBill_DiscountOnBill', 'Luot da thanh toan', 'Hoa don'),
    const ParkingReportDef('rpBill_DiscountOnFoodOrDrink', 'Doanh thu theo loai xe', 'Hoa don'),
    const ParkingReportDef('rpBillForField', 'Ve thang theo thang', 'Hoa don'),
    const ParkingReportDef('rpBillForField_IsNotUsed', 'Cho thue theo khach', 'Hoa don'),
    const ParkingReportDef('rpBillForTax', 'Phuong thuc thanh toan', 'Hoa don'),
    const ParkingReportDef('rpReceipt', 'Chi tiet hoa don', 'Hoa don'),
    const ParkingReportDef('rpInput', 'Phieu chi tien', 'Thu chi'),
    const ParkingReportDef('rpListInput', 'Tong hop chi phi theo loai', 'Thu chi'),
    const ParkingReportDef('rpPaymentByPaymentID', 'Thu tien theo luot', 'Thu chi'),
    const ParkingReportDef('rpPaymentForCashier', 'Phieu thu tien', 'Thu chi'),
  ];

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return _buildCashFundSummary();
      case 'rp1111_detail': return _buildCashFundDetail(from, to);
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return _buildVehicleInventorySummary(from, to);
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return _buildVehicleInventoryDetail(from, to);
      case 'rpOutputByStock': return _buildVehicleByStatus(from, to);
      case 'rpOutputFromShift': return _buildVehicleByType(from, to);
      case 'rpSoChiTietThanhToanNguoiBan': return _buildCustomerDebtDetail(from, to);
      case 'rpSoTongHopThanhToanVoiNguoiBan': return _buildCustomerDebtSummary(from, to);
      case 'rpS10DN': return _buildProfitLoss(from, to);
      case 'rpBill': return _buildTicketList(from, to);
      case 'rpBill_DiscountOnBill': return _buildTicketPaid(from, to);
      case 'rpBill_DiscountOnFoodOrDrink': return _buildRevenueByVehicleType(from, to);
      case 'rpBillForField': return _buildMonthlyTicketList(from, to);
      case 'rpBillForField_IsNotUsed': return _buildRentalList(from, to);
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
    final tickets = await db.parkingTickets.where().findAll();
    final financeTxs = await db.parkingFinanceTxs.where().findAll();
    final monthlyTickets = await db.parkingMonthlyTickets.where().findAll();
    final rentals = await db.parkingRentals.where().findAll();

    double tongThu = 0, tongChi = 0;
    final Map<String, double> thuByType = {};
    final Map<String, double> chiByType = {};

    // Ticket payments (luot)
    for (final t in tickets) {
      if (t.paymentStatus == 'paid') {
        tongThu += t.feeAmount;
        thuByType['Ve luot'] = (thuByType['Ve luot'] ?? 0) + t.feeAmount;
      }
    }

    // Monthly ticket fees
    for (final m in monthlyTickets) {
      tongThu += m.feeAmount;
      thuByType['Ve thang'] = (thuByType['Ve thang'] ?? 0) + m.feeAmount;
    }

    // Rental fees
    for (final r in rentals) {
      tongThu += r.rentalFee;
      thuByType['Cho thue'] = (thuByType['Cho thue'] ?? 0) + r.rentalFee;
      tongChi += r.depositAmount;
      chiByType['Dat coc'] = (chiByType['Dat coc'] ?? 0) + r.depositAmount;
    }

    // Finance transactions
    for (final f in financeTxs) {
      if (f.isIncome) {
        tongThu += f.amount;
        final key = f.incomeCategory.isNotEmpty ? f.incomeCategory : 'Thu khac';
        thuByType[key] = (thuByType[key] ?? 0) + f.amount;
      } else {
        tongChi += f.amount;
        final key = f.expenseCategory.isNotEmpty ? f.expenseCategory : 'Chi khac';
        chiByType[key] = (chiByType[key] ?? 0) + f.amount;
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
      headerRows: [[ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildCashFundDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final financeTxs = await db.parkingFinanceTxs.where().findAll();

    final filteredTickets = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();
    final filteredFinance = financeTxs.where((f) =>
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double tongThu = 0, tongChi = 0;
    for (final t in filteredTickets) {
      if (t.paymentStatus == 'paid') {
        tongThu += t.feeAmount;
        rows.add(ReportRow([
          ReportCell(t.checkInTime.toString().substring(0, 10)),
          ReportCell(t.ticketId),
          ReportCell('${t.licensePlate} - Luot gui'),
          ReportCell(formatMoney(t.feeAmount), align: ReportCellAlign.right),
        ]));
      }
    }
    for (final f in filteredFinance) {
      if (f.isIncome) {
        tongThu += f.amount;
      } else {
        tongChi += f.amount;
      }
      rows.add(ReportRow([
        ReportCell(f.createdAt.toString().substring(0, 10)),
        ReportCell(f.financeId),
        ReportCell(f.note.isNotEmpty ? f.note : (f.isIncome ? 'Phieu thu' : 'Phieu chi')),
        ReportCell(formatMoney(f.amount), align: ReportCellAlign.right),
      ]));
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
    return r;
  }

  // ★ XUAT NHAP TON KHO

  Future<CrystalReportModel> _buildVehicleInventorySummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> countByType = {};
    final Map<String, double> revenueByType = {};
    for (final t in filtered) {
      countByType[t.paymentMethod] = (countByType[t.paymentMethod] ?? 0) + 1;
      revenueByType[t.paymentMethod] = (revenueByType[t.paymentMethod] ?? 0) + t.feeAmount;
    }

    final rows = <ReportRow>[];
    for (final e in countByType.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
        ReportCell(formatMoney(revenueByType[e.key] ?? 0), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Loai'), ReportHeaderCell('So luot', align: ReportCellAlign.right), ReportHeaderCell('Doanh thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${filtered.length}', align: ReportCellAlign.right, isBold: true), ReportCell(formatMoney(revenueByType.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildVehicleInventoryDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    for (final t in filtered) {
      final duration = t.checkOutTime != null
        ? '${t.checkOutTime!.difference(t.checkInTime).inHours}h'
        : 'Dang gui';
      rows.add(ReportRow([
        ReportCell(t.checkInTime.toString().substring(0, 10)),
        ReportCell(t.licensePlate),
        ReportCell(t.paymentMethod),
        ReportCell(duration),
        ReportCell(formatMoney(t.feeAmount), align: ReportCellAlign.right),
        ReportCell(t.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 1, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Bien so'), ReportHeaderCell('PT TT'), ReportHeaderCell('Thoi gian'), ReportHeaderCell('Phi', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildVehicleByStatus(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> byStatus = {};
    for (final t in filtered) {
      byStatus[t.status] = (byStatus[t.status] ?? 0) + 1;
    }

    final rows = <ReportRow>[];
    for (final e in byStatus.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XE THEO TRANG THAI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2],
      headerRows: [[ReportHeaderCell('Trang thai'), ReportHeaderCell('So luot', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildVehicleByType(DateTime from, DateTime to) async {
    final db = await _isar;
    final vehicles = await db.parkingVehicles.where().findAll();
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final vehicleTypeMap = {for (final v in vehicles) v.vehicleId: v.vehicleType};

    final Map<String, int> byType = {};
    for (final t in filtered) {
      final vType = vehicleTypeMap[t.vehicleId] ?? 'Khong xac dinh';
      byType[vType] = (byType[vType] ?? 0) + 1;
    }

    final rows = <ReportRow>[];
    for (final e in byType.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XE THEO LOAI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2],
      headerRows: [[ReportHeaderCell('Loai xe'), ReportHeaderCell('So luot', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  // ★ CONG NO KH

  Future<CrystalReportModel> _buildCustomerDebtDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final customers = await db.parkingCustomers.where().findAll();
    final debtCustomers = customers.where((c) => c.debtBalance > 0).toList();

    final rows = <ReportRow>[];
    for (final c in debtCustomers) {
      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(c.phone),
        ReportCell(c.licensePlate),
        ReportCell(formatMoney(c.debtBalance), align: ReportCellAlign.right),
      ]));
    }

    final totalDebt = debtCustomers.fold(0.0, (sum, c) => sum + c.debtBalance);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO KH - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Khach hang'), ReportHeaderCell('Dien thoai'), ReportHeaderCell('Bien so'), ReportHeaderCell('No can thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildCustomerDebtSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final customers = await db.parkingCustomers.where().findAll();
    final debtCustomers = customers.where((c) => c.debtBalance > 0).toList();

    final rows = <ReportRow>[];
    for (final c in debtCustomers) {
      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(c.phone),
        ReportCell(formatMoney(c.debtBalance), align: ReportCellAlign.right),
      ]));
    }

    final totalDebt = debtCustomers.fold(0.0, (sum, c) => sum + c.debtBalance);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO KH - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}', 'So KH con no: ${debtCustomers.length}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Khach hang'), ReportHeaderCell('Dien thoai'), ReportHeaderCell('No can thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${debtCustomers.length} KH', align: ReportCellAlign.right), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  // ★ LOI LO

  Future<CrystalReportModel> _buildProfitLoss(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final monthlyTickets = await db.parkingMonthlyTickets.where().findAll();
    final rentals = await db.parkingRentals.where().findAll();
    final financeTxs = await db.parkingFinanceTxs.where().findAll();

    double tongThu = 0;
    final Map<String, double> thuByType = {};

    final filteredTickets = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1))) &&
      t.paymentStatus == 'paid').toList();
    for (final t in filteredTickets) {
      tongThu += t.feeAmount;
      thuByType['Ve luot'] = (thuByType['Ve luot'] ?? 0) + t.feeAmount;
    }

    final filteredMonthly = monthlyTickets.where((m) =>
      m.startDate.isAfter(from.subtract(const Duration(days: 1))) &&
      m.startDate.isBefore(to.add(const Duration(days: 1)))).toList();
    for (final m in filteredMonthly) {
      tongThu += m.feeAmount;
      thuByType['Ve thang'] = (thuByType['Ve thang'] ?? 0) + m.feeAmount;
    }

    final filteredRentals = rentals.where((r) =>
      r.rentStartTime.isAfter(from.subtract(const Duration(days: 1))) &&
      r.rentStartTime.isBefore(to.add(const Duration(days: 1)))).toList();
    for (final r in filteredRentals) {
      tongThu += r.rentalFee;
      thuByType['Cho thue'] = (thuByType['Cho thue'] ?? 0) + r.rentalFee;
    }

    double tongChiPhi = 0;
    final Map<String, double> chiByCategory = {};
    final filteredFinance = financeTxs.where((f) =>
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();
    for (final f in filteredFinance) {
      if (!f.isIncome) {
        tongChiPhi += f.amount;
        final cat = f.expenseCategory.isNotEmpty ? f.expenseCategory : 'Chi khac';
        chiByCategory[cat] = (chiByCategory[cat] ?? 0) + f.amount;
      }
    }

    final rows = <ReportRow>[];
    rows.add(ReportRow([ReportCell('DOANH THU', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right)], isSection: true));
    for (final e in thuByType.entries) {
      rows.add(ReportRow([ReportCell('  ${e.key}'), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('CHI PHI', isBold: true), ReportCell(formatMoney(tongChiPhi), align: ReportCellAlign.right)], isSection: true));
    for (final e in chiByCategory.entries) {
      rows.add(ReportRow([ReportCell('  ${e.key}'), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([
      ReportCell('LOI NHUAN', isBold: true),
      ReportCell(formatMoney(tongThu - tongChiPhi), align: ReportCellAlign.right, isBold: true),
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
    return r;
  }

  // HOA DON

  Future<CrystalReportModel> _buildTicketList(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += t.feeAmount;
      rows.add(ReportRow([
        ReportCell(t.checkInTime.toString().substring(0, 16)),
        ReportCell(t.licensePlate),
        ReportCell(t.paymentMethod),
        ReportCell(t.paymentStatus),
        ReportCell(formatMoney(t.feeAmount), align: ReportCellAlign.right),
        ReportCell(t.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DANH SACH LUOT GUI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Gio vao'), ReportHeaderCell('Bien so'), ReportHeaderCell('PT TT'), ReportHeaderCell('Trang thai TT'), ReportHeaderCell('Phi', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true), ReportCell('${filtered.length} luot', isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildTicketPaid(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.paymentStatus == 'paid' &&
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += t.feeAmount;
      rows.add(ReportRow([
        ReportCell(t.ticketId),
        ReportCell(t.licensePlate),
        ReportCell(t.paymentMethod),
        ReportCell(formatMoney(t.feeAmount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'LUOT DA THANH TOAN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma luot'), ReportHeaderCell('Bien so'), ReportHeaderCell('PT TT'), ReportHeaderCell('Phi', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildRevenueByVehicleType(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final vehicles = await db.parkingVehicles.where().findAll();
    final vehicleTypeMap = {for (final v in vehicles) v.vehicleId: v.vehicleType};

    final filtered = tickets.where((t) =>
      t.paymentStatus == 'paid' &&
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byType = {};
    for (final t in filtered) {
      final vType = vehicleTypeMap[t.vehicleId] ?? 'Khong xac dinh';
      byType[vType] = (byType[vType] ?? 0) + t.feeAmount;
    }

    final rows = <ReportRow>[];
    for (final entry in byType.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DOANH THU THEO LOAI XE',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Loai xe'), ReportHeaderCell('Doanh thu', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byType.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildMonthlyTicketList(DateTime from, DateTime to) async {
    final db = await _isar;
    final monthlyTickets = await db.parkingMonthlyTickets.where().findAll();
    final filtered = monthlyTickets.where((m) =>
      m.startDate.isAfter(from.subtract(const Duration(days: 1))) &&
      m.startDate.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final m in filtered) {
      total += m.feeAmount;
      rows.add(ReportRow([
        ReportCell(m.ticketId),
        ReportCell(m.customerName),
        ReportCell(m.licensePlate),
        ReportCell(m.vehicleType),
        ReportCell('${formatDate(m.startDate)} - ${formatDate(m.endDate)}'),
        ReportCell(formatMoney(m.feeAmount), align: ReportCellAlign.right),
        ReportCell(m.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'VE THANG THEO THANG',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma ve'), ReportHeaderCell('KH'), ReportHeaderCell('Bien so'), ReportHeaderCell('Loai xe'), ReportHeaderCell('Thoi han'), ReportHeaderCell('Phi', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true), ReportCell('${filtered.length} ve', isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildRentalList(DateTime from, DateTime to) async {
    final db = await _isar;
    final rentals = await db.parkingRentals.where().findAll();
    final filtered = rentals.where((r) =>
      r.rentStartTime.isAfter(from.subtract(const Duration(days: 1))) &&
      r.rentStartTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double totalFee = 0, totalDeposit = 0;
    for (final r in filtered) {
      totalFee += r.rentalFee;
      totalDeposit += r.depositAmount;
      rows.add(ReportRow([
        ReportCell(r.rentalId),
        ReportCell(r.customerName),
        ReportCell(r.licensePlate),
        ReportCell('${formatDate(r.rentStartTime)} - ${formatDate(r.rentEndTime)}'),
        ReportCell(formatMoney(r.rentalFee), align: ReportCellAlign.right),
        ReportCell(formatMoney(r.depositAmount), align: ReportCellAlign.right),
        ReportCell(r.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CHO THUE THEO KHACH',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma thue'), ReportHeaderCell('KH'), ReportHeaderCell('Bien so'), ReportHeaderCell('Thoi han'), ReportHeaderCell('Phi thue', align: ReportCellAlign.right), ReportHeaderCell('Dat coc', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(totalFee), align: ReportCellAlign.right, isBold: true), ReportCell(formatMoney(totalDeposit), align: ReportCellAlign.right, isBold: true), ReportCell('${filtered.length} luot', isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildTicketByPaymentMethod(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.paymentStatus == 'paid' &&
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> countByMethod = {};
    final Map<String, double> amountByMethod = {};
    for (final t in filtered) {
      countByMethod[t.paymentMethod] = (countByMethod[t.paymentMethod] ?? 0) + 1;
      amountByMethod[t.paymentMethod] = (amountByMethod[t.paymentMethod] ?? 0) + t.feeAmount;
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
      title: 'PHUONG THUC THANH TOAN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Phuong thuc'), ReportHeaderCell('So luot', align: ReportCellAlign.right), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildTicketDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final tickets = await db.parkingTickets.where().findAll();
    final filtered = tickets.where((t) =>
      t.checkInTime.isAfter(from.subtract(const Duration(days: 1))) &&
      t.checkInTime.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    for (final t in filtered) {
      final duration = t.checkOutTime != null
        ? '${t.checkOutTime!.difference(t.checkInTime).inHours}h ${t.checkOutTime!.difference(t.checkInTime).inMinutes % 60}ph'
        : 'Dang gui';
      rows.add(ReportRow([
        ReportCell(t.ticketId),
        ReportCell(t.licensePlate),
        ReportCell(t.checkInTime.toString().substring(0, 16)),
        ReportCell(t.checkOutTime != null ? t.checkOutTime.toString().substring(0, 16) : '-'),
        ReportCell(duration),
        ReportCell(formatMoney(t.feeAmount), align: ReportCellAlign.right),
        ReportCell(t.paymentMethod),
        ReportCell(t.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CHI TIET HOA DON',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 1, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma luot'), ReportHeaderCell('Bien so'), ReportHeaderCell('Gio vao'), ReportHeaderCell('Gio ra'), ReportHeaderCell('Thoi luong'), ReportHeaderCell('Phi', align: ReportCellAlign.right), ReportHeaderCell('PT TT'), ReportHeaderCell('Trang thai')]],
      rows: rows,
    );
    return r;
  }

  // THU CHI

  Future<CrystalReportModel> _buildCashTxChi(DateTime from, DateTime to) async {
    final db = await _isar;
    final financeTxs = await db.parkingFinanceTxs.where().findAll();
    final filtered = financeTxs.where((f) =>
      !f.isIncome &&
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final f in filtered) {
      total += f.amount;
      rows.add(ReportRow([
        ReportCell(f.createdAt.toString().substring(0, 10)),
        ReportCell(f.financeId),
        ReportCell(f.expenseCategory.isNotEmpty ? f.expenseCategory : 'Chi khac'),
        ReportCell(f.note.isNotEmpty ? f.note : '-'),
        ReportCell(formatMoney(f.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU CHI TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma'), ReportHeaderCell('Loai chi'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildExpenseSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final financeTxs = await db.parkingFinanceTxs.where().findAll();
    final filtered = financeTxs.where((f) =>
      !f.isIncome &&
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byCategory = {};
    for (final f in filtered) {
      final cat = f.expenseCategory.isNotEmpty ? f.expenseCategory : 'Chi khac';
      byCategory[cat] = (byCategory[cat] ?? 0) + f.amount;
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
    return r;
  }

  Future<CrystalReportModel> _buildCashTxThuByRef(DateTime from, DateTime to) async {
    final db = await _isar;
    final financeTxs = await db.parkingFinanceTxs.where().findAll();
    final filtered = financeTxs.where((f) =>
      f.isIncome &&
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final f in filtered) {
      total += f.amount;
      rows.add(ReportRow([
        ReportCell(f.financeId),
        ReportCell(f.note.isNotEmpty ? f.note : (f.incomeCategory.isNotEmpty ? f.incomeCategory : 'Thu khac')),
        ReportCell(formatMoney(f.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'THU TIEN THEO LUOT',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 3, 2],
      headerRows: [[ReportHeaderCell('Ma phieu'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildCashTxThu(DateTime from, DateTime to) async {
    final db = await _isar;
    final financeTxs = await db.parkingFinanceTxs.where().findAll();
    final filtered = financeTxs.where((f) =>
      f.isIncome &&
      f.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      f.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final f in filtered) {
      total += f.amount;
      rows.add(ReportRow([
        ReportCell(f.createdAt.toString().substring(0, 10)),
        ReportCell(f.financeId),
        ReportCell(f.incomeCategory.isNotEmpty ? f.incomeCategory : 'Thu khac'),
        ReportCell(f.note.isNotEmpty ? f.note : '-'),
        ReportCell(formatMoney(f.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU THU TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma phieu'), ReportHeaderCell('Loai thu'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
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

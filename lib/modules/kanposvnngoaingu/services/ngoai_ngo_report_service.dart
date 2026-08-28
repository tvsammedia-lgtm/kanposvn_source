import 'package:isar/isar.dart';

import '../../../core/reports/crystal_report_models.dart';
import '../models/ngoai_ngo_ops.dart';
import '../models/student.dart';
import '../models/course_class.dart';

class NgoaiNguReportDef {
  final String code;
  final String title;
  final String group;
  final bool useDateRange;
  const NgoaiNguReportDef(this.code, this.title, this.group, {this.useDateRange = true});
}

class NgoaiNguReportService {
  final Future<Isar> _isar;
  NgoaiNguReportService(this._isar);

  static const company = {'name': '', 'address': '', 'taxCode': ''};

  static void configureCompany(String name, {String address = '', String taxCode = ''}) {
    company['name'] = name;
    company['address'] = address;
    company['taxCode'] = taxCode;
  }

  static final reportList = [
    const NgoaiNguReportDef('rp1111', 'Quy tien mat - Tong hop', '★ Quy tien mat', useDateRange: false),
    const NgoaiNguReportDef('rp1111_detail', 'Quy tien mat - Chi tiet', '★ Quy tien mat'),
    const NgoaiNguReportDef('rpBaoCaoTongHopXuatNhapTonVatTu', 'Xuat nhap ton kho - Tong hop', '★ Xuat nhap ton kho'),
    const NgoaiNguReportDef('rpBaoCaoHaoHutNguyenVatLieuHangHoa', 'Xuat nhap ton kho - Chi tiet', '★ Xuat nhap ton kho'),
    const NgoaiNguReportDef('rpOutputByStock', 'HV theo trang thai', '★ Xuat nhap ton kho'),
    const NgoaiNguReportDef('rpOutputFromShift', 'Lop hoc theo mon', '★ Xuat nhap ton kho'),
    const NgoaiNguReportDef('rpSoChiTietThanhToanNguoiBan', 'Cong no HV - Chi tiet', '★ Cong no KH-NCC'),
    const NgoaiNguReportDef('rpSoTongHopThanhToanVoiNguoiBan', 'Cong no HV - Tong hop', '★ Cong no KH-NCC'),
    const NgoaiNguReportDef('rpS10DN', 'Loi loi (P&L)', '★ Loi lo'),
    const NgoaiNguReportDef('rpBill', 'Danh sach hoc phi', 'Hoa don'),
    const NgoaiNguReportDef('rpBill_DiscountOnBill', 'Hoc phi da thanh toan', 'Hoa don'),
    const NgoaiNguReportDef('rpBill_DiscountOnFoodOrDrink', 'Hoc phi theo khoa hoc', 'Hoa don'),
    const NgoaiNguReportDef('rpBillForField', 'Hoc phi theo lop', 'Hoa don'),
    const NgoaiNguReportDef('rpBillForField_IsNotUsed', 'HV theo khoa hoc', 'Hoa don'),
    const NgoaiNguReportDef('rpBillForTax', 'Phuong thuc thanh toan', 'Hoa don'),
    const NgoaiNguReportDef('rpReceipt', 'Chi tiet hoa don', 'Hoa don'),
    const NgoaiNguReportDef('rpInput', 'Phieu chi tien', 'Thu chi'),
    const NgoaiNguReportDef('rpListInput', 'Tong hop chi phi theo loai', 'Thu chi'),
    const NgoaiNguReportDef('rpPaymentByPaymentID', 'Thu tien theo phieu', 'Thu chi'),
    const NgoaiNguReportDef('rpPaymentForCashier', 'Phieu thu tien', 'Thu chi'),
  ];

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return _buildCashFundSummary();
      case 'rp1111_detail': return _buildCashFundDetail(from, to);
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return _buildEnrollmentInventorySummary(from, to);
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return _buildEnrollmentInventoryDetail(from, to);
      case 'rpOutputByStock': return _buildStudentByStatus(from, to);
      case 'rpOutputFromShift': return _buildClassByCourse(from, to);
      case 'rpSoChiTietThanhToanNguoiBan': return _buildStudentDebtDetail(from, to);
      case 'rpSoTongHopThanhToanVoiNguoiBan': return _buildStudentDebtSummary(from, to);
      case 'rpS10DN': return _buildProfitLoss(from, to);
      case 'rpBill': return _buildInvoiceList(from, to);
      case 'rpBill_DiscountOnBill': return _buildInvoicePaid(from, to);
      case 'rpBill_DiscountOnFoodOrDrink': return _buildTuitionByCourse(from, to);
      case 'rpBillForField': return _buildTuitionByClass(from, to);
      case 'rpBillForField_IsNotUsed': return _buildStudentByCourse(from, to);
      case 'rpBillForTax': return _buildInvoiceByPaymentMethod(from, to);
      case 'rpReceipt': return _buildInvoiceDetail(from, to);
      case 'rpInput': return _buildExpenseList(from, to);
      case 'rpListInput': return _buildExpenseSummary(from, to);
      case 'rpPaymentByPaymentID': return _buildPaymentByRef(from, to);
      case 'rpPaymentForCashier': return _buildPaymentList(from, to);
      default: return _emptyReport(code);
    }
  }

  // ★ QUY TIEN MAT

  Future<CrystalReportModel> _buildCashFundSummary() async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final invoices = await db.ngoaiNguInvoices.where().findAll();

    double tongThu = 0;
    final Map<String, double> thuByMethod = {};
    for (final p in payments) {
      tongThu += p.amount;
      final method = p.method.isNotEmpty ? p.method : 'Khac';
      thuByMethod[method] = (thuByMethod[method] ?? 0) + p.amount;
    }

    double tongNo = 0;
    for (final inv in invoices) {
      tongNo += inv.outstanding;
    }

    final rows = <ReportRow>[];
    for (final e in thuByMethod.entries) {
      rows.add(ReportRow([ReportCell(e.key), ReportCell(formatMoney(e.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([ReportCell('Tong thu', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)], isSection: true));
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('Tong no chua thu', isBold: true), ReportCell(formatMoney(tongNo), align: ReportCellAlign.right, isBold: true)], isSection: true));
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('Tong tien can thu', isBold: true), ReportCell(formatMoney(tongThu + tongNo), align: ReportCellAlign.right, isBold: true)], isSection: true));

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
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final filtered = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final p in filtered) {
      total += p.amount;
      rows.add(ReportRow([
        ReportCell(p.paidAt.toString().substring(0, 10)),
        ReportCell(p.paymentId),
        ReportCell(p.invoiceCode),
        ReportCell(p.method.isNotEmpty ? p.method : 'Tien mat'),
        ReportCell(formatMoney(p.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'QUY TIEN MAT - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma phieu'), ReportHeaderCell('Ma HĐ'), ReportHeaderCell('PT TT'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  // ★ XUAT NHAP TON KHO (Enrollment inventory)

  Future<CrystalReportModel> _buildEnrollmentInventorySummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final filtered = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> countByStatus = {};
    final Map<String, double> amountByStatus = {};
    for (final inv in filtered) {
      countByStatus[inv.status] = (countByStatus[inv.status] ?? 0) + 1;
      amountByStatus[inv.status] = (amountByStatus[inv.status] ?? 0) + inv.amount;
    }

    final rows = <ReportRow>[];
    for (final e in countByStatus.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
        ReportCell(formatMoney(amountByStatus[e.key] ?? 0), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2],
      headerRows: [[ReportHeaderCell('Trang thai'), ReportHeaderCell('So HV', align: ReportCellAlign.right), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildEnrollmentInventoryDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final students = await db.ngoaiNguStudents.where().findAll();
    final filtered = students.where((s) =>
      s.enrollmentDate != null &&
      s.enrollmentDate!.isAfter(from.subtract(const Duration(days: 1))) &&
      s.enrollmentDate!.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    for (final s in filtered) {
      rows.add(ReportRow([
        ReportCell(s.enrollmentDate.toString().substring(0, 10)),
        ReportCell(s.studentCode ?? '-'),
        ReportCell(s.fullName ?? '-'),
        ReportCell(s.learningLanguage ?? '-'),
        ReportCell(s.currentLevel ?? '-'),
        ReportCell(s.status.name),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'XUAT NHAP TON KHO - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay NH'), ReportHeaderCell('Ma HV'), ReportHeaderCell('Ho ten'), ReportHeaderCell('Ngon ngu'), ReportHeaderCell('Cap do'), ReportHeaderCell('Trang thai')]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildStudentByStatus(DateTime from, DateTime to) async {
    final db = await _isar;
    final students = await db.ngoaiNguStudents.where().findAll();

    final Map<String, int> byStatus = {};
    for (final s in students) {
      byStatus[s.status.name] = (byStatus[s.status.name] ?? 0) + 1;
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
      title: 'HV THEO TRANG THAI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2],
      headerRows: [[ReportHeaderCell('Trang thai'), ReportHeaderCell('So HV', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${students.length}', align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildClassByCourse(DateTime from, DateTime to) async {
    final db = await _isar;
    final classes = await db.ngoaiNguClass.where().findAll();
    final courses = await db.ngoaiNguCourses.where().findAll();
    final courseMap = {for (final c in courses) c.uuid: c.courseName ?? '-'};

    final Map<String, int> byCourse = {};
    for (final cl in classes) {
      final courseName = courseMap[cl.courseUuid] ?? 'Khong xac dinh';
      byCourse[courseName] = (byCourse[courseName] ?? 0) + 1;
    }

    final rows = <ReportRow>[];
    for (final e in byCourse.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell('${e.value}', align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'LOP HOC THEO MON',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 2],
      headerRows: [[ReportHeaderCell('Mon hoc'), ReportHeaderCell('So lop', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell('${classes.length}', align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  // ★ CONG NO HV

  Future<CrystalReportModel> _buildStudentDebtDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final students = await db.ngoaiNguStudents.where().findAll();
    final studentMap = {for (final s in students) s.uuid: s.fullName ?? '-'};

    final debtInvoices = invoices.where((i) => i.outstanding > 0).toList();

    final rows = <ReportRow>[];
    for (final inv in debtInvoices) {
      final studentName = studentMap[inv.studentUuid] ?? '-';
      rows.add(ReportRow([
        ReportCell(studentName),
        ReportCell(inv.invoiceCode),
        ReportCell(formatMoney(inv.amount), align: ReportCellAlign.right),
        ReportCell(formatMoney(inv.paidAmount), align: ReportCellAlign.right),
        ReportCell(formatMoney(inv.outstanding), align: ReportCellAlign.right),
      ]));
    }

    final totalDebt = debtInvoices.fold(0.0, (sum, i) => sum + i.outstanding);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO HV - CHI TIET',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [3, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Hoc vien'), ReportHeaderCell('Ma HĐ'), ReportHeaderCell('Hoc phi', align: ReportCellAlign.right), ReportHeaderCell('Da TT', align: ReportCellAlign.right), ReportHeaderCell('Con no', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildStudentDebtSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final students = await db.ngoaiNguStudents.where().findAll();
    final studentMap = {for (final s in students) s.uuid: s.fullName ?? '-'};

    final Map<String, double> debtByStudent = {};
    for (final inv in invoices) {
      if (inv.outstanding > 0) {
        final name = studentMap[inv.studentUuid] ?? '-';
        debtByStudent[name] = (debtByStudent[name] ?? 0) + inv.outstanding;
      }
    }

    final rows = <ReportRow>[];
    for (final e in debtByStudent.entries) {
      rows.add(ReportRow([
        ReportCell(e.key),
        ReportCell(formatMoney(e.value), align: ReportCellAlign.right),
      ]));
    }

    final totalDebt = debtByStudent.values.fold(0.0, (a, b) => a + b);

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CONG NO HV - TONG HOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}', 'So HV con no: ${debtByStudent.length}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Hoc vien'), ReportHeaderCell('Con no', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  // ★ LOI LO

  Future<CrystalReportModel> _buildProfitLoss(DateTime from, DateTime to) async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final invoices = await db.ngoaiNguInvoices.where().findAll();

    final filteredPayments = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    double tongThu = 0;
    for (final p in filteredPayments) {
      tongThu += p.amount;
    }

    final filteredInvoices = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();
    double tongHocPhi = 0;
    for (final inv in filteredInvoices) {
      tongHocPhi += inv.amount;
    }

    final rows = <ReportRow>[];
    rows.add(ReportRow([ReportCell('DOANH THU THU DUOC', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right)], isSection: true));
    rows.add(ReportRow([ReportCell('  Tien thu hoc phi'), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right)]));
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([ReportCell('TONG HOC PHI PHAI THU', isBold: true), ReportCell(formatMoney(tongHocPhi), align: ReportCellAlign.right)], isSection: true));
    for (final inv in filteredInvoices) {
      rows.add(ReportRow([
        ReportCell('  ${inv.invoiceCode}'),
        ReportCell(formatMoney(inv.amount), align: ReportCellAlign.right),
      ]));
    }
    rows.add(ReportRow([ReportCell(''), ReportCell('')]));
    rows.add(ReportRow([
      ReportCell('HOC PHI CHUA THU', isBold: true),
      ReportCell(formatMoney(tongHocPhi - tongThu), align: ReportCellAlign.right, isBold: true),
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

  Future<CrystalReportModel> _buildInvoiceList(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final students = await db.ngoaiNguStudents.where().findAll();
    final studentMap = {for (final s in students) s.uuid: s.fullName ?? '-'};

    final filtered = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final inv in filtered) {
      total += inv.amount;
      rows.add(ReportRow([
        ReportCell(inv.invoiceCode),
        ReportCell(studentMap[inv.studentUuid] ?? '-'),
        ReportCell(formatMoney(inv.amount), align: ReportCellAlign.right),
        ReportCell(formatMoney(inv.paidAmount), align: ReportCellAlign.right),
        ReportCell(formatMoney(inv.outstanding), align: ReportCellAlign.right),
        ReportCell(inv.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'DANH SACH HOC PHI',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma HĐ'), ReportHeaderCell('Hoc vien'), ReportHeaderCell('Hoc phi', align: ReportCellAlign.right), ReportHeaderCell('Da TT', align: ReportCellAlign.right), ReportHeaderCell('Con no', align: ReportCellAlign.right), ReportHeaderCell('Trang thai')]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true), ReportCell(''), ReportCell(''), ReportCell('${filtered.length} HĐ', isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildInvoicePaid(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final students = await db.ngoaiNguStudents.where().findAll();
    final studentMap = {for (final s in students) s.uuid: s.fullName ?? '-'};

    final filtered = invoices.where((i) =>
      i.status == 'paid' &&
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final inv in filtered) {
      total += inv.paidAmount;
      rows.add(ReportRow([
        ReportCell(inv.invoiceCode),
        ReportCell(studentMap[inv.studentUuid] ?? '-'),
        ReportCell(inv.paymentMethod),
        ReportCell(formatMoney(inv.paidAmount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HOC PHI DA THANH TOAN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma HĐ'), ReportHeaderCell('Hoc vien'), ReportHeaderCell('PT TT'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildTuitionByCourse(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final courses = await db.ngoaiNguCourses.where().findAll();
    final courseMap = {for (final c in courses) c.uuid: c.courseName ?? '-'};

    final filtered = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byCourse = {};
    for (final inv in filtered) {
      final courseName = courseMap[inv.courseUuid] ?? 'Khong xac dinh';
      byCourse[courseName] = (byCourse[courseName] ?? 0) + inv.amount;
    }

    final rows = <ReportRow>[];
    for (final entry in byCourse.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HOC PHI THEO KHOA HOC',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Khoa hoc'), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byCourse.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildTuitionByClass(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final classes = await db.ngoaiNguClass.where().findAll();
    final classMap = {for (final c in classes) c.uuid: c.className ?? '-'};

    final filtered = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byClass = {};
    for (final inv in filtered) {
      final className = classMap[inv.classUuid] ?? 'Khong xac dinh';
      byClass[className] = (byClass[className] ?? 0) + inv.amount;
    }

    final rows = <ReportRow>[];
    for (final entry in byClass.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell(formatMoney(entry.value), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HOC PHI THEO LOP',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 3],
      headerRows: [[ReportHeaderCell('Lop hoc'), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byClass.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildStudentByCourse(DateTime from, DateTime to) async {
    final db = await _isar;
    final enrollments = await db.ngoaiNguClassStudents.where().findAll();
    final courses = await db.ngoaiNguCourses.where().findAll();
    final classes = await db.ngoaiNguClass.where().findAll();
    final classCourseMap = {for (final c in classes) c.uuid: c.courseUuid ?? ''};
    final courseNameMap = {for (final c in courses) c.uuid: c.courseName ?? '-'};

    final filtered = enrollments.where((e) =>
      e.enrolledAt != null &&
      e.enrolledAt!.isAfter(from.subtract(const Duration(days: 1))) &&
      e.enrolledAt!.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> byCourse = {};
    for (final e in filtered) {
      final courseUuid = classCourseMap[e.classUuid] ?? '';
      final courseName = courseNameMap[courseUuid] ?? 'Khong xac dinh';
      byCourse[courseName] = (byCourse[courseName] ?? 0) + 1;
    }

    final rows = <ReportRow>[];
    for (final entry in byCourse.entries) {
      rows.add(ReportRow([
        ReportCell(entry.key),
        ReportCell('${entry.value}', align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'HV THEO KHOA HOC',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [4, 2],
      headerRows: [[ReportHeaderCell('Khoa hoc'), ReportHeaderCell('So HV', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildInvoiceByPaymentMethod(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();

    final filtered = invoices.where((i) =>
      i.status == 'paid' &&
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, int> countByMethod = {};
    final Map<String, double> amountByMethod = {};
    for (final inv in filtered) {
      final method = inv.paymentMethod.isNotEmpty ? inv.paymentMethod : 'Khac';
      countByMethod[method] = (countByMethod[method] ?? 0) + 1;
      amountByMethod[method] = (amountByMethod[method] ?? 0) + inv.paidAmount;
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
      headerRows: [[ReportHeaderCell('Phuong thuc'), ReportHeaderCell('So luong', align: ReportCellAlign.right), ReportHeaderCell('Tong tien', align: ReportCellAlign.right)]],
      rows: rows,
    );
    return r;
  }

  Future<CrystalReportModel> _buildInvoiceDetail(DateTime from, DateTime to) async {
    final db = await _isar;
    final invoices = await db.ngoaiNguInvoices.where().findAll();
    final students = await db.ngoaiNguStudents.where().findAll();
    final studentMap = {for (final s in students) s.uuid: s.fullName ?? '-'};

    final filtered = invoices.where((i) =>
      i.createdAt.isAfter(from.subtract(const Duration(days: 1))) &&
      i.createdAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    for (final inv in filtered) {
      rows.add(ReportRow([
        ReportCell(inv.invoiceCode),
        ReportCell(studentMap[inv.studentUuid] ?? '-'),
        ReportCell(formatMoney(inv.amount), align: ReportCellAlign.right),
        ReportCell(inv.voucherCode.isNotEmpty ? inv.voucherCode : '-'),
        ReportCell(formatMoney(inv.discount), align: ReportCellAlign.right),
        ReportCell(formatMoney(inv.paidAmount), align: ReportCellAlign.right),
        ReportCell(inv.paymentMethod),
        ReportCell(inv.status),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'CHI TIET HOA DON',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ma HĐ'), ReportHeaderCell('HV'), ReportHeaderCell('Hoc phi', align: ReportCellAlign.right), ReportHeaderCell('Voucher'), ReportHeaderCell('Giam gia', align: ReportCellAlign.right), ReportHeaderCell('Da TT', align: ReportCellAlign.right), ReportHeaderCell('PT TT'), ReportHeaderCell('Trang thai')]],
      rows: rows,
    );
    return r;
  }

  // THU CHI

  Future<CrystalReportModel> _buildExpenseList(DateTime from, DateTime to) async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final filtered = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final p in filtered) {
      total += p.amount;
      rows.add(ReportRow([
        ReportCell(p.paidAt.toString().substring(0, 10)),
        ReportCell(p.paymentId),
        ReportCell(p.invoiceCode),
        ReportCell(p.note.isNotEmpty ? p.note : '-'),
        ReportCell(formatMoney(p.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU CHI TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma phieu'), ReportHeaderCell('Ma HĐ'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildExpenseSummary(DateTime from, DateTime to) async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final filtered = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final Map<String, double> byMethod = {};
    for (final p in filtered) {
      final method = p.method.isNotEmpty ? p.method : 'Khac';
      byMethod[method] = (byMethod[method] ?? 0) + p.amount;
    }

    final rows = <ReportRow>[];
    for (final entry in byMethod.entries) {
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
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(byMethod.values.fold(0.0, (a, b) => a + b)), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildPaymentByRef(DateTime from, DateTime to) async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final filtered = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final p in filtered) {
      total += p.amount;
      rows.add(ReportRow([
        ReportCell(p.paymentId),
        ReportCell(p.invoiceCode),
        ReportCell(p.note.isNotEmpty ? p.note : '-'),
        ReportCell(formatMoney(p.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'THU TIEN THEO PHIEU',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 3, 2],
      headerRows: [[ReportHeaderCell('Ma phieu'), ReportHeaderCell('Ma HĐ'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
      ],
    );
    return r;
  }

  Future<CrystalReportModel> _buildPaymentList(DateTime from, DateTime to) async {
    final db = await _isar;
    final payments = await db.ngoaiNguPaymentRecords.where().findAll();
    final filtered = payments.where((p) =>
      p.paidAt.isAfter(from.subtract(const Duration(days: 1))) &&
      p.paidAt.isBefore(to.add(const Duration(days: 1)))).toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final p in filtered) {
      total += p.amount;
      rows.add(ReportRow([
        ReportCell(p.paidAt.toString().substring(0, 10)),
        ReportCell(p.paymentId),
        ReportCell(p.invoiceCode),
        ReportCell(p.method.isNotEmpty ? p.method : 'Tien mat'),
        ReportCell(p.note.isNotEmpty ? p.note : '-'),
        ReportCell(formatMoney(p.amount), align: ReportCellAlign.right),
      ]));
    }

    final r = CrystalReportModel(
      formLine: 'Mau so: 01 - TT',
      unitName: company['name']!,
      title: 'PHIEU THU TIEN',
      subtitleLines: ['Tu ngay: ${formatDate(from)} - Den ngay: ${formatDate(to)}'],
      columnFlex: [2, 2, 2, 2, 2, 2],
      headerRows: [[ReportHeaderCell('Ngay'), ReportHeaderCell('Ma phieu'), ReportHeaderCell('Ma HĐ'), ReportHeaderCell('PT TT'), ReportHeaderCell('Dien giai'), ReportHeaderCell('So tien', align: ReportCellAlign.right)]],
      rows: rows,
      totalRows: [
        ReportRow([ReportCell('TONG CONG', isBold: true), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(''), ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true)]),
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

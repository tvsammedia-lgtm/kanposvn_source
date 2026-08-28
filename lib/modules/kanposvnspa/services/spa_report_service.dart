import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../models/spa_session.dart';
import '../models/spa_expense.dart';
import '../models/spa_inventory_models.dart';
import '../models/spa_customer.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_combo.dart';

/// Xây dựng báo cáo cho module Spa — mô phỏng tất cả 20 báo cáo Crystal
/// (.rpt) từ KANCAFE_VS2022_DEMO.
///
/// KEY REPORTS (special attention):
///  - rp1111 / rp1111_Detail:          Quỹ tiền mặt (tổng hợp + chi tiết)
///  - rpBaoCaoTongHopXuatNhapTonVatTu: Xuất nhập tồn kho
///  - rpSoTongHopThanhToanVoiNguoiBan: Công nợ nhà cung cấp (tổng hợp)
///  - rpSoChiTietThanhToanNguoiBan:    Công nợ nhà cung cấp (chi tiết)
///  - rpS10DN:                         Lãi lỗ
///
/// BILL / RECEIPT:
///  - rpBill / rpBillForTax / rpBillForField:  Hóa đơn
///  - rpBill_DiscountOnBill / rpBill_DiscountOnFoodOrDrink: Hóa đơn giảm giá
///  - rpReceipt:                              Biên lai
///
/// INVENTORY:
///  - rpInput / rpListInput:            Nhập kho
///  - rpOutputFromShift / rpOutputByStock: Xuất kho (theo ca / theo kho)
///  - rpBaoCaoHaoHutNguyenVatLieuHangHoa: Hao hụt
///
/// PAYMENT:
///  - rpPaymentByPaymentID / rpPaymentForCashier: Thanh toán NCC
class SpaReportService {
  final Isar _isar;

  SpaReportService(this._isar);

  static String _kUnit = kUnitDash;
  static String _kAddress = kUnitDash;
  static String _kTax = kUnitDash;

  static void configureCompany({String? name, String? address, String? taxCode}) {
    if (name != null && name.trim().isNotEmpty) _kUnit = name.trim();
    if (address != null && address.trim().isNotEmpty) _kAddress = address.trim();
    if (taxCode != null && taxCode.trim().isNotEmpty) _kTax = taxCode.trim();
  }

  static bool _inRange(DateTime d, DateTime from, DateTime to) =>
      !d.isBefore(from) && !d.isAfter(to);

  static final _dateFmt = DateFormat('dd/MM/yyyy');
  static final _dateTimeFmt = DateFormat('dd/MM/yyyy HH:mm');

  static String _money(double v) => formatMoney(v);
  static String _date(DateTime? d) => d == null ? '—' : _dateFmt.format(d);
  static String _dateTime(DateTime? d) => d == null ? '—' : _dateTimeFmt.format(d);

  // ═════════════════════════════════════════════════════════════════════════════
  // 1) QUỸ TIỀN MẶT — TỔNG HỢP (rp1111) ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final expenses = await _isar.spaExpenses.where().findAll();

    final thuTuDichVu = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .fold<double>(0, (s, ss) => s + ss.totalAmount);

    final thuTip = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .fold<double>(0, (s, ss) => s + ss.tipAmount);

    final thuKhac = expenses
        .where((e) => e.type == SpaExpenseType.REVENUE && e.amount < 0 && _inRange(e.spentAt, from, to))
        .fold<double>(0, (s, e) => s + e.amount.abs());

    final chiPhi = expenses
        .where((e) => e.type != SpaExpenseType.REVENUE && e.amount > 0 && _inRange(e.spentAt, from, to))
        .fold<double>(0, (s, e) => s + e.amount);

    final openingThu = sessions
        .where((s) => s.status == SpaSessionStatus.COMPLETED && s.endTime != null && s.endTime!.isBefore(from))
        .fold<double>(0, (s, ss) => s + ss.totalAmount);
    final openingChi = expenses
        .where((e) => e.amount > 0 && e.spentAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);

    final opening = openingThu - openingChi;
    final totalThu = thuTuDichVu + thuTip + thuKhac;
    final closing = opening + totalThu - chiPhi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        ReportCell(_money(opening), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Tổng thu trong kỳ', isBold: true),
        ReportCell(_money(totalThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2.1'),
        const ReportCell('  Thu từ dịch vụ'),
        ReportCell(_money(thuTuDichVu), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('2.2'),
        const ReportCell('  Tiền tip KTV'),
        ReportCell(_money(thuTip), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('2.3'),
        const ReportCell('  Thu khác (combo, SP...)'),
        ReportCell(_money(thuKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Tổng chi trong kỳ', isBold: true),
        ReportCell(_money(chiPhi), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Số dư cuối kỳ (1 + 2 − 3)', isBold: true),
        ReportCell(_money(closing), align: ReportCellAlign.right, isBold: true),
      ]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO QUỸ TIỀN MẶT',
      titleSub: 'Tổng hợp thu chi (rp1111)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('STT'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Số tiền (VNĐ)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(closing), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 2) QUỸ TIỀN MẶT — CHI TIẾT (rp1111_Detail) ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCashFundDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final expenses = await _isar.spaExpenses.where().findAll();

    final openingThu = sessions
        .where((s) => s.status == SpaSessionStatus.COMPLETED && s.endTime != null && s.endTime!.isBefore(from))
        .fold<double>(0, (s, ss) => s + ss.totalAmount);
    final openingChi = expenses
        .where((e) => e.amount > 0 && e.spentAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    var running = openingThu - openingChi;

    final filteredSessions = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final filteredExpenses = expenses
        .where((e) => _inRange(e.spentAt, from, to))
        .toList()
      ..sort((a, b) => b.spentAt.compareTo(a.spentAt));

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];
    int stt = 0;

    for (final s in filteredSessions) {
      stt++;
      running += s.totalAmount;
      final techName = s.technician.value?.name ?? '—';
      final svcName = s.service.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTime(s.endTime)),
        ReportCell('$svcName — KTV: $techName'),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(_money(running), align: ReportCellAlign.right),
      ]));
    }

    for (final e in filteredExpenses) {
      stt++;
      if (e.amount > 0) {
        running -= e.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(e.spentAt)),
          ReportCell('Chi: ${e.category.isNotEmpty ? e.category : e.content}'),
          const ReportCell(''),
          ReportCell(_money(e.amount), align: ReportCellAlign.right),
          ReportCell(_money(running), align: ReportCellAlign.right),
        ]));
      } else {
        running += e.amount.abs();
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(e.spentAt)),
          ReportCell('Thu: ${e.content}'),
          ReportCell(_money(e.amount.abs()), align: ReportCellAlign.right),
          const ReportCell(''),
          ReportCell(_money(running), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03b-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'SỔ QUỸ TIỀN MẶT — CHI TIẾT',
      titleSub: 'Chi tiết từng khoản thu/chi (rp1111_Detail)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left),
          const ReportHeaderCell('Thu (VNĐ)'),
          const ReportHeaderCell('Chi (VNĐ)'),
          const ReportHeaderCell('Số dư (VNĐ)'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('SỐ DƯ CUỐI KỲ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(_money(running), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 3) XUẤT NHẬP TỒN KHO (rpBaoCaoTongHopXuatNhapTonVatTu) ★ SPECIAL
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildInventoryReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.spaProducts.where().findAll();
    final txs = await _isar.spaInventoryTxs.where().findAll();

    final flex = [4, 22, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    for (final p in products) {
      double nhap = 0, xuat = 0;
      for (final tx in txs) {
        if (!_inRange(tx.createdAt, from, to)) continue;
        if (tx.productId == p.productId) {
          if (tx.type == SpaInventoryTxType.IMPORT) { nhap += tx.quantity.toDouble(); }
          else { xuat += tx.quantity.toDouble(); }
        }
      }
      final ton = p.stock;
      final gtTon = ton.toDouble() * p.price;
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category.label})'),
        ReportCell(formatQty((ton + xuat - nhap).toDouble()), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(p.price), align: ReportCellAlign.right),
        ReportCell(_money(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP XUẤT NHẬP TỒN VẬT TƯ',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Tên mặt hàng'),
          const ReportHeaderCell('Tồn đầu'),
          const ReportHeaderCell('Nhập'),
          const ReportHeaderCell('Xuất'),
          const ReportHeaderCell('Tồn cuối'),
          const ReportHeaderCell('Đơn giá'),
          const ReportHeaderCell('Giá trị tồn'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(totalNhap), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(totalXuat), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(totalTon.toDouble()), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 4) CÔNG NỢ KHÁCH HÀNG ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCustomerDebtReport() async {
    final customers = await _isar.spaCustomers.where().findAll();
    final debtors = customers.where((c) => c.debtAmount > 0).toList()
      ..sort((a, b) => b.debtAmount.compareTo(a.debtAmount));

    final flex = [6, 26, 18, 16, 14, 20];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final c in debtors) {
      totalDebt += c.debtAmount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${c.name} (${c.phone})'),
        ReportCell(c.customerGroup),
        ReportCell(_money(c.debtAmount), align: ReportCellAlign.right, isBold: true),
        ReportCell('${c.loyaltyPoints} điểm'),
        ReportCell(c.gender),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO CÔNG NỢ KHÁCH HÀNG',
      titleSub: 'Danh sách khách hàng còn nợ',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Họ tên / SĐT'),
          const ReportHeaderCell('Nhóm KH'),
          const ReportHeaderCell('Công nợ'),
          const ReportHeaderCell('Điểm'),
          const ReportHeaderCell('Giới tính'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG KH NỢ', isBold: true),
          const ReportCell(''),
          ReportCell(_money(totalDebt), align: ReportCellAlign.right, isBold: true),
          ReportCell('${debtors.length} người', align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 5) CÔNG NỢ NCC — TỔNG HỢP (rpSoTongHopThanhToanVoiNguoiBan)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtSummaryReport() async {
    final expenses = await _isar.spaExpenses.where().findAll();
    final chiTieuNCC = expenses
        .where((e) => e.amount > 0 && e.category.toLowerCase().contains('mỹ phẩm'))
        .toList();

    final flex = [6, 26, 22, 18, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    final byCat = <String, double>{};
    for (final e in chiTieuNCC) {
      byCat[e.category] = (byCat[e.category] ?? 0) + e.amount;
    }
    final sorted = byCat.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    for (final entry in sorted) {
      totalDebt += entry.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(entry.key),
        const ReportCell('—'),
        ReportCell(_money(entry.value), align: ReportCellAlign.right),
        ReportCell(_money(entry.value), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'TỔNG HỢP CHI TIÊU NHÀ CUNG CẤP',
      titleSub: '(rpSoTongHopThanhToanVoiNguoiBan)',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Nhóm chi tiêu'),
          const ReportHeaderCell('Ghi chú'),
          const ReportHeaderCell('Đã chi'),
          const ReportHeaderCell('Tổng cộng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          ReportCell('${sorted.length} nhóm', align: ReportCellAlign.right, isBold: true),
          ReportCell(_money(totalDebt), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 6) CÔNG NỢ NCC — CHI TIẾT (rpSoChiTietThanhToanNguoiBan)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtDetailReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _isar.spaExpenses.where().findAll();
    final filtered = expenses
        .where((e) => e.amount > 0 && _inRange(e.spentAt, from, to))
        .toList()
      ..sort((a, b) => b.spentAt.compareTo(a.spentAt));

    final flex = [6, 22, 14, 22, 16, 16];
    final rows = <ReportRow>[];
    double total = 0;

    for (final e in filtered) {
      total += e.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(e.expenseId),
        ReportCell(_dateTime(e.spentAt)),
        ReportCell('${e.category.isNotEmpty ? e.category : "—"}: ${e.content.isNotEmpty ? e.content : "—"}'),
        ReportCell(_money(e.amount), align: ReportCellAlign.right),
        ReportCell(_money(e.amount), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'CHI TIẾT CHI TIÊU NHÀ CUNG CẤP',
      titleSub: '(rpSoChiTietThanhToanNguoiBan)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã CT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('Số tiền'),
          const ReportHeaderCell('Còn nợ'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 7) LÃI LỖ (rpS10DN) ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildProfitLossReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final expenses = await _isar.spaExpenses.where().findAll();

    double doanhThuDichVu = 0;
    double doanhThuTip = 0;
    double doanhThuKhac = 0;
    double chiPhiCoDinh = 0;
    double chiPhiBienDoi = 0;

    for (final s in sessions) {
      if (s.status != SpaSessionStatus.COMPLETED || s.endTime == null) continue;
      if (!_inRange(s.endTime!, from, to)) continue;
      doanhThuDichVu += s.totalAmount;
      doanhThuTip += s.tipAmount;
    }

    for (final e in expenses) {
      if (!_inRange(e.spentAt, from, to)) continue;
      if (e.type == SpaExpenseType.REVENUE) {
        doanhThuKhac += e.amount.abs();
      } else if (e.type == SpaExpenseType.FIXED) {
        chiPhiCoDinh += e.amount;
      } else {
        chiPhiBienDoi += e.amount;
      }
    }

    final doanhThu = doanhThuDichVu + doanhThuTip + doanhThuKhac;
    final tongChiPhi = chiPhiCoDinh + chiPhiBienDoi;
    final loiNhuanRong = doanhThu - tongChiPhi;

    final flex = [6, 34, 12, 24];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Doanh thu dịch vụ', isBold: true),
        const ReportCell(''),
        ReportCell(_money(doanhThuDichVu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Tiền tip KTV'),
        const ReportCell(''),
        ReportCell(_money(doanhThuTip), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Doanh thu khác (combo, SP...)'),
        const ReportCell(''),
        ReportCell(_money(doanhThuKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('TỔNG DOANH THU (1+2+3)', isBold: true),
        const ReportCell(''),
        ReportCell(_money(doanhThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Chi phí cố định'),
        const ReportCell(''),
        ReportCell(_money(chiPhiCoDinh), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('6'),
        const ReportCell('Chi phí biến đổi'),
        const ReportCell(''),
        ReportCell(_money(chiPhiBienDoi), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('7'),
        const ReportCell('TỔNG CHI PHÍ (5+6)', isBold: true),
        const ReportCell(''),
        ReportCell(_money(tongChiPhi), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('8'),
        const ReportCell('LỢI NHUẬN RÒNG (4 − 7)', isBold: true),
        const ReportCell(''),
        ReportCell(_money(loiNhuanRong), align: ReportCellAlign.right, isBold: true),
      ]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO KẾT QUẢ HOẠT ĐỘNG KINH DOANH',
      titleSub: 'Lãi lỗ (rpS10DN)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('STT'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Thành tiền'), const ReportHeaderCell('Tổng cộng (VNĐ)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Giám đốc', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 8) HÓA ĐƠN (rpBill / rpBillForTax / rpBillForField)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSalesBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 18, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final s in filtered) {
      total += s.totalAmount;
      final techName = s.technician.value?.name ?? '—';
      final svcName = s.service.value?.name ?? '—';
      final custName = s.customer.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(custName),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(svcName),
        ReportCell(techName),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
        ReportCell(_money(s.tipAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HÓA ĐƠN DỊCH VỤ',
      titleSub: '(rpBill / rpBillForTax)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Dịch vụ'),
          const ReportHeaderCell('KTV'),
          const ReportHeaderCell('Thành tiền'),
          const ReportHeaderCell('Tip'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 9) GIẢM GIÁ (rpBill_DiscountOnBill)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildDiscountOnBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final combos = await _isar.spaCombos.where().findAll();
    final filtered = combos
        .where((c) => c.purchaseDate != null && _inRange(c.purchaseDate!, from, to))
        .toList()
      ..sort((a, b) => (b.purchaseDate ?? DateTime(0)).compareTo(a.purchaseDate ?? DateTime(0)));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalGT = 0;

    for (final c in filtered) {
      totalGT += c.price;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(c.customerName),
        ReportCell(_date(c.purchaseDate)),
        ReportCell(c.serviceName),
        ReportCell('${c.totalSessions + c.bonusSessions} buổi'),
        ReportCell(_money(c.price), align: ReportCellAlign.right),
        ReportCell('${c.usedCount}/${c.totalSessions}'),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO BÁN COMBO / GÓI DỊCH VỤ',
      titleSub: '(rpBill_DiscountOnBill)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Ngày mua'),
          const ReportHeaderCell('Dịch vụ'),
          const ReportHeaderCell('Tổng buổi'),
          const ReportHeaderCell('Thành tiền'),
          const ReportHeaderCell('Đã dùng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('${filtered.length} combo', align: ReportCellAlign.right, isBold: true),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 10) BIÊN LAI (rpReceipt)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildReceiptReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final s in filtered) {
      total += s.totalAmount;
      final custName = s.customer.value?.name ?? '—';
      final svcName = s.service.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(s.sessionId),
        ReportCell(_dateTime(s.endTime)),
        ReportCell('$custName: $svcName'),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'DANH SÁCH PHIẾU THU TIỀN',
      titleSub: '(rpReceipt)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã buổi'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 11) NHẬP KHO (rpInput / rpListInput)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildImportReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final txs = await _isar.spaInventoryTxs.where().findAll();
    final filtered = txs
        .where((tx) => tx.type == SpaInventoryTxType.IMPORT && _inRange(tx.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final tx in filtered) {
      final cost = tx.quantity.toDouble() * 50000;
      total += cost;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(tx.productId.isNotEmpty ? tx.productId : '—'),
        ReportCell(_dateTime(tx.createdAt)),
        ReportCell('${tx.productName}${tx.note.isNotEmpty ? ' — ${tx.note}' : ''}'),
        ReportCell(formatQty(tx.quantity.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(50000), align: ReportCellAlign.right),
        ReportCell(_money(cost), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO NHẬP KHO DƯỢC LIỆU',
      titleSub: '(rpInput / rpListInput)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Số phiếu'),
          const ReportHeaderCell('Ngày nhập'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('SL'),
          const ReportHeaderCell('Đơn giá'),
          const ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('${filtered.length} phiếu', align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 12) XUẤT KHO THEO PHIẾU (rpOutputFromShift)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final services = await _isar.spaServiceModels.where().findAll();
    final serviceMap = {for (final s in services) s.serviceId: s};

    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 22, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final s in filtered) {
      final svc = serviceMap[s.service.value?.serviceId ?? ''];
      final consumptions = svc?.consumptions ?? [];
      for (final c in consumptions) {
        final parts = c.split('|');
        if (parts.length >= 3) {
          final qty = double.tryParse(parts[2]) ?? 0;
          totalSL += qty;
          final amt = qty * s.totalAmount * 0.1;
          totalGT += amt;
          rows.add(ReportRow([
            ReportCell('${rows.length + 1}'),
            ReportCell(_dateTime(s.endTime)),
            ReportCell(s.sessionId),
            ReportCell(parts.length > 1 ? parts[1] : parts[0]),
            ReportCell(formatQty(qty), align: ReportCellAlign.right),
            const ReportCell(''),
            const ReportCell(''),
            ReportCell(_money(amt), align: ReportCellAlign.right),
          ]));
        }
      }
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO PHIẾU DỊCH VỤ',
      titleSub: '(rpOutputFromShift)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Phiếu'),
          const ReportHeaderCell('Vật tư'),
          const ReportHeaderCell('SL'),
          const ReportHeaderCell('Giá vốn'),
          const ReportHeaderCell('Giá bán'),
          const ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(formatQty(totalSL), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 13) XUẤT KHO THEO MẶT HÀNG (rpOutputByStock)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByStockReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.spaProducts.where().findAll();
    final txs = await _isar.spaInventoryTxs.where().findAll();

    final flex = [4, 24, 12, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final p in products) {
      double sl = 0;
      for (final tx in txs) {
        if (tx.type == SpaInventoryTxType.EXPORT && _inRange(tx.createdAt, from, to) && tx.productId == p.productId) {
          sl += tx.quantity.toDouble();
        }
      }
      if (sl <= 0) continue;
      final gt = sl * p.price;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category.label})'),
        ReportCell(_money(p.price), align: ReportCellAlign.right),
        ReportCell(_money(p.price), align: ReportCellAlign.right),
        ReportCell(formatQty(sl), align: ReportCellAlign.right),
        ReportCell(_money(gt), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO TỪNG DƯỢC LIỆU',
      titleSub: '(rpOutputByStock)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Dược liệu'),
          const ReportHeaderCell('Giá vốn'),
          const ReportHeaderCell('Giá bán'),
          const ReportHeaderCell('Số lượng'),
          const ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(totalSL), align: ReportCellAlign.right, isBold: true),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 14) HAO HỤT (rpBaoCaoHaoHutNguyenVatLieuHangHoa)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildShrinkageReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.spaProducts.where().findAll();

    final flex = [6, 24, 12, 14, 14, 16];
    final rows = <ReportRow>[];

    for (final p in products) {
      if (p.stock <= 0) continue;
      final gtTon = p.stock.toDouble() * p.price;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category.label})'),
        ReportCell(formatQty(p.stock.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(p.price), align: ReportCellAlign.right),
        ReportCell(_money(p.price), align: ReportCellAlign.right),
        ReportCell(_money(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HAO HỤT DƯỢC LIỆU',
      titleSub: '(rpBaoCaoHaoHutNguyenVatLieuHangHoa)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Dược liệu'),
          const ReportHeaderCell('Tồn kho'),
          const ReportHeaderCell('Giá vốn'),
          const ReportHeaderCell('Giá bán'),
          const ReportHeaderCell('Giá trị tồn'),
        ],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 15) CHI TIÊU THEO MÃ (rpPaymentByPaymentID)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentByPaymentIdReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _isar.spaExpenses.where().findAll();
    final filtered = expenses
        .where((e) => e.amount > 0 && _inRange(e.spentAt, from, to))
        .toList()
      ..sort((a, b) => b.spentAt.compareTo(a.spentAt));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final e in filtered) {
      total += e.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(e.expenseId),
        ReportCell(_dateTime(e.spentAt)),
        ReportCell('${e.category.isNotEmpty ? e.category : "—"}: ${e.content.isNotEmpty ? e.content : "—"}'),
        ReportCell(_money(e.amount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'PHIẾU CHI THEO MÃ THANH TOÁN',
      titleSub: '(rpPaymentByPaymentID)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã CT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 16) THU TIỀN CHO THU NGÂN (rpPaymentForCashier)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentForCashierReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 22, 16, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final s in filtered) {
      total += s.totalAmount;
      final custName = s.customer.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(custName),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(s.paymentInfo),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
        ReportCell(_money(s.tipAmount), align: ReportCellAlign.right),
        ReportCell(_money(s.totalAmount + s.tipAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'PHIẾU THU TIỀN CHO THU NGÂN',
      titleSub: '(rpPaymentForCashier)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('PTTT'),
          const ReportHeaderCell('Dịch vụ'),
          const ReportHeaderCell('Tip'),
          const ReportHeaderCell('Tổng cộng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(_money(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 17) DOANH THU THEO KTV (rpBillForField)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildRevenueByTechnicianReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final techs = await _isar.spaTechnicians.where().findAll();
    final sessions = await _isar.spaSessions.where().findAll();

    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList();

    final flex = [6, 20, 14, 14, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalTip = 0;

    for (final t in techs) {
      double doanhThu = 0, tip = 0;
      int soBuoi = 0;
      for (final s in filtered) {
        if (s.technician.value?.techId == t.techId) {
          doanhThu += s.totalAmount;
          tip += s.tipAmount;
          soBuoi++;
        }
      }
      if (soBuoi == 0) continue;
      totalTip += tip;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${t.name} (${t.specialized})'),
        ReportCell(_money(doanhThu), align: ReportCellAlign.right),
        ReportCell('$soBuoi'),
        ReportCell(_money(doanhThu / soBuoi), align: ReportCellAlign.right),
        ReportCell(_money(tip), align: ReportCellAlign.right),
        ReportCell(_money(doanhThu + tip), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO DOANH THU THEO KTV',
      titleSub: '(rpBillForField)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('KTV'),
          const ReportHeaderCell('Doanh thu'),
          const ReportHeaderCell('Số buổi'),
          const ReportHeaderCell('TB/buổi'),
          const ReportHeaderCell('Tip'),
          const ReportHeaderCell('Tổng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(_money(totalTip), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 18) DOANH THU THEO DỊCH VỤ (rpBillForField_IsNotUsed)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildRevenueByServiceReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final services = await _isar.spaServiceModels.where().findAll();
    final sessions = await _isar.spaSessions.where().findAll();

    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList();

    final flex = [6, 22, 12, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final svc in services) {
      double sl = 0, gt = 0;
      for (final s in filtered) {
        if (s.service.value?.serviceId == svc.serviceId) {
          sl += 1;
          gt += s.totalAmount;
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${svc.name} (${svc.category.label})'),
        ReportCell(_money(svc.price), align: ReportCellAlign.right),
        ReportCell(formatQty(sl), align: ReportCellAlign.right),
        ReportCell(_money(gt), align: ReportCellAlign.right),
        ReportCell(_money(gt / sl), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO DOANH THU THEO DỊCH VỤ',
      titleSub: '(rpBillForField_IsNotUsed)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Dịch vụ'),
          const ReportHeaderCell('Đơn giá'),
          const ReportHeaderCell('Số buổi'),
          const ReportHeaderCell('Doanh thu'),
          const ReportHeaderCell('TB/buổi'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(totalSL), align: ReportCellAlign.right, isBold: true),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 19) CHI TIẾT MẶT HÀNG BÁN (rpBill_DiscountOnFoodOrDrink)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildDiscountOnItemReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final sessions = await _isar.spaSessions.where().findAll();
    final services = await _isar.spaServiceModels.where().findAll();
    final serviceMap = {for (final s in services) s.serviceId: s};

    final filtered = sessions
        .where((s) =>
            s.status == SpaSessionStatus.COMPLETED &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final s in filtered) {
      final svc = serviceMap[s.service.value?.serviceId ?? ''] ?? s.service.value;
      final custName = s.customer.value?.name ?? '—';
      totalSL += 1;
      totalGT += s.totalAmount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(custName),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(svc?.name ?? '—'),
        ReportCell('1'),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
        ReportCell(_money(s.totalAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'CHI TIẾT CÁC BUỔI DỊCH VỤ',
      titleSub: '(rpBill_DiscountOnFoodOrDrink)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Dịch vụ'),
          const ReportHeaderCell('SL'),
          const ReportHeaderCell('Thành tiền'),
          const ReportHeaderCell('Tổng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('$totalSL buổi', align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 20) PHIẾU CHI TIÊU (rpListInput + rp1111 chi tiết)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildExpenseListReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _isar.spaExpenses.where().findAll();
    final filtered = expenses
        .where((e) => _inRange(e.spentAt, from, to))
        .toList()
      ..sort((a, b) => b.spentAt.compareTo(a.spentAt));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalChi = 0, totalThu = 0;

    for (final e in filtered) {
      if (e.amount > 0) { totalChi += e.amount; }
      else { totalThu += e.amount.abs(); }
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(e.expenseId),
        ReportCell(_dateTime(e.spentAt)),
        ReportCell('${e.type.label}: ${e.content.isNotEmpty ? e.content : e.category}'),
        e.amount > 0
            ? ReportCell(_money(e.amount), align: ReportCellAlign.right)
            : const ReportCell(''),
        e.amount < 0
            ? ReportCell(_money(e.amount.abs()), align: ReportCellAlign.right)
            : const ReportCell(''),
        ReportCell(e.notes.isNotEmpty ? e.notes : '—'),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'DANH SÁCH PHIẾU THU CHI',
      titleSub: 'Tất cả phiếu thu/chi trong kỳ',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã CT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('Chi (VNĐ)'),
          const ReportHeaderCell('Thu (VNĐ)'),
          const ReportHeaderCell('Ghi chú'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(totalChi), align: ReportCellAlign.right, isBold: true),
          ReportCell(_money(totalThu), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }
}

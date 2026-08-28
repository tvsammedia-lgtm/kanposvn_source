import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../models/bida_finance.dart';
import '../models/bida_inventory_tx.dart';
import '../models/bida_item.dart';
import '../models/bida_partner.dart';
import '../models/bida_session.dart';
import 'bida_isar_service.dart';

/// Xây dựng báo cáo cho module Bida — mô phỏng tất cả 20 báo cáo Crystal
/// (.rpt) từ KANCAFE_VS2022_DEMO:
///
///  KEY REPORTS (special attention):
///  - rp1111 / rp1111_Detail:          Quỹ tiền mặt (tổng hợp + chi tiết)
///  - rpBaoCaoTongHopXuatNhapTonVatTu: Xuất nhập tồn kho
///  - rpSoTongHopThanhToanVoiNguoiBan: Công nợ nhà cung cấp (tổng hợp)
///  - rpSoChiTietThanhToanNguoiBan:    Công nợ nhà cung cấp (chi tiết)
///  - rpS10DN:                         Lãi lỗ
///
///  BILL / RECEIPT:
///  - rpBill / rpBillForTax / rpBillForField:  Hóa đơn
///  - rpBill_DiscountOnBill / rpBill_DiscountOnFoodOrDrink: Hóa đơn giảm giá
///  - rpReceipt:                              Biên lai
///
///  INVENTORY:
///  - rpInput / rpListInput:            Nhập kho
///  - rpOutputFromShift / rpOutputByStock: Xuất kho (theo ca / theo kho)
///  - rpBaoCaoHaoHutNguyenVatLieuHangHoa: Hao hụt
///
///  PAYMENT:
///  - rpPaymentByPaymentID / rpPaymentForCashier: Thanh toán NCC
class BidaReportService {
  final BidaIsarService _isar;

  BidaReportService(this._isar);

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
  // 1) QUỸ TIỀN MẶT — TỔNG HỢP (rp1111)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final financeTx = await db.bidaFinanceTxs.where().findAll();

    final thuTuBanHang = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .fold<double>(0, (s, ss) => s + ss.grandTotal);

    final thuKhac = financeTx
        .where((t) =>
            t.isIncome &&
            _inRange(t.createdAt, from, to))
        .fold<double>(0, (s, t) => s + t.amount);

    final chiTuFinance = financeTx
        .where((t) =>
            !t.isIncome &&
            _inRange(t.createdAt, from, to))
        .fold<double>(0, (s, t) => s + t.amount);

    final openingThuBanHang = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            s.endTime!.isBefore(from))
        .fold<double>(0, (s, ss) => s + ss.grandTotal);
    final openingThuKhac = financeTx
        .where((t) => t.isIncome && t.createdAt.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingChi = financeTx
        .where((t) => !t.isIncome && t.createdAt.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);

    final opening = openingThuBanHang + openingThuKhac - openingChi;
    final totalThu = thuTuBanHang + thuKhac;
    final totalChi = chiTuFinance;
    final closing = opening + totalThu - totalChi;

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
        const ReportCell('  Thu từ bán hàng (bàn + đồ)'),
        ReportCell(_money(thuTuBanHang), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('2.2'),
        const ReportCell('  Thu khác (phiếu thu)'),
        ReportCell(_money(thuKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Tổng chi trong kỳ', isBold: true),
        ReportCell(_money(totalChi), align: ReportCellAlign.right, isBold: true),
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
  // 2) QUỸ TIỀN MẶT — CHI TIẾT (rp1111_Detail)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCashFundDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final financeTx = await db.bidaFinanceTxs.where().findAll();

    final openingThuBanHang = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            s.endTime!.isBefore(from))
        .fold<double>(0, (s, ss) => s + ss.grandTotal);
    final openingThuKhac = financeTx
        .where((t) => t.isIncome && t.createdAt.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingChi = financeTx
        .where((t) => !t.isIncome && t.createdAt.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    var running = openingThuBanHang + openingThuKhac - openingChi;

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];

    final filteredSessions = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final filteredFinance = financeTx
        .where((t) => _inRange(t.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    int stt = 0;

    for (final s in filteredSessions) {
      stt++;
      running += s.grandTotal;
      final tableName = s.table.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTime(s.endTime)),
        ReportCell('Thu bàn ${s.customerName.isNotEmpty ? s.customerName : tableName}'),
        ReportCell(_money(s.grandTotal), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(_money(running), align: ReportCellAlign.right),
      ]));
    }

    for (final t in filteredFinance) {
      stt++;
      final desc = '${t.note.isNotEmpty ? t.note : t.financeId}'
          '${t.isIncome ? '' : ' — ${t.expenseCategory}'}';

      if (t.isIncome) {
        running += t.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(t.createdAt)),
          ReportCell('Phiếu thu: $desc'),
          ReportCell(_money(t.amount), align: ReportCellAlign.right),
          const ReportCell(''),
          ReportCell(_money(running), align: ReportCellAlign.right),
        ]));
      } else {
        running -= t.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(t.createdAt)),
          ReportCell('Phiếu chi: $desc'),
          const ReportCell(''),
          ReportCell(_money(t.amount), align: ReportCellAlign.right),
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
  // 3) XUẤT NHẬP TỒN KHO (rpBaoCaoTongHopXuatNhapTonVatTu)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildInventoryReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final items = await db.bidaItems.where().findAll();
    final inventoryTx = await db.bidaInventoryTxs.where().findAll();
    final sessions = await db.bidaSessions.where().findAll();

    final flex = [4, 22, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    for (final item in items) {
      double nhap = 0, xuat = 0;

      for (final tx in inventoryTx) {
        if (!_inRange(tx.createdAt, from, to)) continue;
        if (tx.itemId == item.itemId) {
          if (tx.type == BidaInventoryTxType.IMPORT) {
            nhap += tx.quantity;
          } else {
            xuat += tx.quantity.abs();
          }
        }
      }

      // Auto-export from session order lines
      for (final s in sessions) {
        if (s.status != BidaSessionStatus.PAID || s.endTime == null) continue;
        if (!_inRange(s.endTime!, from, to)) continue;
        for (final line in s.orderLines) {
          if (line.itemId == item.itemId) {
            xuat += line.quantity;
          }
        }
      }

      final ton = item.stock;
      final gtTon = (ton * item.costPrice).toDouble();
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${item.name} (${item.category.label})'),
        ReportCell(formatQty((ton + xuat - nhap).toDouble()), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(item.costPrice), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Giá vốn'),
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
  // 4) CÔNG NỢ KHÁCH HÀNG
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCustomerDebtReport() async {
    final db = await _isar.db;
    final customers = await db.bidaCustomers.where().findAll();
    final debtors = customers.where((c) => c.debtBalance > 0).toList()
      ..sort((a, b) => b.debtBalance.compareTo(a.debtBalance));

    final flex = [6, 26, 18, 16, 14, 20];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final c in debtors) {
      totalDebt += c.debtBalance;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${c.name} (${c.phone})'),
        ReportCell(_money(c.totalSpent), align: ReportCellAlign.right),
        ReportCell('${c.points} điểm'),
        ReportCell(c.isMember ? 'ĐC' : '—'),
        ReportCell(_money(c.debtBalance), align: ReportCellAlign.right, isBold: true),
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
          const ReportHeaderCell('Tổng chi'),
          const ReportHeaderCell('Điểm'),
          const ReportHeaderCell('Hội viên'),
          const ReportHeaderCell('Công nợ (VNĐ)'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG KH NỢ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell('${debtors.length} người', align: ReportCellAlign.right, isBold: true),
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
  // 5) CÔNG NỢ NCC — TỔNG HỢP (rpSoTongHopThanhToanVoiNguoiBan)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtSummaryReport() async {
    final db = await _isar.db;
    final suppliers = await db.bidaSuppliers.where().findAll();
    final debtors = suppliers.where((s) => s.debtBalance > 0).toList()
      ..sort((a, b) => b.debtBalance.compareTo(a.debtBalance));

    final flex = [6, 26, 22, 18, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in debtors) {
      totalDebt += s.debtBalance;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone})'),
        ReportCell(s.address),
        ReportCell(_money(s.totalImported), align: ReportCellAlign.right),
        ReportCell(_money(s.debtBalance), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'TỔNG HỢP CÔNG NỢ NHÀ CUNG CẤP',
      titleSub: '(rpSoTongHopThanhToanVoiNguoiBan)',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Nhà cung cấp'),
          const ReportHeaderCell('Địa chỉ'),
          const ReportHeaderCell('Đã nhập'),
          const ReportHeaderCell('Công nợ'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG NCC NỢ', isBold: true),
          const ReportCell(''),
          ReportCell('${debtors.length} NCC', align: ReportCellAlign.right, isBold: true),
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
    final db = await _isar.db;
    final suppliers = await db.bidaSuppliers.where().findAll();
    final inventoryTx = await db.bidaInventoryTxs.where().findAll();

    final flex = [6, 22, 14, 22, 16, 16];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in suppliers) {
      if (s.debtBalance <= 0) continue;
      totalDebt += s.debtBalance;

      final imports = inventoryTx
          .where((tx) =>
              tx.type == BidaInventoryTxType.IMPORT &&
              tx.supplierId == s.supplierId &&
              _inRange(tx.createdAt, from, to))
          .toList();

      double imported = imports.fold(0, (sum, tx) => sum + tx.unitPrice * tx.quantity);

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone})'),
        ReportCell(_date(s.updatedAt)),
        ReportCell(s.address),
        ReportCell(_money(imported), align: ReportCellAlign.right),
        ReportCell(_money(s.debtBalance), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'CHI TIẾT CÔNG NỢ NHÀ CUNG CẤP',
      titleSub: '(rpSoChiTietThanhToanNguoiBan)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Nhà cung cấp'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Địa chỉ'),
          const ReportHeaderCell('Nhập hàng'),
          const ReportHeaderCell('Còn nợ'),
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
  // 7) LÃI LỖ (rpS10DN)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildProfitLossReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final items = await db.bidaItems.where().findAll();
    final financeTx = await db.bidaFinanceTxs.where().findAll();

    double doanhThuBan = 0;
    double doanhThuDoUong = 0;
    double doanhThuDoAn = 0;
    double doanhThuBia = 0;
    double doanhThuThuocLa = 0;
    double doanhThuKhac = 0;
    double giaVonHang = 0;
    double chiPhiKhac = 0;

    for (final s in sessions) {
      if (s.status != BidaSessionStatus.PAID || s.endTime == null) continue;
      if (!_inRange(s.endTime!, from, to)) continue;
      doanhThuBan += s.totalTimeCost;
      for (final line in s.orderLines) {
        final itemMap = {for (final i in items) i.itemId: i};
        final item = itemMap[line.itemId];
        final cat = item?.category;
        switch (cat) {
          case BidaItemCategory.DRINK:
            doanhThuDoUong += line.total;
            break;
          case BidaItemCategory.BEER:
            doanhThuBia += line.total;
            break;
          case BidaItemCategory.FOOD:
            doanhThuDoAn += line.total;
            break;
          case BidaItemCategory.TOBACCO:
            doanhThuThuocLa += line.total;
            break;
          default:
            doanhThuKhac += line.total;
        }
        if (item != null) {
          giaVonHang += line.quantity * item.costPrice;
        }
      }
    }

    for (final t in financeTx) {
      if (!t.isIncome && _inRange(t.createdAt, from, to)) {
        chiPhiKhac += t.amount;
      }
    }

    final doanhThu = doanhThuBan + doanhThuDoUong + doanhThuBia + doanhThuDoAn + doanhThuThuocLa + doanhThuKhac;
    final loiNhuanGop = doanhThu - giaVonHang;
    final loiNhuanRong = loiNhuanGop - chiPhiKhac;

    final flex = [6, 34, 12, 24];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Doanh thu bán hàng', isBold: true),
        const ReportCell(''),
        ReportCell(_money(doanhThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('1.1'),
        const ReportCell('  Tiền bàn'),
        ReportCell(_money(doanhThuBan), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.2'),
        const ReportCell('  Nước uống'),
        ReportCell(_money(doanhThuDoUong), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.3'),
        const ReportCell('  Bia'),
        ReportCell(_money(doanhThuBia), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.4'),
        const ReportCell('  Đồ ăn'),
        ReportCell(_money(doanhThuDoAn), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.5'),
        const ReportCell('  Thuốc lá'),
        ReportCell(_money(doanhThuThuocLa), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.6'),
        const ReportCell('  Khác'),
        ReportCell(_money(doanhThuKhac), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Giá vốn hàng bán (COGS)'),
        const ReportCell(''),
        ReportCell(_money(giaVonHang), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Lợi nhuận gộp (1 − 2)', isBold: true),
        const ReportCell(''),
        ReportCell(_money(loiNhuanGop), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Chi phí khác'),
        const ReportCell(''),
        ReportCell(_money(chiPhiKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Lợi nhuận ròng (3 − 4)', isBold: true),
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
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 18, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final s in filtered) {
      total += s.grandTotal;
      final tableName = s.table.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(s.customerName.isNotEmpty ? s.customerName : s.sessionId),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(tableName),
        ReportCell(_money(s.totalTimeCost), align: ReportCellAlign.right),
        ReportCell(_money(s.totalItemCost), align: ReportCellAlign.right),
        ReportCell(_money(s.grandTotal), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HÓA ĐƠN BÁN HÀNG',
      titleSub: '(rpBill / rpBillForTax)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách / Mã'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Bàn'),
          const ReportHeaderCell('Tiền bàn'),
          const ReportHeaderCell('Tiền đồ'),
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
  // 9) HÓA ĐƠN GIẢM GIÁ TRÊN HÓA ĐƠN (rpBill_DiscountOnBill)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildDiscountOnBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to) &&
            s.discount > 0)
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 18, 16, 16, 16];
    final rows = <ReportRow>[];
    double totalDiscount = 0;

    for (final s in filtered) {
      totalDiscount += s.discount;
      final tableName = s.table.value?.name ?? '—';
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(s.customerName.isNotEmpty ? s.customerName : s.sessionId),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(tableName),
        ReportCell(_money(s.grandTotal + s.discount), align: ReportCellAlign.right),
        ReportCell(_money(s.grandTotal), align: ReportCellAlign.right),
        ReportCell(_money(s.discount), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'HÓA ĐƠN GIẢM GIÁ TRÊN HÓA ĐƠN',
      titleSub: '(rpBill_DiscountOnBill)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách / Mã'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Bàn'),
          const ReportHeaderCell('Trước giảm'),
          const ReportHeaderCell('Sau giảm'),
          const ReportHeaderCell('Giảm giá'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG GIẢM GIÁ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(_money(totalDiscount), align: ReportCellAlign.right, isBold: true),
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
    final db = await _isar.db;
    final financeTx = await db.bidaFinanceTxs.where().findAll();
    final filtered = financeTx
        .where((t) => t.isIncome && _inRange(t.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final t in filtered) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(t.financeId),
        ReportCell(_dateTime(t.createdAt)),
        ReportCell('${t.incomeCategory.isNotEmpty ? t.incomeCategory : '—'}: ${t.note.isNotEmpty ? t.note : '—'}'),
        ReportCell(_money(t.amount), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Số phiếu'),
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
    final db = await _isar.db;
    final inventoryTx = await db.bidaInventoryTxs.where().findAll();
    final filtered = inventoryTx
        .where((tx) =>
            tx.type == BidaInventoryTxType.IMPORT &&
            _inRange(tx.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final tx in filtered) {
      final lineTotal = tx.unitPrice * tx.quantity;
      total += lineTotal;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(tx.invoiceNo.isNotEmpty ? tx.invoiceNo : tx.itemId),
        ReportCell(_dateTime(tx.createdAt)),
        ReportCell('${tx.itemName}${tx.supplierName.isNotEmpty ? ' — ${tx.supplierName}' : ''}'),
        ReportCell(formatQty(tx.quantity.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(tx.unitPrice), align: ReportCellAlign.right),
        ReportCell(_money(lineTotal), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO NHẬP KHO',
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
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();

    final flex = [6, 14, 12, 22, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    final filtered = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    for (final s in filtered) {
      for (final line in s.orderLines) {
        totalSL += line.quantity;
        totalGT += line.total;
        rows.add(ReportRow([
          ReportCell('${rows.length + 1}'),
          ReportCell(_dateTime(s.endTime)),
          ReportCell(s.customerName.isNotEmpty ? s.customerName : s.sessionId),
          ReportCell(line.itemName),
          ReportCell(formatQty(line.quantity.toDouble()), align: ReportCellAlign.right),
          ReportCell(''),
          ReportCell(_money(line.price), align: ReportCellAlign.right),
          ReportCell(_money(line.total), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO PHIẾU BÁN HÀNG',
      titleSub: '(rpOutputFromShift)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Phiếu'),
          const ReportHeaderCell('Mặt hàng'),
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
          ReportCell(formatQty(totalSL.toDouble()), align: ReportCellAlign.right, isBold: true),
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
    final db = await _isar.db;
    final items = await db.bidaItems.where().findAll();
    final sessions = await db.bidaSessions.where().findAll();

    final flex = [4, 24, 12, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final item in items) {
      double sl = 0, gt = 0;
      for (final s in sessions) {
        if (s.status != BidaSessionStatus.PAID || s.endTime == null) continue;
        if (!_inRange(s.endTime!, from, to)) continue;
        for (final line in s.orderLines) {
          if (line.itemId == item.itemId) {
            sl += line.quantity;
            gt += line.total;
          }
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${item.name} (${item.category.label})'),
        ReportCell(_money(item.costPrice), align: ReportCellAlign.right),
        ReportCell(_money(item.price), align: ReportCellAlign.right),
        ReportCell(formatQty(sl), align: ReportCellAlign.right),
        ReportCell(_money(gt), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO TỪNG MẶT HÀNG',
      titleSub: '(rpOutputByStock)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mặt hàng'),
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
    final db = await _isar.db;
    final items = await db.bidaItems.where().findAll();

    final flex = [6, 24, 12, 14, 14, 16];
    final rows = <ReportRow>[];

    for (final item in items) {
      if (item.stock <= 0) continue;
      final gtTon = (item.stock * item.costPrice).toDouble();
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${item.name} (${item.category.label})'),
        ReportCell(formatQty(item.stock.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(item.costPrice), align: ReportCellAlign.right),
        ReportCell(_money(item.price), align: ReportCellAlign.right),
        ReportCell(_money(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HAO HỤT MẶT HÀNG',
      titleSub: '(rpBaoCaoHaoHutNguyenVatLieuHangHoa)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mặt hàng'),
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
  // 15) THANH TOÁN NCC — THEO MÃ (rpPaymentByPaymentID)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentByPaymentIdReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final financeTx = await db.bidaFinanceTxs.where().findAll();
    final filtered = financeTx
        .where((t) => !t.isIncome && _inRange(t.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final t in filtered) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(t.financeId),
        ReportCell(_dateTime(t.createdAt)),
        ReportCell('${t.expenseCategory.isNotEmpty ? t.expenseCategory : '—'}: ${t.note.isNotEmpty ? t.note : '—'}'),
        ReportCell(_money(t.amount), align: ReportCellAlign.right),
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
  // 16) THANH TOÁN CHO THU NGÂN (rpPaymentForCashier)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentForCashierReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final sessions = await db.bidaSessions.where().findAll();
    final filtered = sessions
        .where((s) =>
            s.status == BidaSessionStatus.PAID &&
            s.endTime != null &&
            _inRange(s.endTime!, from, to))
        .toList()
      ..sort((a, b) => b.endTime!.compareTo(a.endTime!));

    final flex = [6, 14, 12, 22, 16, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final s in filtered) {
      total += s.grandTotal;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(s.customerName.isNotEmpty ? s.customerName : s.sessionId),
        ReportCell(_dateTime(s.endTime)),
        ReportCell(s.table.value?.name ?? '—'),
        ReportCell(_money(s.grandTotal), align: ReportCellAlign.right),
        ReportCell(_money(s.deposit), align: ReportCellAlign.right),
        ReportCell(_money(s.grandTotal - s.deposit), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Khách / Mã'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Bàn'),
          const ReportHeaderCell('Tổng cộng'),
          const ReportHeaderCell('Đã cọc'),
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
}

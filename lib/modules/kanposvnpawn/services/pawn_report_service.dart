import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';
import '../models/customer.dart';
import '../models/invoice.dart';
import '../models/pawn_invoice_detail.dart';
import '../models/pawn_contract.dart';
import '../models/product.dart';
import '../models/supplier.dart';
import '../models/pawn_cash_transaction.dart';
import 'pawn_isar_service.dart';

/// Xây dựng báo cáo cho module Cầm Đồ — mô phỏng tất cả 20 báo cáo Crystal
/// (.rpt) từ KANCAFE_VS2022_DEMO.
class PawnReportService {
  final PawnIsarService _isar;

  PawnReportService(this._isar);

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
  static double _n(num? v) => (v ?? 0).toDouble();

  // ═════════════════════════════════════════════════════════════════════════════
  // 1) QUỸ TIỀN MẶT — TỔNG HỢP (rp1111)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final txs = await db.pawnCashTransactions.where().findAll();
    final invoices = await db.invoices.where().findAll();

    final thuFromTx = txs
        .where((t) => t.type == TransactionType.income && t.createdAt != null && _inRange(t.createdAt!, from, to))
        .fold<double>(0, (s, t) => s + _n(t.amount));
    final chiFromTx = txs
        .where((t) => t.type == TransactionType.expense && t.createdAt != null && _inRange(t.createdAt!, from, to))
        .fold<double>(0, (s, t) => s + _n(t.amount));

    final thuFromInvoice = invoices
        .where((i) => i.type == InvoiceType.sale && i.createdAt != null && _inRange(i.createdAt!, from, to))
        .fold<double>(0, (s, i) => s + _n(i.amountPaid));

    final openingThu = txs.where((t) => t.type == TransactionType.income && t.createdAt != null && t.createdAt!.isBefore(from)).fold<double>(0, (s, t) => s + _n(t.amount));
    final openingChi = txs.where((t) => t.type == TransactionType.expense && t.createdAt != null && t.createdAt!.isBefore(from)).fold<double>(0, (s, t) => s + _n(t.amount));
    final openingInv = invoices.where((i) => i.type == InvoiceType.sale && i.createdAt != null && i.createdAt!.isBefore(from)).fold<double>(0, (s, i) => s + _n(i.amountPaid));

    final opening = openingThu + openingInv - openingChi;
    final totalThu = thuFromTx + thuFromInvoice;
    final totalChi = chiFromTx;
    final closing = opening + totalThu - totalChi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('1'), const ReportCell('Số dư đầu kỳ', isBold: true), ReportCell(_money(opening), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('2'), const ReportCell('Tổng thu trong kỳ', isBold: true), ReportCell(_money(totalThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('2.1'), const ReportCell('  Thu từ bán hàng'), ReportCell(_money(thuFromInvoice), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('2.2'), const ReportCell('  Thu lãi cầm đồ + khác'), ReportCell(_money(thuFromTx), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('3'), const ReportCell('Tổng chi trong kỳ', isBold: true), ReportCell(_money(totalChi), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('4'), const ReportCell('Số dư cuối kỳ (1 + 2 − 3)', isBold: true), ReportCell(_money(closing), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO QUỸ TIỀN MẶT', titleSub: 'Tổng hợp thu chi (rp1111)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Số tiền (VNĐ)')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell(_money(closing), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final txs = await db.pawnCashTransactions.where().findAll();
    final invoices = await db.invoices.where().findAll();

    final openingThu = txs.where((t) => t.type == TransactionType.income && t.createdAt != null && t.createdAt!.isBefore(from)).fold<double>(0, (s, t) => s + _n(t.amount));
    final openingChi = txs.where((t) => t.type == TransactionType.expense && t.createdAt != null && t.createdAt!.isBefore(from)).fold<double>(0, (s, t) => s + _n(t.amount));
    final openingInv = invoices.where((i) => i.type == InvoiceType.sale && i.createdAt != null && i.createdAt!.isBefore(from)).fold<double>(0, (s, i) => s + _n(i.amountPaid));
    var running = openingThu + openingInv - openingChi;

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];

    final filteredTx = txs.where((t) => t.createdAt != null && _inRange(t.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    final filteredInv = invoices.where((i) => i.type == InvoiceType.sale && i.createdAt != null && _inRange(i.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    int stt = 0;
    for (final i in filteredInv) {
      stt++;
      final paid = _n(i.amountPaid);
      running += paid;
      final cust = i.customer.value;
      rows.add(ReportRow([ReportCell('$stt'), ReportCell(_dateTime(i.createdAt)), ReportCell('Thu bán hàng ${i.invoiceNumber ?? ''}${cust != null ? ' — ${cust.fullName ?? ''}' : ''}'), ReportCell(_money(paid), align: ReportCellAlign.right), const ReportCell(''), ReportCell(_money(running), align: ReportCellAlign.right)]));
    }
    for (final t in filteredTx) {
      stt++;
      final cust = t.customer.value;
      final desc = '${t.category ?? ''}: ${t.description ?? ''}${cust != null ? ' — KH: ${cust.fullName ?? ''}' : ''}';
      if (t.type == TransactionType.income) {
        running += _n(t.amount);
        rows.add(ReportRow([ReportCell('$stt'), ReportCell(_dateTime(t.createdAt)), ReportCell('Thu: $desc'), ReportCell(_money(_n(t.amount)), align: ReportCellAlign.right), const ReportCell(''), ReportCell(_money(running), align: ReportCellAlign.right)]));
      } else {
        running -= _n(t.amount);
        rows.add(ReportRow([ReportCell('$stt'), ReportCell(_dateTime(t.createdAt)), ReportCell('Chi: $desc'), const ReportCell(''), ReportCell(_money(_n(t.amount)), align: ReportCellAlign.right), ReportCell(_money(running), align: ReportCellAlign.right)]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03b-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'SỔ QUỸ TIỀN MẶT — CHI TIẾT', titleSub: '(rp1111_Detail)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Thu'), const ReportHeaderCell('Chi'), const ReportHeaderCell('Số dư')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell('SỐ DƯ CUỐI KỲ', isBold: true), const ReportCell(''), const ReportCell(''), ReportCell(_money(running), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final products = await db.products.where().findAll();
    final allDetails = await db.pawnInvoiceDetails.where().findAll();

    final flex = [4, 24, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    for (final p in products) {
      double nhap = 0, xuat = 0;
      for (final d in allDetails) {
        final inv = d.invoice.value;
        if (inv == null || inv.createdAt == null || !_inRange(inv.createdAt!, from, to)) continue;
        if (d.product.value?.name == p.name) {
          if (inv.type == InvoiceType.purchase) { nhap += (d.quantity ?? 0); }
          else if (inv.type == InvoiceType.sale) { xuat += (d.quantity ?? 0); }
        }
      }
      final ton = p.stock ?? 0;
      final gtTon = ton * _n(p.costPrice);
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name ?? "—"} (${p.category ?? ""})'),
        ReportCell(formatQty((ton + xuat - nhap).toDouble()), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(_n(p.costPrice)), align: ReportCellAlign.right),
        ReportCell(_money(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP XUẤT NHẬP TỒN VẬT TƯ', titleSub: '(rpBaoCaoTongHopXuatNhapTonVatTu)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Tên vật tư'), const ReportHeaderCell('Tồn đầu'), const ReportHeaderCell('Nhập'), const ReportHeaderCell('Xuất'), const ReportHeaderCell('Tồn cuối'), const ReportHeaderCell('Giá vốn'), const ReportHeaderCell('Giá trị tồn')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), const ReportCell(''), ReportCell(formatQty(totalNhap), align: ReportCellAlign.right, isBold: true), ReportCell(formatQty(totalXuat), align: ReportCellAlign.right, isBold: true), ReportCell(formatQty(totalTon.toDouble()), align: ReportCellAlign.right, isBold: true), const ReportCell(''), ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 4) CÔNG NỢ KHÁCH HÀNG
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCustomerDebtReport() async {
    final db = await _isar.db;
    final customers = await db.customers.where().findAll();
    final debtors = customers.where((c) => _n(c.debtAmount) > 0).toList()..sort((a, b) => _n(b.debtAmount).compareTo(_n(a.debtAmount)));

    final flex = [6, 26, 16, 14, 14, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final c in debtors) {
      final debt = _n(c.debtAmount);
      totalDebt += debt;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell('${c.fullName ?? "—"} (${c.phone ?? ""})'), ReportCell(_money(_n(c.totalPawn)), align: ReportCellAlign.right), ReportCell('${c.rewardPoints ?? 0}'), ReportCell(c.membershipTier ?? '—'), ReportCell(_money(debt), align: ReportCellAlign.right, isBold: true)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO CÔNG NỢ KHÁCH HÀNG', titleSub: 'Danh sách khách hàng còn nợ',
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Họ tên / SĐT'), const ReportHeaderCell('Tổng cầm'), const ReportHeaderCell('Điểm'), const ReportHeaderCell('Hạng'), const ReportHeaderCell('Công nợ')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG KH NỢ', isBold: true), const ReportCell(''), const ReportCell(''), ReportCell('${debtors.length} người', align: ReportCellAlign.right, isBold: true), ReportCell(_money(totalDebt), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 5) CÔNG NỢ NCC — TỔNG HỢP (rpSoTongHopThanhToanVoiNguoiBan)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtSummaryReport() async {
    final db = await _isar.db;
    final suppliers = await db.suppliers.where().findAll();
    final debtors = suppliers.where((s) => _n(s.currentDebt) > 0).toList()..sort((a, b) => _n(b.currentDebt).compareTo(_n(a.currentDebt)));

    final flex = [6, 26, 22, 18, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in debtors) {
      final debt = _n(s.currentDebt);
      totalDebt += debt;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell('${s.name ?? "—"} (${s.phone ?? ""})'), ReportCell(s.address ?? ''), ReportCell(_money(_n(s.totalPurchase)), align: ReportCellAlign.right), ReportCell(_money(debt), align: ReportCellAlign.right, isBold: true)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'TỔNG HỢP CÔNG NỢ NHÀ CUNG CẤP', titleSub: '(rpSoTongHopThanhToanVoiNguoiBan)',
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Nhà cung cấp'), const ReportHeaderCell('Địa chỉ'), const ReportHeaderCell('Đã nhập'), const ReportHeaderCell('Công nợ')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG NCC NỢ', isBold: true), const ReportCell(''), ReportCell('${debtors.length} NCC', align: ReportCellAlign.right, isBold: true), ReportCell(_money(totalDebt), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final suppliers = await db.suppliers.where().findAll();
    final invoices = await db.invoices.where().findAll();

    final flex = [6, 22, 14, 22, 16, 16];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in suppliers) {
      final debt = _n(s.currentDebt);
      if (debt <= 0) continue;
      totalDebt += debt;

      double imported = 0;
      for (final i in invoices) {
        if (i.type != InvoiceType.purchase || i.createdAt == null || !_inRange(i.createdAt!, from, to)) continue;
        imported += _n(i.totalAmount);
      }

      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell('${s.name ?? "—"} (${s.phone ?? ""})'), ReportCell(_date(s.createdAt)), ReportCell(s.address ?? ''), ReportCell(_money(imported), align: ReportCellAlign.right), ReportCell(_money(debt), align: ReportCellAlign.right, isBold: true)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'CHI TIẾT CÔNG NỢ NHÀ CUNG CẤP', titleSub: '(rpSoChiTietThanhToanNguoiBan)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Nhà cung cấp'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Địa chỉ'), const ReportHeaderCell('Nhập hàng'), const ReportHeaderCell('Còn nợ')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), const ReportCell(''), const ReportCell(''), const ReportCell(''), ReportCell(_money(totalDebt), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final invoices = await db.invoices.where().findAll();
    final contracts = await db.pawnContracts.where().findAll();
    final txs = await db.pawnCashTransactions.where().findAll();

    double doanhThuBanHang = 0, doanhThuLaiCamDo = 0, doanhThuSuaChua = 0;
    double giaVonBanHang = 0, chiPhiKhac = 0;

    for (final i in invoices) {
      if (i.createdAt == null || !_inRange(i.createdAt!, from, to)) continue;
      final amt = _n(i.totalAmount);
      switch (i.type) {
        case InvoiceType.sale: doanhThuBanHang += amt; break;
        case InvoiceType.repair: doanhThuSuaChua += amt; break;
        default: break;
      }
    }
    for (final c in contracts) {
      if (c.status != PawnStatus.active && c.status != PawnStatus.redeemed) continue;
      if (c.pawnDate != null && _inRange(c.pawnDate!, from, to)) {
        doanhThuLaiCamDo += _n(c.totalInterestCollected);
      }
    }
    for (final t in txs) {
      if (t.type == TransactionType.expense && t.createdAt != null && _inRange(t.createdAt!, from, to)) {
        chiPhiKhac += _n(t.amount);
      }
    }

    final doanhThu = doanhThuBanHang + doanhThuLaiCamDo + doanhThuSuaChua;
    final loiNhuanGop = doanhThu - giaVonBanHang;
    final loiNhuanRong = loiNhuanGop - chiPhiKhac;

    final flex = [6, 34, 12, 24];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('1'), const ReportCell('Doanh thu bán hàng', isBold: true), const ReportCell(''), ReportCell(_money(doanhThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('1.1'), const ReportCell('  Bán hàng'), ReportCell(_money(doanhThuBanHang), align: ReportCellAlign.right), const ReportCell('')]),
      ReportRow([const ReportCell('1.2'), const ReportCell('  Thu lãi cầm đồ'), ReportCell(_money(doanhThuLaiCamDo), align: ReportCellAlign.right), const ReportCell('')]),
      ReportRow([const ReportCell('1.3'), const ReportCell('  Sửa chữa'), ReportCell(_money(doanhThuSuaChua), align: ReportCellAlign.right), const ReportCell('')]),
      ReportRow([const ReportCell('2'), const ReportCell('Giá vốn hàng bán'), const ReportCell(''), ReportCell(_money(giaVonBanHang), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('3'), const ReportCell('Lợi nhuận gộp (1 − 2)', isBold: true), const ReportCell(''), ReportCell(_money(loiNhuanGop), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('4'), const ReportCell('Chi phí khác'), const ReportCell(''), ReportCell(_money(chiPhiKhac), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('5'), const ReportCell('Lợi nhuận ròng (3 − 4)', isBold: true), const ReportCell(''), ReportCell(_money(loiNhuanRong), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit', unitAddress: 'Địa chỉ: $_kAddress', taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO KẾT QUẢ HOẠT ĐỘNG KINH DOANH', titleSub: 'Lãi lỗ (rpS10DN)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Thành tiền'), const ReportHeaderCell('Tổng cộng')]],
      rows: rows,
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Giám đốc', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 8) HÓA ĐƠN BÁN HÀNG (rpBill / rpBillForTax)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSalesBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final invoices = await db.invoices.where().findAll();
    final filtered = invoices.where((i) => i.type == InvoiceType.sale && i.createdAt != null && _inRange(i.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 22, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;
    for (final i in filtered) {
      total += _n(i.totalAmount);
      final cust = i.customer.value;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(i.invoiceNumber ?? '—'), ReportCell(_dateTime(i.createdAt)), ReportCell(cust?.fullName ?? 'Khách lẻ'), ReportCell(i.paymentMethod.name), ReportCell(_money(_n(i.totalAmount)), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HÓA ĐƠN BÁN HÀNG', titleSub: '(rpBill / rpBillForTax)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Số HĐ'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Khách hàng'), const ReportHeaderCell('TT'), const ReportHeaderCell('Tổng tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell('${filtered.length} HĐ', align: ReportCellAlign.right, isBold: true), ReportCell(_money(total), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 9) HÓA ĐƠN GIẢM GIÁ (rpBill_DiscountOnBill)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildDiscountOnBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final invoices = await db.invoices.where().findAll();
    final filtered = invoices.where((i) => i.createdAt != null && _inRange(i.createdAt!, from, to) && _n(i.discount) > 0).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 22, 16, 16, 16];
    final rows = <ReportRow>[];
    double totalDiscount = 0;
    for (final i in filtered) {
      final disc = _n(i.discount);
      totalDiscount += disc;
      final cust = i.customer.value;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(i.invoiceNumber ?? '—'), ReportCell(_dateTime(i.createdAt)), ReportCell(cust?.fullName ?? '—'), ReportCell(_money(_n(i.subTotal)), align: ReportCellAlign.right), ReportCell(_money(_n(i.totalAmount)), align: ReportCellAlign.right), ReportCell(_money(disc), align: ReportCellAlign.right, isBold: true)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'HÓA ĐƠN GIẢM GIÁ TRÊN HÓA ĐƠN', titleSub: '(rpBill_DiscountOnBill)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Số HĐ'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Khách'), const ReportHeaderCell('Trước giảm'), const ReportHeaderCell('Sau giảm'), const ReportHeaderCell('Giảm giá')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG GIẢM GIÁ', isBold: true), const ReportCell(''), const ReportCell(''), ReportCell(_money(totalDiscount), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final txs = await db.pawnCashTransactions.where().findAll();
    final filtered = txs.where((t) => t.type == TransactionType.income && t.createdAt != null && _inRange(t.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += _n(t.amount);
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(t.documentCode ?? '—'), ReportCell(_dateTime(t.createdAt)), ReportCell('${t.category ?? "—"}: ${t.description ?? "—"}'), ReportCell(_money(_n(t.amount)), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'DANH SÁCH PHIẾU THU TIỀN', titleSub: '(rpReceipt)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Số phiếu'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Diễn giải'), const ReportHeaderCell('Số tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell(_money(total), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final invoices = await db.invoices.where().findAll();
    final filtered = invoices.where((i) => i.type == InvoiceType.purchase && i.createdAt != null && _inRange(i.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 24, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;
    for (final i in filtered) {
      final detailCount = await db.pawnInvoiceDetails.filter().invoice((q) => q.idEqualTo(i.id)).count();
      total += _n(i.totalAmount);
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(i.invoiceNumber ?? '—'), ReportCell(_dateTime(i.createdAt)), ReportCell('$detailCount mặt hàng'), ReportCell(_money(_n(i.totalAmount)), align: ReportCellAlign.right), ReportCell(_money(_n(i.totalAmount)), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO NHẬP KHO', titleSub: '(rpInput / rpListInput)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Số phiếu'), const ReportHeaderCell('Ngày nhập'), const ReportHeaderCell('Diễn giải'), const ReportHeaderCell('Tổng tiền'), const ReportHeaderCell('Thành tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell('${filtered.length} phiếu', align: ReportCellAlign.right, isBold: true), ReportCell(_money(total), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final allDetails = await db.pawnInvoiceDetails.where().findAll();
    final filteredDetails = <(Invoice, PawnInvoiceDetail)>[];
    for (final d in allDetails) {
      final inv = d.invoice.value;
      if (inv == null || inv.type != InvoiceType.sale || inv.createdAt == null || !_inRange(inv.createdAt!, from, to)) continue;
      filteredDetails.add((inv, d));
    }
    filteredDetails.sort((a, b) => b.$1.createdAt!.compareTo(a.$1.createdAt!));

    final flex = [6, 14, 12, 22, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;
    for (final entry in filteredDetails) {
      final i = entry.$1;
      final d = entry.$2;
      final qty = d.quantity ?? 0;
      final tot = _n(d.total);
      totalSL += qty;
      totalGT += tot;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(_dateTime(i.createdAt)), ReportCell(i.invoiceNumber ?? '—'), ReportCell(d.productName ?? '—'), ReportCell(formatQty(qty.toDouble()), align: ReportCellAlign.right), const ReportCell(''), ReportCell(_money(_n(d.unitPrice)), align: ReportCellAlign.right), ReportCell(_money(tot), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO PHIẾU BÁN HÀNG', titleSub: '(rpOutputFromShift)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Mã HĐ'), const ReportHeaderCell('Sản phẩm'), const ReportHeaderCell('SL'), const ReportHeaderCell('Giá vốn'), const ReportHeaderCell('Giá bán'), const ReportHeaderCell('Thành tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell(formatQty(totalSL.toDouble()), align: ReportCellAlign.right, isBold: true), const ReportCell(''), const ReportCell(''), ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 13) XUẤT KHO THEO SẢN PHẨM (rpOutputByStock)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByStockReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final products = await db.products.where().findAll();
    final allDetails = await db.pawnInvoiceDetails.where().findAll();

    final flex = [4, 24, 12, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;
    for (final p in products) {
      double sl = 0, gt = 0;
      for (final d in allDetails) {
        final inv = d.invoice.value;
        if (inv == null || inv.type != InvoiceType.sale || inv.createdAt == null || !_inRange(inv.createdAt!, from, to)) continue;
        if (d.product.value?.name == p.name) {
          sl += (d.quantity ?? 0);
          gt += _n(d.total);
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell('${p.name ?? "—"} (${p.category ?? ""})'), ReportCell(_money(_n(p.costPrice)), align: ReportCellAlign.right), ReportCell(_money(_n(p.sellingPrice)), align: ReportCellAlign.right), ReportCell(formatQty(sl), align: ReportCellAlign.right), ReportCell(_money(gt), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO TỪNG SẢN PHẨM', titleSub: '(rpOutputByStock)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Sản phẩm'), const ReportHeaderCell('Giá vốn'), const ReportHeaderCell('Giá bán'), const ReportHeaderCell('Số lượng'), const ReportHeaderCell('Thành tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), const ReportCell(''), const ReportCell(''), ReportCell(formatQty(totalSL), align: ReportCellAlign.right, isBold: true), ReportCell(_money(totalGT), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)')],
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
    final products = await db.products.where().findAll();

    final flex = [6, 24, 12, 14, 14, 16];
    final rows = <ReportRow>[];
    for (final p in products) {
      final stock = p.stock ?? 0;
      if (stock <= 0) continue;
      final gtTon = stock * _n(p.costPrice);
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell('${p.name ?? "—"} (${p.category ?? ""})'), ReportCell(formatQty(stock.toDouble()), align: ReportCellAlign.right), ReportCell(_money(_n(p.costPrice)), align: ReportCellAlign.right), ReportCell(_money(_n(p.sellingPrice)), align: ReportCellAlign.right), ReportCell(_money(gtTon), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HAO HỤT SẢN PHẨM', titleSub: '(rpBaoCaoHaoHutNguyenVatLieuHangHoa)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Sản phẩm'), const ReportHeaderCell('Tồn kho'), const ReportHeaderCell('Giá vốn'), const ReportHeaderCell('Giá bán'), const ReportHeaderCell('Giá trị tồn')]],
      rows: rows,
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
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
    final txs = await db.pawnCashTransactions.where().findAll();
    final filtered = txs.where((t) => t.type == TransactionType.expense && t.createdAt != null && _inRange(t.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;
    for (final t in filtered) {
      total += _n(t.amount);
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(t.documentCode ?? '—'), ReportCell(_dateTime(t.createdAt)), ReportCell('${t.category ?? "—"}: ${t.description ?? "—"}'), ReportCell(_money(_n(t.amount)), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'PHIẾU CHI THEO MÃ THANH TOÁN', titleSub: '(rpPaymentByPaymentID)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Mã CT'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Diễn giải'), const ReportHeaderCell('Số tiền')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), ReportCell(_money(total), align: ReportCellAlign.right, isBold: true)])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
    );
  }

  // ═════════════════════════════════════════════════════════════════════════════
  // 16) PHIẾU THU CHO THU NGÂN (rpPaymentForCashier)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentForCashierReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final invoices = await db.invoices.where().findAll();
    final filtered = invoices.where((i) => i.type == InvoiceType.sale && i.createdAt != null && _inRange(i.createdAt!, from, to)).toList()..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    final flex = [6, 16, 14, 22, 16, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;
    for (final i in filtered) {
      total += _n(i.totalAmount);
      rows.add(ReportRow([ReportCell('${rows.length + 1}'), ReportCell(i.invoiceNumber ?? '—'), ReportCell(_dateTime(i.createdAt)), ReportCell(i.customer.value?.fullName ?? 'Khách lẻ'), ReportCell(_money(_n(i.totalAmount)), align: ReportCellAlign.right), ReportCell(_money(_n(i.amountPaid)), align: ReportCellAlign.right), ReportCell(_money(_n(i.totalAmount) - _n(i.amountPaid)), align: ReportCellAlign.right)]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'PHIẾU THU TIỀN CHO THU NGÂN', titleSub: '(rpPaymentForCashier)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [[const ReportHeaderCell('STT'), const ReportHeaderCell('Số HĐ'), const ReportHeaderCell('Ngày'), const ReportHeaderCell('Khách hàng'), const ReportHeaderCell('Tổng tiền'), const ReportHeaderCell('Đã thu'), const ReportHeaderCell('Còn nợ')]],
      rows: rows,
      totalRows: [ReportRow([const ReportCell(''), const ReportCell(''), const ReportCell(''), const ReportCell('TỔNG CỘNG', isBold: true), const ReportCell(''), ReportCell(_money(total), align: ReportCellAlign.right, isBold: true), const ReportCell('')])],
      signature: [const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'), const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)')],
    );
  }
}

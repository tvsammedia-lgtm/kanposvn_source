import 'package:isar/isar.dart';

import '../../../core/reports/crystal_report_models.dart';
import '../models/accounting_entry.dart';
import '../models/inventory.dart';
import '../models/sale.dart';
import 'tramxang_isar_service.dart';

/// Bộ máy báo cáo mô phỏng Crystal Reports (.rpt) cho Trạm Xăng.
///
/// Sao từ KanPosVN VLXD (vlxd_report_service.dart) và ánh xạ sang dữ liệu
/// trạm xăng: sổ quỹ tiền mặt, phiếu thu/chi, chi tiết & tổng hợp bán hàng,
/// đối chiếu bồn, sổ N-X-T, báo cáo ca, lãi/lỗ, công nợ người mua/người bán.
///
/// Mọi báo cáo trả về [CrystalReportModel] dùng chung với widget
/// `CrystalReportView` trong `lib/core/reports/`.
class TramXangReportService {
  final TramXangIsarService _isarService;

  TramXangReportService(this._isarService);

  // ---------- Cấu hình đơn vị (header báo cáo) ----------
  static String _kUnit = kUnitDash;
  static String? _kAddress;
  static String? _kTax;

  static void configureCompany({String? name, String? address, String? taxCode}) {
    _kUnit = (name != null && name.trim().isNotEmpty) ? name : kUnitDash;
    _kAddress = (address != null && address.trim().isNotEmpty) ? address : null;
    _kTax = (taxCode != null && taxCode.trim().isNotEmpty) ? taxCode : null;
  }

  static void resetCompanyDefaults() {
    _kUnit = kUnitDash;
    _kAddress = null;
    _kTax = null;
  }

  static String get companyName => _kUnit;
  static String? get companyAddress => _kAddress;
  static String? get companyTaxCode => _kTax;

  // ---------- Form-line constants (TT133) ----------
  static const _formS03a =
      'Mẫu số S03a-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/8/2016 của Bộ Tài chính)';
  static const _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/8/2016 của Bộ Tài chính)';
  static const _formS10 =
      'Mẫu số S10-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/8/2016 của Bộ Tài chính)';
  static const _form01TT =
      'Mẫu số 01-TT (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/8/2016 của Bộ Tài chính)';
  static const _form02TT =
      'Mẫu số 02-TT (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/8/2016 của Bộ Tài chính)';
  static const _formKho =
      'Kèm theo Quyết định số 48/2006/QĐ-BTC ngày 14/9/2006 của Bộ Tài chính';

  static const _sig3 = [
    ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
    ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
    ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
  ];
  static const _sigCash = [
    ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
    ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
    ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
    ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
  ];

  // ---------- Helpers ----------
  static bool _inRange(DateTime d, DateTime from, DateTime to) {
    final t = d.toUtc().millisecondsSinceEpoch;
    return t >= from.toUtc().millisecondsSinceEpoch &&
        t <= to.toUtc().millisecondsSinceEpoch;
  }

  String _labelType(TramXangEntryType t) => switch (t) {
        TramXangEntryType.fuelPurchase => 'MUA XĂNG DẦU',
        TramXangEntryType.fuelSale => 'BÁN XĂNG DẦU',
        TramXangEntryType.fuelCost => 'GIÁ VỐN',
        TramXangEntryType.saleReceipt => 'THU TIỀN',
        TramXangEntryType.purchasePayment => 'CHI TIỀN',
        TramXangEntryType.customerReceipt => 'THU NỢ',
        TramXangEntryType.supplierPayment => 'TRẢ NỢ',
        TramXangEntryType.openingBalance => 'SỐ DƯ ĐK',
        TramXangEntryType.adjustment => 'ĐIỀU CHỈNH',
        TramXangEntryType.other => 'KHÁC',
      };

  // ---------- Data access ----------
  Future<List<TramXangSale>> _allSalesInRange(DateTime from, DateTime to) async {
    final isar = await _isarService.db;
    return (await isar.tramXangSales.where().findAll())
        .where((s) => s.status != 'CANCELLED' && _inRange(s.createdAt, from, to))
        .toList();
  }

  Future<List<TramXangSaleLine>> _linesOf(String saleId) async {
    final isar = await _isarService.db;
    return await isar.tramXangSaleLines.filter().saleIdEqualTo(saleId).findAll();
  }

  Future<List<TramXangInventoryTransaction>> _allInvTx() async {
    final isar = await _isarService.db;
    return await isar.tramXangInventoryTransactions.where().findAll();
  }

  Future<List<TramXangAccountingEntry>> _allEntries() async {
    final isar = await _isarService.db;
    return await isar.tramXangAccountingEntrys.where().sortByPostingDate().findAll();
  }

  Future<List<TramXangAccountingEntryLine>> _linesOfJournal(String journalID) async {
    final isar = await _isarService.db;
    return await isar.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(journalID)
        .findAll();
  }

  /// Lượng tiền mặt (1111) của 1 bút toán: trả về (thu, chi).
  Future<(double, double)> _cashAmount(TramXangAccountingEntry e) async {
    final lines = await _linesOfJournal(e.journalID);
    double thu = 0;
    double chi = 0;
    for (final l in lines) {
      if (l.debitAccountNumber == '1111') thu += l.amount;
      if (l.creditAccountNumber == '1111') chi += l.amount;
    }
    return (thu, chi);
  }

  Future<double> _cashBalanceBefore(DateTime from) async {
    final entries = await _allEntries();
    double bal = 0;
    for (final e in entries) {
      if (e.status == TramXangEntryStatus.reversed) continue;
      if (!_inRange(e.postingDate, from, DateTime(9999, 12, 31))) continue;
      final (thu, chi) = await _cashAmount(e);
      bal += thu - chi;
    }
    return bal;
  }

  // =========================================================================
  // 1. SỔ QUỸ TIỀN MẶT (rp1111_Detail)
  // =========================================================================
  Future<CrystalReportModel> buildCashBook({
    required DateTime from,
    required DateTime to,
  }) async {
    final entries = (await _allEntries())
        .where((e) => _inRange(e.postingDate, from, to) && e.status != TramXangEntryStatus.reversed)
        .toList();
    final opening = await _cashBalanceBefore(from);
    var running = opening;
    final rows = <ReportRow>[];
    rows.add(ReportRow([
      const ReportCell('Số dư đầu kỳ', isBold: true),
      const ReportCell(''),
      const ReportCell(''),
      ReportCell('', align: ReportCellAlign.right),
      ReportCell('', align: ReportCellAlign.right),
      ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true),
    ], isSection: true));

    double totalThu = 0;
    double totalChi = 0;
    for (final e in entries) {
      final (thu, chi) = await _cashAmount(e);
      if (thu == 0 && chi == 0) continue;
      totalThu += thu;
      totalChi += chi;
      running += thu - chi;
      rows.add(ReportRow([
        ReportCell(formatDate(e.postingDate), align: ReportCellAlign.center),
        ReportCell(e.voucherNumber, align: ReportCellAlign.center),
        ReportCell(e.description ?? ''),
        ReportCell(thu == 0 ? '' : formatMoney(thu), align: ReportCellAlign.right),
        ReportCell(chi == 0 ? '' : formatMoney(chi), align: ReportCellAlign.right),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'SỔ QUỸ TIỀN MẶT',
      titleSub: 'Dùng cho hình thức kế toán Nhật ký chung',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [12, 10, 32, 16, 16, 16],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải', colspan: 1),
          ReportHeaderCell('Số tiền', colspan: 3),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell(''),
          ReportHeaderCell('Thu'),
          ReportHeaderCell('Chi'),
          ReportHeaderCell('Tồn'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng phát sinh trong kỳ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalThu), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalChi), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
        ReportRow([
          const ReportCell('Số dư cuối kỳ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: _sigCash,
    );
  }

  // =========================================================================
  // 2. BÁO CÁO TỔNG HỢP QUỸ TIỀN MẶT (rp1111)
  // =========================================================================
  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final entries = (await _allEntries())
        .where((e) => e.status != TramXangEntryStatus.reversed)
        .toList();
    final opening = await _cashBalanceBefore(from);
    double thu = 0;
    double chi = 0;
    for (final e in entries) {
      if (!_inRange(e.postingDate, from, to)) continue;
      final (t, c) = await _cashAmount(e);
      thu += t;
      chi += c;
    }
    final closing = opening + thu - chi;

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO TỔNG HỢP QUỸ TIỀN MẶT',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [6, 42, 20],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Số tiền (VND)'),
        ],
      ],
      rows: [
        ReportRow([
          const ReportCell('1'),
          const ReportCell('Số dư đầu kỳ'),
          ReportCell(formatMoney(opening), align: ReportCellAlign.right),
        ]),
        ReportRow([
          const ReportCell('2'),
          const ReportCell('Tổng thu trong kỳ'),
          ReportCell(formatMoney(thu), align: ReportCellAlign.right),
        ]),
        ReportRow([
          const ReportCell('3'),
          const ReportCell('Tổng chi trong kỳ'),
          ReportCell(formatMoney(chi), align: ReportCellAlign.right),
        ]),
      ],
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('Số dư cuối kỳ (1 + 2 - 3)', isBold: true),
          ReportCell(formatMoney(closing), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
      ],
    );
  }

  // =========================================================================
  // 3. BÁO CÁO PHIẾU THU / PHIẾU CHI (rpReceipt / rpPayment)
  // =========================================================================
  Future<CrystalReportModel> buildReceiptPayment({
    required DateTime from,
    required DateTime to,
    required bool isReceipt,
  }) async {
    final all = (await _allEntries())
        .where((e) => _inRange(e.postingDate, from, to) && e.status != TramXangEntryStatus.reversed)
        .toList();
    final rows = <ReportRow>[];
    for (final e in all) {
      final (thu, chi) = await _cashAmount(e);
      final amount = isReceipt ? thu : chi;
      if (amount == 0) continue;
      if (isReceipt && e.entryType == TramXangEntryType.fuelPurchase) continue;
      if (!isReceipt && e.entryType == TramXangEntryType.fuelSale) continue;
      rows.add(ReportRow([
        ReportCell(formatDate(e.postingDate), align: ReportCellAlign.center),
        ReportCell(e.voucherNumber, align: ReportCellAlign.center),
        ReportCell(e.objectName ?? '', align: ReportCellAlign.center),
        ReportCell(e.description ?? ''),
        ReportCell(_labelType(e.entryType), align: ReportCellAlign.center),
        ReportCell(formatMoney(amount), align: ReportCellAlign.right),
      ]));
    }
    final total = rows.fold<double>(
        0,
        (sum, r) =>
            sum + (double.tryParse(r.cells[5].text.replaceAll('.', '')) ?? 0));

    return CrystalReportModel(
      formLine: isReceipt ? _form01TT : _form02TT,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: isReceipt ? 'BÁO CÁO PHIẾU THU' : 'BÁO CÁO PHIẾU CHI',
      titleSub: 'Quyển số: ... - Số: ...',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [12, 12, 18, 34, 16, 16],
      headerRows: [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số phiếu'),
          ReportHeaderCell(isReceipt ? 'Người nộp tiền' : 'Người nhận tiền'),
          const ReportHeaderCell('Lý do'),
          const ReportHeaderCell('Khoản mục'),
          const ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Tổng cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      noteLine: 'Số tiền bằng chữ: ${moneyToWords(total)}',
      signature: isReceipt
          ? const [
              ReportSignatureItem('Người lập phiếu', '(Ký, họ tên)'),
              ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
              ReportSignatureItem('Người nộp tiền', '(Ký, họ tên)'),
              ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
            ]
          : const [
              ReportSignatureItem('Người lập phiếu', '(Ký, họ tên)'),
              ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
              ReportSignatureItem('Người nhận tiền', '(Ký, họ tên)'),
              ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
            ],
    );
  }

  // =========================================================================
  // 4. BÁO CÁO CHI TIẾT BÁN HÀNG (rpBaocaochitietbanhang)
  // =========================================================================
  Future<CrystalReportModel> buildSalesDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSalesInRange(from, to);
    final rows = <ReportRow>[];
    double totalAmount = 0;
    for (final s in sales) {
      rows.add(ReportRow([
        ReportCell(formatDate(s.createdAt), align: ReportCellAlign.center),
        ReportCell(s.saleNo, align: ReportCellAlign.center),
        ReportCell(
            '${s.customerId.isEmpty ? 'Khách lẻ' : s.customerId}: ${s.paymentMethod}',
            isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(s.subtotal), align: ReportCellAlign.right, isBold: true),
      ], isSection: true));
      final lines = await _linesOf(s.saleId);
      for (final l in lines) {
        rows.add(ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          ReportCell((await _productName(l.productId))),
          ReportCell(formatQty(l.quantity), align: ReportCellAlign.center),
          ReportCell(formatMoney(l.unitPrice), align: ReportCellAlign.right),
          ReportCell(formatMoney(l.amount), align: ReportCellAlign.right),
        ]));
        totalAmount += l.amount;
      }
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO CHI TIẾT BÁN HÀNG',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [10, 10, 36, 14, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số HD'),
          ReportHeaderCell('Khách hàng / Mặt hàng'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('Đơn giá'),
          ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Tổng cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalAmount), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: _sig3,
    );
  }

  // =========================================================================
  // 5. BÁO CÁO TỔNG HỢP BÁN HÀNG (rpBaocaotonghopbanhang)
  // =========================================================================
  Future<CrystalReportModel> buildSalesSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSalesInRange(from, to);
    final agg = <String, _QtyAmt>{};
    double grandTotal = 0;
    for (final s in sales) {
      final lines = await _linesOf(s.saleId);
      for (final l in lines) {
        final entry = agg.putIfAbsent(l.productId, () => _QtyAmt('', 0, 0));
        entry.name = await _productName(l.productId);
        entry.qty += l.quantity;
        entry.amount += l.amount;
        grandTotal += l.amount;
      }
    }
    final sorted = agg.entries.toList()
      ..sort((a, b) => b.value.amount.compareTo(a.value.amount));

    final rows = <ReportRow>[
      for (var i = 0; i < sorted.length; i++)
        ReportRow([
          ReportCell('${i + 1}', align: ReportCellAlign.center),
          ReportCell(sorted[i].key, align: ReportCellAlign.center),
          ReportCell(sorted[i].value.name),
          ReportCell(await _unitOf(sorted[i].key), align: ReportCellAlign.center),
          ReportCell(formatQty(sorted[i].value.qty), align: ReportCellAlign.right),
          ReportCell(formatMoney(sorted[i].value.amount), align: ReportCellAlign.right),
        ]),
    ];

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO TỔNG HỢP BÁN HÀNG',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [8, 12, 36, 10, 16, 18],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Mã hàng'),
          ReportHeaderCell('Tên mặt hàng'),
          ReportHeaderCell('ĐVT'),
          ReportHeaderCell('Số lượng'),
          ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Tổng cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(grandTotal), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: _sig3,
    );
  }

  // =========================================================================
  // 6. ĐỐI CHIẾU BỒN CHỨA (rpBaoCaoHaoHut — bản trạm xăng)
  // =========================================================================
  Future<CrystalReportModel> buildTankStockSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final recon = await _isarService.getTankReconciliation();
    final rows = <ReportRow>[
      for (final r in recon)
        ReportRow([
          ReportCell(r.tank.code, align: ReportCellAlign.center),
          ReportCell(r.tank.name),
          ReportCell(formatQty(r.opening), align: ReportCellAlign.right),
          ReportCell(formatQty(r.imported), align: ReportCellAlign.right),
          ReportCell(formatQty(r.sold), align: ReportCellAlign.right),
          ReportCell(formatQty(r.theoretical), align: ReportCellAlign.right),
          ReportCell(formatQty(r.actual), align: ReportCellAlign.right),
          ReportCell(
            formatQty(r.diff),
            align: ReportCellAlign.right,
            isBold: r.diff.abs() > 10,
          ),
        ]),
    ];

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO ĐỐI CHIẾU BỒN CHỨA XĂNG DẦU',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
        'So sánh tồn lý thuyết (đầu + nhập - bán) với tồn đo thực tế',
      ],
      columnFlex: const [10, 26, 10, 10, 10, 10, 10, 14],
      headerRows: const [
        [
          ReportHeaderCell('Mã bồn'),
          ReportHeaderCell('Tên bồn'),
          ReportHeaderCell('Tồn đầu (L)'),
          ReportHeaderCell('Nhập (L)'),
          ReportHeaderCell('Bán (L)'),
          ReportHeaderCell('Tồn LT (L)'),
          ReportHeaderCell('Tồn TT (L)'),
          ReportHeaderCell('Chênh lệch (L)'),
        ],
      ],
      rows: rows,
      signature: _sig3,
    );
  }

  // =========================================================================
  // 7. SỔ CHI TIẾT NHẬP - XUẤT - TỒN (rpChiTietNXT)
  // =========================================================================
  Future<CrystalReportModel> buildStockLedger({
    required DateTime from,
    required DateTime to,
    required String productId,
  }) async {
    final product = await _isarService.getProductById(productId);
    final unit = product?.unit ?? '';
    final name = await _productName(productId);

    if (product == null) {
      return CrystalReportModel(
        formLine: _formS10,
        unitName: _kUnit,
        unitAddress: _kAddress,
        taxCode: _kTax,
        title: 'SỔ CHI TIẾT NHẬP - XUẤT - TỒN',
        subtitleLines: ['Không tìm thấy sản phẩm'],
        columnFlex: const [1],
        headerRows: const [[ReportHeaderCell('Nội dung')]],
        rows: const [ReportRow([ReportCell('Không có dữ liệu cho sản phẩm này')])],
        signature: _sig3,
      );
    }

    final txs = (await _allInvTx()).where((t) => t.productId == productId).toList();
    final before = txs.where((t) => !_inRange(t.createdAt, from, to) || t.documentType == 'OPENING').toList();
    var openingQty = 0.0;
    var openingValue = 0.0;
    for (final t in before) {
      openingQty += t.inQty - t.outQty;
      openingValue += t.inQty * t.unitCost - t.outQty * t.unitCost;
    }
    final inRange = txs.where((t) => _inRange(t.createdAt, from, to) && t.documentType != 'OPENING').toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final rows = <ReportRow>[];
    double qty = openingQty;
    double value = openingValue;
    rows.add(ReportRow([
      const ReportCell('Số dư đầu kỳ', isBold: true),
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell(''),
      ReportCell(formatQty(openingQty), align: ReportCellAlign.right, isBold: true),
      ReportCell(formatMoney(openingValue), align: ReportCellAlign.right, isBold: true),
    ], isSection: true));

    double inQty = 0, outQty = 0, inValue = 0, outValue = 0;
    for (final t in inRange) {
      inQty += t.inQty;
      outQty += t.outQty;
      inValue += t.inQty * t.unitCost;
      outValue += t.outQty * t.unitCost;
      qty += t.inQty - t.outQty;
      value += (t.inQty - t.outQty) * t.unitCost;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt), align: ReportCellAlign.center),
        ReportCell(t.documentType, align: ReportCellAlign.center),
        ReportCell(t.documentType == 'IMPORT' ? 'Nhập kho (mua)' : t.documentType == 'SALE' ? 'Xuất bán' : 'Điều chỉnh'),
        ReportCell(formatMoney(t.unitCost), align: ReportCellAlign.right),
        ReportCell(formatQty(t.inQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.inQty * t.unitCost), align: ReportCellAlign.right),
        ReportCell(formatQty(t.outQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.outQty * t.unitCost), align: ReportCellAlign.right),
        ReportCell(formatQty(qty), align: ReportCellAlign.right),
        ReportCell(formatMoney(value), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS10,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'SỔ CHI TIẾT NHẬP - XUẤT - TỒN',
      titleSub: 'Dùng cho các tài khoản 152, 153, 155, 156',
      subtitleLines: [
        'Tài khoản: 1561 - Giá mua hàng hóa (xăng dầu)',
        'Tên hàng hóa: $name',
        'Mã hàng: $productId',
        'Đơn vị tính: $unit',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [10, 8, 24, 10, 8, 10, 8, 10, 8, 10],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải', colspan: 1),
          ReportHeaderCell('Đơn giá', colspan: 1),
          ReportHeaderCell('Nhập', colspan: 2),
          ReportHeaderCell('Xuất', colspan: 2),
          ReportHeaderCell('Tồn', colspan: 2),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell(''),
          ReportHeaderCell(''),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng phát sinh', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(inQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(inValue), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(outQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(outValue), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          const ReportCell(''),
        ]),
        ReportRow([
          const ReportCell('Tồn cuối kỳ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(qty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(value), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
      ],
    );
  }

  // =========================================================================
  // 8. BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN (rpTongHopXuatNhapTon)
  // =========================================================================
  Future<CrystalReportModel> buildStockSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final txs = await _allInvTx();
    final products = await _isarService.getProducts();
    final rows = <ReportRow>[];
    for (final p in products) {
      final pt = txs.where((t) => t.productId == p.productId).toList();
      final opening = pt
          .where((t) => !_inRange(t.createdAt, from, to) || t.documentType == 'OPENING')
          .fold<double>(0, (s, t) => s + t.inQty - t.outQty);
      final inQty = pt
          .where((t) => _inRange(t.createdAt, from, to) && t.documentType != 'OPENING')
          .fold<double>(0, (s, t) => s + t.inQty);
      final outQty = pt
          .where((t) => _inRange(t.createdAt, from, to) && t.documentType != 'OPENING')
          .fold<double>(0, (s, t) => s + t.outQty);
      final closing = opening + inQty - outQty;
      if (opening == 0 && inQty == 0 && outQty == 0) continue;
      rows.add(ReportRow([
        ReportCell(p.sku.isNotEmpty ? p.sku : p.productId, align: ReportCellAlign.center),
        ReportCell(p.name),
        ReportCell(p.unit, align: ReportCellAlign.center),
        ReportCell(formatQty(opening), align: ReportCellAlign.right),
        ReportCell(formatQty(inQty), align: ReportCellAlign.right),
        ReportCell(formatQty(outQty), align: ReportCellAlign.right),
        ReportCell(formatQty(closing), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formKho,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [14, 34, 10, 11, 11, 11, 11],
      headerRows: const [
        [
          ReportHeaderCell('Mã hàng'),
          ReportHeaderCell('Tên mặt hàng'),
          ReportHeaderCell('ĐVT'),
          ReportHeaderCell('Tồn đầu kỳ'),
          ReportHeaderCell('Nhập trong kỳ'),
          ReportHeaderCell('Xuất trong kỳ'),
          ReportHeaderCell('Tồn cuối kỳ'),
        ],
      ],
      rows: rows,
      signature: _sig3,
    );
  }

  // =========================================================================
  // 9. BÁO CÁO CA BÁN HÀNG (rpOutputFromShift)
  // =========================================================================
  Future<CrystalReportModel> buildShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _isarService.getShifts();
    final shifts = all.where((s) => _inRange(s.openedAt, from, to)).toList();
    final rows = <ReportRow>[];
    double totalCount = 0, totalCash = 0, totalNonCash = 0, totalDebt = 0, totalAll = 0;

    for (var i = 0; i < shifts.length; i++) {
      final s = shifts[i];
      final t = await _isarService.getShiftTotals(s.shiftId);
      totalCount += t.count;
      totalCash += t.cash;
      totalNonCash += t.nonCash;
      totalDebt += t.debt;
      totalAll += t.total;
      final diff = s.status == 'OPEN'
          ? null
          : s.actualCash - (s.expectedCash);
      rows.add(ReportRow([
        ReportCell('${i + 1}', align: ReportCellAlign.center),
        ReportCell(
          '${formatDateTime(s.openedAt)}'
          '${s.closedAt != null ? ' → ${formatDateTime(s.closedAt!)}' : ' (đang mở)'}',
        ),
        ReportCell('${t.count}', align: ReportCellAlign.right),
        ReportCell(formatMoney(t.cash), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.nonCash), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.debt), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.total), align: ReportCellAlign.right),
        ReportCell(diff == null ? '' : formatMoney(diff), align: ReportCellAlign.right,
            isBold: s.status == 'SHORT' || s.status == 'OVER'),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO CA BÁN HÀNG',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [6, 34, 10, 12, 12, 12, 12, 12],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Ca (mở → đóng)'),
          ReportHeaderCell('Số HD'),
          ReportHeaderCell('Tiền mặt'),
          ReportHeaderCell('CK/QR'),
          ReportHeaderCell('Bán chịu'),
          ReportHeaderCell('Tổng'),
          ReportHeaderCell('Chênh lệch'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Tổng cộng', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(totalCount), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalCash), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalNonCash), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalAll), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ]),
      ],
      signature: const [
        ReportSignatureItem('Nhân viên ca', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
      ],
    );
  }

  // =========================================================================
  // 10. BÁO CÁO LÃI LỖ (rpS10DN)
  // =========================================================================
  Future<CrystalReportModel> buildProfitLoss({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSalesInRange(from, to);
    double revenue = 0;
    double vat = 0;
    double cost = 0;
    for (final s in sales) {
      revenue += s.subtotal - s.discount;
      vat += s.tax;
      final lines = await _linesOf(s.saleId);
      for (final l in lines) {
        cost += l.costAmount;
      }
    }
    final gross = revenue - cost;
    final preTax = gross;
    final net = preTax;

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'BÁO CÁO LÃI LỖ',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [42, 20],
      headerRows: const [
        [
          ReportHeaderCell('Chỉ tiêu'),
          ReportHeaderCell('Số tiền (VND)'),
        ],
      ],
      rows: [
        ReportRow([ReportCell('1. DOANH THU & GIÁ VỐN', isBold: true), const ReportCell('')], isSection: true),
        ReportRow([ReportCell('  - Doanh thu bán hàng hóa (5111)'), ReportCell(formatMoney(revenue), align: ReportCellAlign.right)]),
        ReportRow([ReportCell('  - Thuế GTGT đầu ra (3331)'), ReportCell(formatMoney(vat), align: ReportCellAlign.right)]),
        ReportRow([ReportCell('  - Giá vốn hàng bán (632)'), ReportCell(formatMoney(cost), align: ReportCellAlign.right)]),
        ReportRow([
          ReportCell('  - LỢI NHUẬN GỘP', isBold: true),
          ReportCell(formatMoney(gross), align: ReportCellAlign.right, isBold: true),
        ]),
        ReportRow([ReportCell('2. CHI PHÍ HOẠT ĐỘNG', isBold: true), const ReportCell('')], isSection: true),
        ReportRow([ReportCell('  - Chi phí quản lý doanh nghiệp (642)'), ReportCell('0', align: ReportCellAlign.right)]),
        ReportRow([
          ReportCell('3. KẾT QUẢ KINH DOANH', isBold: true),
          ReportCell(formatMoney(preTax), align: ReportCellAlign.right, isBold: true),
        ]),
        ReportRow([
          ReportCell('  - LỢI NHUẬN SAU THUẾ (ước)', isBold: true),
          ReportCell(formatMoney(net), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: _sig3,
    );
  }

  // =========================================================================
  // 11. SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI MUA (131) (rpSoTongHopThanhToanVoiNguoiMua)
  // =========================================================================
  Future<CrystalReportModel> buildCustomerDebt({
    required DateTime from,
    required DateTime to,
  }) async {
    final customers = await _isarService.getCustomers();
    final sales = (await _isarService.getSales())
        .where((s) => s.status != 'CANCELLED')
        .toList();
    final rows = <ReportRow>[];
    for (final c in customers) {
      final csales = sales.where((s) => s.customerId == c.customerId).toList();
      final before = csales.where((s) => !_inRange(s.createdAt, from, to)).toList();
      final inRange = csales.where((s) => _inRange(s.createdAt, from, to)).toList();

      double opening = c.openingBalance;
      for (final s in before) {
        opening += s.paymentMethod == 'DEBT' ? s.total : -s.paid;
      }
      double psNo = 0;
      double psCo = 0;
      for (final s in inRange) {
        if (s.paymentMethod == 'DEBT') {
          psNo += s.total;
        } else {
          psCo += s.paid;
        }
      }
      final closing = opening + psNo - psCo;
      if (opening == 0 && psNo == 0 && psCo == 0) continue;
      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(c.code.isEmpty ? c.customerId : c.code, align: ReportCellAlign.center),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right),
        ReportCell(formatMoney(psNo), align: ReportCellAlign.right),
        ReportCell(formatMoney(psCo), align: ReportCellAlign.right),
        ReportCell(formatMoney(closing), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI MUA',
      subtitleLines: [
        'Tài khoản: 131 - Phải thu của khách hàng',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [28, 12, 15, 15, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('Khách hàng'),
          ReportHeaderCell('Mã KH'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('PS Nợ (mua trong kỳ)'),
          ReportHeaderCell('PS Có (đã thanh toán)'),
          ReportHeaderCell('Còn nợ cuối kỳ'),
        ],
      ],
      rows: rows,
      signature: _sig3,
    );
  }

  // =========================================================================
  // 12. SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI BÁN (331) (rpSoTongHopThanhToanVoiNguoiBan)
  // =========================================================================
  Future<CrystalReportModel> buildSupplierDebt({
    required DateTime from,
    required DateTime to,
  }) async {
    final suppliers = await _isarService.getSuppliers();
    final purchases = await _isarService.getPurchases();
    final rows = <ReportRow>[];
    for (final s in suppliers) {
      final ps = purchases.where((p) => p.supplierId == s.supplierId).toList();
      final before = ps.where((p) => !_inRange(p.invoiceDate, from, to)).toList();
      final inRange = ps.where((p) => _inRange(p.invoiceDate, from, to)).toList();
      final opening = s.openingBalance + before.fold<double>(0, (sum, p) => sum + p.total);
      final psNo = inRange.fold<double>(0, (sum, p) => sum + p.total);
      final closing = opening + psNo;
      if (opening == 0 && psNo == 0) continue;
      rows.add(ReportRow([
        ReportCell(s.name),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right),
        ReportCell(formatMoney(psNo), align: ReportCellAlign.right),
        ReportCell('0', align: ReportCellAlign.right),
        ReportCell(formatMoney(closing), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI BÁN',
      subtitleLines: [
        'Tài khoản: 331 - Phải trả người bán',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [30, 18, 18, 18, 18],
      headerRows: const [
        [
          ReportHeaderCell('Nhà cung cấp'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('PS Nợ (mua trong kỳ)'),
          ReportHeaderCell('PS Có (đã trả)'),
          ReportHeaderCell('Còn nợ cuối kỳ'),
        ],
      ],
      rows: rows,
      signature: _sig3,
    );
  }

  // =========================================================================
  // 13/14. SỔ CHI TIẾT THANH TOÁN NGƯỜI MUA / NGƯỜI BÁN
  // =========================================================================
  Future<CrystalReportModel> buildPaymentDetail({
    required DateTime from,
    required DateTime to,
    required bool forCustomer,
    required String partnerId,
  }) async {
    final accountNumber = forCustomer ? '131' : '331';
    final isar = await _isarService.db;
    final partnerName = forCustomer
        ? (await isar.tramXangCustomers.getByCustomerId(partnerId))?.name
        : (await isar.tramXangSuppliers.getBySupplierId(partnerId))?.name;

    if (partnerName == null) {
      return _emptyPaymentDetail(from, to);
    }

    final entries = (await _allEntries())
        .where((e) => e.status != TramXangEntryStatus.reversed)
        .toList();
    final rows = <ReportRow>[];
    var running = 0.0;
    double totalNo = 0;
    double totalCo = 0;
    for (final e in entries) {
      if (!_inRange(e.postingDate, from, to)) continue;
      final lines = await _linesOfJournal(e.journalID);
      double no = 0;
      double co = 0;
      for (final l in lines) {
        if (l.objectCode != partnerId && (l.objectName ?? '') != partnerName) continue;
        if (l.debitAccountNumber == accountNumber) no += l.amount;
        if (l.creditAccountNumber == accountNumber) co += l.amount;
      }
      if (no == 0 && co == 0) continue;
      totalNo += no;
      totalCo += co;
      running += no - co;
      rows.add(ReportRow([
        ReportCell(formatDate(e.postingDate), align: ReportCellAlign.center),
        ReportCell(e.voucherNumber, align: ReportCellAlign.center),
        ReportCell(e.description ?? ''),
        ReportCell(no == 0 ? '' : formatMoney(no), align: ReportCellAlign.right),
        ReportCell(co == 0 ? '' : formatMoney(co), align: ReportCellAlign.right),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: forCustomer
          ? 'SỔ CHI TIẾT THANH TOÁN VỚI NGƯỜI MUA'
          : 'SỔ CHI TIẾT THANH TOÁN VỚI NGƯỜI BÁN',
      subtitleLines: [
        'Tài khoản: $accountNumber',
        partnerName,
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [12, 10, 40, 19, 19, 14],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải', colspan: 1),
          ReportHeaderCell('Số tiền', colspan: 2),
          ReportHeaderCell('Tồn', colspan: 1),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell(''),
          ReportHeaderCell('PS Nợ'),
          ReportHeaderCell('PS Có'),
          ReportHeaderCell(''),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng phát sinh', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalNo), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalCo), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên, đóng dấu)'),
      ],
    );
  }

  CrystalReportModel _emptyPaymentDetail(DateTime from, DateTime to) {
    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _kUnit,
      unitAddress: _kAddress,
      taxCode: _kTax,
      title: 'SỔ CHI TIẾT THANH TOÁN',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [1],
      headerRows: const [[ReportHeaderCell('Nội dung')]],
      rows: const [ReportRow([ReportCell('Không tìm thấy đối tượng')])],
      signature: _sig3,
    );
  }

  Future<String> _productName(String productId) async {
    final p = await _isarService.getProductById(productId);
    return p?.name ?? productId;
  }

  Future<String> _unitOf(String productId) async {
    final p = await _isarService.getProductById(productId);
    return p?.unit ?? '';
  }
}

class _QtyAmt {
  String name;
  double qty;
  double amount;
  _QtyAmt(this.name, this.qty, this.amount);
}
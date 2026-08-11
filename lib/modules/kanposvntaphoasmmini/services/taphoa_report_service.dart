import '../models/finance.dart';
import '../models/inventory.dart';
import '../models/invoice.dart';
import '../models/partner.dart';
import '../models/product.dart';
import '../models/taphoa_report_models.dart';
import 'taphoa_isar_service.dart';

/// Xây dựng các báo cáo (mô phỏng báo cáo Crystal .rpt của KANVLXD_ONE)
/// từ dữ liệu Isar của KANPOSVN TẠP HÓA.
///
/// Kiểu trình bày khớp với bộ .rpt gốc trong KANVLXD_ONE (TDPOS.Reports.*):
/// rpBaocaochitietbanhang (Chi tiết bán hàng), rpBaocaotonghopbanhang
/// (Tổng hợp bán hàng), rpBaoCaoHaoHut (Hao hụt hàng hóa), rpChiTietNXT
/// (Chi tiết nhập xuất tồn), rpTongHopXuatNhapTon (Tổng hợp NXT),
/// rpSoChiTietThanhToanNguoiMua / NguoiBan, rpSoTongHopThanhToanVoiNguoiMua /
/// VoiNguoiBan, rpReceipt (Phiếu thu), rpPayment (Phiếu chi),
/// rpOutputFromShift (Thu - chi theo ca).
/// Báo cáo "Sổ quỹ tiền mặt" lấy kiểu trình bày từ KANHOT rp1111_Detail
/// (KANVLXD không có báo cáo này) và được chuyển sang dữ liệu thu chi tạp hóa.
class TapHoaReportService {
  final TapHoaIsarService _isarService;

  TapHoaReportService(this._isarService);

  static const String _formS03a =
      'Mẫu số S03a-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS10 =
      'Mẫu số S10-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _form01TT =
      'Mẫu số 01-TT (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _form02TT =
      'Mẫu số 02-TT (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formKho =
      'Kèm theo Quyết định số 48/2006/QĐ-BTC ngày 14/09/2006 của Bộ trưởng Bộ Tài chính';

  String get _unitName => 'Đơn vị: $_kUnit';

  static String _kUnit = kUnitDash;
  static String _kAddress = kUnitDash;
  static String _kTax = kUnitDash;

  /// Ghi nhận thông tin công ty để in trên đầu mọi báo cáo.
  static void configureCompany({String? name, String? address, String? taxCode}) {
    if (name != null && name.trim().isNotEmpty) _kUnit = name.trim();
    if (address != null && address.trim().isNotEmpty) _kAddress = address.trim();
    if (taxCode != null && taxCode.trim().isNotEmpty) _kTax = taxCode.trim();
  }

  static void resetCompanyDefaults() {
    _kUnit = kUnitDash;
    _kAddress = kUnitDash;
    _kTax = kUnitDash;
  }

  static bool _inRange(DateTime d, DateTime from, DateTime to) =>
      !d.isBefore(from) && !d.isAfter(to);

  static String _shortId(String id) {
    if (id.length <= 8) return id;
    return id.substring(0, 8);
  }

  static bool _isCancelled(TapHoaInvoice o) => o.status == 'cancelled';

  // ---------------------------------------------------------------------------
  // Dữ liệu thô
  // ---------------------------------------------------------------------------

  Future<List<TapHoaCashTransaction>> _allCash() async {
    return await _isarService.getCashTransactions();
  }

  Future<List<TapHoaInvoice>> _allInvoices() async {
    return await _isarService.getInvoices();
  }

  Future<List<TapHoaProduct>> _allProducts() async {
    return await _isarService.getProducts();
  }

  Future<List<TapHoaInventoryItem>> _allInventoryItems() async {
    return await _isarService.getInventoryItems();
  }

  Future<List<TapHoaInventoryTransaction>> _allStockDetails() async {
    return await _isarService.getInventoryTransactions();
  }

  Future<List<TapHoaCustomer>> _allCustomers() async {
    return await _isarService.getCustomers();
  }

  Future<List<TapHoaSupplier>> _allSuppliers() async {
    return await _isarService.getSuppliers();
  }

  // ---------------------------------------------------------------------------
  // 1) SỔ QUỸ TIỀN MẶT (kiểu KANHOT rp1111_Detail, dữ liệu thu chi tạp hóa)
  // ---------------------------------------------------------------------------

  double _openingCash(List<TapHoaCashTransaction> all, DateTime from) {
    double s = 0;
    for (final t in all) {
      if (t.timestamp.isBefore(from)) {
        s += t.type == 'INCOME' ? t.amount : -t.amount;
      }
    }
    return s;
  }

  Future<CrystalReportModel> buildCashBook({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allCash();
    final inRange = all.where((t) => _inRange(t.timestamp, from, to)).toList();
    final opening = _openingCash(all, from);

    final rows = <ReportRow>[
      ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
    ];

    double running = opening;
    double totalIn = 0, totalOut = 0;
    for (final t in inRange) {
      final isIn = t.type == 'INCOME';
      running += isIn ? t.amount : -t.amount;
      if (isIn) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
      final desc = t.title.isNotEmpty ? t.title : t.category;
      rows.add(ReportRow([
        ReportCell(formatDate(t.timestamp), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(desc),
        ReportCell(isIn ? formatMoney(t.amount) : '', align: ReportCellAlign.right),
        ReportCell(isIn ? '' : formatMoney(t.amount), align: ReportCellAlign.right),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    final totalRows = <ReportRow>[
      ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Cộng phát sinh trong kỳ', isBold: true),
        ReportCell(formatMoney(totalIn), align: ReportCellAlign.right, isBold: true),
        ReportCell(formatMoney(totalOut), align: ReportCellAlign.right, isBold: true),
        ReportCell('', align: ReportCellAlign.right),
      ], isSection: true),
      ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Số dư cuối kỳ', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
    ];

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ QUỸ TIỀN MẶT',
      titleSub: 'Dùng cho hình thức kế toán Nhật ký chung',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [12, 10, 32, 16, 16, 16],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Số tiền', colspan: 3),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Thu'),
          ReportHeaderCell('Chi'),
          ReportHeaderCell('Tồn'),
        ],
      ],
      rows: rows,
      totalRows: totalRows,
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2) BÁO CÁO PHIẾU THU / PHIẾU CHI (rpReceipt / rpPayment)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildReceiptPayment({
    required DateTime from,
    required DateTime to,
    required bool isReceipt,
  }) async {
    final all = await _allCash();
    final type = isReceipt ? 'INCOME' : 'EXPENSE';
    final inRange = all
        .where((t) => t.type == type && _inRange(t.timestamp, from, to))
        .toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in inRange) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell(formatDate(t.timestamp), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.performerName.isNotEmpty ? t.performerName : kBlankDash),
        ReportCell(t.title.isNotEmpty ? t.title : t.category),
        ReportCell(t.category, align: ReportCellAlign.center),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: isReceipt ? _form01TT : _form02TT,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: isReceipt ? 'BÁO CÁO PHIẾU THU' : 'BÁO CÁO PHIẾU CHI',
      titleSub: isReceipt ? 'Quyển số: ...  -  Số: ...' : 'Quyển số: ...  -  Số: ...',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [12, 10, 20, 34, 14, 15],
      headerRows: [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số phiếu'),
          ReportHeaderCell(isReceipt ? 'Người nộp tiền' : 'Người nhận tiền'),
          ReportHeaderCell('Lý do'),
          ReportHeaderCell('Khoản mục'),
          ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có phiếu nào trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
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

  // ---------------------------------------------------------------------------
  // 3) BÁO CÁO CHI TIẾT BÁN HÀNG (rpBaocaochitietbanhang)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildSalesDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final invoices = await _allInvoices();

    final inRange = invoices
        .where((o) => !_isCancelled(o) && _inRange(o.createdAt, from, to))
        .toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final rows = <ReportRow>[];
    double totalMoney = 0;
    for (final o in inRange) {
      rows.add(ReportRow([
        ReportCell(formatDate(o.createdAt), align: ReportCellAlign.center),
        ReportCell(o.invoiceNumber, align: ReportCellAlign.center),
        ReportCell(o.customerName.isEmpty ? kBlankDash : o.customerName),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
      ], isSection: true));
      final ods = o.items.toList();
      for (final d in ods) {
        totalMoney += d.total;
        rows.add(ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(d.productName),
          ReportCell(formatQty(d.quantity), align: ReportCellAlign.right),
          ReportCell(formatMoney(d.price), align: ReportCellAlign.right),
          ReportCell(formatMoney(d.total), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO CHI TIẾT BÁN HÀNG',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [10, 10, 36, 14, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số HĐ'),
          ReportHeaderCell('Khách hàng / Mặt hàng'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('Đơn giá'),
          ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có hoá đơn trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalMoney), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 4) BÁO CÁO TỔNG HỢP BÁN HÀNG (rpBaocaotonghopbanhang)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildSalesSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final invoices = await _allInvoices();
    final products = await _allProducts();
    final productById = <String, TapHoaProduct>{for (final p in products) p.productId: p};

    final invoiceIds = invoices
        .where((o) => !_isCancelled(o) && _inRange(o.createdAt, from, to))
        .map((o) => o.invoiceId)
        .toSet();

    final agg = <String, Map<String, dynamic>>{};
    for (final o in invoices) {
      if (!invoiceIds.contains(o.invoiceId)) continue;
      for (final d in o.items.toList()) {
        final key = d.productId.isEmpty ? 'none' : d.productId;
        final e = agg.putIfAbsent(key, () {
          final p = productById[d.productId];
          return {
            'code': d.productCode,
            'name': d.productName,
            'unit': p?.unit ?? '',
            'qty': 0.0,
            'total': 0.0,
          };
        });
        e['qty'] = (e['qty'] as double) + d.quantity;
        e['total'] = (e['total'] as double) + d.total;
      }
    }

    final sorted = agg.values.toList()
      ..sort((a, b) => (b['total'] as double).compareTo(a['total'] as double));

    final rows = <ReportRow>[];
    double totalQty = 0, totalMoney = 0;
    var stt = 0;
    for (final e in sorted) {
      stt++;
      final qty = e['qty'] as double;
      final total = e['total'] as double;
      totalQty += qty;
      totalMoney += total;
      rows.add(ReportRow([
        ReportCell('$stt', align: ReportCellAlign.center),
        ReportCell('${e['code']}', align: ReportCellAlign.center),
        ReportCell(e['name'] as String),
        ReportCell('${e['unit']}', align: ReportCellAlign.center),
        ReportCell(formatQty(qty), align: ReportCellAlign.right),
        ReportCell(formatMoney(total), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP BÁN HÀNG',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
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
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có sản phẩm bán ra trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(totalQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalMoney), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 5) BÁO CÁO HAO HỤT HÀNG HÓA (rpBaoCaoHaoHut)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildLossReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _allProducts();
    final stockDetails = await _allStockDetails();
    final invoices = await _allInvoices();

    final invoiceIds = invoices
        .where((o) => !_isCancelled(o) && _inRange(o.createdAt, from, to))
        .map((o) => o.invoiceId)
        .toSet();

    final rows = <ReportRow>[];
    double tOutput = 0, tInput = 0, tLoss = 0;
    for (final p in products) {
      final pid = p.productId;
      double input = 0, output = 0;
      for (final d in stockDetails) {
        if (d.inventoryItemId.isEmpty || d.productName.isEmpty) continue;
        if (!_inRange(d.timestamp, from, to)) continue;
        if (d.type == 'IMPORT') {
          if (_belongsToProduct(d, p)) input += d.quantityChange.abs();
        } else if (d.type == 'EXPORT') {
          if (_belongsToProduct(d, p)) output += d.quantityChange.abs();
        }
      }
      for (final o in invoices) {
        if (!invoiceIds.contains(o.invoiceId)) continue;
        for (final d in o.items.toList()) {
          if (d.productId == pid) {
            output += d.quantity;
          }
        }
      }
      final loss = input - output;
      tOutput += output;
      tInput += input;
      tLoss += loss;
      if (input == 0 && output == 0) continue;
      rows.add(ReportRow([
        ReportCell(p.productCode, align: ReportCellAlign.center),
        ReportCell(p.productName),
        ReportCell(p.unit.isEmpty ? 'Cái' : p.unit, align: ReportCellAlign.center),
        ReportCell(formatQty(input), align: ReportCellAlign.right),
        ReportCell(formatQty(output), align: ReportCellAlign.right),
        ReportCell(formatQty(loss), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO HAO HỤT HÀNG HÓA',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [14, 38, 10, 14, 14, 14],
      headerRows: const [
        [
          ReportHeaderCell('Mã hàng'),
          ReportHeaderCell('Tên mặt hàng'),
          ReportHeaderCell('ĐVT'),
          ReportHeaderCell('Nhập (SL)'),
          ReportHeaderCell('Xuất (SL)'),
          ReportHeaderCell('Hao hụt (SL)'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có phát sinh hao hụt trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(tInput), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tOutput), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tLoss), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Thủ kho', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  bool _belongsToProduct(TapHoaInventoryTransaction d, TapHoaProduct p) {
    if (d.inventoryItemId.isNotEmpty) {
      return d.productName == p.productName || d.inventoryItemId.contains(p.productId);
    }
    return d.productName == p.productName;
  }

  // ---------------------------------------------------------------------------
  // 6) CHI TIẾT NHẬP - XUẤT - TỒN (rpChiTietNXT)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockLedger({
    required DateTime from,
    required DateTime to,
    required String productId,
  }) async {
    final products = await _allProducts();
    final p = products.where((e) => e.productId == productId).firstOrNull;
    if (p == null) {
      return _emptyStockLedger(from, to, 'Chưa chọn mặt hàng');
    }

    final inventoryItems = await _allInventoryItems();
    final invItem = inventoryItems
        .where((e) => e.productId == productId)
        .firstOrNull;
    final unitPrice =
        invItem != null && invItem.costPrice > 0 ? invItem.costPrice : p.purchasePrice;

    final all = await _allStockDetails();
    final inRange = all
        .where((d) =>
            _belongsToProduct(d, p) && _inRange(d.timestamp, from, to))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    double openQty = 0, openValue = 0;
    for (final d in all) {
      if (!_belongsToProduct(d, p)) continue;
      if (d.timestamp.isBefore(from)) {
        final isImport = d.type == 'IMPORT';
        final value = unitPrice * d.quantityChange.abs();
        openQty += isImport ? d.quantityChange : -d.quantityChange.abs();
        openValue += isImport ? value : -value;
      }
    }

    final rows = <ReportRow>[
      ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatQty(openQty), align: ReportCellAlign.right, isBold: true),
        ReportCell(formatMoney(openValue), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
    ];

    double runningQty = openQty, runningValue = openValue;
    double inQty = 0, inValue = 0, outQty = 0, outValue = 0;
    for (final d in inRange) {
      final isImport = d.type == 'IMPORT';
      final qty = d.quantityChange.abs();
      final value = unitPrice * qty;
      if (isImport) {
        inQty += qty;
        inValue += value;
      } else {
        outQty += qty;
        outValue += value;
      }
      runningQty += isImport ? qty : -qty;
      runningValue += isImport ? value : -value;
      rows.add(ReportRow([
        ReportCell(formatDate(d.timestamp), align: ReportCellAlign.center),
        ReportCell(d.referenceId.isNotEmpty ? _shortId(d.referenceId) : _shortId('${d.id}'), align: ReportCellAlign.center),
        ReportCell(d.note.isNotEmpty ? d.note : (isImport ? 'Nhập kho' : 'Xuất kho')),
        ReportCell(formatMoney(unitPrice), align: ReportCellAlign.right),
        ReportCell(isImport ? formatQty(qty) : '', align: ReportCellAlign.right),
        ReportCell(isImport ? formatMoney(value) : '', align: ReportCellAlign.right),
        ReportCell(isImport ? '' : formatQty(qty), align: ReportCellAlign.right),
        ReportCell(isImport ? '' : formatMoney(value), align: ReportCellAlign.right),
        ReportCell(formatQty(runningQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(runningValue), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS10,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CHI TIẾT NHẬP - XUẤT - TỒN',
      titleSub: 'Dùng cho các tài khoản 152, 153, 155, 156',
      subtitleLines: [
        'Tài khoản: 156 - Hàng hóa',
        'Tên mặt hàng: ${p.productName}',
        'Mã hàng: ${p.productCode}',
        'Đơn vị tính: ${p.unit.isEmpty ? 'Cái' : p.unit}',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [10, 8, 24, 10, 8, 10, 8, 10, 8, 10],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Đơn giá'),
          ReportHeaderCell('Nhập trong kỳ', colspan: 2),
          ReportHeaderCell('Xuất trong kỳ', colspan: 2),
          ReportHeaderCell('Tồn', colspan: 2),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Đơn giá'),
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
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('Cộng số phát sinh', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(inQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(inValue), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(outQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(outValue), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          const ReportCell(''),
        ], isSection: true),
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('Số dư cuối kỳ', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(runningQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(runningValue), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  CrystalReportModel _emptyStockLedger(DateTime from, DateTime to, String msg) {
    return CrystalReportModel(
      formLine: _formS10,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CHI TIẾT NHẬP - XUẤT - TỒN',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [100],
      headerRows: const [
        [
          ReportHeaderCell('Nội dung'),
        ],
      ],
      rows: [ReportRow([ReportCell(msg)])],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 7) BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN (rpTongHopXuatNhapTon)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _allProducts();
    final all = await _allStockDetails();

    final rows = <ReportRow>[];
    double tOpenQty = 0, tInQty = 0, tOutQty = 0, tCloseQty = 0;

    for (final p in products) {
      double openQty = 0, inQty = 0, outQty = 0;
      for (final d in all) {
        if (!_belongsToProduct(d, p)) continue;
        final isImport = d.type == 'IMPORT';
        final qty = d.quantityChange.abs();
        if (d.timestamp.isBefore(from)) {
          openQty += isImport ? qty : -qty;
        } else if (_inRange(d.timestamp, from, to)) {
          if (isImport) {
            inQty += qty;
          } else {
            outQty += qty;
          }
        }
      }
      final closeQty = openQty + inQty - outQty;
      tOpenQty += openQty;
      tInQty += inQty;
      tOutQty += outQty;
      tCloseQty += closeQty;
      if (openQty == 0 && inQty == 0 && outQty == 0) continue;

      rows.add(ReportRow([
        ReportCell(p.productCode, align: ReportCellAlign.center),
        ReportCell(p.productName),
        ReportCell(p.unit.isEmpty ? 'Cái' : p.unit, align: ReportCellAlign.center),
        ReportCell(formatQty(openQty), align: ReportCellAlign.right),
        ReportCell(formatQty(inQty), align: ReportCellAlign.right),
        ReportCell(formatQty(outQty), align: ReportCellAlign.right),
        ReportCell(formatQty(closeQty), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formKho,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
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
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có mặt hàng phát sinh trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatQty(tOpenQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tInQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tOutQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tCloseQty), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 8) SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI MUA (rpSoTongHopThanhToanVoiNguoiMua)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCustomerDebt({
    required DateTime from,
    required DateTime to,
  }) async {
    final customers = await _allCustomers();
    final finance = await _allCash();
    final invoices = await _allInvoices();

    final rows = <ReportRow>[];
    double tOpen = 0, tIncur = 0, tPaid = 0, tClose = 0;

    for (final c in customers) {
      double incurred = 0, paid = 0, preIncur = 0, prePaid = 0;
      for (final o in invoices) {
        if (o.customerId != c.customerId) continue;
        if (_isCancelled(o) || o.paymentMethod != 'debt') continue;
        if (o.createdAt.isBefore(from)) {
          preIncur += o.finalAmount;
        } else if (_inRange(o.createdAt, from, to)) {
          incurred += o.finalAmount;
        }
      }
      for (final t in finance) {
        if (t.type != 'INCOME' || t.category != 'Thu công nợ') continue;
        if (!_isPartnerMatch(t, c.name)) continue;
        if (t.timestamp.isBefore(from)) {
          prePaid += t.amount;
        } else if (_inRange(t.timestamp, from, to)) {
          paid += t.amount;
        }
      }
      final open = preIncur - prePaid;
      final close = open + incurred - paid;
      tOpen += open;
      tIncur += incurred;
      tPaid += paid;
      tClose += close;

      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(c.memberTier, align: ReportCellAlign.center),
        ReportCell(formatMoney(open), align: ReportCellAlign.right),
        ReportCell(formatMoney(incurred), align: ReportCellAlign.right),
        ReportCell(formatMoney(paid), align: ReportCellAlign.right),
        ReportCell(formatMoney(close), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI MUA',
      subtitleLines: [
        'Tài khoản: 131 - Phải thu của khách hàng',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [28, 12, 15, 15, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('Khách hàng'),
          ReportHeaderCell('Hạng'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('Phát sinh nợ\n(Mua trong kỳ)'),
          ReportHeaderCell('Phát sinh có\n(Đã thanh toán)'),
          ReportHeaderCell('Còn nợ cuối kỳ'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có khách hàng nào')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          ReportCell(formatMoney(tOpen), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tIncur), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tPaid), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tClose), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  bool _isPartnerMatch(TapHoaCashTransaction t, String name) {
    if (name.isEmpty) return false;
    if (t.note.trim() == name.trim()) return true;
    return t.title.contains(name);
  }

  // ---------------------------------------------------------------------------
  // 9) SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI BÁN (rpSoTongHopThanhToanVoiNguoiBan)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildSupplierDebt({
    required DateTime from,
    required DateTime to,
  }) async {
    final suppliers = await _allSuppliers();
    final finance = await _allCash();

    final rows = <ReportRow>[];
    double tOpen = 0, tIncur = 0, tPaid = 0, tClose = 0;

    for (final s in suppliers) {
      double incurred = 0, paid = 0, preIncur = 0, prePaid = 0;

      for (final t in finance) {
        if (t.type != 'EXPENSE') continue;
        if (t.category == 'Trả nhà cung cấp' && _isPartnerMatch(t, s.name)) {
          if (t.timestamp.isBefore(from)) {
            prePaid += t.amount;
          } else if (_inRange(t.timestamp, from, to)) {
            paid += t.amount;
          }
        } else if (t.category == 'Nhập hàng' && _isPartnerMatch(t, s.name)) {
          if (t.timestamp.isBefore(from)) {
            preIncur += t.amount;
          } else if (_inRange(t.timestamp, from, to)) {
            incurred += t.amount;
          }
        }
      }
      final open = preIncur - prePaid;
      final close = open + incurred - paid;
      tOpen += open;
      tIncur += incurred;
      tPaid += paid;
      tClose += close;

      rows.add(ReportRow([
        ReportCell(s.name),
        ReportCell(formatMoney(open), align: ReportCellAlign.right),
        ReportCell(formatMoney(incurred), align: ReportCellAlign.right),
        ReportCell(formatMoney(paid), align: ReportCellAlign.right),
        ReportCell(formatMoney(close), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI BÁN',
      subtitleLines: [
        'Tài khoản: 331 - Phải trả cho người bán',
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [30, 18, 18, 18, 18],
      headerRows: const [
        [
          ReportHeaderCell('Nhà cung cấp'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('Phát sinh nợ\n(Mua trong kỳ)'),
          ReportHeaderCell('Phát sinh có\n(Đã thanh toán)'),
          ReportHeaderCell('Còn nợ cuối kỳ'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có nhà cung cấp nào')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          ReportCell(formatMoney(tOpen), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tIncur), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tPaid), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tClose), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 10) SỔ CHI TIẾT THANH TOÁN NGƯỜI MUA / NGƯỜI BÁN
  //     (rpSoChiTietThanhToanNguoiMua / NguoiBan)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildPaymentDetail({
    required DateTime from,
    required DateTime to,
    required bool forCustomer,
    required String partnerId,
  }) async {
    final isCustomer = forCustomer;
    final rows = <ReportRow>[];

    String title, tk, unitLine;
    double open = 0;

    final finance = await _allCash();
    final invoices = await _allInvoices();

    late final String partnerName;
    if (isCustomer) {
      final customers = await _allCustomers();
      final c = customers.where((e) => e.customerId == partnerId).firstOrNull;
      if (c == null) return _emptyPaymentDetail(from, to, 'Chưa chọn khách hàng');
      title = 'SỔ CHI TIẾT THANH TOÁN VỚI NGƯỜI MUA';
      tk = 'Tài khoản: 131 - Phải thu của khách hàng';
      unitLine = 'Khách hàng: ${c.name} (${c.phone.isEmpty ? '' : c.phone})';
      partnerName = c.name;
      // Nợ đầu kỳ = tổng hóa đơn công nợ trước kỳ - đã thu công nợ trước kỳ
      double preIncur = 0, prePaid = 0;
      for (final o in invoices) {
        if (o.customerId != c.customerId) continue;
        if (_isCancelled(o) || o.paymentMethod != 'debt') continue;
        if (o.createdAt.isBefore(from)) preIncur += o.finalAmount;
      }
      for (final t in finance) {
        if (t.type != 'INCOME' || t.category != 'Thu công nợ') continue;
        if (!_isPartnerMatch(t, c.name)) continue;
        if (t.timestamp.isBefore(from)) prePaid += t.amount;
      }
      open = preIncur - prePaid;
    } else {
      final suppliers = await _allSuppliers();
      final s = suppliers.where((e) => e.supplierId == partnerId).firstOrNull;
      if (s == null) return _emptyPaymentDetail(from, to, 'Chưa chọn nhà cung cấp');
      title = 'SỔ CHI TIẾT THANH TOÁN VỚI NGƯỜI BÁN';
      tk = 'Tài khoản: 331 - Phải trả cho người bán';
      unitLine = 'Nhà cung cấp: ${s.name} (${s.phone.isEmpty ? '' : s.phone})';
      partnerName = s.name;
      double preIncur = 0, prePaid = 0;
      for (final t in finance) {
        if (t.type != 'EXPENSE') continue;
        if (t.category == 'Trả nhà cung cấp' && _isPartnerMatch(t, s.name)) {
          if (t.timestamp.isBefore(from)) prePaid += t.amount;
        } else if (t.category == 'Nhập hàng' && _isPartnerMatch(t, s.name)) {
          if (t.timestamp.isBefore(from)) preIncur += t.amount;
        }
      }
      open = preIncur - prePaid;
    }

    rows.add(ReportRow([
      const ReportCell(''),
      const ReportCell(''),
      const ReportCell('Số dư đầu kỳ', isBold: true),
      const ReportCell(''),
      ReportCell(formatMoney(open), align: ReportCellAlign.right, isBold: true),
    ], isSection: true));

    double running = open;
    double totalIn = 0, totalOut = 0;
    for (final t in finance) {
      final matches = isCustomer
          ? t.type == 'INCOME' &&
              t.category == 'Thu công nợ' &&
              _isPartnerMatch(t, partnerName)
          : t.type == 'EXPENSE' &&
              t.category == 'Trả nhà cung cấp' &&
              _isPartnerMatch(t, partnerName);
      if (!matches) continue;
      if (!_inRange(t.timestamp, from, to)) continue;
      final isIn = isCustomer;
      running += isIn ? -t.amount : -t.amount;
      if (isIn) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
      rows.add(ReportRow([
        ReportCell(formatDate(t.timestamp), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.title.isNotEmpty ? t.title : t.category),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: title,
      subtitleLines: [
        tk,
        unitLine,
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: const [12, 10, 40, 19, 19],
      headerRows: [
        const [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Số tiền', colspan: 2),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell(isCustomer ? 'Thu' : 'Chi'),
          ReportHeaderCell('Tồn'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('Cộng phát sinh trong kỳ', isBold: true),
          ReportCell(formatMoney(isCustomer ? totalIn : totalOut), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ], isSection: true),
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('Số dư cuối kỳ', isBold: true),
          const ReportCell(''),
          ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  CrystalReportModel _emptyPaymentDetail(DateTime from, DateTime to, String msg) {
    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CHI TIẾT THANH TOÁN',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [100],
      headerRows: const [
        [
          ReportHeaderCell('Nội dung'),
        ],
      ],
      rows: [ReportRow([ReportCell(msg)])],
      signature: const [
        ReportSignatureItem('Người ghi sổ', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 11) BÁO CÁO THU - CHI TIỀN MẶT THEO CA (rpOutputFromShift)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final finance = await _allCash();
    final inRange = finance
        .where((t) => _inRange(t.timestamp, from, to))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    final days = <String, Map<String, double>>{};
    for (final t in inRange) {
      final key = formatDate(t.timestamp);
      final e = days.putIfAbsent(key, () => {'in': 0.0, 'out': 0.0});
      if (t.type == 'INCOME') {
        e['in'] = e['in']! + t.amount;
      } else {
        e['out'] = e['out']! + t.amount;
      }
    }

    final rows = <ReportRow>[];
    double totalIn = 0, totalOut = 0, totalEnd = 0;
    var stt = 0;
    for (final entry in days.entries) {
      stt++;
      final i = entry.value['in']!;
      final o = entry.value['out']!;
      totalIn += i;
      totalOut += o;
      totalEnd += i - o;
      rows.add(ReportRow([
        ReportCell('$stt', align: ReportCellAlign.center),
        ReportCell(entry.key, align: ReportCellAlign.center),
        ReportCell(formatMoney(i), align: ReportCellAlign.right),
        ReportCell(formatMoney(o), align: ReportCellAlign.right),
        ReportCell(formatMoney(i - o), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO THU - CHI TIỀN MẶT THEO CA',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [8, 30, 21, 21, 20],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Thu trong ca'),
          ReportHeaderCell('Chi trong ca'),
          ReportHeaderCell('Tồn trong ca'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có phát sinh trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          ReportCell(formatMoney(totalIn), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalOut), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalEnd), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Nhân viên ca', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  /// Tổng tiền mặt thực tế hiện có (cho màn hình tổng quan).
  Future<double> currentCashBalance() async {
    final all = await _allCash();
    double s = 0;
    for (final t in all) {
      s += t.type == 'INCOME' ? t.amount : -t.amount;
    }
    return s;
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    for (final e in this) {
      return e;
    }
    return null;
  }
}

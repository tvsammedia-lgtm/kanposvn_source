import 'package:isar/isar.dart';

import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_customer_supplier.dart';
import '../models/hotel_finance_accounting.dart';
import '../models/hotel_inventory.dart';
import '../models/hotel_report_models.dart';
import '../models/hotel_service.dart';
import '../services/hotel_isar_service.dart';

/// Xây dựng các báo cáo (mô phỏng báo cáo Crystal .rpt của KANHOT) từ dữ liệu Isar.
///
/// Tên báo cáo/kiểu trình bày khớp với bộ .rpt gốc:
/// rp1111_1 (Sổ cái TK 1111), rp1111_Detail (Sổ quỹ tiền mặt),
/// rpReceipt (Phiếu thu/chi), rpBillByDate (Doanh thu theo ngày),
/// rpOutputFromShift (Báo cáo cuối ca), rpSoLuongMonBanRa,
/// rpS10DN (Sổ chi tiết vật tư, hàng hóa), rpBaoCaoTongHopXuatNhapTonVatTu,
/// rpSoTongHopThanhToanVoiNguoiBan.
class HotelReportService {
  final HotelIsarService _isarService;

  HotelReportService(this._isarService);

  static const String _formS03a =
      'Mẫu số S03a-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS10 =
      'Mẫu số S10-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _form01TT =
      'Mẫu số 01-TT (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';

  String get _unitName => 'Đơn vị: $_kUnit';

  // Cấu hình công ty (tên/địa chỉ/MST) lấy từ SharedPreferences ở tầng UI;
  // service nhận qua tham số nếu có.
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

  // ---------------------------------------------------------------------------
  // Dữ liệu thô
  // ---------------------------------------------------------------------------

  Future<List<HotelCashTransaction>> _allCash() async {
    final db = await _isarService.db;
    return await db.hotelCashTransactions.where().sortByCreatedAt().findAll();
  }

  Future<List<RoomCheckIn>> _allCheckIns() async {
    final db = await _isarService.db;
    final list = await db.roomCheckIns.where().sortByActualCheckInDesc().findAll();
    for (final c in list) {
      await c.room.load();
    }
    return list;
  }

  Future<List<RoomServiceOrderItem>> _allOrderItems() async {
    final db = await _isarService.db;
    final list = await db.roomServiceOrderItems.where().sortByOrderTime().findAll();
    for (final it in list) {
      await it.serviceItem.load();
    }
    return list;
  }

  Future<List<HotelShiftReport>> _allShifts() async {
    final db = await _isarService.db;
    return await db.hotelShiftReports.where().findAll();
  }

  Future<List<HotelInventoryItem>> _allItems() async {
    final db = await _isarService.db;
    return await db.hotelInventoryItems.where().sortByItemName().findAll();
  }

  Future<List<HotelInventoryTransaction>> _allStockTx() async {
    final db = await _isarService.db;
    final list = await db.hotelInventoryTransactions.where().sortByCreatedAt().findAll();
    for (final t in list) {
      await t.item.load();
    }
    return list;
  }

  Future<List<HotelSupplier>> _allSuppliers() async {
    final db = await _isarService.db;
    return await db.hotelSuppliers.where().sortBySupplierName().findAll();
  }

  static bool _inRange(DateTime d, DateTime from, DateTime to) =>
      !d.isBefore(from) && !d.isAfter(to);

  static String _shortId(String id) {
    if (id.length <= 8) return id;
    return id.substring(0, 8);
  }

  /// Tồn quỹ đầu kỳ (tổng thu trừ chi trước [from]).
  double _openingCash(List<HotelCashTransaction> all, DateTime from) {
    double s = 0;
    for (final t in all) {
      if (t.createdAt.isBefore(from)) {
        s += t.type == CashTransactionType.INCOME ? t.amount : -t.amount;
      }
    }
    return s;
  }

  // ---------------------------------------------------------------------------
  // 1) SỔ CÁI TK 1111 - TIỀN MẶT (rp1111_1 — tổng hợp theo tháng)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCashLedger({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allCash();
    final inRange = all.where((t) => _inRange(t.createdAt, from, to)).toList();
    final opening = _openingCash(all, from);

    final rows = <ReportRow>[];
    double totalDebit = 0, totalCredit = 0;
    for (final t in inRange) {
      final isIn = t.type == CashTransactionType.INCOME;
      final amount = t.amount;
      final debit = isIn ? amount : 0.0;
      final credit = isIn ? 0.0 : amount;
      totalDebit += debit;
      totalCredit += credit;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.description.isNotEmpty ? t.description : t.category),
        ReportCell(t.category, align: ReportCellAlign.center),
        ReportCell(debit > 0 ? formatMoney(debit) : '', align: ReportCellAlign.right),
        ReportCell(credit > 0 ? formatMoney(credit) : '', align: ReportCellAlign.right),
      ]));
    }

    final endBalance = opening + totalDebit - totalCredit;
    final totalRows = <ReportRow>[
      ReportRow([
        const ReportCell('Cộng số phát sinh', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(totalDebit), align: ReportCellAlign.right, isBold: true),
        ReportCell(formatMoney(totalCredit), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
      ReportRow([
        const ReportCell('Số dư cuối kỳ', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(endBalance), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
    ];

    final period = from.month == to.month && from.year == to.year
        ? 'Tháng ${from.month}/${from.year}'
        : 'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}';

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CÁI',
      titleSub: 'Dùng cho hình thức kế toán Nhật ký chung',
      subtitleLines: ['Tài khoản: 1111 - Tiền mặt', period],
      columnFlex: const [14, 10, 32, 15, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('Chứng từ', colspan: 2),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('TK đối ứng'),
          ReportHeaderCell('Số tiền', colspan: 2),
        ],
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('TK đối ứng'),
          ReportHeaderCell('Nợ'),
          ReportHeaderCell('Có'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Không có phát sinh trong kỳ')])]
          : rows,
      totalRows: totalRows,
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2) SỔ QUỸ TIỀN MẶT (rp1111_Detail — chi tiết, có số dư đầu/cuối kỳ)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCashBook({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allCash();
    final inRange = all.where((t) => _inRange(t.createdAt, from, to)).toList();
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
      final isIn = t.type == CashTransactionType.INCOME;
      running += isIn ? t.amount : -t.amount;
      if (isIn) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.description.isNotEmpty ? t.description : t.category),
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
      columnFlex: const [14, 10, 30, 16, 16, 16],
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
  // 3) PHIẾU THU / PHIẾU CHI (rpReceipt)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildReceiptPayment({
    required DateTime from,
    required DateTime to,
    required bool isReceipt,
  }) async {
    final all = await _allCash();
    final type = isReceipt ? CashTransactionType.INCOME : CashTransactionType.EXPENSE;
    final inRange = all
        .where((t) => t.type == type && _inRange(t.createdAt, from, to))
        .toList();

    final rows = <ReportRow>[];
    double total = 0;
    for (final t in inRange) {
      total += t.amount;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt), align: ReportCellAlign.center),
        ReportCell(_shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.createdBy.isNotEmpty ? t.createdBy : kBlankDash),
        ReportCell(t.description.isNotEmpty ? t.description : t.category),
        ReportCell(t.category, align: ReportCellAlign.center),
        ReportCell(formatMoney(t.amount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _form01TT,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: isReceipt ? 'BÁO CÁO PHIẾU THU' : 'BÁO CÁO PHIẾU CHI',
      titleSub: isReceipt
          ? 'Quyển số: ...  -  Số: ...'
          : 'Quyển số: ...  -  Số: ...',
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
  // 4) DOANH THU THEO NGÀY (rpBillByDate)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueByDate({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allCheckIns();
    final inRange = all
        .where((c) =>
            c.isCheckedOut &&
            c.actualCheckOut != null &&
            _inRange(c.actualCheckOut!, from, to))
        .toList()
      ..sort((a, b) => (a.actualCheckOut!).compareTo(b.actualCheckOut!));

    final rows = <ReportRow>[];
    double totalRoom = 0, totalService = 0, totalDiscount = 0, totalPaid = 0;
    for (final c in inRange) {
      totalRoom += c.roomTotalCharge;
      totalService += c.serviceTotalCharge;
      totalDiscount += c.discount;
      final paid = (c.roomTotalCharge + c.serviceTotalCharge - c.discount)
          .clamp(0.0, double.infinity);
      totalPaid += paid;
      rows.add(ReportRow([
        ReportCell(formatDate(c.actualCheckOut!), align: ReportCellAlign.center),
        ReportCell(c.room.value?.roomNumber ?? '', align: ReportCellAlign.center),
        ReportCell(c.customerName.isNotEmpty ? c.customerName : kBlankDash),
        ReportCell(formatMoney(c.roomTotalCharge), align: ReportCellAlign.right),
        ReportCell(formatMoney(c.serviceTotalCharge), align: ReportCellAlign.right),
        ReportCell(formatMoney(c.discount), align: ReportCellAlign.right),
        ReportCell(formatMoney(paid), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO DOANH THU THEO NGÀY',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [12, 8, 22, 15, 15, 13, 15],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Phòng'),
          ReportHeaderCell('Khách hàng'),
          ReportHeaderCell('Tiền phòng'),
          ReportHeaderCell('Tiền dịch vụ'),
          ReportHeaderCell('Giảm giá'),
          ReportHeaderCell('Tổng thu'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có lượt check-out trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalRoom), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalService), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDiscount), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalPaid), align: ReportCellAlign.right, isBold: true),
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
  // 5) BÁO CÁO CUỐI CA (rpOutputFromShift)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allShifts();
    final inRange = all.where((s) => _inRange(s.startTime, from, to)).toList();

    final rows = <ReportRow>[];
    double totalIn = 0, totalOut = 0, totalStart = 0, totalEnd = 0, totalDiff = 0;
    for (final s in inRange) {
      totalStart += s.startingCash;
      totalIn += s.totalCashIncome;
      totalOut += s.totalCashExpense;
      totalEnd += s.endingCash;
      totalDiff += s.difference;
      rows.add(ReportRow([
        ReportCell(s.shiftName.isNotEmpty ? s.shiftName : 'Ca làm việc'),
        ReportCell(s.employeeName.isNotEmpty ? s.employeeName : kBlankDash),
        ReportCell(formatDateTime(s.startTime), align: ReportCellAlign.center),
        ReportCell(s.endTime != null ? formatDateTime(s.endTime!) : '...', align: ReportCellAlign.center),
        ReportCell(formatMoney(s.startingCash), align: ReportCellAlign.right),
        ReportCell(formatMoney(s.totalCashIncome), align: ReportCellAlign.right),
        ReportCell(formatMoney(s.totalCashExpense), align: ReportCellAlign.right),
        ReportCell(formatMoney(s.endingCash), align: ReportCellAlign.right),
        ReportCell(formatMoney(s.difference), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO THU - CHI TIỀN MẶT THEO CA',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [14, 16, 16, 16, 12, 12, 12, 12, 12],
      headerRows: const [
        [
          ReportHeaderCell('Ca làm việc'),
          ReportHeaderCell('Nhân viên'),
          ReportHeaderCell('Giờ mở ca'),
          ReportHeaderCell('Giờ đóng ca'),
          ReportHeaderCell('Tiền đầu ca'),
          ReportHeaderCell('Thu trong ca'),
          ReportHeaderCell('Chi trong ca'),
          ReportHeaderCell('Tiền cuối ca'),
          ReportHeaderCell('Chênh lệch'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có báo cáo ca trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalStart), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalIn), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalOut), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalEnd), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDiff), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Nhân viên ca', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 6) SỐ LƯỢNG MÓN BÁN RA (rpSoLuongMonBanRa)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildMenuSold({
    required DateTime from,
    required DateTime to,
  }) async {
    final all = await _allOrderItems();
    final inRange = all.where((o) => _inRange(o.orderTime, from, to)).toList();

    final agg = <String, Map<String, Object>>{};
    for (final o in inRange) {
      final item = o.serviceItem.value;
      final key = item?.itemId ?? o.orderItemId;
      final e = agg.putIfAbsent(key, () {
        return {
          'name': item?.itemName ?? 'Món không xác định',
          'qty': 0.0,
          'price': o.unitPrice,
          'total': 0.0,
        };
      });
      e['qty'] = (e['qty'] as double) + o.quantity;
      e['total'] = (e['total'] as double) + o.totalPrice;
      if (e['price'] == 0.0) e['price'] = o.unitPrice;
    }

    final sorted = agg.values.toList()
      ..sort((a, b) => (b['qty'] as double).compareTo(a['qty'] as double));

    final rows = <ReportRow>[];
    double totalQty = 0, totalMoney = 0;
    var stt = 0;
    for (final e in sorted) {
      stt++;
      final qty = e['qty'] as double;
      final price = e['price'] as double;
      final total = e['total'] as double;
      totalQty += qty;
      totalMoney += total;
      rows.add(ReportRow([
        ReportCell('$stt', align: ReportCellAlign.center),
        ReportCell(e['name'] as String),
        ReportCell(formatQty(qty), align: ReportCellAlign.center),
        ReportCell(formatMoney(price), align: ReportCellAlign.right),
        ReportCell(formatMoney(total), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO SỐ LƯỢNG MÓN BÁN RA',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [8, 48, 14, 15, 15],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Tên món'),
          ReportHeaderCell('Số lượng'),
          ReportHeaderCell('Đơn giá'),
          ReportHeaderCell('Thành tiền'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có món nào bán ra trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(totalQty), align: ReportCellAlign.right, isBold: true),
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
  // 7) SỔ CHI TIẾT VẬT LIỆU, DỤNG CỤ, SẢN PHẨM, HÀNG HÓA (rpS10DN)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockLedger({
    required DateTime from,
    required DateTime to,
    required String itemId,
  }) async {
    final items = await _allItems();
    final item = items.where((i) => i.itemId == itemId).firstOrNull;
    if (item == null) {
      return _emptyStockLedger(from, to, 'Chưa chọn vật tư, hàng hóa');
    }

    final all = await _allStockTx();
    final inRange = all
        .where((t) => t.item.value?.itemId == itemId && _inRange(t.createdAt, from, to))
        .toList();

    double openQty = 0;
    for (final t in all) {
      if (t.item.value?.itemId == itemId && t.createdAt.isBefore(from)) {
        openQty += t.type == InventoryTransactionType.IMPORT ? t.quantity : -t.quantity;
      }
    }
    double openValue = openQty * item.costPrice;

    final rows = <ReportRow>[
      ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        ReportCell(formatMoney(item.costPrice), align: ReportCellAlign.right),
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
    for (final t in inRange) {
      final isImport = t.type == InventoryTransactionType.IMPORT;
      final value = t.unitPrice > 0 ? t.unitPrice * t.quantity : item.costPrice * t.quantity;
      final qty = isImport ? t.quantity : -t.quantity;
      if (isImport) {
        inQty += t.quantity;
        inValue += value;
      } else {
        outQty += t.quantity;
        outValue += value;
      }
      runningQty += qty;
      runningValue += value;
      rows.add(ReportRow([
        ReportCell(formatDate(t.createdAt), align: ReportCellAlign.center),
        ReportCell(t.referenceInfo.isNotEmpty ? _shortId(t.referenceInfo) : _shortId(t.transactionId), align: ReportCellAlign.center),
        ReportCell(t.note.isNotEmpty ? t.note : (isImport ? 'Nhập kho' : 'Xuất kho')),
        ReportCell(formatMoney(t.unitPrice), align: ReportCellAlign.right),
        ReportCell(isImport ? formatQty(t.quantity.toDouble()) : '', align: ReportCellAlign.right),
        ReportCell(isImport ? formatMoney(value) : '', align: ReportCellAlign.right),
        ReportCell(isImport ? '' : formatQty(t.quantity.toDouble()), align: ReportCellAlign.right),
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
      title: 'SỔ CHI TIẾT VẬT LIỆU, DỤNG CỤ, SẢN PHẨM, HÀNG HÓA',
      titleSub: 'Dùng cho các tài khoản 152, 153, 155, 156',
      subtitleLines: [
        'Tài khoản: 156 - Hàng hóa',
        'Tên vật tư, hàng hóa: ${item.itemName}',
        'Đơn vị tính: ${item.unit.isEmpty ? 'Cái' : item.unit}',
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
      title: 'SỔ CHI TIẾT VẬT LIỆU, DỤNG CỤ, SẢN PHẨM, HÀNG HÓA',
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
  // 8) BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN (rpBaoCaoTongHopXuatNhapTonVatTu)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final items = await _allItems();
    final all = await _allStockTx();

    final rows = <ReportRow>[];
    double tOpenQty = 0, tInQty = 0, tOutQty = 0, tCloseQty = 0;
    double tOpenVal = 0, tInVal = 0, tOutVal = 0, tCloseVal = 0;

    for (final item in items) {
      double openQty = 0, inQty = 0, outQty = 0;
      double inVal = 0, outVal = 0;
      for (final t in all) {
        if (t.item.value?.itemId != item.itemId) continue;
        final isImport = t.type == InventoryTransactionType.IMPORT;
        final value = t.unitPrice > 0 ? t.unitPrice * t.quantity : item.costPrice * t.quantity;
        if (t.createdAt.isBefore(from)) {
          openQty += isImport ? t.quantity : -t.quantity;
        } else if (_inRange(t.createdAt, from, to)) {
          if (isImport) {
            inQty += t.quantity;
            inVal += value;
          } else {
            outQty += t.quantity;
            outVal += value;
          }
        }
      }
      final closeQty = openQty + inQty - outQty;
      final openVal = openQty * item.costPrice;
      final closeVal = closeQty * item.costPrice;
      tOpenQty += openQty;
      tOpenVal += openVal;
      tInQty += inQty;
      tInVal += inVal;
      tOutQty += outQty;
      tOutVal += outVal;
      tCloseQty += closeQty;
      tCloseVal += closeVal;

      rows.add(ReportRow([
        ReportCell(item.itemName),
        ReportCell(item.unit.isEmpty ? 'Cái' : item.unit, align: ReportCellAlign.center),
        ReportCell(formatQty(openQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(openVal), align: ReportCellAlign.right),
        ReportCell(formatQty(inQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(inVal), align: ReportCellAlign.right),
        ReportCell(formatQty(outQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(outVal), align: ReportCellAlign.right),
        ReportCell(formatQty(closeQty), align: ReportCellAlign.right),
        ReportCell(formatMoney(closeVal), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS10,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN VẬT TƯ, HÀNG HÓA',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [26, 8, 8, 10, 8, 10, 8, 10, 8, 10],
      headerRows: const [
        [
          ReportHeaderCell('Tên vật tư, hàng hóa'),
          ReportHeaderCell('ĐVT'),
          ReportHeaderCell('Tồn đầu kỳ', colspan: 2),
          ReportHeaderCell('Nhập trong kỳ', colspan: 2),
          ReportHeaderCell('Xuất trong kỳ', colspan: 2),
          ReportHeaderCell('Tồn cuối kỳ', colspan: 2),
        ],
        [
          ReportHeaderCell('Tên vật tư'),
          ReportHeaderCell('ĐVT'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
          ReportHeaderCell('SL'),
          ReportHeaderCell('TG'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có vật tư, hàng hóa trong kỳ')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell('Cộng', isBold: true),
          const ReportCell(''),
          ReportCell(formatQty(tOpenQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tOpenVal), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tInQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tInVal), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tOutQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tOutVal), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatQty(tCloseQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(tCloseVal), align: ReportCellAlign.right, isBold: true),
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
  // 9) SỔ TỔNG HỢP THANH TOÁN VỚI NGƯỜI BÁN (rpSoTongHopThanhToanVoiNguoiBan)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildSupplierDebt({
    required DateTime from,
    required DateTime to,
  }) async {
    final suppliers = await _allSuppliers();
    final cash = await _allCash();
    final stock = await _allStockTx();

    final rows = <ReportRow>[];
    double tOpen = 0, tIncur = 0, tPaid = 0, tClose = 0;

    for (final s in suppliers) {
      final name = s.supplierName.toLowerCase();
      double incurred = 0, paid = 0;
      double preIncur = 0, prePaid = 0;
      for (final t in cash) {
        final pay = t.type == CashTransactionType.EXPENSE &&
            (t.category.toLowerCase().contains('nhà cung cấp') ||
                t.description.toLowerCase().contains(s.supplierName.toLowerCase()));
        if (!pay) continue;
        if (t.createdAt.isBefore(from)) {
          prePaid += t.amount;
        } else if (_inRange(t.createdAt, from, to)) {
          paid += t.amount;
        }
      }
      for (final t in stock) {
        if (t.type != InventoryTransactionType.IMPORT) continue;
        final note = t.note.toLowerCase();
        if (note.isNotEmpty && !note.contains(name)) continue;
        final value = t.unitPrice > 0 ? t.unitPrice * t.quantity : 0;
        if (t.createdAt.isBefore(from)) {
          preIncur += value;
        } else if (_inRange(t.createdAt, from, to)) {
          incurred += value;
        }
      }
      final open = preIncur - prePaid;
      final close = open + incurred - paid;
      tOpen += open;
      tIncur += incurred;
      tPaid += paid;
      tClose += close;

      rows.add(ReportRow([
        ReportCell(s.supplierName),
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

  /// Tổng tiền mặt thực tế hiện có (cho màn hình tổng quan).
  Future<double> currentCashBalance() async {
    final all = await _allCash();
    double s = 0;
    for (final t in all) {
      s += t.type == CashTransactionType.INCOME ? t.amount : -t.amount;
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

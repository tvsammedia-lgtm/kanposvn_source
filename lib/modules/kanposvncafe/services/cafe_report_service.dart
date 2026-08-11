import '../models/cafe_finance_accounting.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_report_models.dart';
import 'cafe_isar_service.dart';

/// Xây dựng các báo cáo (mô phỏng báo cáo Crystal .rpt của KANCAFE) từ dữ
/// liệu của module Quán Cafe & Trà Sữa.
///
/// Kiểu trình bày khớp với bộ .rpt gốc trong KANCAFE (TDERP_RES.Reports.*):
///  - rp1111 / rp1111_Detail: BÁO CÁO QUỸ TIỀN MẶT (tổng hợp + chi tiết).
///  - Bảng kê bàn theo tầng/khu vực (nhóm theo CafeArea).
///  - Danh mục món ăn (nhóm theo loại món).
///  - Giá món ăn (danh sách giá theo loại).
///
/// Quỹ tiền mặt dùng dữ liệu thu/chi thật (CashTransaction):
///  - Thu từ hóa đơn bán hàng = khoản thu có loại "Doanh thu bán hàng".
///  - Thu từ phiếu thu = các khoản thu còn lại (phiếu thu, thu nợ...).
///  - Tổng số chi = các khoản chi (phiếu chi, nhập hàng, chi phí...).
///  - Số dư đầu kỳ = tổng (thu - chi) trước kỳ; cuối kỳ = đầu kỳ + thu - chi.
class CafeReportService {
  final CafeIsarService _isar;

  CafeReportService(this._isar);

  static const String _formS03a =
      'Mẫu số S03a-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';

  /// Nhãn khoản thu ghi tự động khi thanh toán đơn hàng (checkout).
  static const String _saleIncomeCategory = 'Doanh thu bán hàng';

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

  static String _monthLabel(int year, int month) {
    final m = month < 10 ? '0$month' : '$month';
    return '$m/$year';
  }

  /// Giá trị quy đổi của một giao dịch: thu (+) / chi (-).
  static double _txAmount(CashTransaction t) =>
      t.type == 'INCOME' ? t.amount : -t.amount;

  static bool _isIncome(CashTransaction t) => t.type == 'INCOME';

  // ---------------------------------------------------------------------------
  // 1) BÁO CÁO QUỸ TIỀN MẶT - TỔNG HỢP (kiểu KANCAFE rp1111)
  // ---------------------------------------------------------------------------

  CrystalReportModel buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) {
    final txs = _isar.getCashTransactions();
    final opening = txs
        .where((t) => t.timestamp.isBefore(from))
        .fold<double>(0, (s, t) => s + _txAmount(t));
    final inRange = txs.where((t) => _inRange(t.timestamp, from, to)).toList();
    final thuBill = inRange
        .where((t) => _isIncome(t) && t.category == _saleIncomeCategory)
        .fold<double>(0, (s, t) => s + t.amount);
    final thuReceipt = inRange
        .where((t) => _isIncome(t) && t.category != _saleIncomeCategory)
        .fold<double>(0, (s, t) => s + t.amount);
    final chi = inRange
        .where((t) => t.type == 'EXPENSE')
        .fold<double>(0, (s, t) => s + t.amount);
    final end = opening + thuBill + thuReceipt - chi;

    const flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Thu từ hóa đơn bán hàng'),
        ReportCell(formatMoney(thuBill), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Thu từ phiếu thu'),
        ReportCell(formatMoney(thuReceipt), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Cộng số thu'),
        ReportCell(formatMoney(thuBill + thuReceipt), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Tổng số chi (phiếu chi, nhập hàng, chi phí...)'),
        ReportCell(formatMoney(chi), align: ReportCellAlign.right),
      ]),
    ];

    return CrystalReportModel(
      formLine: _formS03a,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO QUỸ TIỀN MẶT',
      titleSub: 'Tháng ${_monthLabel(from.year, from.month)}',
      subtitleLines: [
        'Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}',
      ],
      columnFlex: flex,
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Chỉ tiêu'),
          ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('Số dư cuối kỳ', isBold: true),
          ReportCell(formatMoney(end), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      noteLine: 'Số tiền cuối kỳ bằng chữ: ${moneyToWords(end)}',
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2) SỔ QUỸ TIỀN MẶT - CHI TIẾT (kiểu KANCAFE rp1111_Detail)
  // ---------------------------------------------------------------------------

  CrystalReportModel buildCashFundDetail({
    required DateTime from,
    required DateTime to,
  }) {
    final txs = _isar.getCashTransactions();
    final opening = txs
        .where((t) => t.timestamp.isBefore(from))
        .fold<double>(0, (s, t) => s + _txAmount(t));
    final inRange = txs.where((t) => _inRange(t.timestamp, from, to)).toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

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
      final isIn = _isIncome(t);
      running += _txAmount(t);
      if (isIn) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
      rows.add(ReportRow([
        ReportCell(formatDate(t.timestamp), align: ReportCellAlign.center),
        ReportCell(_shortId(t.id), align: ReportCellAlign.center),
        ReportCell(t.title),
        ReportCell(
          isIn ? formatMoney(t.amount) : '',
          align: ReportCellAlign.right,
        ),
        ReportCell(
          isIn ? '' : formatMoney(t.amount),
          align: ReportCellAlign.right,
        ),
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
        const ReportCell(''),
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
      noteLine: 'Số tiền cuối kỳ bằng chữ: ${moneyToWords(running)}',
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 3) SƠ ĐỒ TẦNG BÀN (bảng kê bàn theo khu vực / tầng)
  // ---------------------------------------------------------------------------

  CrystalReportModel buildTableFloorReport() {
    final areas = _isar.getAreas();
    final tables = _isar.getTables();

    final rows = <ReportRow>[];
    var stt = 0;
    final statusCounts = <String, int>{};
    final usedAreas = <String>{};

    for (final area in areas) {
      final list = tables.where((t) => t.areaId == area.id).toList()
        ..sort((a, b) => a.name.compareTo(b.name));
      if (list.isEmpty) continue;
      usedAreas.add(area.id);
      rows.add(ReportRow([
        const ReportCell(''),
        ReportCell('Khu vực: ${area.name}', isBold: true),
        const ReportCell(''),
        ReportCell('${list.length} bàn', isBold: true, align: ReportCellAlign.right),
      ], isSection: true));
      for (final t in list) {
        stt++;
        statusCounts[t.status.label] = (statusCounts[t.status.label] ?? 0) + 1;
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(t.name),
          ReportCell(area.name),
          ReportCell(t.status.label, align: ReportCellAlign.center),
        ]));
      }
    }

    final orphans = tables.where((t) => !usedAreas.contains(t.areaId)).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    if (orphans.isNotEmpty) {
      rows.add(ReportRow([
        const ReportCell(''),
        ReportCell('Khu vực: Chưa phân khu', isBold: true),
        const ReportCell(''),
        ReportCell('${orphans.length} bàn', isBold: true, align: ReportCellAlign.right),
      ], isSection: true));
      for (final t in orphans) {
        stt++;
        statusCounts[t.status.label] = (statusCounts[t.status.label] ?? 0) + 1;
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(t.name),
          ReportCell('Chưa phân khu'),
          ReportCell(t.status.label, align: ReportCellAlign.center),
        ]));
      }
    }

    final statusSummary = StringBuffer();
    statusSummary.write('Tổng cộng $stt bàn');
    for (final entry in statusCounts.entries) {
      statusSummary.write(' - ${entry.key}: ${entry.value}');
    }

    return CrystalReportModel(
      formLine: '',
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SƠ ĐỒ TẦNG BÀN',
      subtitleLines: [
        'Thời điểm: ${formatDateTime(DateTime.now())}',
      ],
      columnFlex: const [8, 26, 26, 30],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Tên bàn'),
          ReportHeaderCell('Khu vực / Tầng'),
          ReportHeaderCell('Trạng thái'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có bàn nào')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('Tổng cộng', isBold: true),
          const ReportCell(''),
          ReportCell(statusSummary.toString(), align: ReportCellAlign.right, isBold: true),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập', '(Ký, họ tên)'),
        ReportSignatureItem('Quản lý', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 4) DANH MỤC MÓN ĂN
  // ---------------------------------------------------------------------------

  static String _sizeLabel(CafeMenuItem m) {
    if (m.sizes.isEmpty) return '';
    return m.sizes.map((s) => s.name).join('/');
  }

  CrystalReportModel buildMenuCategoryReport() {
    final items = _isar.getMenuItems();
    final sorted = [...items]
      ..sort((a, b) {
        final cc = a.categoryName.compareTo(b.categoryName);
        if (cc != 0) return cc;
        return a.name.compareTo(b.name);
      });

    final cats = <String>[];
    final byCat = <String, List<CafeMenuItem>>{};
    for (final m in sorted) {
      final c = m.categoryName.trim().isEmpty ? 'Khác' : m.categoryName.trim();
      byCat.putIfAbsent(c, () => []).add(m);
      if (!cats.contains(c)) cats.add(c);
    }

    final rows = <ReportRow>[];
    var stt = 0;
    for (final c in cats) {
      final list = byCat[c]!;
      rows.add(ReportRow([
        const ReportCell(''),
        ReportCell('Loại: $c', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
      ], isSection: true));
      for (final m in list) {
        stt++;
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(m.code, align: ReportCellAlign.center),
          ReportCell(m.name),
          ReportCell(_sizeLabel(m), align: ReportCellAlign.center),
          ReportCell(m.categoryName.isEmpty ? 'Khác' : m.categoryName),
          ReportCell(formatMoney(m.basePrice), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: '',
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'DANH MỤC MÓN ĂN',
      subtitleLines: [
        'Thời điểm: ${formatDateTime(DateTime.now())}',
      ],
      columnFlex: const [7, 14, 34, 10, 14, 16],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Mã món'),
          ReportHeaderCell('Tên món ăn'),
          ReportHeaderCell('Kích thước'),
          ReportHeaderCell('Loại món'),
          ReportHeaderCell('Giá'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có món ăn nào')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          ReportCell('Tổng cộng: $stt món', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập', '(Ký, họ tên)'),
        ReportSignatureItem('Quản lý', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 5) GIÁ MÓN ĂN
  // ---------------------------------------------------------------------------

  CrystalReportModel buildMenuPriceReport() {
    final items = _isar.getMenuItems();
    final sorted = [...items]
      ..sort((a, b) {
        final cc = a.categoryName.compareTo(b.categoryName);
        if (cc != 0) return cc;
        return b.basePrice.compareTo(a.basePrice);
      });

    final cats = <String>[];
    final byCat = <String, List<CafeMenuItem>>{};
    for (final m in sorted) {
      final c = m.categoryName.trim().isEmpty ? 'Khác' : m.categoryName.trim();
      byCat.putIfAbsent(c, () => []).add(m);
      if (!cats.contains(c)) cats.add(c);
    }

    final rows = <ReportRow>[];
    var stt = 0;
    double minPrice = double.infinity;
    double maxPrice = 0;
    for (final c in cats) {
      final list = byCat[c]!;
      rows.add(ReportRow([
        const ReportCell(''),
        ReportCell('Loại: $c', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
      ], isSection: true));
      for (final m in list) {
        stt++;
        if (m.basePrice < minPrice) minPrice = m.basePrice;
        if (m.basePrice > maxPrice) maxPrice = m.basePrice;
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(m.code, align: ReportCellAlign.center),
          ReportCell(m.name),
          ReportCell(_sizeLabel(m), align: ReportCellAlign.center),
          ReportCell(m.categoryName.isEmpty ? 'Khác' : m.categoryName),
          ReportCell(formatMoney(m.basePrice), align: ReportCellAlign.right, isBold: true),
        ]));
      }
    }

    final priceNote = stt == 0
        ? 'Chưa có món ăn nào'
        : 'Giá thấp nhất: ${formatMoney(minPrice)} - Giá cao nhất: ${formatMoney(maxPrice)}';

    return CrystalReportModel(
      formLine: '',
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'GIÁ MÓN ĂN',
      subtitleLines: [
        'Thời điểm: ${formatDateTime(DateTime.now())}',
      ],
      columnFlex: const [7, 14, 34, 10, 14, 16],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Mã món'),
          ReportHeaderCell('Tên món ăn'),
          ReportHeaderCell('Kích thước'),
          ReportHeaderCell('Loại món'),
          ReportHeaderCell('Giá'),
        ],
      ],
      rows: rows.isEmpty
          ? const [ReportRow([ReportCell('Chưa có món ăn nào')])]
          : rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          ReportCell('Tổng cộng: $stt món', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
        ], isSection: true),
      ],
      noteLine: priceNote,
      signature: const [
        ReportSignatureItem('Người lập', '(Ký, họ tên)'),
        ReportSignatureItem('Quản lý', '(Ký, họ tên)'),
      ],
    );
  }
}

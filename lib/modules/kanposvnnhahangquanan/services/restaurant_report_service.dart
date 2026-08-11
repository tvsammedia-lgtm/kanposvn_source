import 'package:isar/isar.dart';

import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_report_models.dart';
import '../models/restaurant_table.dart';
import 'restaurant_isar_service.dart';

/// Xây dựng các báo cáo (mô phỏng báo cáo Crystal .rpt của KANTOUCH touch_admin)
/// từ dữ liệu Isar của module Nhà hàng - Quán ăn.
///
/// Kiểu trình bày khớp với bộ .rpt gốc trong touch_admin (TDERP_RES.Reports.*):
///  - rp1111 / rp1111_Detail: BÁO CÁO QUỸ TIỀN MẶT (tổng hợp + chi tiết).
///  - Bảng kê bàn theo tầng/khu vực (nhóm theo trường "zone" của bàn).
///  - Danh mục món ăn (nhóm theo loại món).
///  - Giá món ăn (danh sách giá theo loại).
///
/// Quỹ tiền mặt được suy ra từ dữ liệu hiện có: Thu = tổng đơn đã thanh toán
/// (completed) trong kỳ; Chi = chưa có dữ liệu chi tiền mặt trong module
/// (để trống/0); Số dư đầu kỳ = tổng tiền các đơn đã thanh toán trước kỳ.
class RestaurantReportService {
  final RestaurantIsarService _isarService;

  RestaurantReportService(this._isarService);

  static const String _formS03a =
      'Mẫu số S03a-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';

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

  // ---------------------------------------------------------------------------
  // 1) BÁO CÁO QUỸ TIỀN MẶT - TỔNG HỢP (kiểu KANTOUCH rp1111)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isarService.db;
    final orders = await db.restaurantOrders.where().findAll();
    for (final o in orders) {
      await o.table.load();
    }

    final inRange = orders.where((o) =>
        o.status == RestaurantOrderStatus.COMPLETED &&
        o.closedAt != null &&
        _inRange(o.closedAt!, from, to));
    final before = orders.where((o) =>
        o.status == RestaurantOrderStatus.COMPLETED &&
        o.closedAt != null &&
        o.closedAt!.isBefore(from));

    final opening = before.fold<double>(0, (s, o) => s + o.totalAmount);
    final thuBill = inRange.fold<double>(0, (s, o) => s + o.totalAmount);
    final thuReceipt = 0.0; // Module chưa có phiếu thu riêng
    final chi = 0.0; // Module chưa có dữ liệu chi tiền mặt
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
        const ReportCell('Tổng số chi (phiếu chi, mua hàng...)'),
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

  static String _monthLabel(int year, int month) {
    final m = month < 10 ? '0$month' : '$month';
    return '$m/$year';
  }

  // ---------------------------------------------------------------------------
  // 2) SỔ QUỸ TIỀN MẶT - CHI TIẾT (kiểu KANTOUCH rp1111_Detail)
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCashFundDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isarService.db;
    final orders = await db.restaurantOrders.where().findAll();
    for (final o in orders) {
      await o.table.load();
    }

    final inRange = orders.where((o) =>
        o.status == RestaurantOrderStatus.COMPLETED &&
        o.closedAt != null &&
        _inRange(o.closedAt!, from, to)).toList()
      ..sort((a, b) => a.closedAt!.compareTo(b.closedAt!));
    final opening = orders.where((o) =>
        o.status == RestaurantOrderStatus.COMPLETED &&
        o.closedAt != null &&
        o.closedAt!.isBefore(from)).fold<double>(0, (s, o) => s + o.totalAmount);

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
    for (final o in inRange) {
      running += o.totalAmount;
      totalIn += o.totalAmount;
      final desc = o.table.value?.name ?? '';
      rows.add(ReportRow([
        ReportCell(formatDate(o.closedAt!), align: ReportCellAlign.center),
        ReportCell('HĐ${_shortId(o.orderId)}', align: ReportCellAlign.center),
        ReportCell('Thu tiền bán hàng${desc.isNotEmpty ? ' - bàn $desc' : ''}'),
        ReportCell(formatMoney(o.totalAmount), align: ReportCellAlign.right),
        const ReportCell(''),
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

  Future<CrystalReportModel> buildTableFloorReport() async {
    final db = await _isarService.db;
    final tables = await db.restaurantTables.where().findAll();
    final sorted = [...tables]
      ..sort((a, b) {
        final zc = a.zone.compareTo(b.zone);
        if (zc != 0) return zc;
        return a.name.compareTo(b.name);
      });

    final zones = <String>[];
    final byZone = <String, List<RestaurantTable>>{};
    for (final t in sorted) {
      final z = t.zone.trim().isEmpty ? 'Chưa phân khu' : t.zone.trim();
      byZone.putIfAbsent(z, () => []).add(t);
      if (!zones.contains(z)) zones.add(z);
    }

    final rows = <ReportRow>[];
    var stt = 0;
    int empty = 0, serving = 0, waiting = 0;
    for (final z in zones) {
      final list = byZone[z]!;
      rows.add(ReportRow([
        const ReportCell(''),
        ReportCell('Khu vực: $z', isBold: true),
        const ReportCell(''),
        ReportCell('${list.length} bàn', isBold: true, align: ReportCellAlign.right),
      ], isSection: true));
      for (final t in list) {
        stt++;
        switch (t.status) {
          case RestaurantTableStatus.EMPTY:
            empty++;
            break;
          case RestaurantTableStatus.SERVING:
            serving++;
            break;
          case RestaurantTableStatus.WAITING_PAYMENT:
            waiting++;
            break;
        }
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(t.name),
          ReportCell(z),
          ReportCell(t.status.label, align: ReportCellAlign.center),
        ]));
      }
    }

    final statusSummary = StringBuffer();
    statusSummary.write('Tổng cộng $stt bàn');
    if (empty > 0) statusSummary.write(' - Trống: $empty');
    if (serving > 0) statusSummary.write(' - Đang phục vụ: $serving');
    if (waiting > 0) statusSummary.write(' - Chờ thanh toán: $waiting');

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

  Future<CrystalReportModel> buildMenuCategoryReport() async {
    final db = await _isarService.db;
    final items = await db.restaurantMenuItems.where().findAll();
    final sorted = [...items]
      ..sort((a, b) {
        final cc = a.category.compareTo(b.category);
        if (cc != 0) return cc;
        return a.name.compareTo(b.name);
      });

    final cats = <String>[];
    final byCat = <String, List<RestaurantMenuItem>>{};
    for (final m in sorted) {
      final c = m.category.trim().isEmpty ? 'Khác' : m.category.trim();
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
          ReportCell(_shortId(m.itemId), align: ReportCellAlign.center),
          ReportCell(m.name),
          ReportCell(m.unit, align: ReportCellAlign.center),
          ReportCell(m.category.isEmpty ? 'Khác' : m.category),
          ReportCell(formatMoney(m.price), align: ReportCellAlign.right),
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
          ReportHeaderCell('ĐVT'),
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

  Future<CrystalReportModel> buildMenuPriceReport() async {
    final db = await _isarService.db;
    final items = await db.restaurantMenuItems.where().findAll();
    final sorted = [...items]
      ..sort((a, b) {
        final cc = a.category.compareTo(b.category);
        if (cc != 0) return cc;
        return b.price.compareTo(a.price);
      });

    final cats = <String>[];
    final byCat = <String, List<RestaurantMenuItem>>{};
    for (final m in sorted) {
      final c = m.category.trim().isEmpty ? 'Khác' : m.category.trim();
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
        if (m.price < minPrice) minPrice = m.price;
        if (m.price > maxPrice) maxPrice = m.price;
        rows.add(ReportRow([
          ReportCell('$stt', align: ReportCellAlign.center),
          ReportCell(_shortId(m.itemId), align: ReportCellAlign.center),
          ReportCell(m.name),
          ReportCell(m.unit, align: ReportCellAlign.center),
          ReportCell(m.category.isEmpty ? 'Khác' : m.category),
          ReportCell(formatMoney(m.price), align: ReportCellAlign.right, isBold: true),
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
          ReportHeaderCell('ĐVT'),
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

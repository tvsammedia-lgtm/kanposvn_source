import 'package:isar/isar.dart';

import '../models/tt_finance.dart';
import '../models/tt_order.dart';
import '../models/tt_partner.dart';
import '../models/tt_product.dart';
import '../models/tt_stock.dart';
import '../../../core/reports/crystal_report_models.dart';
import '../services/tt_isar_service.dart';

/// Xây dựng các báo cáo (mô phỏng báo cáo Crystal .rpt của KANTT _ SẠP RAU CỦ QUẢ)
/// từ dữ liệu Isar.
///
/// Gồm: Sổ quỹ tiền mặt, Báo cáo tổng hợp quỹ, Phiếu thu/phiếu chi,
/// Doanh thu theo ngày/tháng/sản phẩm/khách hàng, Chi phí theo nhóm,
/// Nhập - xuất - tồn (tổng hợp/chi tiết), Công nợ khách/nhà cung cấp,
/// Lãi/lỗ, Cân đối doanh thu - chi phí, Hàng tồn nguy cơ hư hỏng,
/// Hàng bán chạy/chậm, Kiểm kê, Hạn sử dụng.
class TtReportService {
  final TtIsarService _isarService;

  TtReportService(this._isarService);

  static const String _formS03b =
      'Mẫu số S03b-DN (Ban hành theo Thông tư số 133/2016/TT-BTC ngày 26/08/2016 của Bộ Tài chính)';
  static const String _formS08 =
      'Mẫu số S08-DN (Ban hành theo Thông tư số 200/2014/TT-BTC ngày 22/12/2014 của Bộ Tài chính)';

  String get _unitName => 'Đơn vị: $_kUnit';

  static String _kUnit = kBlankDash;
  static String _kAddress = kUnitDash;
  static String _kTax = kUnitDash;

  /// Ghi nhận thông tin công ty để in trên đầu mọi báo cáo.
  static void configureCompany({String? name, String? address, String? taxCode}) {
    if (name != null && name.trim().isNotEmpty) _kUnit = name.trim();
    if (address != null && address.trim().isNotEmpty) _kAddress = address.trim();
    if (taxCode != null && taxCode.trim().isNotEmpty) _kTax = taxCode.trim();
  }

  static void resetCompanyDefaults() {
    _kUnit = kBlankDash;
    _kAddress = kUnitDash;
    _kTax = kUnitDash;
  }

  static bool _inRange(DateTime d, DateTime from, DateTime to) =>
      !d.isBefore(from) && !d.isAfter(to);

  static String _shortId(String id) {
    if (id.length <= 10) return id;
    return id.substring(0, 10);
  }

  static DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

  // ---------------------------------------------------------------------------
  // Dữ liệu thô
  // ---------------------------------------------------------------------------

  Future<List<TtSalesInvoice>> _allSales() async {
    final db = await _isarService.db;
    final list = await db.ttSalesInvoices.where().findAll();
    for (final s in list) {
      await s.customer.load();
    }
    return list;
  }

  Future<List<TtSalesItem>> _allSalesItems() async {
    final db = await _isarService.db;
    final list = await db.ttSalesItems.where().findAll();
    for (final d in list) {
      await d.product.load();
      await d.invoice.load();
    }
    return list;
  }

  Future<List<TtPurchaseInvoice>> _allPurchases() async {
    final db = await _isarService.db;
    final list = await db.ttPurchaseInvoices.where().findAll();
    for (final p in list) {
      await p.supplier.load();
    }
    return list;
  }

  /// Tất cả sản phẩm (không bị xóa).

  Future<List<TtReceipt>> _allReceipts() async {
    final db = await _isarService.db;
    final list = await db.ttReceipts.where().findAll();
    for (final r in list) {
      await r.customer.load();
      await r.supplier.load();
    }
    return list;
  }

  Future<List<TtExpense>> _allExpenses() async {
    final db = await _isarService.db;
    final list = await db.ttExpenses.where().findAll();
    for (final e in list) {
      await e.category.load();
      await e.supplier.load();
    }
    return list;
  }

  Future<List<TtProduct>> _allProducts() async {
    final db = await _isarService.db;
    final list = await db.ttProducts.where().findAll();
    for (final p in list) {
      await p.category.load();
    }
    list.retainWhere((p) => p.deletedAt == null);
    return list;
  }

  Future<List<TtCustomer>> _allCustomers() async {
    final db = await _isarService.db;
    final list = await db.ttCustomers.where().findAll();
    list.retainWhere((c) => c.deletedAt == null);
    return list;
  }

  Future<List<TtSupplier>> _allSuppliers() async {
    final db = await _isarService.db;
    final list = await db.ttSuppliers.where().findAll();
    list.retainWhere((s) => s.deletedAt == null);
    return list;
  }

  Future<List<TtStockLot>> _allLots() async {
    final db = await _isarService.db;
    final list = await db.ttStockLots.where().findAll();
    for (final l in list) {
      await l.product.load();
      await l.supplier.load();
    }
    return list;
  }

  Future<List<TtStockMovement>> _allMovements() async {
    final db = await _isarService.db;
    final list = await db.ttStockMovements.where().findAll();
    for (final m in list) {
      await m.product.load();
      await m.lot.load();
    }
    return list;
  }

  // ---------------------------------------------------------------------------
  // 1) SỔ QUỸ TIỀN MẶT
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCashBook({
    required DateTime from,
    required DateTime to,
  }) async {
    final receipts = await _allReceipts();
    final expenses = await _allExpenses();

    double opening = 0;
    for (final r in receipts) {
      if (r.date.isBefore(from)) opening += r.amount;
    }
    for (final e in expenses) {
      if (e.date.isBefore(from)) opening -= e.amount;
    }

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

    final txList = <({DateTime date, String code, String desc, double amount, bool isIn})>[
      for (final r in receipts)
        (
          date: r.date,
          code: r.receiptNumber,
          desc: r.note.isNotEmpty
              ? r.note
              : (r.customer.value?.name ?? r.supplier.value?.name ?? 'Thu khác'),
          amount: r.amount,
          isIn: true,
        ),
      for (final e in expenses)
        (
          date: e.date,
          code: e.expenseNumber,
          desc: e.description.isNotEmpty ? e.description : (e.category.value?.name ?? 'Chi phí'),
          amount: e.amount,
          isIn: false,
        ),
    ]..sort((a, b) => a.date.compareTo(b.date));

    double running = opening;
    double totalIn = 0, totalOut = 0;
    for (final t in txList) {
      if (!_inRange(t.date, from, to)) continue;
      running += t.isIn ? t.amount : -t.amount;
      if (t.isIn) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
      rows.add(ReportRow([
        ReportCell(formatDate(t.date), align: ReportCellAlign.center),
        ReportCell(t.code.isNotEmpty ? t.code : _shortId(t.code), align: ReportCellAlign.center),
        ReportCell(t.desc),
        ReportCell(t.isIn ? formatMoney(t.amount) : '', align: ReportCellAlign.right),
        ReportCell(t.isIn ? '' : formatMoney(t.amount), align: ReportCellAlign.right),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS03b,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ QUỸ TIỀN MẶT',
      titleSub: 'Dùng cho hình thức kế toán Nhật ký chung',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
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
      totalRows: [
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
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Thủ quỹ', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2) BÁO CÁO DOANH THU THEO NGÀY
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueByDay({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSales();
    final map = <String, List<TtSalesInvoice>>{};
    for (final s in sales) {
      if (s.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(s.saleDate, from, to)) continue;
      final key = _dayStart(s.saleDate);
      map.putIfAbsent('${key.day.toString().padLeft(2, '0')}/${key.month.toString().padLeft(2, '0')}',
          () => []).add(s);
    }
    final keys = map.keys.toList()..sort();

    final rows = <ReportRow>[];
    double totalRevenue = 0, totalDiscount = 0, totalReceived = 0;
    for (final k in keys) {
      final list = map[k]!;
      double rev = 0, disc = 0, rec = 0;
      for (final s in list) {
        rev += s.totalAmount;
        disc += s.discount + s.loyaltyDiscount;
        rec += s.paidAmount;
      }
      totalRevenue += rev;
      totalDiscount += disc;
      totalReceived += rec;
      rows.add(ReportRow([
        ReportCell(k, align: ReportCellAlign.center),
        ReportCell('${list.length}', align: ReportCellAlign.right),
        ReportCell(formatMoney(rev), align: ReportCellAlign.right),
        ReportCell(formatMoney(disc), align: ReportCellAlign.right),
        ReportCell(formatMoney(rec), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO DOANH THU THEO NGÀY',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [14, 14, 26, 22, 26],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Số hóa đơn'),
          ReportHeaderCell('Doanh thu'),
          ReportHeaderCell('Giảm giá'),
          ReportHeaderCell('Thực thu'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalRevenue), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDiscount), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalReceived), align: ReportCellAlign.right, isBold: true),
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
  // 3) BÁO CÁO DOANH THU THEO THÁNG
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueByMonth({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSales();
    final items = await _allSalesItems();
    final costs = <int, double>{};
    for (final d in items) {
      final pid = d.product.value?.id;
      if (pid == null) continue;
      costs[pid] = (costs[pid] ?? 0) + d.costPrice * d.quantity;
    }

    final map = <int, List<TtSalesInvoice>>{};
    for (final s in sales) {
      if (s.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(s.saleDate, from, to)) continue;
      final key = s.saleDate.year * 100 + s.saleDate.month;
      map.putIfAbsent(key, () => []).add(s);
    }
    final keys = map.keys.toList()..sort();

    final rows = <ReportRow>[];
    double totalRevenue = 0, totalCost = 0, totalExpense = 0;
    final expenses = await _allExpenses();
    for (final k in keys) {
      final list = map[k]!;
      double rev = 0, giftCost = 0;
      for (final s in list) {
        rev += s.totalAmount;
        // Giá vốn theo dòng bán trong tháng này
        for (final d in items) {
          if (d.invoice.value?.id == s.id) {
            giftCost += d.costPrice * d.quantity;
          }
        }
      }
      double exp = 0;
      for (final e in expenses) {
        if ((e.date.year * 100 + e.date.month) == k) exp += e.amount;
      }
      totalRevenue += rev;
      totalCost += giftCost;
      totalExpense += exp;
      final label = '${(k % 100).toString().padLeft(2, '0')}/${k ~/ 100}';
      rows.add(ReportRow([
        ReportCell(label, align: ReportCellAlign.center),
        ReportCell('${list.length}', align: ReportCellAlign.right),
        ReportCell(formatMoney(rev), align: ReportCellAlign.right),
        ReportCell(formatMoney(giftCost), align: ReportCellAlign.right),
        ReportCell(formatMoney(rev - giftCost), align: ReportCellAlign.right),
        ReportCell(formatMoney(exp), align: ReportCellAlign.right),
        ReportCell(formatMoney(rev - giftCost - exp), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO DOANH THU THEO THÁNG',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ tháng ${formatDate(from)} đến tháng ${formatDate(to)}'],
      columnFlex: const [12, 12, 18, 18, 18, 16, 18],
      headerRows: const [
        [
          ReportHeaderCell('Tháng'),
          ReportHeaderCell('Số HĐ'),
          ReportHeaderCell('Doanh thu'),
          ReportHeaderCell('Giá vốn'),
          ReportHeaderCell('Lãi gộp'),
          ReportHeaderCell('Chi phí'),
          ReportHeaderCell('Lãi ròng'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalRevenue), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalCost), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRevenue - totalCost), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalExpense), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRevenue - totalCost - totalExpense), align: ReportCellAlign.right, isBold: true),
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
  // 4) BÁO CÁO DOANH THU THEO SẢN PHẨM
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueByProduct({
    required DateTime from,
    required DateTime to,
  }) async {
    final items = await _allSalesItems();
    final map = <int, List<TtSalesItem>>{};
    for (final d in items) {
      final inv = d.invoice.value;
      if (inv == null || inv.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(inv.saleDate, from, to)) continue;
      final pid = d.product.value?.id ?? -1;
      map.putIfAbsent(pid, () => []).add(d);
    }

    // Sắp xếp theo doanh thu giảm dần (giá trị số, không phải chuỗi format)
    final data = <({String name, double qty, double rev, double cost})>[];
    double totalQty = 0, totalRevenue = 0, totalCost = 0;
    for (final e in map.entries) {
      final name = e.value.first.product.value?.name ?? '(Đã xóa)';
      double qty = 0, rev = 0, cost = 0;
      for (final d in e.value) {
        qty += d.quantity;
        rev += d.amount - d.discount;
        cost += d.costPrice * d.quantity;
      }
      totalQty += qty;
      totalRevenue += rev;
      totalCost += cost;
      data.add((name: name, qty: qty, rev: rev, cost: cost));
    }
    data.sort((a, b) => b.rev.compareTo(a.rev));
    final rows = <ReportRow>[];
    for (final d in data) {
      final gross = d.rev - d.cost;
      final margin = d.rev > 0 ? (gross / d.rev * 100) : 0;
      rows.add(ReportRow([
        ReportCell(d.name),
        ReportCell(formatQty(d.qty), align: ReportCellAlign.right),
        ReportCell(formatMoney(d.rev), align: ReportCellAlign.right),
        ReportCell(formatMoney(d.cost), align: ReportCellAlign.right),
        ReportCell(formatMoney(gross), align: ReportCellAlign.right),
        ReportCell('${margin.toStringAsFixed(1)}%', align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO DOANH THU THEO SẢN PHẨM',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [34, 12, 18, 18, 18, 14],
      headerRows: const [
        [
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Số lượng'),
          ReportHeaderCell('Doanh thu'),
          ReportHeaderCell('Giá vốn'),
          ReportHeaderCell('Lãi gộp'),
          ReportHeaderCell('Biên LN'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(formatQty(totalQty), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRevenue), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalCost), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRevenue - totalCost), align: ReportCellAlign.right, isBold: true),
          ReportCell('', align: ReportCellAlign.right),
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
  // 5) BÁO CÁO DOANH THU THEO KHÁCH HÀNG
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueByCustomer({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSales();
    final receipts = await _allReceipts();
    final map = <int, List<TtSalesInvoice>>{};
    for (final s in sales) {
      if (s.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(s.saleDate, from, to)) continue;
      final cid = s.customer.value?.id ?? -1;
      map.putIfAbsent(cid, () => []).add(s);
    }
    final recMap = <int, double>{};
    for (final r in receipts) {
      if (!_inRange(r.date, from, to)) continue;
      final cid = r.customer.value?.id ?? -1;
      recMap[cid] = (recMap[cid] ?? 0) + r.amount;
    }

    final rows = <ReportRow>[];
    double totalRev = 0, totalRec = 0;
    final customers = await _allCustomers();
    final allIds = {...map.keys, ...recMap.keys};
    for (final cid in allIds) {
      final name = cid >= 0
          ? customers.where((c) => c.id == cid).map((c) => c.name).firstOrNull ?? '(Khách lẻ)'
          : '(Khách lẻ)';
      final list = map[cid] ?? [];
      final rev = list.fold<double>(0, (s, x) => s + x.totalAmount);
      final rec = recMap[cid] ?? 0;
      final debt = rev - rec;
      totalRev += rev;
      totalRec += rec;
      rows.add(ReportRow([
        ReportCell(name),
        ReportCell('${list.length}', align: ReportCellAlign.right),
        ReportCell(formatMoney(rev), align: ReportCellAlign.right),
        ReportCell(formatMoney(rec), align: ReportCellAlign.right),
        ReportCell(formatMoney(debt), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO DOANH THU THEO KHÁCH HÀNG',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [34, 12, 20, 20, 20],
      headerRows: const [
        [
          ReportHeaderCell('Khách hàng'),
          ReportHeaderCell('Số HĐ'),
          ReportHeaderCell('Doanh thu'),
          ReportHeaderCell('Đã thu'),
          ReportHeaderCell('Công nợ'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalRev), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRec), align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalRev - totalRec), align: ReportCellAlign.right, isBold: true),
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
  // 6) BÁO CÁO CHI PHÍ
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildExpenseByCategory({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _allExpenses();
    final map = <String, List<TtExpense>>{};
    for (final e in expenses) {
      if (!_inRange(e.date, from, to)) continue;
      map.putIfAbsent(e.category.value?.name ?? 'Chi phí khác', () => []).add(e);
    }
    final keys = map.keys.toList()..sort();

    // Tỷ lệ % so với TỔNG chi phí (tổng đúng, không phải tổng cộng dồn)
    final sums = {
      for (final k in keys) k: map[k]!.fold<double>(0, (s, e) => s + e.amount),
    };
    final total = sums.values.fold<double>(0, (a, b) => a + b);
    final rows = <ReportRow>[];
    for (final k in keys) {
      final sum = sums[k]!;
      final pct = total > 0 ? (sum / total * 100) : 0;
      rows.add(ReportRow([
        ReportCell(k),
        ReportCell(formatMoney(sum), align: ReportCellAlign.right),
        ReportCell('${pct.toStringAsFixed(1)}%', align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO CHI PHÍ',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [46, 32, 24],
      headerRows: const [
        [
          ReportHeaderCell('Nhóm chi phí'),
          ReportHeaderCell('Số tiền'),
          ReportHeaderCell('Tỷ lệ %'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true),
          ReportCell('100%', align: ReportCellAlign.right, isBold: true),
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
  // 7) NHẬP - XUẤT - TỒN TỔNG HỢP
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final lots = await _allLots();
    final movements = await _allMovements();

    // Tồn đầu kỳ: tổng nhập trước from - xuất trước from (theo lô)
    final openMap = <int, double>{};
    final inMap = <int, double>{};
    final outMap = <int, double>{};
    for (final m in movements) {
      final pid = m.product.value?.id ?? -1;
      if (m.createdAt.isBefore(from)) {
        openMap[pid] = (openMap[pid] ?? 0) + m.quantity;
      } else if (!m.createdAt.isAfter(to)) {
        if (m.quantity >= 0) {
          inMap[pid] = (inMap[pid] ?? 0) + m.quantity;
        } else {
          outMap[pid] = (outMap[pid] ?? 0) + m.quantity.abs();
        }
      }
    }

    final productIds = <int>{...openMap.keys, ...inMap.keys, ...outMap.keys, ...lots.map((l) => l.product.value?.id ?? -1)};
    final products = await _allProducts();
    final priceMap = {for (final p in products) p.id: p.defaultPurchasePrice};

    final rows = <ReportRow>[];
    double totalValue = 0;
    for (final pid in productIds) {
      final name = products.where((p) => p.id == pid).map((p) => p.name).firstOrNull ?? '(Đã xóa)';
      final open = openMap[pid] ?? 0;
      final cin = inMap[pid] ?? 0;
      final cout = outMap[pid] ?? 0;
      final close = open + cin - cout;
      final price = (priceMap[pid] ?? 0).toDouble();
      final value = close * price;
      totalValue += value;
      if (close == 0 && open == 0 && cin == 0 && cout == 0) continue;
      rows.add(ReportRow([
        ReportCell(name),
        ReportCell(formatQty(open), align: ReportCellAlign.right),
        ReportCell(formatQty(cin), align: ReportCellAlign.right),
        ReportCell(formatQty(cout), align: ReportCellAlign.right),
        ReportCell(formatQty(close), align: ReportCellAlign.right),
        ReportCell(formatMoney(value), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP NHẬP - XUẤT - TỒN',
      titleSub: 'Đơn vị tính: kg/đơn vị quy đổi',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [34, 15, 15, 15, 15, 22],
      headerRows: const [
        [
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Tồn đầu'),
          ReportHeaderCell('Nhập'),
          ReportHeaderCell('Xuất'),
          ReportHeaderCell('Tồn cuối'),
          ReportHeaderCell('Giá trị tồn'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true),
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
  // 8) NHẬP - XUẤT - TỒN CHI TIẾT
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockDetail({
    required DateTime from,
    required DateTime to,
    String? productId,
  }) async {
    final movements = await _allMovements();

    final rows = <ReportRow>[];
    final balances = <int, double>{};
    double totalValue = 0;

    for (final m in movements) {
      final p = m.product.value;
      if (p == null) continue;
      if (productId != null && p.productId != productId) continue;
      if (!_inRange(m.createdAt, from, to)) continue;
      balances[p.id] = (balances[p.id] ?? 0) + m.quantity;
      final running = balances[p.id] ?? 0;
      final totalCost = m.unitCost * m.quantity.abs();
      rows.add(ReportRow([
        ReportCell(formatDate(m.createdAt), align: ReportCellAlign.center),
        ReportCell(m.referenceId.isNotEmpty ? m.referenceId : _shortId(m.movementId), align: ReportCellAlign.center),
        ReportCell(m.movementType.label),
        ReportCell(p.name),
        ReportCell(m.quantity >= 0 ? formatQty(m.quantity) : formatQty(m.quantity.abs()), align: ReportCellAlign.right),
        ReportCell(formatMoney(m.unitCost), align: ReportCellAlign.right),
        ReportCell(formatMoney(totalCost), align: ReportCellAlign.right),
        ReportCell(formatQty(running), align: ReportCellAlign.right),
      ]));
      totalValue += totalCost;
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CHI TIẾT NHẬP - XUẤT - TỒN',
      titleSub: productId == null ? 'Tất cả sản phẩm' : 'Theo sản phẩm',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [10, 12, 14, 18, 10, 12, 14, 12],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Chứng từ'),
          ReportHeaderCell('Loại giao dịch'),
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Số lượng'),
          ReportHeaderCell('Giá vốn'),
          ReportHeaderCell('Thành tiền'),
          ReportHeaderCell('Tồn sau'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
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
  // 9) CÔNG NỢ KHÁCH HÀNG — TỔNG HỢP
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCustomerDebtSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final customers = await _allCustomers();
    final sales = await _allSales();
    final receipts = await _allReceipts();

    final rows = <ReportRow>[];
    double totalEnd = 0;
    for (final c in customers) {
      double open = c.openingDebt;
      double buy = 0, paid = 0;
      for (final s in sales) {
        if (s.customer.value?.id == c.id) {
          if (s.saleDate.isBefore(from)) {
            open += s.debtAmount;
          } else if (!s.saleDate.isAfter(to)) {
            buy += s.debtAmount;
          }
        }
      }
      for (final r in receipts) {
        if (r.customer.value?.id == c.id && r.type == TtReceiptType.CUSTOMER_PAYMENT) {
          if (r.date.isBefore(from)) {
            open -= r.amount;
          } else if (!r.date.isAfter(to)) {
            paid += r.amount;
          }
        }
      }
      final end = open + buy - paid;
      totalEnd += end;
      if (open == 0 && buy == 0 && paid == 0 && end == 0) continue;
      rows.add(ReportRow([
        ReportCell(c.name),
        ReportCell(formatMoney(open), align: ReportCellAlign.right),
        ReportCell(formatMoney(buy), align: ReportCellAlign.right),
        ReportCell(formatMoney(paid), align: ReportCellAlign.right),
        ReportCell('', align: ReportCellAlign.right),
        ReportCell(formatMoney(end), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ TỔNG HỢP CÔNG NỢ KHÁCH HÀNG',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [34, 16, 16, 16, 10, 16],
      headerRows: const [
        [
          ReportHeaderCell('Khách hàng'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('Mua hàng'),
          ReportHeaderCell('Đã trả'),
          ReportHeaderCell(''),
          ReportHeaderCell('Nợ cuối kỳ'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalEnd), align: ReportCellAlign.right, isBold: true),
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
  // 10) CÔNG NỢ KHÁCH HÀNG — CHI TIẾT
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildCustomerDebtDetail({
    required DateTime from,
    required DateTime to,
    String? customerId,
  }) async {
    final customers = await _allCustomers();
    final sales = await _allSales();
    final receipts = await _allReceipts();

    final samples = customerId != null
        ? customers.where((c) => c.customerId == customerId).toList()
        : customers;

    final rows = <ReportRow>[];
    double grand = 0;
    for (final c in samples) {
      final tx = <({DateTime date, String code, String desc, double inUp, double outDown})>[
        for (final s in sales)
          if (s.customer.value?.id == c.id && !s.saleDate.isBefore(from) && !s.saleDate.isAfter(to))
            (
              date: s.saleDate,
              code: s.invoiceNumber,
              desc: 'Bán hàng ${s.invoiceNumber}',
              inUp: s.debtAmount,
              outDown: 0,
            ),
        for (final r in receipts)
          if (r.customer.value?.id == c.id && r.type == TtReceiptType.CUSTOMER_PAYMENT &&
              !r.date.isBefore(from) && !r.date.isAfter(to))
            (
              date: r.date,
              code: r.receiptNumber,
              desc: r.note.isNotEmpty ? r.note : 'Khách trả nợ',
              inUp: 0,
              outDown: r.amount,
            ),
      ]..sort((a, b) => a.date.compareTo(b.date));

      if (tx.isEmpty) continue;

      double opening = c.openingDebt;
      final allSales = sales.where((s) => s.customer.value?.id == c.id && s.saleDate.isBefore(from)).toList();
      final allRec = receipts
          .where((r) => r.customer.value?.id == c.id && r.type == TtReceiptType.CUSTOMER_PAYMENT && r.date.isBefore(from))
          .toList();
      opening += allSales.fold<double>(0, (s, x) => s + x.debtAmount) - allRec.fold<double>(0, (s, x) => s + x.amount);

      rows.add(ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        ReportCell('Khách hàng: ${c.name}', isBold: true),
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell(''),
      ], isSection: true));
      rows.add(ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        const ReportCell('Số dư đầu kỳ', isItalic: true),
        const ReportCell(''),
        const ReportCell(''),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right),
      ]));

      double running = opening;
      double inTotal = 0, outTotal = 0;
      for (final t in tx) {
        running += t.inUp - t.outDown;
        inTotal += t.inUp;
        outTotal += t.outDown;
        rows.add(ReportRow([
          ReportCell(formatDate(t.date), align: ReportCellAlign.center),
          ReportCell(t.code, align: ReportCellAlign.center),
          ReportCell(t.desc),
          ReportCell(t.inUp > 0 ? formatMoney(t.inUp) : '', align: ReportCellAlign.right),
          ReportCell(t.outDown > 0 ? formatMoney(t.outDown) : '', align: ReportCellAlign.right),
          ReportCell(formatMoney(running), align: ReportCellAlign.right),
        ]));
      }
      rows.add(ReportRow([
        const ReportCell(''),
        const ReportCell(''),
        ReportCell('Cộng', isBold: true),
        ReportCell(formatMoney(inTotal), align: ReportCellAlign.right, isBold: true),
        ReportCell(formatMoney(outTotal), align: ReportCellAlign.right, isBold: true),
        ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
      ], isSection: true));
      grand += running;
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ CHI TIẾT CÔNG NỢ KHÁCH HÀNG',
      titleSub: customerId == null ? 'Tất cả khách hàng' : 'Theo khách hàng',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [10, 12, 32, 16, 16, 16],
      headerRows: const [
        [
          ReportHeaderCell('Ngày'),
          ReportHeaderCell('Chứng từ'),
          ReportHeaderCell('Diễn giải'),
          ReportHeaderCell('Tăng'),
          ReportHeaderCell('Giảm'),
          ReportHeaderCell('Số dư'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell(''),
          const ReportCell(''),
          ReportCell(formatMoney(grand), align: ReportCellAlign.right, isBold: true),
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
  // 11) CÔNG NỢ NHÀ CUNG CẤP
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildSupplierDebtSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final suppliers = await _allSuppliers();
    final purchases = await _allPurchases();
    final receipts = await _allReceipts();

    final rows = <ReportRow>[];
    double totalEnd = 0;
    for (final s in suppliers) {
      double open = s.openingDebt;
      double buy = 0, paid = 0;
      for (final p in purchases) {
        if (p.supplier.value?.id == s.id) {
          if (p.purchaseDate.isBefore(from)) {
            open += p.debtAmount;
          } else if (!p.purchaseDate.isAfter(to)) {
            buy += p.debtAmount;
          }
        }
      }
      for (final r in receipts) {
        if (r.supplier.value?.id == s.id && r.type == TtReceiptType.SUPPLIER_PAYMENT) {
          if (r.date.isBefore(from)) {
            open -= r.amount;
          } else if (!r.date.isAfter(to)) {
            paid += r.amount;
          }
        }
      }
      final end = open + buy - paid;
      totalEnd += end;
      if (open == 0 && buy == 0 && paid == 0 && end == 0) continue;
      rows.add(ReportRow([
        ReportCell(s.name),
        ReportCell(formatMoney(open), align: ReportCellAlign.right),
        ReportCell(formatMoney(buy), align: ReportCellAlign.right),
        ReportCell(formatMoney(paid), align: ReportCellAlign.right),
        ReportCell(formatMoney(end), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'SỔ TỔNG HỢP CÔNG NỢ NHÀ CUNG CẤP',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [36, 16, 16, 16, 16],
      headerRows: const [
        [
          ReportHeaderCell('Nhà cung cấp'),
          ReportHeaderCell('Nợ đầu kỳ'),
          ReportHeaderCell('Nhập hàng'),
          ReportHeaderCell('Đã thanh toán'),
          ReportHeaderCell('Nợ cuối kỳ'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalEnd), align: ReportCellAlign.right, isBold: true),
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
  // 12) BÁO CÁO LÃI / LỖ
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildProfitLoss({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSales();
    final items = await _allSalesItems();
    final expenses = await _allExpenses();

    double revenue = 0, cost = 0, operating = 0, waste = 0;
    for (final s in sales) {
      if (s.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(s.saleDate, from, to)) continue;
      revenue += s.totalAmount;
    }
    for (final d in items) {
      final inv = d.invoice.value;
      if (inv == null || inv.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(inv.saleDate, from, to)) continue;
      cost += d.costPrice * d.quantity;
    }
    for (final e in expenses) {
      if (!_inRange(e.date, from, to)) continue;
      final name = e.category.value?.name ?? '';
      if (name.contains('Hao hụt') || name.contains('hư hỏng')) {
        waste += e.amount;
      } else {
        operating += e.amount;
      }
    }

    final gross = revenue - cost;
    final net = gross - operating - waste;

    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1', align: ReportCellAlign.center),
        const ReportCell('Doanh thu thuần', isBold: true),
        const ReportCell(''),
        ReportCell(formatMoney(revenue), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2', align: ReportCellAlign.center),
        const ReportCell('Giá vốn hàng bán'),
        const ReportCell(''),
        ReportCell(formatMoney(cost), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3', align: ReportCellAlign.center),
        const ReportCell('Lãi gộp (1 - 2)', isBold: true),
        ReportCell(''),
        ReportCell(formatMoney(gross), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
      ReportRow([
        const ReportCell('4', align: ReportCellAlign.center),
        const ReportCell('Chi phí vận hành'),
        ReportCell(''),
        ReportCell(formatMoney(operating), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('5', align: ReportCellAlign.center),
        const ReportCell('Chi phí hao hụt / hư hỏng'),
        ReportCell(''),
        ReportCell(formatMoney(waste), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('', align: ReportCellAlign.center),
        const ReportCell('LỢI NHUẬN RÒNG (3 - 4 - 5)', isBold: true),
        ReportCell(''),
        ReportCell(formatMoney(net), align: ReportCellAlign.right, isBold: true),
      ], isSection: true),
    ];

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO LÃI / LỖ',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [6, 50, 20, 28],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Chỉ tiêu', align: ReportCellAlign.left),
          ReportHeaderCell(''),
          ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 13) CÂN ĐỐI DOANH THU - CHI PHÍ
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildRevenueExpenseBalance({
    required DateTime from,
    required DateTime to,
  }) async {
    final sales = await _allSales();
    final receipts = await _allReceipts();
    final expenses = await _allExpenses();

    double sell = 0, collect = 0, other = 0;
    for (final s in sales) {
      if (s.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(s.saleDate, from, to)) continue;
      sell += s.totalAmount;
    }
    for (final r in receipts) {
      if (!_inRange(r.date, from, to)) continue;
      if (r.type == TtReceiptType.CUSTOMER_PAYMENT) {
        collect += r.amount;
      } else if (r.type == TtReceiptType.SUPPLIER_PAYMENT) {
        collect -= r.amount;
      } else {
        other += r.amount;
      }
    }
    final totalIn = sell + collect + other;
    double purchase = 0, transport = 0, rent = 0, utility = 0, labor = 0, waste = 0, otherCost = 0;
    for (final e in expenses) {
      if (!_inRange(e.date, from, to)) continue;
      switch (e.category.value?.name ?? '') {
        case 'Nhập hàng':
          purchase += e.amount;
        case 'Vận chuyển':
          transport += e.amount;
        case 'Thuê sạp':
          rent += e.amount;
        case 'Điện':
        case 'Nước':
          utility += e.amount;
        case 'Nhân công':
          labor += e.amount;
        case 'Hao hụt/hư hỏng':
          waste += e.amount;
        default:
          otherCost += e.amount;
      }
    }
    final totalCost = purchase + transport + rent + utility + labor + waste + otherCost;
    final diff = totalIn - totalCost;

    final rows = <ReportRow>[
      ReportRow([const ReportCell('I', align: ReportCellAlign.center), const ReportCell('DOANH THU', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell('', align: ReportCellAlign.right)], isSection: true),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Bán hàng'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(sell), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Thu công nợ'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(collect), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Thu khác'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(other), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Tổng thu', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(totalIn), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('II', align: ReportCellAlign.center), const ReportCell('CHI PHÍ', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell('', align: ReportCellAlign.right)], isSection: true),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Nhập hàng'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(purchase), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Vận chuyển'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(transport), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Thuê sạp'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(rent), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Điện nước'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(utility), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Nhân công'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(labor), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Hao hụt / hư hỏng'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(waste), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Chi khác'), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(otherCost), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Tổng chi', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(totalCost), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('III', align: ReportCellAlign.center), const ReportCell('KẾT QUẢ', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell('', align: ReportCellAlign.right)], isSection: true),
      ReportRow([const ReportCell('', align: ReportCellAlign.center), const ReportCell('Chênh lệch (Tổng thu - Tổng chi)', isBold: true), ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(diff), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'CÂN ĐỐI DOANH THU - CHI PHÍ',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [8, 52, 20, 24],
      headerRows: const [
        [
          ReportHeaderCell('', align: ReportCellAlign.center),
          ReportHeaderCell('Chỉ tiêu', align: ReportCellAlign.left),
          ReportHeaderCell(''),
          ReportHeaderCell('Số tiền'),
        ],
      ],
      rows: rows,
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 14) HÀNG TỒN CÓ NGUY CƠ HƯ HỎNG / HẠN SỬ DỤNG
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildExpiryRisk({
    required DateTime from,
    required DateTime to,
  }) async {
    final lots = await _allLots();
    final now = DateTime.now();

    final rows = <ReportRow>[];
    double totalValue = 0;
    for (final l in lots) {
      if (l.quantityRemaining <= 0) continue;
      final e = l.expiryDate;
      if (e == null) continue;
      final name = l.product.value?.name ?? '(Đã xóa)';
      // So theo ngày (không phải giờ) để lô quá hạn 1 ngày tính đúng là đã hết hạn
      final daysLeft = _dayStart(e).difference(_dayStart(now)).inDays;
      if (daysLeft > to.difference(from).inDays) continue;
      final value = l.quantityRemaining * l.unitCost;
      totalValue += value;
      final status = daysLeft < 0
          ? 'Đã hết hạn'
          : daysLeft == 0
              ? 'Hết hạn hôm nay'
              : 'Còn $daysLeft ngày';
      rows.add(ReportRow([
        ReportCell(name),
        ReportCell(l.lotNumber, align: ReportCellAlign.center),
        ReportCell(formatQty(l.quantityRemaining), align: ReportCellAlign.right),
        ReportCell(formatDate(e), align: ReportCellAlign.center),
        ReportCell(status),
        ReportCell(formatMoney(value), align: ReportCellAlign.right),
      ]));
    }
    rows.sort((a, b) => a.cells[3].text.compareTo(b.cells[3].text));

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO HÀNG TỒN NGUY CƠ HƯ HỎNG',
      titleSub: 'Cảnh báo hạn sử dụng theo lô hàng',
      subtitleLines: [
        'Thời điểm: ${formatDateTime(now)}',
        'Ngưỡng cảnh báo còn ${to.difference(from).inDays} ngày',
      ],
      columnFlex: const [26, 14, 12, 14, 16, 20],
      headerRows: const [
        [
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Lô'),
          ReportHeaderCell('Tồn'),
          ReportHeaderCell('Hạn sử dụng'),
          ReportHeaderCell('Trạng thái'),
          ReportHeaderCell('Giá trị'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true),
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
  // 15) HÀNG BÁN CHẠY / CHẬM BÁN
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildFastestSlowest({
    required DateTime from,
    required DateTime to,
    required bool fastest,
  }) async {
    final items = await _allSalesItems();
    final map = <int, double>{};
    final nameMap = <int, String>{};
    for (final d in items) {
      final inv = d.invoice.value;
      if (inv == null || inv.status == TtSaleStatus.CANCELLED) continue;
      if (!_inRange(inv.saleDate, from, to)) continue;
      final pid = d.product.value?.id ?? -1;
      map[pid] = (map[pid] ?? 0) + d.quantity;
      nameMap[pid] = d.product.value?.name ?? '(Đã xóa)';
    }

    final entries = map.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final selected = fastest ? entries : entries.reversed.toList();
    if (selected.length > 15) {
      selected.removeRange(15, selected.length);
    }

    final rows = <ReportRow>[];
    int stt = 0;
    for (final e in selected) {
      stt++;
      rows.add(ReportRow([
        ReportCell('$stt', align: ReportCellAlign.center),
        ReportCell(nameMap[e.key] ?? ''),
        ReportCell(formatQty(e.value), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: fastest
          ? 'BÁO CÁO HÀNG BÁN CHẠY'
          : 'BÁO CÁO HÀNG CHẬM BÁN',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Từ ngày ${formatDate(from)} đến ngày ${formatDate(to)}'],
      columnFlex: const [10, 60, 30],
      headerRows: const [
        [
          ReportHeaderCell('STT'),
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Số lượng bán'),
        ],
      ],
      rows: rows,
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 16) BÁO CÁO KIỂM KÊ
  // ---------------------------------------------------------------------------

  Future<CrystalReportModel> buildStockCountReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final lots = await _allLots();
    final products = await _allProducts();
    final map = <int, double>{};
    for (final l in lots) {
      final pid = l.product.value?.id ?? -1;
      map[pid] = (map[pid] ?? 0) + l.quantityRemaining;
    }

    final rows = <ReportRow>[];
    double totalValue = 0;
    for (final p in products) {
      if (p.deletedAt != null) continue;
      final qty = map[p.id] ?? 0;
      final value = qty * p.defaultPurchasePrice;
      totalValue += value;
      final minStock = p.minStock;
      final status = qty <= 0
          ? 'Hết hàng'
          : (minStock > 0 && qty < minStock ? 'Thiếu' : 'OK');
      rows.add(ReportRow([
        ReportCell(p.name),
        ReportCell(p.category.value?.name ?? '', align: ReportCellAlign.center),
        ReportCell(formatQty(qty), align: ReportCellAlign.right),
        ReportCell(formatQty(minStock), align: ReportCellAlign.right),
        ReportCell(formatMoney(value), align: ReportCellAlign.right),
        ReportCell(status, align: ReportCellAlign.center),
      ]));
    }

    return CrystalReportModel(
      formLine: _formS08,
      unitName: _unitName,
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'Mã số thuế: $_kTax',
      title: 'BÁO CÁO KIỂM KÊ TỒN KHO',
      titleSub: 'Sạp Rau - Củ - Quả',
      subtitleLines: ['Thời điểm kiểm kê: ${formatDateTime(from)}'],
      columnFlex: const [30, 14, 12, 12, 20, 12],
      headerRows: const [
        [
          ReportHeaderCell('Sản phẩm'),
          ReportHeaderCell('Nhóm'),
          ReportHeaderCell('Tồn kho'),
          ReportHeaderCell('Tồn tối thiểu'),
          ReportHeaderCell('Giá trị'),
          ReportHeaderCell('Trạng thái'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell('TỔNG CỘNG', isBold: true),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          const ReportCell('', align: ReportCellAlign.right),
          ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
        ], isSection: true),
      ],
      signature: const [
        ReportSignatureItem('Người lập biểu', '(Ký, họ tên)'),
        ReportSignatureItem('Kế toán trưởng', '(Ký, họ tên)'),
        ReportSignatureItem('Giám đốc', '(Ký, họ tên)'),
      ],
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}
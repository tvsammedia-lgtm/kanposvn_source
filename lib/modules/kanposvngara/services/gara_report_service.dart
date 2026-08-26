import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';
import '../models/gara_customer.dart';
import '../models/gara_finance.dart';
import '../models/gara_inventory.dart';
import '../models/gara_product.dart';
import '../models/gara_repair_order.dart';
import '../models/gara_supplier.dart';
import 'gara_isar_service.dart';

/// Xây dựng báo cáo cho module Gara — mô phỏng tất cả 20 báo cáo Crystal
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
///  - rpBill / rpBillForTax / rpBillForField:  Hóa đơn sửa chữa
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
class GaraReportService {
  final GaraIsarService _isar;

  GaraReportService(this._isar);

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
    final transactions = await db.garaFinanceTransactions.where().findAll();
    final orders = await db.garaRepairOrders.where().findAll();

    final receipts = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.RECEIPT &&
            t.transactionDate != null &&
            _inRange(t.transactionDate!, from, to))
        .fold<double>(0, (s, t) => s + t.amount);
    final payments = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.PAYMENT &&
            t.transactionDate != null &&
            _inRange(t.transactionDate!, from, to))
        .fold<double>(0, (s, t) => s + t.amount);

    final thuFromOrders = orders
        .where((o) =>
            (o.status == GaraOrderStatus.COMPLETED ||
                o.status == GaraOrderStatus.DELIVERED) &&
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to))
        .fold<double>(0, (s, o) => s + o.paidAmount);

    final openingReceipts = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.RECEIPT &&
            t.transactionDate != null &&
            t.transactionDate!.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingPayments = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.PAYMENT &&
            t.transactionDate != null &&
            t.transactionDate!.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingOrders = orders
        .where((o) =>
            (o.status == GaraOrderStatus.COMPLETED ||
                o.status == GaraOrderStatus.DELIVERED) &&
            o.orderDate != null &&
            o.orderDate!.isBefore(from))
        .fold<double>(0, (s, o) => s + o.paidAmount);

    final opening = openingOrders + openingReceipts - openingPayments;
    final totalThu = thuFromOrders + receipts;
    final totalChi = payments;
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
        const ReportCell('  Thu từ sửa chữa xe'),
        ReportCell(_money(thuFromOrders), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('2.2'),
        const ReportCell('  Thu khác (phiếu thu)'),
        ReportCell(_money(receipts), align: ReportCellAlign.right),
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
    final transactions = await db.garaFinanceTransactions.where().findAll();
    final orders = await db.garaRepairOrders.where().findAll();

    final openingReceipts = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.RECEIPT &&
            t.transactionDate != null &&
            t.transactionDate!.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingPayments = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.PAYMENT &&
            t.transactionDate != null &&
            t.transactionDate!.isBefore(from))
        .fold<double>(0, (s, t) => s + t.amount);
    final openingOrders = orders
        .where((o) =>
            (o.status == GaraOrderStatus.COMPLETED ||
                o.status == GaraOrderStatus.DELIVERED) &&
            o.orderDate != null &&
            o.orderDate!.isBefore(from))
        .fold<double>(0, (s, o) => s + o.paidAmount);
    var running = openingOrders + openingReceipts - openingPayments;

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];

    final filteredOrders = orders
        .where((o) =>
            (o.status == GaraOrderStatus.COMPLETED ||
                o.status == GaraOrderStatus.DELIVERED) &&
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to))
        .toList()
      ..sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

    final filteredTransactions = transactions
        .where((t) =>
            t.transactionDate != null && _inRange(t.transactionDate!, from, to))
        .toList()
      ..sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));

    int stt = 0;

    for (final o in filteredOrders) {
      stt++;
      running += o.paidAmount;
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTime(o.orderDate)),
        ReportCell('Thu sửa chữa ${o.orderCode}', isItalic: true),
        ReportCell(_money(o.paidAmount), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(_money(running), align: ReportCellAlign.right),
      ]));
    }

    for (final t in filteredTransactions) {
      stt++;
      final customer = t.customer.value;
      final supplier = t.supplier.value;
      final desc = '${t.description.isNotEmpty ? t.description : t.documentCode}'
          '${customer != null ? ' — KH: ${customer.name}' : ''}'
          '${supplier != null ? ' — NCC: ${supplier.name}' : ''}';

      if (t.type == GaraFinanceTransactionType.RECEIPT) {
        running += t.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(t.transactionDate)),
          ReportCell('Phiếu thu: $desc'),
          ReportCell(_money(t.amount), align: ReportCellAlign.right),
          const ReportCell(''),
          ReportCell(_money(running), align: ReportCellAlign.right),
        ]));
      } else {
        running -= t.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTime(t.transactionDate)),
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
    final products = await db.garaProducts.where().findAll();
    final inventoryTx = await db.garaInventoryTransactions.where().findAll();
    final orders = await db.garaRepairOrders.where().findAll();

    final flex = [4, 24, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    final parts = products.where((p) => p.type == GaraProductType.PART).toList();

    for (final prod in parts) {
      double nhap = 0, xuat = 0;

      for (final tx in inventoryTx) {
        if (tx.transactionDate == null || !_inRange(tx.transactionDate!, from, to)) continue;
        for (final d in tx.details) {
          if (d.product.value?.productId == prod.productId) {
            if (tx.type == GaraInventoryTransactionType.IMPORT) {
              nhap += d.quantity;
            } else {
              xuat += d.quantity;
            }
          }
        }
      }

      // Also count auto-export from repair orders
      for (final o in orders) {
        if (o.status == GaraOrderStatus.RECEPTION || o.orderDate == null) continue;
        if (!_inRange(o.orderDate!, from, to)) continue;
        for (final d in o.details) {
          final med = d.product.value;
          if (med != null && med.productId == prod.productId && med.type == GaraProductType.PART) {
            xuat += d.quantity;
          }
        }
      }

      final ton = prod.currentStock;
      final gtTon = ton * prod.retailPrice;
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${prod.name} (${prod.unit})'),
        ReportCell(formatQty(ton + xuat - nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton), align: ReportCellAlign.right),
        ReportCell(_money(prod.purchasePrice), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Tên phụ tùng / vật tư'),
          const ReportHeaderCell('Tồn đầu'),
          const ReportHeaderCell('Nhập'),
          const ReportHeaderCell('Xuất'),
          const ReportHeaderCell('Tồn cuối'),
          const ReportHeaderCell('Giá mua'),
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
          ReportCell(formatQty(totalTon), align: ReportCellAlign.right, isBold: true),
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
    final customers = await db.garaCustomers.where().findAll();
    final debtors = customers.where((c) => c.currentDebt > 0).toList()
      ..sort((a, b) => b.currentDebt.compareTo(a.currentDebt));

    final flex = [6, 28, 22, 16, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final c in debtors) {
      totalDebt += c.currentDebt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${c.name} (${c.phone})'),
        ReportCell(c.address),
        const ReportCell('KH'),
        ReportCell(_money(c.currentDebt), align: ReportCellAlign.right, isBold: true),
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
          const ReportHeaderCell('Địa chỉ'),
          const ReportHeaderCell('Loại'),
          const ReportHeaderCell('Công nợ (VNĐ)'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG KH NỢ', isBold: true),
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
  // 5) CÔNG NỢ NHÀ CUNG CẤP — TỔNG HỢP (rpSoTongHopThanhToanVoiNguoiBan)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtSummaryReport() async {
    final db = await _isar.db;
    final suppliers = await db.garaSuppliers.where().findAll();
    final debtors = suppliers.where((s) => s.currentDebt > 0).toList()
      ..sort((a, b) => b.currentDebt.compareTo(a.currentDebt));

    final flex = [6, 28, 22, 18, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in debtors) {
      totalDebt += s.currentDebt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone})'),
        ReportCell(s.address),
        const ReportCell('—'),
        ReportCell(_money(s.currentDebt), align: ReportCellAlign.right, isBold: true),
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
          const ReportHeaderCell('Số phiếu'),
          const ReportHeaderCell('Công nợ (VNĐ)'),
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
    final suppliers = await db.garaSuppliers.where().findAll();
    final inventoryTx = await db.garaInventoryTransactions.where().findAll();

    final flex = [6, 22, 14, 20, 14, 14];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in suppliers) {
      if (s.currentDebt <= 0) continue;
      totalDebt += s.currentDebt;

      final imports = inventoryTx
          .where((tx) =>
              tx.type == GaraInventoryTransactionType.IMPORT &&
              tx.transactionDate != null &&
              _inRange(tx.transactionDate!, from, to))
          .toList();

      double imported = 0;
      for (final tx in imports) {
        for (final d in tx.details) {
          imported += d.totalAmount;
        }
      }
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone})'),
        ReportCell(_date(s.updatedAt)),
        ReportCell(s.address),
        ReportCell(_money(imported), align: ReportCellAlign.right),
        ReportCell(_money(s.currentDebt), align: ReportCellAlign.right, isBold: true),
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
    final orders = await db.garaRepairOrders.where().findAll();
    final transactions = await db.garaFinanceTransactions.where().findAll();

    double doanhThu = 0;
    double giaVonPhuTung = 0;
    double chiPhiKhac = 0;

    for (final o in orders) {
      if (o.status == GaraOrderStatus.RECEPTION || o.orderDate == null) continue;
      if (!_inRange(o.orderDate!, from, to)) continue;
      doanhThu += o.totalAmount;
      for (final d in o.details) {
        final prod = d.product.value;
        if (prod != null && prod.type == GaraProductType.PART) {
          giaVonPhuTung += d.quantity * prod.purchasePrice;
        }
      }
    }

    for (final t in transactions) {
      if (t.type == GaraFinanceTransactionType.PAYMENT &&
          t.transactionDate != null &&
          _inRange(t.transactionDate!, from, to)) {
        chiPhiKhac += t.amount;
      }
    }

    final loiNhuanGop = doanhThu - giaVonPhuTung;
    final loiNhuanRong = loiNhuanGop - chiPhiKhac;

    final flex = [6, 42, 24];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Doanh thu sửa chữa', isBold: true),
        ReportCell(_money(doanhThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Giá vốn phụ tùng đã sử dụng'),
        ReportCell(_money(giaVonPhuTung), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Lợi nhuận gộp (1 − 2)', isBold: true),
        ReportCell(_money(loiNhuanGop), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Chi phí khác (lương, thuê, điện nước...)'),
        ReportCell(_money(chiPhiKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Lợi nhuận ròng (3 − 4)', isBold: true),
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
        [const ReportHeaderCell('STT'), const ReportHeaderCell('Diễn giải', align: ReportCellAlign.left), const ReportHeaderCell('Số tiền (VNĐ)')],
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
  // 8) HÓA ĐƠN SỬA CHỮA — TỔNG HỢP (rpBill / rpBillForTax)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSalesBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final orders = await db.garaRepairOrders.where().findAll();
    final filtered = orders
        .where((o) =>
            o.status != GaraOrderStatus.RECEPTION &&
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to))
        .toList()
      ..sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

    final flex = [6, 14, 12, 18, 12, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final o in filtered) {
      total += o.totalAmount;
      final customer = o.customer.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(o.orderCode),
        ReportCell(_dateTime(o.orderDate)),
        ReportCell(customer?.name ?? '—'),
        ReportCell(o.status.label),
        ReportCell(_money(o.paidAmount), align: ReportCellAlign.right),
        ReportCell(_money(o.totalAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HÓA ĐƠN SỬA CHỮA',
      titleSub: '(rpBill / rpBillForTax)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã phiếu'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Trạng thái'),
          const ReportHeaderCell('Đã thu'),
          const ReportHeaderCell('Tổng tiền'),
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
    final orders = await db.garaRepairOrders.where().findAll();
    final filtered = orders
        .where((o) =>
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to) &&
            o.subTotal > o.totalAmount)
        .toList()
      ..sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

    final flex = [6, 14, 12, 18, 16, 16, 16];
    final rows = <ReportRow>[];
    double totalDiscount = 0;

    for (final o in filtered) {
      final discount = o.subTotal - o.totalAmount;
      totalDiscount += discount;
      final customer = o.customer.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(o.orderCode),
        ReportCell(_dateTime(o.orderDate)),
        ReportCell(customer?.name ?? '—'),
        ReportCell(_money(o.subTotal), align: ReportCellAlign.right),
        ReportCell(_money(o.totalAmount), align: ReportCellAlign.right),
        ReportCell(_money(discount), align: ReportCellAlign.right, isBold: true),
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
          const ReportHeaderCell('Mã phiếu'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Khách hàng'),
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
    final transactions = await db.garaFinanceTransactions.where().findAll();
    final filtered = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.RECEIPT &&
            t.transactionDate != null &&
            _inRange(t.transactionDate!, from, to))
        .toList()
      ..sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));

    final flex = [6, 16, 14, 28, 18, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final t in filtered) {
      total += t.amount;
      final customer = t.customer.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(t.documentCode.isNotEmpty ? t.documentCode : t.transactionId),
        ReportCell(_dateTime(t.transactionDate)),
        ReportCell('${t.description.isNotEmpty ? t.description : '—'}${customer != null ? ' — KH: ${customer.name}' : ''}'),
        ReportCell(t.customer.value?.name ?? '—'),
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
          const ReportHeaderCell('Khách hàng'),
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
          ReportCell('${filtered.length} phiếu', align: ReportCellAlign.right, isBold: true),
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
    final inventoryTx = await db.garaInventoryTransactions.where().findAll();
    final filtered = inventoryTx
        .where((tx) =>
            tx.type == GaraInventoryTransactionType.IMPORT &&
            tx.transactionDate != null &&
            _inRange(tx.transactionDate!, from, to))
        .toList()
      ..sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));

    final flex = [6, 16, 14, 24, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final tx in filtered) {
      double txTotal = 0;
      for (final d in tx.details) {
        txTotal += d.totalAmount;
      }
      total += txTotal;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(tx.documentCode.isNotEmpty ? tx.documentCode : tx.transactionId),
        ReportCell(_dateTime(tx.transactionDate)),
        ReportCell('${tx.details.length} mặt hàng'),
        ReportCell(_money(txTotal), align: ReportCellAlign.right),
        ReportCell(_money(txTotal), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Tổng tiền'),
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
  // 12) XUẤT KHO THEO CA (rpOutputFromShift)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final orders = await db.garaRepairOrders.where().findAll();

    final flex = [6, 14, 12, 22, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    final filtered = orders
        .where((o) =>
            o.status != GaraOrderStatus.RECEPTION &&
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to))
        .toList()
      ..sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

    for (final o in filtered) {
      for (final d in o.details) {
        final prod = d.product.value;
        if (prod == null || prod.type != GaraProductType.PART) continue;
        totalSL += d.quantity;
        totalGT += d.total;
        rows.add(ReportRow([
          ReportCell('${rows.length + 1}'),
          ReportCell(_dateTime(o.orderDate)),
          ReportCell(o.orderCode),
          ReportCell(prod.name),
          ReportCell(formatQty(d.quantity), align: ReportCellAlign.right),
          ReportCell(_money(prod.purchasePrice), align: ReportCellAlign.right),
          ReportCell(_money(d.unitPrice), align: ReportCellAlign.right),
          ReportCell(_money(d.total), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO PHIẾU SỬA CHỮA',
      titleSub: '(rpOutputFromShift)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Mã phiếu'),
          const ReportHeaderCell('Phụ tùng'),
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
  // 13) XUẤT KHO THEO KHO (rpOutputByStock)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByStockReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final products = await db.garaProducts.where().findAll();
    final orders = await db.garaRepairOrders.where().findAll();

    final flex = [4, 24, 12, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    final parts = products.where((p) => p.type == GaraProductType.PART).toList();

    for (final prod in parts) {
      double sl = 0, gt = 0;
      for (final o in orders) {
        if (o.status == GaraOrderStatus.RECEPTION || o.orderDate == null) continue;
        if (!_inRange(o.orderDate!, from, to)) continue;
        for (final d in o.details) {
          if (d.product.value?.productId == prod.productId) {
            sl += d.quantity;
            gt += d.total;
          }
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${prod.name} (${prod.unit})'),
        ReportCell(_money(prod.purchasePrice), align: ReportCellAlign.right),
        ReportCell(_money(prod.retailPrice), align: ReportCellAlign.right),
        ReportCell(formatQty(sl), align: ReportCellAlign.right),
        ReportCell(_money(gt), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'XUẤT KHO THEO TỪNG PHỤ TÙNG',
      titleSub: '(rpOutputByStock)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Phụ tùng'),
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
    final products = await db.garaProducts.where().findAll();

    final flex = [6, 26, 12, 14, 14, 16];
    final rows = <ReportRow>[];

    for (final prod in products) {
      if (prod.type != GaraProductType.PART || prod.currentStock <= 0) continue;
      final gtTon = prod.currentStock * prod.purchasePrice;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${prod.name} (${prod.unit})'),
        ReportCell(formatQty(prod.currentStock), align: ReportCellAlign.right),
        ReportCell(_money(prod.purchasePrice), align: ReportCellAlign.right),
        ReportCell(_money(prod.retailPrice), align: ReportCellAlign.right),
        ReportCell(_money(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HAO HỤT PHỤ TÙNG / VẬT TƯ',
      titleSub: '(rpBaoCaoHaoHutNguyenVatLieuHangHoa)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Tên phụ tùng'),
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
    final transactions = await db.garaFinanceTransactions.where().findAll();
    final filtered = transactions
        .where((t) =>
            t.type == GaraFinanceTransactionType.PAYMENT &&
            t.transactionDate != null &&
            _inRange(t.transactionDate!, from, to))
        .toList()
      ..sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));

    final flex = [6, 16, 14, 24, 18, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final t in filtered) {
      total += t.amount;
      final supplier = t.supplier.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(t.documentCode.isNotEmpty ? t.documentCode : t.transactionId),
        ReportCell(_dateTime(t.transactionDate)),
        ReportCell('${t.description.isNotEmpty ? t.description : '—'}${supplier != null ? ' — NCC: ${supplier.name}' : ''}'),
        ReportCell(supplier?.name ?? '—'),
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
          const ReportHeaderCell('Nhà CC'),
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
          ReportCell('${filtered.length} phiếu', align: ReportCellAlign.right, isBold: true),
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
    final orders = await db.garaRepairOrders.where().findAll();
    final filtered = orders
        .where((o) =>
            o.status != GaraOrderStatus.RECEPTION &&
            o.orderDate != null &&
            _inRange(o.orderDate!, from, to) &&
            o.paidAmount > 0)
        .toList()
      ..sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

    final flex = [6, 14, 12, 22, 16, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final o in filtered) {
      total += o.paidAmount;
      final customer = o.customer.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(o.orderCode),
        ReportCell(_dateTime(o.orderDate)),
        ReportCell(customer?.name ?? '—'),
        ReportCell(_money(o.totalAmount), align: ReportCellAlign.right),
        ReportCell(_money(o.paidAmount), align: ReportCellAlign.right),
        ReportCell(_money(o.totalAmount - o.paidAmount), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Mã phiếu'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Tổng tiền'),
          const ReportHeaderCell('Đã thu'),
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
}

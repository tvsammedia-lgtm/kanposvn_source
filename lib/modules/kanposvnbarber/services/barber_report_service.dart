import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';
import '../models/barber_invoice.dart';
import '../models/barber_invoice_detail.dart';
import '../models/barber_expense.dart';
import '../models/barber_inventory_transaction.dart';
import '../models/barber_customer.dart';
import '../models/barber_supplier.dart';
import '../models/barber_product.dart';
import '../models/barber_employee.dart';
import '../models/barber_service.dart';

/// Xây dựng báo cáo cho module Barber — mô phỏng tất cả 20 báo cáo Crystal
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
class BarberReportService {
  final Isar _isar;

  BarberReportService(this._isar);

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
    final invoices = await _isar.barberInvoices.where().findAll();
    final expenses = await _isar.barberExpenses.where().findAll();

    final thuTuBanHang = invoices
        .where((i) =>
            i.status == 'Đã thanh toán' &&
            _inRange(i.createdAt, from, to))
        .fold<double>(0, (s, i) => s + i.total);

    final chiPhi = expenses
        .where((e) => _inRange(e.createdAt, from, to))
        .fold<double>(0, (s, e) => s + e.amount);

    final openingThu = invoices
        .where((i) => i.status == 'Đã thanh toán' && i.createdAt.isBefore(from))
        .fold<double>(0, (s, i) => s + i.total);
    final openingChi = expenses
        .where((e) => e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);

    final opening = openingThu - openingChi;
    final closing = opening + thuTuBanHang - chiPhi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        ReportCell(_money(opening), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Tổng thu trong kỳ (bán hàng)', isBold: true),
        ReportCell(_money(thuTuBanHang), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Tổng chi trong kỳ (phí vận hành)', isBold: true),
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
    final invoices = await _isar.barberInvoices.where().findAll();
    final expenses = await _isar.barberExpenses.where().findAll();

    final openingThu = invoices
        .where((i) => i.status == 'Đã thanh toán' && i.createdAt.isBefore(from))
        .fold<double>(0, (s, i) => s + i.total);
    final openingChi = expenses
        .where((e) => e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    var running = openingThu - openingChi;

    final filteredInvoices = invoices
        .where((i) => i.status == 'Đã thanh toán' && _inRange(i.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final filteredExpenses = expenses
        .where((e) => _inRange(e.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];
    int stt = 0;

    for (final i in filteredInvoices) {
      stt++;
      running += i.total;
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTime(i.createdAt)),
        ReportCell('Thu bán hàng: ${i.customerName ?? i.invoiceId}'),
        ReportCell(_money(i.total), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(_money(running), align: ReportCellAlign.right),
      ]));
    }

    for (final e in filteredExpenses) {
      stt++;
      running -= e.amount;
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTime(e.createdAt)),
        ReportCell('Chi: ${e.category.isNotEmpty ? e.category : e.description}'),
        const ReportCell(''),
        ReportCell(_money(e.amount), align: ReportCellAlign.right),
        ReportCell(_money(running), align: ReportCellAlign.right),
      ]));
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
  // 3) XUẤT NHẬP TỒN KHO (rpBaoCaoTongHopXuatNhapTonVatTu) ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildInventoryReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.barberProducts.where().findAll();
    final txs = await _isar.barberInventoryTransactions.where().findAll();

    final flex = [4, 22, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    for (final p in products) {
      double nhap = 0, xuat = 0;
      for (final tx in txs) {
        if (!_inRange(tx.createdAt, from, to)) continue;
        if (tx.productId == p.productId) {
          if (tx.type == 'IMPORT') { nhap += tx.quantity.toDouble(); }
          else { xuat += tx.quantity.toDouble(); }
        }
      }
      final ton = p.stock;
      final gtTon = ton * p.purchasePrice;
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category})'),
        ReportCell(formatQty((ton + xuat - nhap).toDouble()), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(p.purchasePrice), align: ReportCellAlign.right),
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
  // 4) CÔNG NỢ KHÁCH HÀNG ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildCustomerDebtReport() async {
    final customers = await _isar.barberCustomers.where().findAll();
    final debtors = customers.where((c) => c.totalSpent > 0).toList()
      ..sort((a, b) => b.totalSpent.compareTo(a.totalSpent));

    final flex = [6, 26, 18, 16, 14, 20];
    final rows = <ReportRow>[];
    double totalSpent = 0;

    for (final c in debtors) {
      totalSpent += c.totalSpent;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${c.name} (${c.phone})'),
        ReportCell(_money(c.totalSpent), align: ReportCellAlign.right),
        ReportCell('${c.rewardPoints} điểm'),
        ReportCell(_date(c.lastVisit)),
        ReportCell(c.gender ?? '—'),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO CÔNG NỢ KHÁCH HÀNG',
      titleSub: 'Tổng chi tiêu theo khách hàng',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Họ tên / SĐT'),
          const ReportHeaderCell('Tổng chi'),
          const ReportHeaderCell('Điểm'),
          const ReportHeaderCell('Lần cuối'),
          const ReportHeaderCell('Giới tính'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(_money(totalSpent), align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          ReportCell('${debtors.length} KH', align: ReportCellAlign.right, isBold: true),
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
  // 5) CÔNG NỢ NCC — TỔNG HỢP (rpSoTongHopThanhToanVoiNguoiBan) ★ SPECIAL
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtSummaryReport() async {
    final suppliers = await _isar.barberSuppliers.where().findAll();
    final debtors = suppliers.where((s) => s.currentDebt > 0).toList()
      ..sort((a, b) => b.currentDebt.compareTo(a.currentDebt));

    final flex = [6, 26, 22, 18, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in debtors) {
      totalDebt += s.currentDebt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone ?? "—"})'),
        ReportCell(s.address ?? '—'),
        ReportCell(_money(s.totalPurchase), align: ReportCellAlign.right),
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
  // 6) CÔNG NỢ NCC — CHI TIẾT (rpSoChiTietThanhToanNguoiBan) ★ SPECIAL
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildSupplierDebtDetailReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final suppliers = await _isar.barberSuppliers.where().findAll();
    final txs = await _isar.barberInventoryTransactions.where().findAll();

    final flex = [6, 22, 14, 22, 16, 16];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in suppliers) {
      if (s.currentDebt <= 0) continue;
      totalDebt += s.currentDebt;

      final imports = txs
          .where((tx) =>
              tx.type == 'IMPORT' &&
              tx.supplierName == s.name &&
              _inRange(tx.createdAt, from, to))
          .toList();

      double imported = imports.fold(0, (sum, tx) => sum + tx.totalCost);

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone ?? "—"})'),
        ReportCell(_date(s.createdAt)),
        ReportCell(s.address ?? '—'),
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
  // 7) LÃI LỖ (rpS10DN) ★ SPECIAL ATTENTION
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildProfitLossReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final invoices = await _isar.barberInvoices.where().findAll();
    final details = await _isar.barberInvoiceDetails.where().findAll();
    final expenses = await _isar.barberExpenses.where().findAll();
    final employees = await _isar.barberEmployees.where().findAll();
    final services = await _isar.barberServices.where().findAll();

    double doanhThuDichVu = 0;
    double doanhThuSanPham = 0;
    double giaVonSP = 0;
    double tongHoaHong = 0;
    double chiPhiVanHanh = 0;

    for (final i in invoices) {
      if (i.status != 'Đã thanh toán' || !_inRange(i.createdAt, from, to)) continue;
    }

    final invoiceIds = invoices
        .where((i) => i.status == 'Đã thanh toán' && _inRange(i.createdAt, from, to))
        .map((i) => i.invoiceId)
        .toSet();

    for (final d in details) {
      if (!invoiceIds.contains(d.invoiceId)) continue;
      if (d.itemType == 'Service') {
        doanhThuDichVu += d.total;
      } else {
        doanhThuSanPham += d.total;
      }
      giaVonSP += d.quantity * d.unitPrice * 0.6;
    }

    final empMap = {for (final e in employees) e.employeeId: e};
    final serviceMap = {for (final s in services) s.serviceId: s};
    for (final d in details) {
      if (!invoiceIds.contains(d.invoiceId) || d.itemType != 'Service') continue;
      final emp = empMap[d.employeeId];
      final svc = serviceMap[d.itemId];
      if (emp != null && svc != null) {
        if (svc.isFixedCommission) {
          tongHoaHong += svc.commissionRate;
        } else {
          tongHoaHong += d.total * svc.commissionRate / 100;
        }
      }
    }

    for (final e in expenses) {
      if (_inRange(e.createdAt, from, to)) {
        chiPhiVanHanh += e.amount;
      }
    }

    final doanhThu = doanhThuDichVu + doanhThuSanPham;
    final loiNhuanGop = doanhThu - giaVonSP;
    final loiNhuanRong = loiNhuanGop - tongHoaHong - chiPhiVanHanh;

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
        const ReportCell('  Dịch vụ (cắt, gội, nhuộm...)'),
        ReportCell(_money(doanhThuDichVu), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('1.2'),
        const ReportCell('  Sản phẩm (mỹ phẩm, gel...)'),
        ReportCell(_money(doanhThuSanPham), align: ReportCellAlign.right),
        const ReportCell(''),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Giá vốn hàng bán (COGS)'),
        const ReportCell(''),
        ReportCell(_money(giaVonSP), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Lợi nhuận gộp (1 − 2)', isBold: true),
        const ReportCell(''),
        ReportCell(_money(loiNhuanGop), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Chi phí hoa hồng thợ'),
        const ReportCell(''),
        ReportCell(_money(tongHoaHong), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Chi phí vận hành khác'),
        const ReportCell(''),
        ReportCell(_money(chiPhiVanHanh), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('6'),
        const ReportCell('Lợi nhuận ròng (3 − 4 − 5)', isBold: true),
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
    final invoices = await _isar.barberInvoices.where().findAll();
    final filtered = invoices
        .where((i) => i.status == 'Đã thanh toán' && _inRange(i.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 14, 12, 18, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final i in filtered) {
      total += i.total;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(i.customerName ?? i.invoiceId),
        ReportCell(_dateTime(i.createdAt)),
        ReportCell(i.paymentMethod),
        ReportCell(_money(i.subTotal), align: ReportCellAlign.right),
        ReportCell(_money(i.discount), align: ReportCellAlign.right),
        ReportCell(_money(i.total), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Thanh toán'),
          const ReportHeaderCell('Tổng tiền'),
          const ReportHeaderCell('Giảm giá'),
          const ReportHeaderCell('Thực thu'),
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
    final invoices = await _isar.barberInvoices.where().findAll();
    final filtered = invoices
        .where((i) =>
            i.status == 'Đã thanh toán' &&
            _inRange(i.createdAt, from, to) &&
            i.discount > 0)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 14, 12, 18, 16, 16, 16];
    final rows = <ReportRow>[];
    double totalDiscount = 0;

    for (final i in filtered) {
      totalDiscount += i.discount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(i.customerName ?? i.invoiceId),
        ReportCell(_dateTime(i.createdAt)),
        ReportCell(i.paymentMethod),
        ReportCell(_money(i.subTotal), align: ReportCellAlign.right),
        ReportCell(_money(i.total), align: ReportCellAlign.right),
        ReportCell(_money(i.discount), align: ReportCellAlign.right, isBold: true),
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
          const ReportHeaderCell('Thanh toán'),
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
  // 10) GIẢM GIÁ TRÊN MÓN (rpBill_DiscountOnFoodOrDrink)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildDiscountOnItemReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final details = await _isar.barberInvoiceDetails.where().findAll();
    final invoices = await _isar.barberInvoices.where().findAll();

    final invoiceMap = {for (final i in invoices) i.invoiceId: i};

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final d in details) {
      final inv = invoiceMap[d.invoiceId];
      if (inv == null || inv.status != 'Đã thanh toán') continue;
      if (!_inRange(inv.createdAt, from, to)) continue;
      totalSL += d.quantity;
      totalGT += d.total;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(inv.customerName ?? inv.invoiceId),
        ReportCell(_dateTime(inv.createdAt)),
        ReportCell(d.itemName),
        ReportCell(formatQty(d.quantity), align: ReportCellAlign.right),
        ReportCell(_money(d.unitPrice), align: ReportCellAlign.right),
        ReportCell(_money(d.total), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'CHI TIẾT CÁC MẶT HÀNG ĐÃ BÁN',
      titleSub: '(rpBill_DiscountOnFoodOrDrink)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Khách / Mã'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Mặt hàng'),
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
          ReportCell(formatQty(totalSL), align: ReportCellAlign.right, isBold: true),
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
  // 11) BIÊN LAI (rpReceipt)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildReceiptReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final invoices = await _isar.barberInvoices.where().findAll();
    final filtered = invoices
        .where((i) => i.status == 'Đã thanh toán' && _inRange(i.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final i in filtered) {
      total += i.total;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(i.invoiceId),
        ReportCell(_dateTime(i.createdAt)),
        ReportCell('${i.customerName ?? "—"}: ${i.note ?? "—"}'),
        ReportCell(_money(i.total), align: ReportCellAlign.right),
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
  // 12) NHẬP KHO (rpInput / rpListInput)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildImportReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final txs = await _isar.barberInventoryTransactions.where().findAll();
    final filtered = txs
        .where((tx) => tx.type == 'IMPORT' && _inRange(tx.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final tx in filtered) {
      total += tx.totalCost;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(tx.transactionId.isNotEmpty ? tx.transactionId : tx.productId ?? '—'),
        ReportCell(_dateTime(tx.createdAt)),
        ReportCell('${tx.productName ?? "—"}${tx.supplierName != null ? ' — ${tx.supplierName}' : ''}'),
        ReportCell(formatQty(tx.quantity.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(tx.unitCost), align: ReportCellAlign.right),
        ReportCell(_money(tx.totalCost), align: ReportCellAlign.right),
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
  // 13) XUẤT KHO THEO PHIẾU (rpOutputFromShift)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByShiftReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final details = await _isar.barberInvoiceDetails.where().findAll();
    final invoices = await _isar.barberInvoices.where().findAll();

    final invoiceMap = {for (final i in invoices) i.invoiceId: i};

    final filtered = details.where((d) {
      final inv = invoiceMap[d.invoiceId];
      return inv != null && inv.status == 'Đã thanh toán' && _inRange(inv.createdAt, from, to);
    }).toList()..sort((a, b) {
      final invA = invoiceMap[a.invoiceId];
      final invB = invoiceMap[b.invoiceId];
      return (invB?.createdAt ?? DateTime(0)).compareTo(invA?.createdAt ?? DateTime(0));
    });

    final flex = [6, 14, 12, 22, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final d in filtered) {
      final inv = invoiceMap[d.invoiceId]!;
      totalSL += d.quantity;
      totalGT += d.total;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(_dateTime(inv.createdAt)),
        ReportCell(inv.customerName ?? inv.invoiceId),
        ReportCell(d.itemName),
        ReportCell(formatQty(d.quantity), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(_money(d.unitPrice), align: ReportCellAlign.right),
        ReportCell(_money(d.total), align: ReportCellAlign.right),
      ]));
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
  // 14) XUẤT KHO THEO MẶT HÀNG (rpOutputByStock)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildOutputByStockReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.barberProducts.where().findAll();
    final txs = await _isar.barberInventoryTransactions.where().findAll();

    final flex = [4, 24, 12, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final p in products) {
      double sl = 0, gt = 0;
      for (final tx in txs) {
        if (tx.type != 'EXPORT' || !_inRange(tx.createdAt, from, to)) continue;
        if (tx.productId == p.productId) {
          sl += tx.quantity.toDouble();
          gt += tx.totalCost;
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category})'),
        ReportCell(_money(p.purchasePrice), align: ReportCellAlign.right),
        ReportCell(_money(p.sellingPrice), align: ReportCellAlign.right),
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
  // 15) HAO HỤT (rpBaoCaoHaoHutNguyenVatLieuHangHoa)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildShrinkageReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final products = await _isar.barberProducts.where().findAll();

    final flex = [6, 24, 12, 14, 14, 16];
    final rows = <ReportRow>[];

    for (final p in products) {
      if (p.stock <= 0) continue;
      final gtTon = p.stock * p.purchasePrice;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.category})'),
        ReportCell(formatQty(p.stock.toDouble()), align: ReportCellAlign.right),
        ReportCell(_money(p.purchasePrice), align: ReportCellAlign.right),
        ReportCell(_money(p.sellingPrice), align: ReportCellAlign.right),
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
  // 16) THANH TOÁN NCC — THEO MÃ (rpPaymentByPaymentID)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentByPaymentIdReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _isar.barberExpenses.where().findAll();
    final filtered = expenses
        .where((e) => e.supplierId != null && _inRange(e.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 30, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final e in filtered) {
      total += e.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(e.expenseId.isNotEmpty ? e.expenseId : '—'),
        ReportCell(_dateTime(e.createdAt)),
        ReportCell('${e.supplierName ?? "—"}: ${e.description.isNotEmpty ? e.description : "—"}'),
        ReportCell(_money(e.amount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'PHIẾU CHI THEO MÃ THANH TOÁN NCC',
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
  // 17) THANH TOÁN CHO THU NGÂN (rpPaymentForCashier)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildPaymentForCashierReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final invoices = await _isar.barberInvoices.where().findAll();
    final filtered = invoices
        .where((i) => i.status == 'Đã thanh toán' && _inRange(i.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 14, 12, 22, 16, 16, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final i in filtered) {
      total += i.total;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(i.customerName ?? i.invoiceId),
        ReportCell(_dateTime(i.createdAt)),
        ReportCell(i.paymentMethod),
        ReportCell(_money(i.subTotal), align: ReportCellAlign.right),
        ReportCell(_money(i.discount), align: ReportCellAlign.right),
        ReportCell(_money(i.total), align: ReportCellAlign.right),
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
          const ReportHeaderCell('Thanh toán'),
          const ReportHeaderCell('Tổng cộng'),
          const ReportHeaderCell('Giảm giá'),
          const ReportHeaderCell('Thực thu'),
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
  // 18) DOANH THU THEO THỢ (rpBillForField)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildRevenueByEmployeeReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final employees = await _isar.barberEmployees.where().findAll();
    final details = await _isar.barberInvoiceDetails.where().findAll();
    final invoices = await _isar.barberInvoices.where().findAll();

    final invoiceMap = {for (final i in invoices) i.invoiceId: i};
    final filteredDetails = details.where((d) {
      final inv = invoiceMap[d.invoiceId];
      return inv != null && inv.status == 'Đã thanh toán' && _inRange(inv.createdAt, from, to);
    }).toList();

    final flex = [6, 20, 14, 14, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalHoaHong = 0;

    for (final emp in employees) {
      double doanhThu = 0, hoaHong = 0;
      int soKH = 0;
      final khSet = <String>{};
      for (final d in filteredDetails) {
        if (d.employeeId == emp.employeeId) {
          doanhThu += d.total;
          khSet.add(d.invoiceId);
          if (d.itemType == 'Service') {
            hoaHong += d.total * 0.1;
          }
        }
      }
      soKH = khSet.length;
      totalHoaHong += hoaHong;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(emp.name),
        ReportCell(emp.role),
        ReportCell(_money(doanhThu), align: ReportCellAlign.right),
        ReportCell('$soKH'),
        ReportCell(_money(hoaHong), align: ReportCellAlign.right),
        ReportCell(_money(doanhThu - hoaHong), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO DOANH THU THEO THỢ',
      titleSub: '(rpBillForField)',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Thợ'),
          const ReportHeaderCell('Chức vụ'),
          const ReportHeaderCell('Doanh thu'),
          const ReportHeaderCell('Số KH'),
          const ReportHeaderCell('Hoa hồng'),
          const ReportHeaderCell('Thực nhận'),
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
          ReportCell(_money(totalHoaHong), align: ReportCellAlign.right, isBold: true),
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
  // 19) DOANH THU THEO DỊCH VỤ (rpBillForField_IsNotUsed)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildRevenueByServiceReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final services = await _isar.barberServices.where().findAll();
    final details = await _isar.barberInvoiceDetails.where().findAll();
    final invoices = await _isar.barberInvoices.where().findAll();

    final invoiceMap = {for (final i in invoices) i.invoiceId: i};
    final filteredDetails = details.where((d) {
      final inv = invoiceMap[d.invoiceId];
      return inv != null && inv.status == 'Đã thanh toán' && _inRange(inv.createdAt, from, to);
    }).toList();

    final flex = [6, 22, 12, 14, 14, 14];
    final rows = <ReportRow>[];
    double totalSL = 0, totalGT = 0;

    for (final svc in services) {
      double sl = 0, gt = 0;
      for (final d in filteredDetails) {
        if (d.itemId == svc.serviceId) {
          sl += d.quantity;
          gt += d.total;
        }
      }
      if (sl <= 0) continue;
      totalSL += sl;
      totalGT += gt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(svc.name),
        ReportCell(_money(svc.price), align: ReportCellAlign.right),
        ReportCell(formatQty(sl), align: ReportCellAlign.right),
        ReportCell(_money(gt), align: ReportCellAlign.right),
        ReportCell('${(svc.commissionRate).toStringAsFixed(0)}${svc.isFixedCommission ? 'K' : '%'}'),
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
          const ReportHeaderCell('Số lượt'),
          const ReportHeaderCell('Doanh thu'),
          const ReportHeaderCell('HH'),
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
  // 20) PHIẾU CHI TIÊU (rpListInput + rp1111 chi tiết)
  // ═════════════════════════════════════════════════════════════════════════════
  Future<CrystalReportModel> buildExpenseListReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final expenses = await _isar.barberExpenses.where().findAll();
    final filtered = expenses
        .where((e) => _inRange(e.createdAt, from, to))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final flex = [6, 16, 14, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final e in filtered) {
      total += e.amount;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(e.expenseId.isNotEmpty ? e.expenseId : '—'),
        ReportCell(_dateTime(e.createdAt)),
        ReportCell('${e.category.isNotEmpty ? e.category : "—"}: ${e.description.isNotEmpty ? e.description : "—"}'),
        ReportCell(_money(e.amount), align: ReportCellAlign.right),
        ReportCell(e.paymentMethod),
        ReportCell(e.paidBy ?? '—'),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'DANH SÁCH PHIẾU CHI TIÊU',
      titleSub: 'Chi phí vận hành theo danh mục',
      subtitleLines: ['Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã CT'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Diễn giải'),
          const ReportHeaderCell('Số tiền'),
          const ReportHeaderCell('TT'),
          const ReportHeaderCell('Người chi'),
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

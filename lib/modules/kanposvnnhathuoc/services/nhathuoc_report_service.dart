import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';
import '../models/nhathuoc_expense.dart';
import '../models/nhathuoc_medicine.dart';
import '../models/nhathuoc_order.dart';
import '../models/nhathuoc_patient.dart';
import '../models/nhathuoc_purchase.dart';
import '../models/nhathuoc_supplier.dart';
import 'nhathuoc_isar_service.dart';

/// Xây dựng báo cáo cho module Nhà Thuốc — mô phỏng các báo cáo Crystal
/// (.rpt) từ KANCAFE / KANVLXD:
///
///  - rp1111 / rp1111_Detail: Quỹ tiền mặt (tổng hợp + chi tiết).
///  - rpBaoCaoTongHopXuatNhapTonVatTu: Xuất nhập tồn kho.
///  - rpSoTongHopThanhToanVoiNguoiBan / rpSoChiTietThanhToanNguoiBan:
///    Công nợ nhà cung cấp.
///  - Công nợ khách hàng (bệnh nhân bán nợ).
///  - rpS10DN: Lãi lỗ (doanh thu − chi phí).
///  - rpBill / rpBillForField: Hóa đơn bán hàng.
///  - rpInput / rpListInput: Phiếu nhập kho.
///  - rpBaoCaoHaoHutNguyenVatLieuHangHoa: Hao hụt thuốc.
class NhathuocReportService {
  final NhathuocIsarService _isar;

  NhathuocReportService(this._isar);

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

  // ---------------------------------------------------------------------------
  // 1) QUỸ TIỀN MẶT — TỔNG HỢP (rp1111)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildCashFundSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final expenses = await db.nhathuocExpenses.where().findAll();
    final orders = await db.nhathuocOrders.where().findAll();

    final thuFromExpenses = expenses
        .where((e) => e.type == ExpenseType.INCOME && _inRange(e.createdAt, from, to))
        .fold<double>(0, (s, e) => s + e.amount);
    final chiFromExpenses = expenses
        .where((e) => e.type == ExpenseType.EXPENSE && _inRange(e.createdAt, from, to))
        .fold<double>(0, (s, e) => s + e.amount);

    final thuFromOrders = orders
        .where((o) =>
            (o.status == NhathuocOrderStatus.COMPLETED) &&
            _inRange(o.orderDate ?? o.updatedAt, from, to))
        .fold<double>(0, (s, o) => s + o.totalAmount);

    final openingExpenses = expenses
        .where((e) => e.type == ExpenseType.INCOME && e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    final openingExpensesOut = expenses
        .where((e) => e.type == ExpenseType.EXPENSE && e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    final openingOrders = orders
        .where((o) =>
            o.status == NhathuocOrderStatus.COMPLETED &&
            (o.orderDate ?? o.updatedAt).isBefore(from))
        .fold<double>(0, (s, o) => s + o.totalAmount);

    final opening = openingOrders + openingExpenses - openingExpensesOut;
    final totalThu = thuFromOrders + thuFromExpenses;
    final totalChi = chiFromExpenses;
    final closing = opening + totalThu - totalChi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Số dư đầu kỳ', isBold: true),
        ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Tổng thu trong kỳ', isBold: true),
        ReportCell(formatMoney(totalThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2.1'),
        const ReportCell('  Thu từ bán hàng'),
        ReportCell(formatMoney(thuFromOrders), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('2.2'),
        const ReportCell('  Thu khác (phiếu thu)'),
        ReportCell(formatMoney(thuFromExpenses), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Tổng chi trong kỳ', isBold: true),
        ReportCell(formatMoney(totalChi), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Số dư cuối kỳ (1 + 2 − 3)', isBold: true),
        ReportCell(formatMoney(closing), align: ReportCellAlign.right, isBold: true),
      ]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO QUỸ TIỀN MẶT',
      titleSub: 'Tổng hợp thu chi (rp1111)',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('STT', colspan: 1), const ReportHeaderCell('Diễn giải', colspan: 1, align: ReportCellAlign.left), const ReportHeaderCell('Số tiền (VNĐ)', colspan: 1)],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG', isBold: true),
          ReportCell(formatMoney(closing), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2) QUỸ TIỀN MẶT — CHI TIẾT (rp1111_Detail)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildCashFundDetail({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final expenses = await db.nhathuocExpenses.where().findAll();
    final orders = await db.nhathuocOrders.where().findAll();

    final openingExpenses = expenses
        .where((e) => e.type == ExpenseType.INCOME && e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    final openingExpensesOut = expenses
        .where((e) => e.type == ExpenseType.EXPENSE && e.createdAt.isBefore(from))
        .fold<double>(0, (s, e) => s + e.amount);
    final openingOrders = orders
        .where((o) =>
            o.status == NhathuocOrderStatus.COMPLETED &&
            (o.orderDate ?? o.updatedAt).isBefore(from))
        .fold<double>(0, (s, o) => s + o.totalAmount);
    var running = openingOrders + openingExpenses - openingExpensesOut;

    final flex = [6, 14, 30, 16, 16, 16];
    final rows = <ReportRow>[];

    final filteredExpenses = expenses
        .where((e) => _inRange(e.createdAt, from, to))
        .toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final filteredOrders = orders
        .where((o) =>
            o.status == NhathuocOrderStatus.COMPLETED &&
            _inRange(o.orderDate ?? o.updatedAt, from, to))
        .toList()
      ..sort((a, b) => (a.orderDate ?? a.updatedAt).compareTo(b.orderDate ?? b.updatedAt));

    int stt = 0;

    for (final o in filteredOrders) {
      stt++;
      running += o.totalAmount;
      rows.add(ReportRow([
        ReportCell('$stt'),
        ReportCell(_dateTimeFmt.format(o.orderDate ?? o.updatedAt)),
        ReportCell('Thu từ bán hàng #${o.orderCode}', isItalic: true),
        ReportCell(formatMoney(o.totalAmount), align: ReportCellAlign.right),
        const ReportCell(''),
        ReportCell(formatMoney(running), align: ReportCellAlign.right),
      ]));
    }

    for (final e in filteredExpenses) {
      stt++;
      if (e.type == ExpenseType.INCOME) {
        running += e.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTimeFmt.format(e.createdAt)),
          ReportCell('${e.category.label}: ${e.description}'),
          ReportCell(formatMoney(e.amount), align: ReportCellAlign.right),
          const ReportCell(''),
          ReportCell(formatMoney(running), align: ReportCellAlign.right),
        ]));
      } else {
        running -= e.amount;
        rows.add(ReportRow([
          ReportCell('$stt'),
          ReportCell(_dateTimeFmt.format(e.createdAt)),
          ReportCell('${e.category.label}: ${e.description}'),
          const ReportCell(''),
          ReportCell(formatMoney(e.amount), align: ReportCellAlign.right),
          ReportCell(formatMoney(running), align: ReportCellAlign.right),
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
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
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
          ReportCell(formatMoney(running), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 3) XUẤT NHẬP TỒN KHO (rpBaoCaoTongHopXuatNhapTonVatTu)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildInventoryReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final medicines = await db.nhathuocMedicines.where().findAll();
    final purchases = await db.nhathuocPurchases.where().findAll();
    final orders = await db.nhathuocOrders.where().findAll();

    final flex = [4, 22, 10, 10, 10, 12, 12, 12];
    final rows = <ReportRow>[];
    double totalNhap = 0, totalXuat = 0, totalTon = 0, totalGT = 0;

    for (final med in medicines) {
      double nhap = 0, xuat = 0;
      for (final p in purchases) {
        if (p.purchaseDate == null || !_inRange(p.purchaseDate!, from, to)) continue;
        for (final d in p.details) {
          if (d.medicine.value?.medicineId == med.medicineId) {
            nhap += d.quantity;
          }
        }
      }
      for (final o in orders) {
        if (o.status == NhathuocOrderStatus.CANCELLED) continue;
        final od = o.orderDate ?? o.updatedAt;
        if (!_inRange(od, from, to)) continue;
        for (final d in o.details) {
          if (d.medicine.value?.medicineId == med.medicineId) {
            xuat += d.quantity;
          }
        }
      }

      final ton = med.currentStock;
      final gtTon = ton * med.retailPrice;
      totalNhap += nhap;
      totalXuat += xuat;
      totalTon += ton;
      totalGT += gtTon;

      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${med.name} (${med.unit})'),
        ReportCell(formatQty(med.currentStock + xuat - nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(nhap), align: ReportCellAlign.right),
        ReportCell(formatQty(xuat), align: ReportCellAlign.right),
        ReportCell(formatQty(ton), align: ReportCellAlign.right),
        ReportCell(formatMoney(med.retailPrice), align: ReportCellAlign.right),
        ReportCell(formatMoney(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO TỔNG HỢP XUẤT NHẬP TỒN VẬT TƯ',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Tên vật tư / thuốc'),
          const ReportHeaderCell('Tồn đầu'),
          const ReportHeaderCell('Nhập'),
          const ReportHeaderCell('Xuất'),
          const ReportHeaderCell('Tồn cuối'),
          const ReportHeaderCell('Đơn giá'),
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
          ReportCell(formatMoney(totalGT), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 4) CÔNG NỢ KHÁCH HÀNG (Bệnh nhân bán nợ)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildCustomerDebtReport() async {
    final db = await _isar.db;
    final patients = await db.nhathuocPatients.where().findAll();
    final debtors = patients.where((p) => p.currentDebt > 0).toList()
      ..sort((a, b) => b.currentDebt.compareTo(a.currentDebt));

    final flex = [6, 30, 20, 14, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final p in debtors) {
      totalDebt += p.currentDebt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${p.name} (${p.phone})'),
        ReportCell(p.address),
        ReportCell(formatQty(p.rewardPoints.toDouble()), align: ReportCellAlign.right),
        ReportCell(formatMoney(p.currentDebt), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO CÔNG NỢ KHÁCH HÀNG',
      titleSub: 'Danh sách bệnh nhân còn nợ (rpSoCongNoKH)',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Họ tên / SĐT'),
          const ReportHeaderCell('Địa chỉ'),
          const ReportHeaderCell('Điểm TL'),
          const ReportHeaderCell('Công nợ (VNĐ)'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG KHÁCH HÀNG NỢ', isBold: true),
          const ReportCell(''),
          ReportCell('${debtors.length} người', align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 5) CÔNG NỢ NHÀ CUNG CẤP (rpSoTongHopThanhToanVoiNguoiBan)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildSupplierDebtReport() async {
    final db = await _isar.db;
    final suppliers = await db.nhathuocSuppliers.where().findAll();
    final debtors = suppliers.where((s) => s.currentDebt > 0).toList()
      ..sort((a, b) => b.currentDebt.compareTo(a.currentDebt));

    final flex = [6, 28, 22, 22, 18];
    final rows = <ReportRow>[];
    double totalDebt = 0;

    for (final s in debtors) {
      totalDebt += s.currentDebt;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${s.name} (${s.phone})'),
        ReportCell(s.address),
        ReportCell(s.taxCode.isNotEmpty ? 'MST: ${s.taxCode}' : ''),
        ReportCell(formatMoney(s.currentDebt), align: ReportCellAlign.right, isBold: true),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'TỔNG HỢP CÔNG NỢ NHÀ CUNG CẤP',
      titleSub: 'Danh sách NCC còn nợ (rpSoTongHopThanhToanVoiNguoiBan)',
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Nhà cung cấp'),
          const ReportHeaderCell('Địa chỉ'),
          const ReportHeaderCell('Mã số thuế'),
          const ReportHeaderCell('Công nợ (VNĐ)'),
        ],
      ],
      rows: rows,
      totalRows: [
        ReportRow([
          const ReportCell(''),
          const ReportCell('TỔNG CỘNG NCC NỢ', isBold: true),
          const ReportCell(''),
          ReportCell('${debtors.length} nhà cung cấp', align: ReportCellAlign.right, isBold: true),
          ReportCell(formatMoney(totalDebt), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 6) LÃI LỖ (rpS10DN)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildProfitLossReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final expenses = await db.nhathuocExpenses.where().findAll();
    final orders = await db.nhathuocOrders.where().findAll();

    double doanhThu = 0;
    double giaVonBanHang = 0;
    double chiPhiKhac = 0;

    for (final o in orders) {
      if (o.status == NhathuocOrderStatus.CANCELLED) continue;
      final od = o.orderDate ?? o.updatedAt;
      if (!_inRange(od, from, to)) continue;
      doanhThu += o.totalAmount;
      for (final d in o.details) {
        final med = d.medicine.value;
        if (med != null) {
          giaVonBanHang += d.quantity * med.purchasePrice;
        }
      }
    }

    for (final e in expenses) {
      if (e.type == ExpenseType.EXPENSE && _inRange(e.createdAt, from, to)) {
        chiPhiKhac += e.amount;
      }
    }

    final loiNhuanGop = doanhThu - giaVonBanHang;
    final tongChiPhi = chiPhiKhac;
    final loiNhuanRong = loiNhuanGop - tongChiPhi;

    final flex = [6, 42, 24];
    final rows = <ReportRow>[
      ReportRow([
        const ReportCell('1'),
        const ReportCell('Doanh thu bán hàng', isBold: true),
        ReportCell(formatMoney(doanhThu), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('2'),
        const ReportCell('Giá vốn hàng bán (COGS)'),
        ReportCell(formatMoney(giaVonBanHang), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('3'),
        const ReportCell('Lợi nhuận gộp (1 − 2)', isBold: true),
        ReportCell(formatMoney(loiNhuanGop), align: ReportCellAlign.right, isBold: true),
      ]),
      ReportRow([
        const ReportCell('4'),
        const ReportCell('Chi phí khác (lương, thuê, điện nước...)'),
        ReportCell(formatMoney(chiPhiKhac), align: ReportCellAlign.right),
      ]),
      ReportRow([
        const ReportCell('5'),
        const ReportCell('Lợi nhuận ròng (3 − 4)', isBold: true),
        ReportCell(formatMoney(loiNhuanRong), align: ReportCellAlign.right, isBold: true),
      ]),
    ];

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      unitAddress: 'Địa chỉ: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BÁO CÁO KẾT QUẢ HOẠT ĐỘNG KINH DOANH',
      titleSub: 'Lãi lỗ (rpS10DN)',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
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

  // ---------------------------------------------------------------------------
  // 7) HÓA ĐƠN BÁN HÀNG (rpBill / rpBillForField)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildSalesBillReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final orders = await db.nhathuocOrders.where().findAll();
    final filtered = orders
        .where((o) =>
            o.status != NhathuocOrderStatus.CANCELLED &&
            _inRange(o.orderDate ?? o.updatedAt, from, to))
        .toList()
      ..sort((a, b) => (b.orderDate ?? b.updatedAt).compareTo(a.orderDate ?? a.updatedAt));

    final flex = [6, 14, 12, 22, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final o in filtered) {
      total += o.totalAmount;
      final patient = o.patient.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(o.orderCode),
        ReportCell(_dateTimeFmt.format(o.orderDate ?? o.updatedAt)),
        ReportCell(patient?.name ?? 'Khách lẻ'),
        ReportCell(o.status.label),
        ReportCell(o.paymentMethod.label),
        ReportCell(formatMoney(o.totalAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HÓA ĐƠN BÁN HÀNG',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Mã HĐ'),
          const ReportHeaderCell('Ngày'),
          const ReportHeaderCell('Khách hàng'),
          const ReportHeaderCell('Trạng thái'),
          const ReportHeaderCell('Thanh toán'),
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
          ReportCell('${filtered.length} HĐ', align: ReportCellAlign.right, isBold: true),
          const ReportCell(''),
          ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 8) PHIẾU NHẬP KHO (rpInput / rpListInput)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildPurchaseReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final purchases = await db.nhathuocPurchases.where().findAll();
    final filtered = purchases
        .where((p) => p.purchaseDate != null && _inRange(p.purchaseDate!, from, to))
        .toList()
      ..sort((a, b) => b.purchaseDate!.compareTo(a.purchaseDate!));

    final flex = [6, 14, 14, 24, 14, 14, 14];
    final rows = <ReportRow>[];
    double total = 0;

    for (final p in filtered) {
      total += p.totalAmount;
      final supplier = p.supplier.value;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell(p.documentCode.isNotEmpty ? p.documentCode : p.purchaseId),
        ReportCell(_dateFmt.format(p.purchaseDate!)),
        ReportCell(supplier?.name ?? '—'),
        ReportCell(p.supplierInvoiceNumber.isNotEmpty ? p.supplierInvoiceNumber : '—'),
        ReportCell('${p.vat}%'),
        ReportCell(formatMoney(p.totalAmount), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO PHIẾU NHẬP KHO',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Số phiếu'),
          const ReportHeaderCell('Ngày nhập'),
          const ReportHeaderCell('Nhà cung cấp'),
          const ReportHeaderCell('HĐ NCC'),
          const ReportHeaderCell('VAT'),
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
          ReportCell(formatMoney(total), align: ReportCellAlign.right, isBold: true),
        ]),
      ],
      signature: [
        const ReportSignatureItem('Người lập biểu', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Thủ kho', '(Ký, ghi rõ họ tên)'),
        const ReportSignatureItem('Kế toán trưởng', '(Ký, ghi rõ họ tên)'),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 9) HAO HỤT NGUYÊN VẬT LIỆU (rpBaoCaoHaoHutNguyenVatLieuHangHoa)
  // ---------------------------------------------------------------------------
  Future<CrystalReportModel> buildShrinkageReport({
    required DateTime from,
    required DateTime to,
  }) async {
    final db = await _isar.db;
    final medicines = await db.nhathuocMedicines.where().findAll();

    final flex = [6, 26, 12, 14, 14, 16];
    final rows = <ReportRow>[];

    for (final med in medicines) {
      if (med.currentStock <= 0) continue;
      final gtTon = med.currentStock * med.purchasePrice;
      rows.add(ReportRow([
        ReportCell('${rows.length + 1}'),
        ReportCell('${med.name} (${med.unit})'),
        ReportCell(formatQty(med.currentStock), align: ReportCellAlign.right),
        ReportCell(formatMoney(med.purchasePrice), align: ReportCellAlign.right),
        ReportCell(formatMoney(med.retailPrice), align: ReportCellAlign.right),
        ReportCell(formatMoney(gtTon), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mẫu số S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Đơn vị: $_kUnit',
      title: 'BÁO CÁO HAO HỤT NGUYÊN VẬT LIỆU / HÀNG HÓA',
      subtitleLines: [
        'Từ ngày ${_dateFmt.format(from)} đến ngày ${_dateFmt.format(to)}',
      ],
      columnFlex: flex,
      headerRows: [
        [
          const ReportHeaderCell('STT'),
          const ReportHeaderCell('Tên vật tư / thuốc'),
          const ReportHeaderCell('Tồn kho'),
          const ReportHeaderCell('Giá mua'),
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
}

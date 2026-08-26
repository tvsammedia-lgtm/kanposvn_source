import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../models/payment.dart';
import '../models/expense.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../models/asset.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';

class NhatroReportService {
  final Isar _isar;
  NhatroReportService(this._isar);

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

  Future<List<Payment>> _paymentsInRange(DateTime from, DateTime to) async {
    final all = await _isar.payments.where().findAll();
    return all.where((p) => p.paymentDate != null && _inRange(p.paymentDate!, from, to)).toList();
  }

  Future<List<HostelExpense>> _expensesInRange(DateTime from, DateTime to) async {
    final all = await _isar.hostelExpenses.where().findAll();
    return all.where((e) => e.expenseDate != null && _inRange(e.expenseDate!, from, to)).toList();
  }

  Future<Map<String, Room>> _roomMap() async {
    final rooms = await _isar.rooms.where().findAll();
    return {for (final r in rooms) if (r.uuid != null) r.uuid!: r};
  }

  Future<Map<String, Tenant>> _tenantMap() async {
    final tenants = await _isar.tenants.where().findAll();
    return {for (final t in tenants) if (t.uuid != null) t.uuid!: t};
  }

  // ===== 1. rp1111.rpt — Tong hop quỹ tien mat =====
  Future<CrystalReportModel> buildCashFundSummary({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final expenses = await _expensesInRange(from, to);

    final openingPayments = (await _isar.payments.where().findAll())
        .where((p) => p.paymentDate != null && p.paymentDate!.isBefore(from));
    final openingExpenses = (await _isar.hostelExpenses.where().findAll())
        .where((e) => e.expenseDate != null && e.expenseDate!.isBefore(from));

    final opening = openingPayments.fold<double>(0, (s, p) => s + (p.paidAmount ?? 0))
        - openingExpenses.fold<double>(0, (s, e) => s + (e.amount ?? 0));
    final totalThu = payments.fold<double>(0, (s, p) => s + (p.paidAmount ?? 0));
    final totalChi = expenses.fold<double>(0, (s, e) => s + (e.amount ?? 0));
    final closing = opening + totalThu - totalChi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('1'), const ReportCell('So du dau ky', isBold: true), ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('2'), const ReportCell('Tong thu trong ky', isBold: true), ReportCell(formatMoney(totalThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('3'), const ReportCell('Tong chi trong ky', isBold: true), ReportCell(formatMoney(totalChi), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('4'), const ReportCell('So du cuoi ky (1 + 2 - 3)', isBold: true), ReportCell(formatMoney(closing), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN (TT 133/2016/TT-BTC)',
      unitName: 'Don vi: $_kUnit',
      unitAddress: 'Dia chi: $_kAddress',
      taxCode: 'MST: $_kTax',
      title: 'BAO CAO QUY TIEN MAT',
      titleSub: 'Tong hop thu chi (rp1111)',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('STT'), const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell(''), const ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(closing), align: ReportCellAlign.right, isBold: true)]),
      ],
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 2. rp1111_Detail.rpt — Chi tiet quỹ tien mat =====
  Future<CrystalReportModel> buildCashFundDetail({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final expenses = await _expensesInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [10, 14, 30, 12, 12];
    final rows = <ReportRow>[];

    for (final p in payments) {
      final room = rm[p.roomUuid]?.roomCode ?? '';
      final tenant = tm[p.tenantUuid]?.fullName ?? '';
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(p.paymentDate!)),
        ReportCell(p.receiptNumber ?? ''),
        ReportCell('Thu tien phong $room - $tenant'),
        ReportCell(formatMoney(p.paidAmount ?? 0), align: ReportCellAlign.right),
        const ReportCell(''),
      ]));
    }
    for (final e in expenses) {
      final room = rm[e.roomUuid]?.roomCode ?? '';
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(e.expenseDate!)),
        ReportCell(e.expenseNumber ?? ''),
        ReportCell('${e.category ?? ''} - ${e.description ?? ''} ${room.isNotEmpty ? "($room)" : ""}'),
        const ReportCell(''),
        ReportCell(formatMoney(e.amount ?? 0), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET QUY TIEN MAT',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ngay'), const ReportHeaderCell('Phieu'), const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('Thu (VND)'), const ReportHeaderCell('Chi (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 3. rpBill.rpt — Danh sach phieu thu =====
  Future<CrystalReportModel> buildReceiptList({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [12, 10, 18, 14, 16];
    final rows = payments.map((p) => ReportRow([
      ReportCell(p.receiptNumber ?? ''),
      ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
      ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
      ReportCell(p.paymentDate != null ? _dateFmt.format(p.paymentDate!) : ''),
      ReportCell(formatMoney(p.paidAmount ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH PHIEU THU',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phieu thu'), const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Ngay thu'), const ReportHeaderCell('Tien thu (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 4. rpReceipt.rpt — Phieu thu chi tiet =====
  Future<CrystalReportModel> buildReceiptDetail({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [42, 20];
    final rows = <ReportRow>[];

    for (final p in payments) {
      final room = rm[p.roomUuid]?.roomCode ?? '';
      final tenant = tm[p.tenantUuid]?.fullName ?? '';
      final prefix = 'Phieu ${p.receiptNumber} - $room - $tenant';
      rows.add(ReportRow([ReportCell('$prefix: Tien phong'), ReportCell(formatMoney(p.rentAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Tien dien'), ReportCell(formatMoney(p.electricAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Tien nuoc'), ReportCell(formatMoney(p.waterAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Internet'), ReportCell(formatMoney(p.internetAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Rac'), ReportCell(formatMoney(p.garbageAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Gui xe'), ReportCell(formatMoney(p.parkingAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Dich vu khac'), ReportCell(formatMoney(p.otherServiceAmount ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: TONG CONG', isBold: true), ReportCell(formatMoney(p.totalAmount ?? 0), align: ReportCellAlign.right, isBold: true)]));
      rows.add(ReportRow([ReportCell('$prefix: DA THANH TOAN', isBold: true), ReportCell(formatMoney(p.paidAmount ?? 0), align: ReportCellAlign.right, isBold: true)]));
      if ((p.debtAmount ?? 0) > 0) {
        rows.add(ReportRow([const ReportCell(''), ReportCell('')]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHIEU THU CHI TIET',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 5. rpBill_DiscountOnBill.rpt — Giam gia tren hoa don =====
  Future<CrystalReportModel> buildDiscountOnBill({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [12, 18, 14, 16];
    final rows = <ReportRow>[];
    for (final p in payments) {
      final disc = (p.discount ?? 0) + (p.promotion ?? 0);
      if (disc <= 0) continue;
      rows.add(ReportRow([
        ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
        ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
        ReportCell(p.paymentDate != null ? _dateFmt.format(p.paymentDate!) : ''),
        ReportCell(formatMoney(disc), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'GIAM GIA TREN HOA DON',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Ngay'), const ReportHeaderCell('Giam gia (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 6. rpBill_DiscountOnFoodOrDrink.rpt — Chi tiet giam gia =====
  Future<CrystalReportModel> buildDiscountOnService({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [18, 12, 18, 14];
    final rows = <ReportRow>[];
    for (final p in payments) {
      final disc = p.discount ?? 0;
      final prom = p.promotion ?? 0;
      if (disc > 0) {
        rows.add(ReportRow([
          const ReportCell('Giam gia hoa don'),
          ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
          ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
          ReportCell(formatMoney(disc), align: ReportCellAlign.right),
        ]));
      }
      if (prom > 0) {
        rows.add(ReportRow([
          const ReportCell('Khuyen mai'),
          ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
          ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
          ReportCell(formatMoney(prom), align: ReportCellAlign.right),
        ]));
      }
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET GIAM GIA THEO KHOAN',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Khoan giam gia'), const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 7. rpPaymentByPaymentID.rpt — Phieu thu theo ma phieu =====
  Future<CrystalReportModel> buildPaymentByPaymentID({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [12, 10, 18, 14, 14];
    final rows = payments.map((p) => ReportRow([
      ReportCell(p.receiptNumber ?? ''),
      ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
      ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
      ReportCell(p.paymentDate != null ? _dateFmt.format(p.paymentDate!) : ''),
      ReportCell(formatMoney(p.totalAmount ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHIEU THU THEO MA PHIEU',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma phieu'), const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Ngay thu'), const ReportHeaderCell('Tong tien')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 8. rpPaymentForCashier.rpt — Thu tien cho thu ngan =====
  Future<CrystalReportModel> buildPaymentForCashier({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [12, 18, 14, 16];
    final rows = payments.map((p) => ReportRow([
      ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
      ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
      ReportCell(p.paymentDate != null ? _dateFmt.format(p.paymentDate!) : ''),
      ReportCell(formatMoney(p.paidAmount ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'THU TIEN CHO THU NGAN',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Ngay'), const ReportHeaderCell('Tien thu (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 9. rpInput.rpt — Danh sach phieu chi =====
  Future<CrystalReportModel> buildExpenseList({required DateTime from, required DateTime to}) async {
    final expenses = await _expensesInRange(from, to);
    final rm = await _roomMap();

    final flex = [12, 12, 14, 18, 10, 14];
    final rows = expenses.map((e) => ReportRow([
      ReportCell(e.expenseNumber ?? ''),
      ReportCell(e.expenseDate != null ? _dateFmt.format(e.expenseDate!) : ''),
      ReportCell(e.category ?? ''),
      ReportCell(e.description ?? ''),
      ReportCell(rm[e.roomUuid]?.roomCode ?? ''),
      ReportCell(formatMoney(e.amount ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH PHIEU CHI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phieu chi'), const ReportHeaderCell('Ngay chi'), const ReportHeaderCell('Loai chi'), const ReportHeaderCell('Noi dung', align: ReportCellAlign.left), const ReportHeaderCell('Phong'), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 10. rpListInput.rpt — Tong hop chi phi theo loai =====
  Future<CrystalReportModel> buildExpenseByCategory({required DateTime from, required DateTime to}) async {
    final expenses = await _expensesInRange(from, to);

    final categoryTotals = <String, ({int count, double total})>{};
    for (final e in expenses) {
      final cat = e.category ?? 'Khac';
      final cur = categoryTotals[cat];
      categoryTotals[cat] = (count: (cur?.count ?? 0) + 1, total: (cur?.total ?? 0) + (e.amount ?? 0));
    }

    final sorted = categoryTotals.entries.toList()..sort((a, b) => b.value.total.compareTo(a.value.total));

    final flex = [30, 14, 20];
    final rows = sorted.map((entry) => ReportRow([
      ReportCell(entry.key),
      ReportCell(entry.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value.total), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP CHI PHI THEO LOAI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai chi', align: ReportCellAlign.left), const ReportHeaderCell('So phieu'), const ReportHeaderCell('Tong tien (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 11. rpOutputByStock.rpt — Xuat nhap ton tai san =====
  Future<CrystalReportModel> buildInventorySummary() async {
    final assets = await _isar.assets.where().findAll();
    final rm = await _roomMap();

    final flex = [20, 10, 14, 16, 14, 12];
    final rows = assets.map((a) => ReportRow([
      ReportCell(a.name ?? ''),
      ReportCell(rm[a.roomUuid]?.roomCode ?? ''),
      ReportCell(a.purchaseDate != null ? _dateFmt.format(a.purchaseDate!) : ''),
      ReportCell(formatMoney(a.purchasePrice ?? 0), align: ReportCellAlign.right),
      ReportCell('${a.depreciationRate ?? 0}'),
      ReportCell(a.condition ?? ''),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'XUAT NHAP TON TAI SAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Tai san', align: ReportCellAlign.left), const ReportHeaderCell('Phong'), const ReportHeaderCell('Ngay mua'), const ReportHeaderCell('Gia mua (VND)'), const ReportHeaderCell('Ty le KH (%/thang)'), const ReportHeaderCell('Tinh trang')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 12. rpOutputFromShift.rpt — Tong hop tai san theo phong =====
  Future<CrystalReportModel> buildAssetByRoom() async {
    final assets = await _isar.assets.where().findAll();
    final rm = await _roomMap();

    final roomTotals = <String, ({int count, double total})>{};
    for (final a in assets) {
      final roomKey = rm[a.roomUuid]?.roomCode ?? 'Chua phan phong';
      final cur = roomTotals[roomKey];
      roomTotals[roomKey] = (count: (cur?.count ?? 0) + 1, total: (cur?.total ?? 0) + (a.purchasePrice ?? 0));
    }

    final flex = [30, 14, 20];
    final rows = roomTotals.entries.map((entry) => ReportRow([
      ReportCell(entry.key),
      ReportCell(entry.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value.total), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP TAI SAN THEO PHONG',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phong', align: ReportCellAlign.left), const ReportHeaderCell('So tai san'), const ReportHeaderCell('Tong gia tri (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 13. rpBillForField.rpt — Dich vu theo phong =====
  Future<CrystalReportModel> buildServiceByRoom({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();

    final roomServiceMap = <String, Map<String, double>>{};
    for (final p in payments) {
      final roomCode = rm[p.roomUuid]?.roomCode ?? 'Khac';
      roomServiceMap.putIfAbsent(roomCode, () => {'electric': 0, 'water': 0, 'internet': 0, 'garbage': 0, 'parking': 0, 'other': 0});
      roomServiceMap[roomCode]!['electric'] = roomServiceMap[roomCode]!['electric']! + (p.electricAmount ?? 0);
      roomServiceMap[roomCode]!['water'] = roomServiceMap[roomCode]!['water']! + (p.waterAmount ?? 0);
      roomServiceMap[roomCode]!['internet'] = roomServiceMap[roomCode]!['internet']! + (p.internetAmount ?? 0);
      roomServiceMap[roomCode]!['garbage'] = roomServiceMap[roomCode]!['garbage']! + (p.garbageAmount ?? 0);
      roomServiceMap[roomCode]!['parking'] = roomServiceMap[roomCode]!['parking']! + (p.parkingAmount ?? 0);
      roomServiceMap[roomCode]!['other'] = roomServiceMap[roomCode]!['other']! + (p.otherServiceAmount ?? 0);
    }

    final flex = [12, 12, 12, 12, 12, 12, 12];
    final rows = roomServiceMap.entries.map((entry) => ReportRow([
      ReportCell(entry.key),
      ReportCell(formatMoney(entry.value['electric']!), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value['water']!), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value['internet']!), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value['garbage']!), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value['parking']!), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value['other']!), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DICH VU THEO PHONG',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phong'), const ReportHeaderCell('Dien'), const ReportHeaderCell('Nuoc'), const ReportHeaderCell('Internet'), const ReportHeaderCell('Rac'), const ReportHeaderCell('Gui xe'), const ReportHeaderCell('Khac')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 14. rpBillForField_IsNotUsed.rpt — Phong chua su dung =====
  Future<CrystalReportModel> buildUnusedRooms() async {
    final rooms = await _isar.rooms.where().findAll();
    final contracts = await _isar.contracts.where().findAll();
    final rentedRoomUuids = contracts.map((c) => c.roomUuid).toSet();

    final flex = [10, 16, 10, 8, 10, 14, 10];
    final rows = <ReportRow>[];
    for (final r in rooms) {
      if (rentedRoomUuids.contains(r.uuid)) continue;
      rows.add(ReportRow([
        ReportCell(r.roomCode ?? ''),
        ReportCell(r.roomName ?? ''),
        ReportCell(r.block ?? ''),
        ReportCell('${r.floor ?? ''}'),
        ReportCell('${r.areaSize ?? ''}'),
        ReportCell(formatMoney(r.rentPrice ?? 0), align: ReportCellAlign.right),
        ReportCell(r.status.name),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHONG CHUA SU DUNG',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma phong'), const ReportHeaderCell('Ten phong', align: ReportCellAlign.left), const ReportHeaderCell('Day'), const ReportHeaderCell('Tang'), const ReportHeaderCell('Dien tich'), const ReportHeaderCell('Gia thue'), const ReportHeaderCell('Trang thai')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 15. rpBillForTax.rpt — Hoa don theo thue =====
  Future<CrystalReportModel> buildInvoiceForTax({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final flex = [10, 18, 12, 14, 14, 14];
    final rows = payments.map((p) => ReportRow([
      ReportCell(rm[p.roomUuid]?.roomCode ?? ''),
      ReportCell(tm[p.tenantUuid]?.fullName ?? ''),
      ReportCell('${p.month ?? ''}/${p.year ?? ''}'),
      ReportCell(formatMoney(p.totalAmount ?? 0), align: ReportCellAlign.right),
      ReportCell(formatMoney(p.paidAmount ?? 0), align: ReportCellAlign.right),
      ReportCell(formatMoney(p.debtAmount ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'HOA DON THEO THUE',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Phong'), const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Thang/Nam'), const ReportHeaderCell('Tong tien'), const ReportHeaderCell('Da thanh toan'), const ReportHeaderCell('Con no')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 16. rpSoChiTietThanhToanNguoiBan.rpt — Cong no KH =====
  Future<CrystalReportModel> buildCustomerDebt() async {
    final payments = await _isar.payments.where().findAll();
    final rm = await _roomMap();
    final tm = await _tenantMap();

    final tenantTotals = <String, ({double receivable, double paid, double debt})>{};
    for (final p in payments) {
      final tenantId = p.tenantUuid;
      if (tenantId == null) continue;
      final cur = tenantTotals[tenantId];
      tenantTotals[tenantId] = (
        receivable: (cur?.receivable ?? 0) + (p.totalAmount ?? 0),
        paid: (cur?.paid ?? 0) + (p.paidAmount ?? 0),
        debt: (cur?.debt ?? 0) + (p.debtAmount ?? 0),
      );
    }

    final flex = [18, 10, 18, 16, 16];
    final rows = <ReportRow>[];
    for (final entry in tenantTotals.entries) {
      final tenant = tm[entry.key];
      final roomPayments = payments.where((p) => p.tenantUuid == entry.key).toList();
      final roomCode = roomPayments.isNotEmpty ? rm[roomPayments.first.roomUuid]?.roomCode : null;
      rows.add(ReportRow([
        ReportCell(tenant?.fullName ?? ''),
        ReportCell(roomCode ?? ''),
        ReportCell(formatMoney(entry.value.receivable), align: ReportCellAlign.right),
        ReportCell(formatMoney(entry.value.paid), align: ReportCellAlign.right),
        ReportCell(formatMoney(entry.value.debt), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CONG NO KHACH HANG',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Khach hang', align: ReportCellAlign.left), const ReportHeaderCell('Phong'), const ReportHeaderCell('Tong phai thu'), const ReportHeaderCell('Da thu'), const ReportHeaderCell('Con no')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 17. rpSoTongHopThanhToanVoiNguoiBan.rpt — Tong hop cong no =====
  Future<CrystalReportModel> buildDebtSummary() async {
    final payments = await _isar.payments.where().findAll();

    final periodTotals = <String, ({double receivable, double paid, double debt})>{};
    for (final p in payments) {
      final key = '${p.month ?? 0}/${p.year ?? 0}';
      final cur = periodTotals[key];
      periodTotals[key] = (
        receivable: (cur?.receivable ?? 0) + (p.totalAmount ?? 0),
        paid: (cur?.paid ?? 0) + (p.paidAmount ?? 0),
        debt: (cur?.debt ?? 0) + (p.debtAmount ?? 0),
      );
    }

    final flex = [18, 18, 16, 16];
    final rows = periodTotals.entries.map((entry) => ReportRow([
      ReportCell(entry.key),
      ReportCell(formatMoney(entry.value.receivable), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value.paid), align: ReportCellAlign.right),
      ReportCell(formatMoney(entry.value.debt), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP CONG NO THEO THANG',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Thang/Nam'), const ReportHeaderCell('Tong phai thu'), const ReportHeaderCell('Da thu'), const ReportHeaderCell('Con no')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 18. rpBaoCaoHaoHutNguyenVatLieuHangHoa.rpt — Hao hut tai san =====
  Future<CrystalReportModel> buildAssetDepreciation() async {
    final assets = await _isar.assets.where().findAll();

    final flex = [20, 16, 16, 14, 14, 12];
    final rows = assets.map((a) => ReportRow([
      ReportCell(a.name ?? ''),
      ReportCell(formatMoney(a.purchasePrice ?? 0), align: ReportCellAlign.right),
      ReportCell('${a.depreciationRate ?? 0}'),
      ReportCell('${a.usefulLifeMonths ?? ''}'),
      ReportCell(a.warrantyExpiry ?? ''),
      ReportCell(a.condition ?? ''),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BAO CAO HAO HUT TAI SAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Tai san', align: ReportCellAlign.left), const ReportHeaderCell('Gia mua (VND)'), const ReportHeaderCell('Ty le KH (%/thang)'), const ReportHeaderCell('Thoi han SD'), const ReportHeaderCell('Han bao hanh'), const ReportHeaderCell('Tinh trang')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 19. rpBaoCaoTongHopXuatNhapTonVatTu.rpt — Tong hop tai san =====
  Future<CrystalReportModel> buildAssetSummary() async {
    final assets = await _isar.assets.where().findAll();

    final totalAssets = assets.length;
    final totalValue = assets.fold<double>(0, (s, a) => s + (a.purchasePrice ?? 0));
    final depreciationTotal = assets.fold<double>(0, (s, a) => s + (a.purchasePrice ?? 0) * (a.depreciationRate ?? 0) / 100);

    final flex = [30, 14, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Tong cong tai san', isBold: true), ReportCell(totalAssets.toString(), align: ReportCellAlign.right), ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('Tong khau hao/thang'), const ReportCell('-', align: ReportCellAlign.right), ReportCell(formatMoney(depreciationTotal), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Gia tri con lai', isBold: true), const ReportCell('-', align: ReportCellAlign.right), ReportCell(formatMoney(totalValue - depreciationTotal), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP TAI SAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (VND)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell(''), const ReportCell(''), ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true)]),
      ],
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 20. rpS10DN.rpt — Lai lo =====
  Future<CrystalReportModel> buildProfitLoss({required DateTime from, required DateTime to}) async {
    final payments = await _paymentsInRange(from, to);
    final expenses = await _expensesInRange(from, to);

    double tienPhong = 0;
    double tienDichVu = 0;
    for (final p in payments) {
      tienPhong += (p.rentAmount ?? 0);
      tienDichVu += (p.electricAmount ?? 0) + (p.waterAmount ?? 0) + (p.internetAmount ?? 0) + (p.garbageAmount ?? 0) + (p.parkingAmount ?? 0) + (p.otherServiceAmount ?? 0);
    }
    final tongThu = tienPhong + tienDichVu;

    double tongChi = 0;
    final chiPhiCategories = <String, double>{};
    for (final e in expenses) {
      final cat = e.category ?? 'Khac';
      chiPhiCategories[cat] = (chiPhiCategories[cat] ?? 0) + (e.amount ?? 0);
      tongChi += e.amount ?? 0;
    }
    final sortedChi = chiPhiCategories.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    final flex = [42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('=== THU ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('  Tien phong'), ReportCell(formatMoney(tienPhong), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('  Tien dich vu'), ReportCell(formatMoney(tienDichVu), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Tong thu', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell(''), const ReportCell('')]),
      ReportRow([const ReportCell('=== CHI ===', isBold: true), const ReportCell('')]),
    ];
    for (final entry in sortedChi) {
      rows.add(ReportRow([ReportCell('  ${entry.key}'), ReportCell(formatMoney(entry.value), align: ReportCellAlign.right)]));
    }
    rows.add(ReportRow([const ReportCell('Tong chi', isBold: true), ReportCell(formatMoney(tongChi), align: ReportCellAlign.right, isBold: true)]));
    rows.add(ReportRow([const ReportCell(''), const ReportCell('')]));
    rows.add(ReportRow([const ReportCell('=== LAI/LO ===', isBold: true), const ReportCell('')]));
    rows.add(ReportRow([const ReportCell('Loi nhuan rong', isBold: true), ReportCell(formatMoney(tongThu - tongChi), align: ReportCellAlign.right, isBold: true)]));

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BAO CAO LAI LO',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Noi dung', align: ReportCellAlign.left), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell('LOI NHUAN RONG', isBold: true), ReportCell(formatMoney(tongThu - tongChi), align: ReportCellAlign.right, isBold: true)]),
      ],
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== Danh sach 20 bao cao =====
  static const List<({String code, String title, String group, bool useDateRange})> reportList = [
    (code: 'rp1111',                  title: 'Tong hop quy tien mat',     group: '★ Quy tien mat',              useDateRange: true),
    (code: 'rp1111_Detail',           title: 'Chi tiet quy tien mat',     group: '★ Quy tien mat',              useDateRange: true),
    (code: 'rpBaoCaoTongHopXuatNhapTonVatTu', title: 'Tong hop tai san',  group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpBaoCaoHaoHutNguyenVatLieuHangHoa', title: 'Hao hut tai san', group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputByStock',         title: 'Xuat nhap ton tai san',     group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputFromShift',       title: 'Tai san theo phong',        group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpSoChiTietThanhToanNguoiBan', title: 'Cong no KH',          group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpSoTongHopThanhToanVoiNguoiBan', title: 'Tong hop cong no',  group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpS10DN',                 title: 'Bao cao loi lo',            group: '★ Lai lo',                    useDateRange: true),
    (code: 'rpBill',                  title: 'Danh sach phieu thu',       group: 'Hoa don',                     useDateRange: true),
    (code: 'rpReceipt',               title: 'Phieu thu chi tiet',        group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnBill',   title: 'Giam gia tren hoa don',     group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnFoodOrDrink', title: 'Chi tiet giam gia',    group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBillForTax',            title: 'Hoa don theo thue',         group: 'Hoa don',                     useDateRange: true),
    (code: 'rpPaymentByPaymentID',    title: 'Phieu thu theo ma phieu',   group: 'Thu chi',                     useDateRange: true),
    (code: 'rpPaymentForCashier',     title: 'Thu tien cho thu ngan',     group: 'Thu chi',                     useDateRange: true),
    (code: 'rpInput',                 title: 'Danh sach phieu chi',       group: 'Thu chi',                     useDateRange: true),
    (code: 'rpListInput',             title: 'Tong hop chi phi theo loai',group: 'Thu chi',                     useDateRange: true),
    (code: 'rpBillForField',          title: 'Dich vu theo phong',        group: 'Dich vu',                     useDateRange: true),
    (code: 'rpBillForField_IsNotUsed', title: 'Phong chua su dung',       group: 'Dich vu',                     useDateRange: false),
  ];

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return buildCashFundSummary(from: from, to: to);
      case 'rp1111_Detail': return buildCashFundDetail(from: from, to: to);
      case 'rpBill': return buildReceiptList(from: from, to: to);
      case 'rpReceipt': return buildReceiptDetail(from: from, to: to);
      case 'rpBill_DiscountOnBill': return buildDiscountOnBill(from: from, to: to);
      case 'rpBill_DiscountOnFoodOrDrink': return buildDiscountOnService(from: from, to: to);
      case 'rpPaymentByPaymentID': return buildPaymentByPaymentID(from: from, to: to);
      case 'rpPaymentForCashier': return buildPaymentForCashier(from: from, to: to);
      case 'rpInput': return buildExpenseList(from: from, to: to);
      case 'rpListInput': return buildExpenseByCategory(from: from, to: to);
      case 'rpOutputByStock': return buildInventorySummary();
      case 'rpOutputFromShift': return buildAssetByRoom();
      case 'rpBillForField': return buildServiceByRoom(from: from, to: to);
      case 'rpBillForField_IsNotUsed': return buildUnusedRooms();
      case 'rpBillForTax': return buildInvoiceForTax(from: from, to: to);
      case 'rpSoChiTietThanhToanNguoiBan': return buildCustomerDebt();
      case 'rpSoTongHopThanhToanVoiNguoiBan': return buildDebtSummary();
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return buildAssetDepreciation();
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return buildAssetSummary();
      case 'rpS10DN': return buildProfitLoss(from: from, to: to);
      default: return buildCashFundSummary(from: from, to: to);
    }
  }
}

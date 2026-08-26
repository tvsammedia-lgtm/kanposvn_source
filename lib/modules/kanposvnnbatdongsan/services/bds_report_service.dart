import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../models/property.dart';
import '../models/customer.dart';
import '../models/broker.dart';
import '../models/transaction.dart';
import '../models/floor_fee.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';

class BdsReportService {
  final Isar _isar;
  BdsReportService(this._isar);

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

  bool _isExpense(FloorFee f) => f.feeType == FloorFeeType.other;

  // ===== 1. rp1111.rpt — Tong hop quy tien mat =====
  Future<CrystalReportModel> buildCashFundSummary({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final fees = await _isar.floorFees.where().findAll();

    final txInRange = txs.where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to) && t.status == TransactionStatus.completed);
    final feeInRange = fees.where((f) => f.feeDate != null && _inRange(f.feeDate!, from, to));

    final openingTxs = txs.where((t) => t.transactionDate != null && t.transactionDate!.isBefore(from) && t.status == TransactionStatus.completed);
    final openingFees = fees.where((f) => f.feeDate != null && f.feeDate!.isBefore(from));

    final opening = openingTxs.fold<double>(0, (s, t) => s + (t.commission ?? 0)) + openingFees.where((f) => !_isExpense(f)).fold<double>(0, (s, f) => s + (f.amount ?? 0)) - openingFees.where(_isExpense).fold<double>(0, (s, f) => s + (f.amount ?? 0));
    final totalThu = txInRange.fold<double>(0, (s, t) => s + (t.commission ?? 0)) + feeInRange.where((f) => !_isExpense(f)).fold<double>(0, (s, f) => s + (f.amount ?? 0));
    final totalChi = feeInRange.where(_isExpense).fold<double>(0, (s, f) => s + (f.amount ?? 0)) + txInRange.fold<double>(0, (s, t) => s + (t.floorFee ?? 0));
    final closing = opening + totalThu - totalChi;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('1'), const ReportCell('So du dau ky', isBold: true), ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('2'), const ReportCell('Tong thu trong ky (hoa mai + phi san)', isBold: true), ReportCell(formatMoney(totalThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('3'), const ReportCell('Tong chi trong ky (phi san + phi giao dich)', isBold: true), ReportCell(formatMoney(totalChi), align: ReportCellAlign.right, isBold: true)]),
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
        [const ReportHeaderCell('STT'), const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('So tien (TY VND)')],
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

  // ===== 2. rp1111_Detail.rpt — Chi tiet quy tien mat =====
  Future<CrystalReportModel> buildCashFundDetail({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final fees = await _isar.floorFees.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final flex = [10, 14, 30, 12, 12];
    final rows = <ReportRow>[];

    for (final t in txs) {
      if (t.transactionDate == null || !_inRange(t.transactionDate!, from, to)) continue;
      final buyer = customerMap[t.buyerId];
      final seller = customerMap[t.sellerId];
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(t.transactionDate!)),
        ReportCell(t.transactionCode ?? ''),
        ReportCell('GD ${buyer?.name ?? ''} - ${seller?.name ?? ''}'),
        ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
        ReportCell(formatMoney(t.floorFee ?? 0), align: ReportCellAlign.right),
      ]));
    }

    for (final f in fees) {
      if (f.feeDate == null || !_inRange(f.feeDate!, from, to)) continue;
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(f.feeDate!)),
        ReportCell(f.feeCode ?? ''),
        ReportCell('Phi ${f.feeType.label} - ${f.notes ?? ''}'),
        _isExpense(f) ? const ReportCell('') : ReportCell(formatMoney(f.amount ?? 0), align: ReportCellAlign.right),
        _isExpense(f) ? ReportCell(formatMoney(f.amount ?? 0), align: ReportCellAlign.right) : const ReportCell(''),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET QUY TIEN MAT',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ngay'), const ReportHeaderCell('Ma'), const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('Thu (TY)'), const ReportHeaderCell('Chi (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 3. rpBill.rpt — Danh sach giao dich =====
  Future<CrystalReportModel> buildTransactionList({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};
    final propertyMap = {for (final p in await _isar.propertys.where().findAll()) p.propertyCode: p};

    final flex = [10, 14, 14, 14, 14, 12];
    final rows = txs
        .where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to))
        .map((t) => ReportRow([
          ReportCell(t.transactionCode ?? ''),
          ReportCell(customerMap[t.buyerId]?.name ?? ''),
          ReportCell(customerMap[t.sellerId]?.name ?? ''),
          ReportCell(propertyMap[t.propertyId]?.title ?? ''),
          ReportCell(formatMoney(t.finalPrice ?? 0), align: ReportCellAlign.right),
          ReportCell(t.status.name),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH GIAO DICH',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma GD'), const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Nguoi ban'), const ReportHeaderCell('BDS'), const ReportHeaderCell('Gia tri (TY)'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 4. rpReceipt.rpt — Phieu thu chi tiet =====
  Future<CrystalReportModel> buildReceiptDetail({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};
    final brokerMap = {for (final b in await _isar.brokers.where().findAll()) b.remoteId: b};

    final flex = [42, 20];
    final rows = <ReportRow>[];

    for (final t in txs) {
      if (t.transactionDate == null || !_inRange(t.transactionDate!, from, to)) continue;
      if (t.status != TransactionStatus.completed) continue;
      final buyer = customerMap[t.buyerId];
      final seller = customerMap[t.sellerId];
      final broker = brokerMap[t.brokerId];
      final prefix = 'GD ${t.transactionCode} - ${buyer?.name ?? ''} - ${seller?.name ?? ''}';
      rows.add(ReportRow([ReportCell('$prefix: Gia tri giao dich'), ReportCell(formatMoney(t.finalPrice ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Hoa mai'), ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Phi san'), ReportCell(formatMoney(t.floorFee ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: HM moi gioi (${broker?.fullName ?? ""})'), ReportCell(formatMoney((t.commission ?? 0) * (t.commissionRate ?? 0) / 100), align: ReportCellAlign.right)]));
      rows.add(ReportRow([const ReportCell(''), ReportCell('')]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHIEU THU CHI TIET',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('So tien (TY VND)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 5. rpBill_DiscountOnBill.rpt — Giao dich da hoan thanh =====
  Future<CrystalReportModel> buildCompletedTransactions({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final completed = txs.where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to) && t.status == TransactionStatus.completed);

    final flex = [14, 16, 16, 14, 14];
    final rows = completed.map((t) => ReportRow([
      ReportCell(t.transactionCode ?? ''),
      ReportCell(customerMap[t.buyerId]?.name ?? ''),
      ReportCell(customerMap[t.sellerId]?.name ?? ''),
      ReportCell(formatMoney(t.finalPrice ?? 0), align: ReportCellAlign.right),
      ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'GIAO DICH DA HOAN THANH',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma GD'), const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Nguoi ban'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('Hoa mai')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 6. rpBill_DiscountOnFoodOrDrink.rpt — Chi tiet hoa mai theo loai BDS =====
  Future<CrystalReportModel> buildCommissionByPropertyType({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final properties = await _isar.propertys.where().findAll();
    final propertyMap = {for (final p in properties) p.propertyCode: p};

    final typeTotals = <String, ({int count, double commission})>{};
    for (final t in txs) {
      if (t.transactionDate == null || !_inRange(t.transactionDate!, from, to)) continue;
      if (t.status != TransactionStatus.completed) continue;
      final prop = propertyMap[t.propertyId];
      final typeName = prop?.propertyType ?? 'Khac';
      final cur = typeTotals[typeName];
      typeTotals[typeName] = (count: (cur?.count ?? 0) + 1, commission: (cur?.commission ?? 0) + (t.commission ?? 0));
    }

    final flex = [30, 14, 20];
    final rows = typeTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.commission), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'HOA MAI THEO LOAI BDS',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai BDS', align: ReportCellAlign.left), const ReportHeaderCell('So GD'), const ReportHeaderCell('Tong hoa mai (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 7. rpPaymentByPaymentID.rpt — Phieu thu theo ma GD =====
  Future<CrystalReportModel> buildPaymentByTxCode({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final flex = [12, 16, 16, 14, 14];
    final rows = txs
        .where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to))
        .map((t) => ReportRow([
          ReportCell(t.transactionCode ?? ''),
          ReportCell(customerMap[t.buyerId]?.name ?? ''),
          ReportCell(_dateFmt.format(t.transactionDate!)),
          ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
          ReportCell(t.status.name),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHIEU THU THEO MA GD',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma GD'), const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Ngay'), const ReportHeaderCell('Hoa mai (TY)'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 8. rpPaymentForCashier.rpt — Thu tien hoa mai =====
  Future<CrystalReportModel> buildCommissionCollection({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final completed = txs.where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to) && t.status == TransactionStatus.completed);

    final flex = [16, 16, 14, 14];
    final rows = completed.map((t) => ReportRow([
      ReportCell(customerMap[t.buyerId]?.name ?? ''),
      ReportCell(customerMap[t.sellerId]?.name ?? ''),
      ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
      ReportCell(formatMoney(t.floorFee ?? 0), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'THU TIEN HOA MAI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Nguoi ban'), const ReportHeaderCell('Hoa mai (TY)'), const ReportHeaderCell('Phi san (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 9. rpInput.rpt — Danh sach phi san =====
  Future<CrystalReportModel> buildFloorFeeList({required DateTime from, required DateTime to}) async {
    final fees = await _isar.floorFees.where().findAll();

    final flex = [12, 14, 16, 14, 16];
    final rows = fees
        .where((f) => f.feeDate != null && _inRange(f.feeDate!, from, to))
        .map((f) => ReportRow([
          ReportCell(f.feeCode ?? ''),
          ReportCell(_dateFmt.format(f.feeDate!)),
          ReportCell(f.feeType.label),
          ReportCell(formatMoney(f.amount ?? 0), align: ReportCellAlign.right),
          ReportCell(f.notes ?? ''),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH PHI SAN',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma phi'), const ReportHeaderCell('Ngay'), const ReportHeaderCell('Loai phi'), const ReportHeaderCell('So tien (TY)'), const ReportHeaderCell('Ghi chu', align: ReportCellAlign.left)],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 10. rpListInput.rpt — Tong hop chi phi theo loai =====
  Future<CrystalReportModel> buildExpenseByCategory({required DateTime from, required DateTime to}) async {
    final fees = await _isar.floorFees.where().findAll();
    final filtered = fees.where((f) => f.feeDate != null && _inRange(f.feeDate!, from, to)).toList();

    final categoryTotals = <String, ({int count, double total})>{};
    for (final f in filtered) {
      final cat = f.feeType.label;
      final cur = categoryTotals[cat];
      categoryTotals[cat] = (count: (cur?.count ?? 0) + 1, total: (cur?.total ?? 0) + (f.amount ?? 0));
    }

    final sorted = categoryTotals.entries.toList()..sort((a, b) => b.value.total.compareTo(a.value.total));
    final flex = [30, 14, 20];
    final rows = sorted.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.total), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP PHI THEO LOAI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai phi', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Tong tien (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 11. rpOutputByStock.rpt — Xuat nhap ton BDS =====
  Future<CrystalReportModel> buildInventorySummary() async {
    final properties = await _isar.propertys.where().findAll();

    final statusTotals = <String, ({int count, double totalValue})>{};
    for (final p in properties) {
      final st = p.status.name;
      final cur = statusTotals[st];
      statusTotals[st] = (count: (cur?.count ?? 0) + 1, totalValue: (cur?.totalValue ?? 0) + (p.price ?? 0));
    }

    final flex = [24, 14, 20];
    final rows = statusTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.totalValue), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'XUAT NHAP TON BAT DONG SAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Trang thai', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (TY VND)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 12. rpOutputFromShift.rpt — Tong hop BDS theo loai =====
  Future<CrystalReportModel> buildPropertyByType() async {
    final properties = await _isar.propertys.where().findAll();

    final typeTotals = <String, ({int count, double totalValue})>{};
    for (final p in properties) {
      final typeName = p.propertyType ?? 'Khac';
      final cur = typeTotals[typeName];
      typeTotals[typeName] = (count: (cur?.count ?? 0) + 1, totalValue: (cur?.totalValue ?? 0) + (p.price ?? 0));
    }

    final flex = [24, 14, 20];
    final rows = typeTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.totalValue), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP BDS THEO LOAI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai BDS', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 13. rpBillForField.rpt — BDS theo quan/huyen =====
  Future<CrystalReportModel> buildPropertyByDistrict() async {
    final properties = await _isar.propertys.where().findAll();

    final districtTotals = <String, ({int count, double totalValue})>{};
    for (final p in properties) {
      final district = p.district ?? 'Khac';
      final cur = districtTotals[district];
      districtTotals[district] = (count: (cur?.count ?? 0) + 1, totalValue: (cur?.totalValue ?? 0) + (p.price ?? 0));
    }

    final sorted = districtTotals.entries.toList()..sort((a, b) => b.value.totalValue.compareTo(a.value.totalValue));
    final flex = [24, 14, 20];
    final rows = sorted.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.totalValue), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BDS THEO QUAN/HUYEN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Quan/Huyen', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (TY)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 14. rpBillForField_IsNotUsed.rpt — BDS chua ban =====
  Future<CrystalReportModel> buildAvailableProperties() async {
    final properties = await _isar.propertys.where().findAll();

    final flex = [14, 16, 16, 14, 12, 10];
    final rows = properties
        .where((p) => p.status == PropertyStatus.available)
        .map((p) => ReportRow([
          ReportCell(p.propertyCode ?? ''),
          ReportCell(p.title ?? ''),
          ReportCell('${p.district ?? ''}, ${p.province ?? ''}'),
          ReportCell(formatMoney(p.price ?? 0), align: ReportCellAlign.right),
          ReportCell('${p.areaSize ?? ''} m2'),
          ReportCell(p.propertyType ?? ''),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BDS CHUA BAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma'), const ReportHeaderCell('Ten BDS', align: ReportCellAlign.left), const ReportHeaderCell('Dia chi'), const ReportHeaderCell('Gia (TY)'), const ReportHeaderCell('Dien tich'), const ReportHeaderCell('Loai')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 15. rpBillForTax.rpt — Hoa don theo giao dich =====
  Future<CrystalReportModel> buildInvoiceByTransaction({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final flex = [12, 16, 16, 14, 14, 12];
    final rows = txs
        .where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to))
        .map((t) => ReportRow([
          ReportCell(t.transactionCode ?? ''),
          ReportCell(customerMap[t.buyerId]?.name ?? ''),
          ReportCell(customerMap[t.sellerId]?.name ?? ''),
          ReportCell(formatMoney(t.finalPrice ?? 0), align: ReportCellAlign.right),
          ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
          ReportCell(t.status.name),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'HOA DON THEO GIAO DICH',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma GD'), const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Nguoi ban'), const ReportHeaderCell('Gia tri (TY)'), const ReportHeaderCell('Hoa mai'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 16. rpSoChiTietThanhToanNguoiBan.rpt — Cong no KH =====
  Future<CrystalReportModel> buildCustomerDebt() async {
    final txs = await _isar.transactionRecords.where().findAll();
    final customerMap = {for (final c in await _isar.customers.where().findAll()) c.remoteId: c};

    final unpaidTxs = txs.where((t) => t.status == TransactionStatus.negotiating || t.status == TransactionStatus.deposited).toList();

    final flex = [18, 14, 18, 16, 12];
    final rows = unpaidTxs.map((t) {
      final buyer = customerMap[t.buyerId];
      final seller = customerMap[t.sellerId];
      return ReportRow([
        ReportCell(buyer?.name ?? ''),
        ReportCell(t.transactionCode ?? ''),
        ReportCell(seller?.name ?? ''),
        ReportCell(formatMoney(t.commission ?? 0), align: ReportCellAlign.right),
        ReportCell(t.status.name),
      ]);
    }).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CONG NO KHACH HANG',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Nguoi mua', align: ReportCellAlign.left), const ReportHeaderCell('Ma GD'), const ReportHeaderCell('Nguoi ban'), const ReportHeaderCell('Hoa mai (TY)'), const ReportHeaderCell('TT')],
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
    final txs = await _isar.transactionRecords.where().findAll();

    final completed = txs.where((t) => t.status == TransactionStatus.completed).fold<double>(0, (s, t) => s + (t.commission ?? 0));
    final negotiating = txs.where((t) => t.status == TransactionStatus.negotiating).fold<double>(0, (s, t) => s + (t.commission ?? 0));
    final deposited = txs.where((t) => t.status == TransactionStatus.deposited).fold<double>(0, (s, t) => s + (t.commission ?? 0));
    final notarized = txs.where((t) => t.status == TransactionStatus.notarized).fold<double>(0, (s, t) => s + (t.commission ?? 0));

    final flex = [30, 18, 14];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Da hoan thanh', isBold: true), ReportCell(formatMoney(completed), align: ReportCellAlign.right, isBold: true), ReportCell('${txs.where((t) => t.status == TransactionStatus.completed).length} GD')]),
      ReportRow([const ReportCell('Dang dat coc'), ReportCell(formatMoney(deposited), align: ReportCellAlign.right), ReportCell('${txs.where((t) => t.status == TransactionStatus.deposited).length} GD')]),
      ReportRow([const ReportCell('Dang lo gia'), ReportCell(formatMoney(negotiating), align: ReportCellAlign.right), ReportCell('${txs.where((t) => t.status == TransactionStatus.negotiating).length} GD')]),
      ReportRow([const ReportCell('Da cong chung'), ReportCell(formatMoney(notarized), align: ReportCellAlign.right), ReportCell('${txs.where((t) => t.status == TransactionStatus.notarized).length} GD')]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP CONG NO THEO TRANG THAI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Trang thai', align: ReportCellAlign.left), const ReportHeaderCell('Tong hoa mai (TY)'), const ReportHeaderCell('So GD')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 18. rpBaoCaoHaoHutNguyenVatLieuHangHoa.rpt — Hao hut phi san =====
  Future<CrystalReportModel> buildFeeBreakdown() async {
    final fees = await _isar.floorFees.where().findAll();

    final typeTotals = <String, double>{};
    for (final f in fees) {
      final type = f.feeType.label;
      typeTotals[type] = (typeTotals[type] ?? 0) + (f.amount ?? 0);
    }

    final flex = [30, 20];
    final rows = typeTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(formatMoney(e.value), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET PHI THEO LOAI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai phi', align: ReportCellAlign.left), const ReportHeaderCell('Tong tien (TY)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(typeTotals.values.fold<double>(0, (s, v) => s + v)), align: ReportCellAlign.right, isBold: true)]),
      ],
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 19. rpBaoCaoTongHopXuatNhapTonVatTu.rpt — Tong hop BDS =====
  Future<CrystalReportModel> buildPropertySummary() async {
    final properties = await _isar.propertys.where().findAll();

    final totalProperties = properties.length;
    final totalValue = properties.fold<double>(0, (s, p) => s + (p.price ?? 0));
    final available = properties.where((p) => p.status == PropertyStatus.available).length;
    final sold = properties.where((p) => p.status == PropertyStatus.sold).length;

    final flex = [30, 14, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Tong cong BDS', isBold: true), ReportCell('$totalProperties', align: ReportCellAlign.right), ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('Dang ban'), ReportCell('$available', align: ReportCellAlign.right), const ReportCell('')]),
      ReportRow([const ReportCell('Da ban'), ReportCell('$sold', align: ReportCellAlign.right), const ReportCell('')]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP BAT DONG SAN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Noi dung', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (TY)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 20. rpS10DN.rpt — Lai lo =====
  Future<CrystalReportModel> buildProfitLoss({required DateTime from, required DateTime to}) async {
    final txs = await _isar.transactionRecords.where().findAll();
    final fees = await _isar.floorFees.where().findAll();

    final completedTxs = txs.where((t) => t.transactionDate != null && _inRange(t.transactionDate!, from, to) && t.status == TransactionStatus.completed);
    final feeInRange = fees.where((f) => f.feeDate != null && _inRange(f.feeDate!, from, to));

    final tongHoaMai = completedTxs.fold<double>(0, (s, t) => s + (t.commission ?? 0));
    final tongPhiSanThu = feeInRange.where((f) => !_isExpense(f)).fold<double>(0, (s, f) => s + (f.amount ?? 0));
    final tongThu = tongHoaMai + tongPhiSanThu;

    final tongPhiGiaoDich = completedTxs.fold<double>(0, (s, t) => s + (t.floorFee ?? 0));
    final tongPhiChi = feeInRange.where(_isExpense).fold<double>(0, (s, f) => s + (f.amount ?? 0));
    final tongChi = tongPhiGiaoDich + tongPhiChi;

    final flex = [42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('=== THU ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('  Hoa mai giao dich'), ReportCell(formatMoney(tongHoaMai), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('  Phi san thu duoc'), ReportCell(formatMoney(tongPhiSanThu), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Tong thu', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell(''), const ReportCell('')]),
      ReportRow([const ReportCell('=== CHI ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('  Phi giao dich'), ReportCell(formatMoney(tongPhiGiaoDich), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('  Phi san chi ra'), ReportCell(formatMoney(tongPhiChi), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Tong chi', isBold: true), ReportCell(formatMoney(tongChi), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell(''), const ReportCell('')]),
      ReportRow([const ReportCell('=== LAI/LO ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('Loi nhuan rong', isBold: true), ReportCell(formatMoney(tongThu - tongChi), align: ReportCellAlign.right, isBold: true)]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BAO CAO LAI LO',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Noi dung', align: ReportCellAlign.left), const ReportHeaderCell('So tien (TY VND)')],
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
    (code: 'rpBaoCaoTongHopXuatNhapTonVatTu', title: 'Tong hop BDS',      group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpBaoCaoHaoHutNguyenVatLieuHangHoa', title: 'Chi tiet phi san', group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputByStock',         title: 'Xuat nhap ton BDS',         group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputFromShift',       title: 'BDS theo loai',             group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpSoChiTietThanhToanNguoiBan', title: 'Cong no KH',          group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpSoTongHopThanhToanVoiNguoiBan', title: 'Tong hop cong no',  group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpS10DN',                 title: 'Bao cao loi lo',            group: '★ Lai lo',                    useDateRange: true),
    (code: 'rpBill',                  title: 'Danh sach giao dich',       group: 'Hoa don',                     useDateRange: true),
    (code: 'rpReceipt',               title: 'Phieu thu chi tiet',        group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnBill',   title: 'GD da hoan thanh',          group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnFoodOrDrink', title: 'Hoa mai theo loai BDS', group: 'Hoa don',                    useDateRange: true),
    (code: 'rpBillForTax',            title: 'Hoa don theo GD',           group: 'Hoa don',                     useDateRange: true),
    (code: 'rpPaymentByPaymentID',    title: 'Phieu thu theo ma GD',      group: 'Thu chi',                     useDateRange: true),
    (code: 'rpPaymentForCashier',     title: 'Thu tien hoa mai',          group: 'Thu chi',                     useDateRange: true),
    (code: 'rpInput',                 title: 'Danh sach phi san',         group: 'Thu chi',                     useDateRange: true),
    (code: 'rpListInput',             title: 'Tong hop phi theo loai',    group: 'Thu chi',                     useDateRange: true),
    (code: 'rpBillForField',          title: 'BDS theo quan/huyen',       group: 'Dich vu',                     useDateRange: false),
    (code: 'rpBillForField_IsNotUsed', title: 'BDS chua ban',             group: 'Dich vu',                     useDateRange: false),
  ];

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return buildCashFundSummary(from: from, to: to);
      case 'rp1111_Detail': return buildCashFundDetail(from: from, to: to);
      case 'rpBill': return buildTransactionList(from: from, to: to);
      case 'rpReceipt': return buildReceiptDetail(from: from, to: to);
      case 'rpBill_DiscountOnBill': return buildCompletedTransactions(from: from, to: to);
      case 'rpBill_DiscountOnFoodOrDrink': return buildCommissionByPropertyType(from: from, to: to);
      case 'rpPaymentByPaymentID': return buildPaymentByTxCode(from: from, to: to);
      case 'rpPaymentForCashier': return buildCommissionCollection(from: from, to: to);
      case 'rpInput': return buildFloorFeeList(from: from, to: to);
      case 'rpListInput': return buildExpenseByCategory(from: from, to: to);
      case 'rpOutputByStock': return buildInventorySummary();
      case 'rpOutputFromShift': return buildPropertyByType();
      case 'rpBillForField': return buildPropertyByDistrict();
      case 'rpBillForField_IsNotUsed': return buildAvailableProperties();
      case 'rpBillForTax': return buildInvoiceByTransaction(from: from, to: to);
      case 'rpSoChiTietThanhToanNguoiBan': return buildCustomerDebt();
      case 'rpSoTongHopThanhToanVoiNguoiBan': return buildDebtSummary();
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return buildFeeBreakdown();
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return buildPropertySummary();
      case 'rpS10DN': return buildProfitLoss(from: from, to: to);
      default: return buildCashFundSummary(from: from, to: to);
    }
  }
}

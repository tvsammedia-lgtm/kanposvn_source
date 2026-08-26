import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../models/member.dart';
import '../models/membership_plan.dart';
import '../models/check_in.dart';
import '../models/asset.dart';
import '../services/gym_isar_service.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';

class GymReportService {
  final GymIsarService _isarService;
  GymReportService(this._isarService);

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

  Future<Isar> _db() async => _isarService.db;

  // ===== 1. rp1111.rpt — Tong hop quy tien mat =====
  Future<CrystalReportModel> buildCashFundSummary({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final assets = await isar.gymAssets.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};

    final soldInRange = cards.where((c) => _inRange(c.startDate, from, to));
    final totalThu = soldInRange.fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));

    final openingCards = cards.where((c) => c.startDate.isBefore(from));
    final opening = openingCards.fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));

    final chiFromAssets = assets.where((a) => _inRange(a.purchaseDate, from, to))
        .fold<double>(0, (s, a) => s + a.purchasePrice);

    final closing = opening + totalThu - chiFromAssets;

    final flex = [6, 42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('1'), const ReportCell('So du dau ky', isBold: true), ReportCell(formatMoney(opening), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('2'), const ReportCell('Tong thu trong ky (ban goi tap)', isBold: true), ReportCell(formatMoney(totalThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('3'), const ReportCell('Tong chi trong ky (mua TB)', isBold: true), ReportCell(formatMoney(chiFromAssets), align: ReportCellAlign.right, isBold: true)]),
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

  // ===== 2. rp1111_Detail.rpt — Chi tiet quy tien mat =====
  Future<CrystalReportModel> buildCashFundDetail({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final assets = await isar.gymAssets.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [10, 14, 30, 12, 12];
    final rows = <ReportRow>[];

    for (final c in cards) {
      if (!_inRange(c.startDate, from, to)) continue;
      final member = memberMap[c.memberId];
      final plan = planMap[c.planId];
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(c.startDate)),
        ReportCell(c.cardId),
        ReportCell('Ban goi ${plan?.name ?? ''} - ${member?.fullName ?? ''}'),
        ReportCell(formatMoney(plan?.price ?? 0), align: ReportCellAlign.right),
        const ReportCell(''),
      ]));
    }

    for (final a in assets) {
      if (!_inRange(a.purchaseDate, from, to)) continue;
      rows.add(ReportRow([
        ReportCell(_dateFmt.format(a.purchaseDate)),
        ReportCell(a.assetId),
        ReportCell('Mua TB: ${a.name}'),
        const ReportCell(''),
        ReportCell(formatMoney(a.purchasePrice), align: ReportCellAlign.right),
      ]));
    }

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET QUY TIEN MAT',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ngay'), const ReportHeaderCell('Ma'), const ReportHeaderCell('Dien giai', align: ReportCellAlign.left), const ReportHeaderCell('Thu (VND)'), const ReportHeaderCell('Chi (VND)')],
      ],
      rows: rows,
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 3. rpBill.rpt — Danh sach ban goi tap =====
  Future<CrystalReportModel> buildCardSalesList({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [12, 18, 14, 16, 12];
    final rows = cards
        .where((c) => _inRange(c.startDate, from, to))
        .map((c) => ReportRow([
          ReportCell(c.cardId),
          ReportCell(memberMap[c.memberId]?.fullName ?? ''),
          ReportCell(_dateFmt.format(c.startDate)),
          ReportCell(formatMoney(planMap[c.planId]?.price ?? 0), align: ReportCellAlign.right),
          ReportCell(c.paymentStatus),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH BAN GOI TAP',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma the'), const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('Ngay ban'), const ReportHeaderCell('Gia tri (VND)'), const ReportHeaderCell('Trang thai')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 4. rpReceipt.rpt — Phieu thu chi tiet =====
  Future<CrystalReportModel> buildReceiptDetail({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [42, 20];
    final rows = <ReportRow>[];

    for (final c in cards) {
      if (!_inRange(c.startDate, from, to)) continue;
      final member = memberMap[c.memberId];
      final plan = planMap[c.planId];
      final prefix = 'The ${c.cardId} - ${member?.fullName ?? ''}';
      rows.add(ReportRow([ReportCell('$prefix: Goi tap'), ReportCell(formatMoney(plan?.price ?? 0), align: ReportCellAlign.right)]));
      rows.add(ReportRow([ReportCell('$prefix: Thoi han'), ReportCell('${_dateFmt.format(c.startDate)} - ${_dateFmt.format(c.endDate)}')]));
      rows.add(ReportRow([ReportCell('$prefix: So luot'), ReportCell('${c.sessionsUsed}/${plan?.totalSessions ?? 0}')]));
      rows.add(ReportRow([const ReportCell(''), ReportCell('')]));
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
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 5. rpBill_DiscountOnBill.rpt — Goi tap thanh vien VIP =====
  Future<CrystalReportModel> buildVIPMembers({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final memberCardCount = <String, int>{};
    for (final c in cards) {
      if (c.startDate.isAfter(to)) continue;
      if (c.endDate.isBefore(from)) continue;
      memberCardCount[c.memberId] = (memberCardCount[c.memberId] ?? 0) + 1;
    }

    final vipMembers = memberCardCount.entries.where((e) => e.value >= 3).toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final flex = [18, 10, 18, 14, 14];
    final rows = vipMembers.map((entry) {
      final member = memberMap[entry.key];
      final memberCards = cards.where((c) => c.memberId == entry.key).toList();
      final totalSpent = memberCards.fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));
      return ReportRow([
        ReportCell(member?.fullName ?? ''),
        ReportCell('${entry.value}'),
        ReportCell(member?.phone ?? ''),
        ReportCell(formatMoney(totalSpent), align: ReportCellAlign.right),
        const ReportCell('VIP'),
      ]);
    }).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'GOI TAP THANH VIEN VIP',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('So goi'), const ReportHeaderCell('SDT'), const ReportHeaderCell('Tong chi'), const ReportHeaderCell('Hang')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 6. rpBill_DiscountOnFoodOrDrink.rpt — Chi tiet theo loai goi =====
  Future<CrystalReportModel> buildCardByPlanType({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};

    final typeTotals = <String, ({int count, double total})>{};
    for (final c in cards) {
      if (!_inRange(c.startDate, from, to)) continue;
      final plan = planMap[c.planId];
      final typeName = plan?.name ?? 'Khac';
      final cur = typeTotals[typeName];
      typeTotals[typeName] = (count: (cur?.count ?? 0) + 1, total: (cur?.total ?? 0) + (plan?.price ?? 0));
    }

    final flex = [30, 14, 20];
    final rows = typeTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.total), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CHI TIET THEO LOAI GOI TAP',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai goi', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Tong tien (VND)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 7. rpPaymentByPaymentID.rpt — Phieu thu theo ma the =====
  Future<CrystalReportModel> buildPaymentByCardID({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [12, 18, 14, 14, 12];
    final rows = cards
        .where((c) => _inRange(c.startDate, from, to))
        .map((c) => ReportRow([
          ReportCell(c.cardId),
          ReportCell(memberMap[c.memberId]?.fullName ?? ''),
          ReportCell(_dateFmt.format(c.startDate)),
          ReportCell(formatMoney(planMap[c.planId]?.price ?? 0), align: ReportCellAlign.right),
          ReportCell(c.paymentStatus),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'PHIEU THU THEO MA THE',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma the'), const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('Ngay'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 8. rpPaymentForCashier.rpt — Thu tien ban goi =====
  Future<CrystalReportModel> buildCashierCollection({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [18, 14, 14, 16];
    final rows = cards
        .where((c) => _inRange(c.startDate, from, to) && c.paymentStatus == 'paid')
        .map((c) => ReportRow([
          ReportCell(memberMap[c.memberId]?.fullName ?? ''),
          ReportCell(_dateFmt.format(c.startDate)),
          ReportCell(formatMoney(planMap[c.planId]?.price ?? 0), align: ReportCellAlign.right),
          ReportCell(c.paymentStatus),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'THU TIEN BAN GOI TAP',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('Ngay'), const ReportHeaderCell('So tien'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 9. rpInput.rpt — Danh sach mua thiet bi =====
  Future<CrystalReportModel> buildAssetPurchaseList({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();

    final flex = [12, 20, 14, 16, 12];
    final rows = assets
        .where((a) => _inRange(a.purchaseDate, from, to))
        .map((a) => ReportRow([
          ReportCell(a.assetId),
          ReportCell(a.name),
          ReportCell(_dateFmt.format(a.purchaseDate)),
          ReportCell(formatMoney(a.purchasePrice), align: ReportCellAlign.right),
          ReportCell(a.status),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'DANH SACH MUA THIET BI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Ma'), const ReportHeaderCell('Thiet bi', align: ReportCellAlign.left), const ReportHeaderCell('Ngay mua'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 10. rpListInput.rpt — Tong hop chi phi theo loai =====
  Future<CrystalReportModel> buildExpenseByCategory({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();
    final filteredAssets = assets.where((a) => _inRange(a.purchaseDate, from, to)).toList();

    final totalCost = filteredAssets.fold<double>(0, (s, a) => s + a.purchasePrice);
    final avgDepreciation = filteredAssets.isEmpty
        ? 0.0
        : filteredAssets.fold<double>(0, (s, a) => s + a.depreciationMonths) / filteredAssets.length;

    final flex = [30, 14, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Mua thiet bi phong tap', isBold: true), ReportCell('${filteredAssets.length}', align: ReportCellAlign.right), ReportCell(formatMoney(totalCost), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Thoi gian KH trung binh'), ReportCell('${avgDepreciation.round()} thang', align: ReportCellAlign.right), const ReportCell('')]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP CHI PHI THEO LOAI',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai chi', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Tong tien (VND)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 11. rpOutputByStock.rpt — Xuat nhap ton thiet bi =====
  Future<CrystalReportModel> buildInventorySummary() async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();

    final flex = [20, 16, 14, 16, 12];
    final rows = assets.map((a) => ReportRow([
      ReportCell(a.name),
      ReportCell(_dateFmt.format(a.purchaseDate)),
      ReportCell(formatMoney(a.purchasePrice), align: ReportCellAlign.right),
      ReportCell('${a.depreciationMonths} thang'),
      ReportCell(a.status),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'XUAT NHAP TON THIET BI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Thiet bi', align: ReportCellAlign.left), const ReportHeaderCell('Ngay mua'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('KH (thang)'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 12. rpOutputFromShift.rpt — Tong hop thiet bi theo trang thai =====
  Future<CrystalReportModel> buildAssetByStatus() async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();

    final statusTotals = <String, ({int count, double total})>{};
    for (final a in assets) {
      final st = a.status;
      final cur = statusTotals[st];
      statusTotals[st] = (count: (cur?.count ?? 0) + 1, total: (cur?.total ?? 0) + a.purchasePrice);
    }

    final flex = [24, 14, 20];
    final rows = statusTotals.entries.map((e) => ReportRow([
      ReportCell(e.key),
      ReportCell(e.value.count.toString(), align: ReportCellAlign.right),
      ReportCell(formatMoney(e.value.total), align: ReportCellAlign.right),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP THIET BI THEO TRANG THAI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Trang thai', align: ReportCellAlign.left), const ReportHeaderCell('So luong'), const ReportHeaderCell('Gia tri (VND)')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 13. rpBillForField.rpt — Lich hoc theo HV =====
  Future<CrystalReportModel> buildClassByMember({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final checkIns = await isar.gymCheckIns.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final memberMap = {for (final m in members) m.memberId: m};

    final memberCheckInCount = <String, int>{};
    for (final ci in checkIns) {
      if (!_inRange(ci.checkInTime, from, to)) continue;
      memberCheckInCount[ci.memberId] = (memberCheckInCount[ci.memberId] ?? 0) + 1;
    }

    final sorted = memberCheckInCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    final flex = [18, 14, 14, 18];
    final rows = sorted.take(30).map((e) {
      final member = memberMap[e.key];
      return ReportRow([
        ReportCell(member?.fullName ?? e.key),
        ReportCell('${e.value}'),
        ReportCell(member?.phone ?? ''),
        ReportCell(member?.target ?? ''),
      ]);
    }).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'LICH HOC THEO HOI VIEN',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('So luot'), const ReportHeaderCell('SDT'), const ReportHeaderCell('Muc tieu')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 14. rpBillForField_IsNotUsed.rpt — HV chua check-in =====
  Future<CrystalReportModel> buildInactiveMembers() async {
    final isar = await _db();
    final members = await isar.gymMembers.where().findAll();
    final checkIns = await isar.gymCheckIns.where().findAll();
    final activeMemberIds = checkIns.map((c) => c.memberId).toSet();

    final inactive = members.where((m) => !activeMemberIds.contains(m.memberId)).toList();

    final flex = [18, 14, 18, 14];
    final rows = inactive.map((m) => ReportRow([
      ReportCell(m.fullName),
      ReportCell(m.phone),
      ReportCell(_dateFmt.format(m.createdAt)),
      ReportCell(m.status),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'HOI VIEN CHUA CHECK-IN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('SDT'), const ReportHeaderCell('Ngay dang ky'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 15. rpBillForTax.rpt — Hoa don theo goi =====
  Future<CrystalReportModel> buildInvoiceByPlan({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final flex = [18, 14, 18, 14, 14];
    final rows = cards
        .where((c) => _inRange(c.startDate, from, to))
        .map((c) => ReportRow([
          ReportCell(memberMap[c.memberId]?.fullName ?? ''),
          ReportCell(planMap[c.planId]?.name ?? ''),
          ReportCell('${_dateFmt.format(c.startDate)} - ${_dateFmt.format(c.endDate)}'),
          ReportCell(formatMoney(planMap[c.planId]?.price ?? 0), align: ReportCellAlign.right),
          ReportCell(c.paymentStatus),
        ]))
        .toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'HOA DON THEO GOI TAP',
      subtitleLines: ['Tu ngay ${_dateFmt.format(from)} den ngay ${_dateFmt.format(to)}'],
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('Goi tap'), const ReportHeaderCell('Thoi han'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 16. rpSoChiTietThanhToanNguoiBan.rpt — Cong no HV =====
  Future<CrystalReportModel> buildCustomerDebt() async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final members = await isar.gymMembers.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};
    final memberMap = {for (final m in members) m.memberId: m};

    final unpaidCards = cards.where((c) => c.paymentStatus != 'paid').toList();

    final flex = [18, 14, 18, 16, 12];
    final rows = unpaidCards.map((c) {
      final member = memberMap[c.memberId];
      final plan = planMap[c.planId];
      return ReportRow([
        ReportCell(member?.fullName ?? ''),
        ReportCell(c.cardId),
        ReportCell(plan?.name ?? ''),
        ReportCell(formatMoney(plan?.price ?? 0), align: ReportCellAlign.right),
        ReportCell(c.paymentStatus),
      ]);
    }).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'CONG NO HOI VIEN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Hoi vien', align: ReportCellAlign.left), const ReportHeaderCell('Ma the'), const ReportHeaderCell('Goi tap'), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('TT')],
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
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};

    final unpaid = cards.where((c) => c.paymentStatus == 'unpaid').fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));
    final partial = cards.where((c) => c.paymentStatus == 'partial').fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));
    final paid = cards.where((c) => c.paymentStatus == 'paid').fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));

    final flex = [30, 18, 18];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Da thanh toan', isBold: true), ReportCell(formatMoney(paid), align: ReportCellAlign.right, isBold: true), ReportCell('${cards.where((c) => c.paymentStatus == 'paid').length} the')]),
      ReportRow([const ReportCell('Chua thanh toan'), ReportCell(formatMoney(unpaid), align: ReportCellAlign.right), ReportCell('${cards.where((c) => c.paymentStatus == 'unpaid').length} the')]),
      ReportRow([const ReportCell('Thanh toan mot phan'), ReportCell(formatMoney(partial), align: ReportCellAlign.right), ReportCell('${cards.where((c) => c.paymentStatus == 'partial').length} the')]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP CONG NO HOI VIEN',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Loai', align: ReportCellAlign.left), const ReportHeaderCell('So tien (VND)'), const ReportHeaderCell('So the')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell('TONG CONG', isBold: true), ReportCell(formatMoney(unpaid + partial), align: ReportCellAlign.right, isBold: true), const ReportCell('')]),
      ],
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 18. rpBaoCaoHaoHutNguyenVatLieuHangHoa.rpt — Hao hut thiet bi =====
  Future<CrystalReportModel> buildAssetDepreciation() async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();

    final flex = [20, 16, 16, 14, 12];
    final rows = assets.map((a) => ReportRow([
      ReportCell(a.name),
      ReportCell(formatMoney(a.purchasePrice), align: ReportCellAlign.right),
      ReportCell('${a.depreciationMonths} thang'),
      ReportCell(_dateFmt.format(a.purchaseDate)),
      ReportCell(a.status),
    ])).toList();

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'BAO CAO HAO HUT THIET BI',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Thiet bi', align: ReportCellAlign.left), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('KH (thang)'), const ReportHeaderCell('Ngay mua'), const ReportHeaderCell('TT')],
      ],
      rows: rows,
      signature: [const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)')],
    );
  }

  // ===== 19. rpBaoCaoTongHopXuatNhapTonVatTu.rpt — Tong hop thiet bi =====
  Future<CrystalReportModel> buildAssetSummary() async {
    final isar = await _db();
    final assets = await isar.gymAssets.where().findAll();

    final totalAssets = assets.length;
    final totalValue = assets.fold<double>(0, (s, a) => s + a.purchasePrice);
    final avgMonths = assets.isEmpty ? 0.0 : assets.fold<double>(0, (s, a) => s + a.depreciationMonths) / assets.length;
    final depreciationTotal = assets.fold<double>(0, (s, a) => s + a.purchasePrice / a.depreciationMonths);

    final flex = [30, 14, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('Tong cong thiet bi', isBold: true), ReportCell('$totalAssets', align: ReportCellAlign.right), ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell('Thoi gian KH trung binh'), ReportCell('${avgMonths.round()} thang', align: ReportCellAlign.right), const ReportCell('')]),
      ReportRow([const ReportCell('Khau hao/thang'), const ReportCell('', align: ReportCellAlign.right), ReportCell(formatMoney(depreciationTotal), align: ReportCellAlign.right)]),
    ];

    return CrystalReportModel(
      formLine: 'Mau so S03a-DN',
      unitName: 'Don vi: $_kUnit',
      title: 'TONG HOP THIET BI PHONG TAP',
      columnFlex: flex,
      headerRows: [
        [const ReportHeaderCell('Noi dung', align: ReportCellAlign.left), const ReportHeaderCell('Gia tri'), const ReportHeaderCell('So tien (VND)')],
      ],
      rows: rows,
      totalRows: [
        ReportRow([const ReportCell('TONG GIA TRI', isBold: true), const ReportCell(''), ReportCell(formatMoney(totalValue), align: ReportCellAlign.right, isBold: true)]),
      ],
      signature: [
        const ReportSignatureItem('Nguoi lap bieu', '(Ky, ghi ro ho ten)'),
        const ReportSignatureItem('Ke toan truong', '(Ky, ghi ro ho ten)'),
      ],
    );
  }

  // ===== 20. rpS10DN.rpt — Lai lo =====
  Future<CrystalReportModel> buildProfitLoss({required DateTime from, required DateTime to}) async {
    final isar = await _db();
    final cards = await isar.gymMembershipCards.where().findAll();
    final plans = await isar.gymPlans.where().findAll();
    final assets = await isar.gymAssets.where().findAll();
    final planMap = {for (final p in plans) p.planId: p};

    final soldInRange = cards.where((c) => _inRange(c.startDate, from, to));
    final tongThu = soldInRange.fold<double>(0, (s, c) => s + (planMap[c.planId]?.price ?? 0));
    final chiFromAssets = assets.where((a) => _inRange(a.purchaseDate, from, to))
        .fold<double>(0, (s, a) => s + a.purchasePrice);

    final depreciationMonthly = assets.fold<double>(0, (s, a) => s + a.purchasePrice / a.depreciationMonths);

    final flex = [42, 20];
    final rows = <ReportRow>[
      ReportRow([const ReportCell('=== THU ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('  Ban goi tap'), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Tong thu', isBold: true), ReportCell(formatMoney(tongThu), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell(''), const ReportCell('')]),
      ReportRow([const ReportCell('=== CHI ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('  Mua thiet bi'), ReportCell(formatMoney(chiFromAssets), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('  Khau hao thiet bi/thang'), ReportCell(formatMoney(depreciationMonthly), align: ReportCellAlign.right)]),
      ReportRow([const ReportCell('Tong chi', isBold: true), ReportCell(formatMoney(chiFromAssets + depreciationMonthly), align: ReportCellAlign.right, isBold: true)]),
      ReportRow([const ReportCell(''), const ReportCell('')]),
      ReportRow([const ReportCell('=== LAI/LO ===', isBold: true), const ReportCell('')]),
      ReportRow([const ReportCell('Loi nhuan rong', isBold: true), ReportCell(formatMoney(tongThu - chiFromAssets - depreciationMonthly), align: ReportCellAlign.right, isBold: true)]),
    ];

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
        ReportRow([const ReportCell('LOI NHUAN RONG', isBold: true), ReportCell(formatMoney(tongThu - chiFromAssets - depreciationMonthly), align: ReportCellAlign.right, isBold: true)]),
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
    (code: 'rpBaoCaoTongHopXuatNhapTonVatTu', title: 'Tong hop thiet bi',  group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpBaoCaoHaoHutNguyenVatLieuHangHoa', title: 'Hao hut thiet bi', group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputByStock',         title: 'Xuat nhap ton thiet bi',    group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpOutputFromShift',       title: 'Thiet bi theo trang thai',  group: '★ Xuat nhap ton kho',         useDateRange: false),
    (code: 'rpSoChiTietThanhToanNguoiBan', title: 'Cong no HV',          group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpSoTongHopThanhToanVoiNguoiBan', title: 'Tong hop cong no',  group: '★ Cong no KH-NCC',            useDateRange: false),
    (code: 'rpS10DN',                 title: 'Bao cao loi lo',            group: '★ Lai lo',                    useDateRange: true),
    (code: 'rpBill',                  title: 'Danh sach ban goi tap',     group: 'Hoa don',                     useDateRange: true),
    (code: 'rpReceipt',               title: 'Phieu thu chi tiet',        group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnBill',   title: 'Goi tap thanh vien VIP',    group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBill_DiscountOnFoodOrDrink', title: 'Chi tiet theo loai',   group: 'Hoa don',                     useDateRange: true),
    (code: 'rpBillForTax',            title: 'Hoa don theo goi tap',      group: 'Hoa don',                     useDateRange: true),
    (code: 'rpPaymentByPaymentID',    title: 'Phieu thu theo ma the',     group: 'Thu chi',                     useDateRange: true),
    (code: 'rpPaymentForCashier',     title: 'Thu tien ban goi',          group: 'Thu chi',                     useDateRange: true),
    (code: 'rpInput',                 title: 'Danh sach mua thiet bi',    group: 'Thu chi',                     useDateRange: true),
    (code: 'rpListInput',             title: 'Tong hop chi phi theo loai',group: 'Thu chi',                     useDateRange: true),
    (code: 'rpBillForField',          title: 'Lich hoc theo HV',          group: 'Dich vu',                     useDateRange: true),
    (code: 'rpBillForField_IsNotUsed', title: 'HV chua check-in',         group: 'Dich vu',                     useDateRange: false),
  ];

  Future<CrystalReportModel> generateReport(String code, DateTime from, DateTime to) async {
    switch (code) {
      case 'rp1111': return buildCashFundSummary(from: from, to: to);
      case 'rp1111_Detail': return buildCashFundDetail(from: from, to: to);
      case 'rpBill': return buildCardSalesList(from: from, to: to);
      case 'rpReceipt': return buildReceiptDetail(from: from, to: to);
      case 'rpBill_DiscountOnBill': return buildVIPMembers(from: from, to: to);
      case 'rpBill_DiscountOnFoodOrDrink': return buildCardByPlanType(from: from, to: to);
      case 'rpPaymentByPaymentID': return buildPaymentByCardID(from: from, to: to);
      case 'rpPaymentForCashier': return buildCashierCollection(from: from, to: to);
      case 'rpInput': return buildAssetPurchaseList(from: from, to: to);
      case 'rpListInput': return buildExpenseByCategory(from: from, to: to);
      case 'rpOutputByStock': return buildInventorySummary();
      case 'rpOutputFromShift': return buildAssetByStatus();
      case 'rpBillForField': return buildClassByMember(from: from, to: to);
      case 'rpBillForField_IsNotUsed': return buildInactiveMembers();
      case 'rpBillForTax': return buildInvoiceByPlan(from: from, to: to);
      case 'rpSoChiTietThanhToanNguoiBan': return buildCustomerDebt();
      case 'rpSoTongHopThanhToanVoiNguoiBan': return buildDebtSummary();
      case 'rpBaoCaoHaoHutNguyenVatLieuHangHoa': return buildAssetDepreciation();
      case 'rpBaoCaoTongHopXuatNhapTonVatTu': return buildAssetSummary();
      case 'rpS10DN': return buildProfitLoss(from: from, to: to);
      default: return buildCashFundSummary(from: from, to: to);
    }
  }
}

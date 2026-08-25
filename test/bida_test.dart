import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_finance.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_inventory_tx.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_item.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_partner.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_session.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_table.dart';
import 'package:kanposvn/modules/kanposvnbida/services/bida_business_logic.dart';
import 'package:kanposvn/modules/kanposvnbida/services/bida_isar_service.dart';
import 'package:kanposvn/modules/kanposvnbida/services/bida_seed_data.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Stub path_provider để mở Isar trong môi trường test.
class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late BidaIsarService service;
  late Isar db;
  late List<BidaTable> tables;
  late List<BidaItem> items;
  late List<BidaPricingRule> rules;
  late List<BidaBlockPlan> plans;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('bida_logic_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    service = BidaIsarService();
    db = await service.db;
    await BidaSeedData.seedIfEmpty(service);
    tables = await db.bidaTables.where().findAll();
    items = await db.bidaItems.where().findAll();
    rules = await db.bidaPricingRules.where().findAll();
    plans = await db.bidaBlockPlans.where().findAll();
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  BidaItem itemById(String id) => items.firstWhere((i) => i.itemId == id);
  BidaTable tableByName(String name) =>
      tables.firstWhere((t) => t.name.contains(name));

  group('IV. Thiết lập giá theo khung giờ / cuối tuần / loại bàn', () {
    // Thứ 4 (weekday), thứ 7 (weekend).
    final wed10h = DateTime(2026, 8, 19, 10, 0);
    final wed18h = DateTime(2026, 8, 19, 18, 0);
    final sat10h = DateTime(2026, 8, 22, 10, 0);

    test('Ngày thường 08-17 = 70k', () {
      expect(
          BidaBusinessLogic.resolveHourlyPrice(
              table: tableByName('Libre'), at: wed10h, rules: rules),
          70000);
    });
    test('Ca tối 17-23 = 90k', () {
      expect(
          BidaBusinessLogic.resolveHourlyPrice(
              table: tableByName('Libre'), at: wed18h, rules: rules),
          90000);
    });
    test('Cuối tuần = 100k (ưu tiên hơn rule thường)', () {
      expect(
          BidaBusinessLogic.resolveHourlyPrice(
              table: tableByName('Libre'), at: sat10h, rules: rules),
          100000);
    });
    test('Ngoài khung có rule -> giá gốc bàn', () {
      final wed23h30 = DateTime(2026, 8, 19, 23, 30);
      final libreTable = tableByName('Libre');
      expect(
          BidaBusinessLogic.resolveHourlyPrice(
              table: libreTable, at: wed23h30, rules: rules),
          libreTable.hourlyPrice); // fallback giá gốc (60k với bàn Libre)
    });
  });

  group('VI + VII. Tính tiền giờ / block / combo', () {
    // Ví dụ VI: vào 18:15 ra 20:45, đơn giá 90k -> 225k.
    test('Ví dụ spec VI: 2h30 x 90k = 225.000đ', () {
      final r = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 18, 15),
        end: DateTime(2026, 8, 19, 20, 45),
        pricePerHour: 90000,
        roundingMinutes: 15,
      );
      expect(r.minutes, 150);
      expect(r.cost, 225000);
    });

    test('Làm tròn lên theo block 15 phút', () {
      final r = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 18, 0),
        end: DateTime(2026, 8, 19, 18, 41), // 41 phút -> làm tròn 45
        pricePerHour: 90000,
        roundingMinutes: 15,
      );
      expect(r.minutes, 45);
      expect(r.cost, closeTo(67500, 0.01));
    });

    test('Chơi 5 phút vẫn tính tối thiểu 1 block', () {
      final r = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 18, 0),
        end: DateTime(2026, 8, 19, 18, 5),
        pricePerHour: 60000,
        roundingMinutes: 30,
      );
      expect(r.minutes, 30);
      expect(r.cost, 30000);
    });

    test('Block 3h đầu 250k, sau đó 80k/giờ (spec VII)', () {
      final plan = plans.firstWhere((p) => p.planId == 'block3h');
      // Đúng 3 giờ -> trọn 250k.
      final in3h = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 9),
        end: DateTime(2026, 8, 19, 12),
        pricePerHour: 70000,
        roundingMinutes: 15,
        plan: plan,
      );
      expect(in3h.cost, 250000);
      // 4h30 -> 250k + 1h30x80k = 370k.
      final over = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 9),
        end: DateTime(2026, 8, 19, 13, 30),
        pricePerHour: 70000,
        roundingMinutes: 15,
        plan: plan,
      );
      expect(over.cost, 370000);
    });

    test('Combo 4 giờ 300k cho bàn Lỗ', () {
      final plan = plans.firstWhere((p) => p.planId == 'combo4h');
      final r = BidaBusinessLogic.calcTimeCost(
        start: DateTime(2026, 8, 19, 9),
        end: DateTime(2026, 8, 19, 11, 20), // < 4h vẫn trọn combo
        pricePerHour: 70000,
        roundingMinutes: 15,
        plan: plan,
      );
      expect(r.cost, 300000);
    });
  });

  group('III + V + VIII. Mở bàn / đặt trước / cọc', () {
    test('Mở bàn -> PLAYING, chốt giá theo khung giờ mở bàn, ghi cọc', () async {
      final t = tableByName('Libre 05');
      // Thứ 4 19h (ngày thường ca tối) -> 90k/h.
      final wednesday19h = DateTime(2026, 8, 19, 19, 0);
      final s = await BidaBusinessLogic.openTable(db,
          table: t, rules: rules, deposit: 100000, at: wednesday19h);
      expect(t.status, BidaTableStatus.PLAYING);
      expect(s.deposit, 100000);
      // Mở lúc 19h ngày thường -> 90k/h.
      expect(s.hourlyPrice, 90000);
    });

    test('Không mở được bàn đang chơi', () async {
      final t = tableByName('Libre 05');
      expect(
        () => BidaBusinessLogic.openTable(db, table: t),
        throwsException,
      );
    });

    test('Đặt trước bàn -> RESERVED rồi mở bình thường được', () async {
      final t = tableByName('Libre 06');
      await BidaBusinessLogic.reserveTable(db, t, deposit: 50000);
      expect(t.status, BidaTableStatus.RESERVED);
      final s = await BidaBusinessLogic.openTable(db, table: t, at: DateTime.now());
      expect(s.status, BidaSessionStatus.OPEN);
      expect(t.status, BidaTableStatus.PLAYING);
    });
  });

  group('XIII-XIV. Bán hàng & kho', () {
    test('Gọi món trừ kho và ghi phiếu xuất', () async {
      final t = tableByName('Libre 07');
      final s = await BidaBusinessLogic.openTable(db, table: t, at: DateTime.now());
      final coca = itemById('bdr009');
      final before = coca.stock;
      await BidaBusinessLogic.addItemToSession(db, s, coca, quantity: 3);
      expect(coca.stock, before - 3);
      final txs = await db.bidaInventoryTxs
          .filter()
          .itemIdEqualTo('bdr009')
          .typeEqualTo(BidaInventoryTxType.EXPORT)
          .findAll();
      expect(txs.where((x) => x.note == 'Bán tại bàn'), isNotEmpty);
    });

    test('Hết hàng thì từ chối bán', () async {
      final t = tableByName('Libre 02');
      final s = await BidaBusinessLogic.openTable(db, table: t, at: DateTime.now());
      final ga = itemById('bfo004'); // Gà rán chỉ còn 20
      expect(() => BidaBusinessLogic.addItemToSession(db, s, ga, quantity: 999),
          throwsException);
      // Gọi lượng hợp lệ để có dữ liệu cho test ghép bàn phía sau.
      await BidaBusinessLogic.addItemToSession(db, s, itemById('bdr003'), quantity: 2);
    });
  });

  group('IX + X. Chuyển bàn / ghép bàn', () {
    test('Chuyển bàn giữ nguyên thời gian bắt đầu', () async {
      final from = tableByName('Libre 07');
      final to = tableByName('Libre 03');
      final sessions = await db.bidaSessions.where().findAll();
      for (final x in sessions) {
        await x.table.load();
      }
      final s = sessions.firstWhere((x) =>
          x.status == BidaSessionStatus.OPEN && x.table.value?.id == from.id);
      final startBefore = s.startTime;
      await BidaBusinessLogic.transferTable(db, s, to);
      final fromAfter = await db.bidaTables.get(from.id);
      final toAfter = await db.bidaTables.get(to.id);
      expect(fromAfter!.status, BidaTableStatus.EMPTY);
      expect(toAfter!.status, BidaTableStatus.PLAYING);
      expect(s.startTime, startBefore);
      expect(s.table.value?.id, to.id);
    });

    test('Ghép bàn: món + tiền giờ dồn về đích, nguồn đóng', () async {
      final src = tableByName('Libre 02'); // phiên có 2 Pepsi (từ test hết hàng)
      final dst = tableByName('Libre 03'); // nhận chuyển bàn từ Libre 07
      final sessions = await db.bidaSessions.where().findAll();
      for (final x in sessions) {
        await x.table.load();
      }
      final srcSession = sessions
          .firstWhere((x) => x.status == BidaSessionStatus.OPEN && x.table.value?.id == src.id);
      final dstSession = sessions
          .firstWhere((x) => x.status == BidaSessionStatus.OPEN && x.table.value?.id == dst.id);
      final srcItemCount =
          srcSession.orderLines.fold<int>(0, (s, l) => s + l.quantity);
      final dstLinesBefore = dstSession.orderLines.length;

      await BidaBusinessLogic.mergeTables(db, srcSession, dstSession,
          sourceTimeCost: 150000);

      expect(srcSession.status, BidaSessionStatus.CANCELLED);
      final srcAfter = await db.bidaTables.get(src.id);
      expect(srcAfter!.status, BidaTableStatus.EMPTY);
      // Dòng tiền ghép + gộp món.
      expect(dstSession.orderLines.length, greaterThan(dstLinesBefore));
      final mergeLine = dstSession.orderLines
          .firstWhere((l) => l.itemId.startsWith('MERGE_TIME_'));
      expect(mergeLine.price, 150000);
      final totalQtyMoved = dstSession.orderLines
          .where((l) => !l.itemId.startsWith('MERGE_TIME_'))
          .fold<int>(0, (s, l) => s + l.quantity);
      expect(totalQtyMoved, greaterThanOrEqualTo(srcItemCount));
    });
  });

  group('XI. Tách hóa đơn', () {
    test('Tách món sang hóa đơn thứ hai trên cùng bàn', () async {
      final t = tableByName('Libre 05'); // phiên đang mở từ group Mở bàn
      final sessions = await db.bidaSessions.where().findAll();
      for (final x in sessions) {
        await x.table.load();
      }
      final s = sessions.firstWhere((x) =>
          x.status == BidaSessionStatus.OPEN && x.table.value?.id == t.id);
      if (s.orderLines.isEmpty) {
        await BidaBusinessLogic.addItemToSession(db, s, itemById('bdr001'));
        await BidaBusinessLogic.addItemToSession(db, s, itemById('bfo001'));
      }

      final split =
          await BidaBusinessLogic.splitSession(db, s, ['bfo001']);
      expect(split.status, BidaSessionStatus.OPEN);
      expect(split.table.value?.id, t.id);
      expect(split.orderLines.map((l) => l.itemId), ['bfo001']);
      expect(s.orderLines.map((l) => l.itemId), contains('bdr001'));
      expect(s.orderLines.map((l) => l.itemId), isNot(contains('bfo001')));
      // Tiền giờ nằm ở hóa đơn gốc.
      expect(split.hourlyPrice, 0);
      expect(s.hourlyPrice, greaterThan(0));
    });
  });

  group('VII-XVIII. Thanh toán / giảm giá / cọc / công nợ / điểm', () {
    test('Ví dụ XVIII: khách thiếu tiền -> còn nợ đúng 550k sau thu 300k', () async {
      final customer = await db.bidaCustomers
          .filter()
          .customerIdEqualTo('kh_vana')
          .findFirst();
      expect(customer!.name, 'Nguyễn Văn A');
      expect(customer.debtBalance, 550000); // 850k nợ - 300k đã trả

      // Phiên mới: nợ thêm 20k.
      final debtBefore = customer.debtBalance;
      final t = tableByName('Lỗ 01'); // giá gốc 70k/giờ
      final s = await BidaBusinessLogic.openTable(db,
          table: t, at: DateTime.now(), customer: customer, deposit: 50000);

      // Giờ chơi giả lập 1h x 70k = 70k; không đưa thêm tiền mặt.
      final result = await BidaBusinessLogic.checkoutSession(
        db,
        s,
        timeCost: 70000,
        cashReceived: 0,
        customer: customer,
      );
      // grandTotal 70k - cọc 50k = thiếu 20k -> thành nợ.
      expect(result.grandTotal, 70000);
      expect(result.debtAdded, 20000);
      // Đọc lại khách từ DB (logic cập nhật bản ghi mới trong txn).
      final after = await db.bidaCustomers
          .filter()
          .customerIdEqualTo('kh_vana')
          .findFirst();
      expect(after!.debtBalance, debtBefore + 20000);
      // Tích điểm trên tiền thực thu (cọc 50k): 50k -> 5 điểm.
      expect(after.points, 55 + 5);
      // Sau thanh toán bàn sang vệ sinh.
      final tAfter = await db.bidaTables.get(t.id);
      expect(tAfter!.status, BidaTableStatus.CLEANING);
      await BidaBusinessLogic.finishCleaning(db, t);
      final tDone = await db.bidaTables.get(t.id);
      expect(tDone!.status, BidaTableStatus.EMPTY);
    });

    test('Thu công nợ tạo phiếu thu và giảm nợ', () async {
      final customer = await db.bidaCustomers
          .filter()
          .customerIdEqualTo('kh_vana')
          .findFirst();
      final before = customer!.debtBalance;
      final incomeCount = await db.bidaFinanceTxs
          .filter()
          .isIncomeEqualTo(true)
          .count();
      await BidaBusinessLogic.collectCustomerDebt(db, customer, 300000);
      expect(customer.debtBalance, before - 300000);
      expect(
          await db.bidaFinanceTxs.filter().isIncomeEqualTo(true).count(),
          incomeCount + 1);
    });

    test('Khách vãng lai trả đủ -> không phát sinh nợ', () async {
      final t = tableByName('Lỗ 03');
      final s = await BidaBusinessLogic.openTable(db, table: t, at: DateTime.now());
      final r = await BidaBusinessLogic.checkoutSession(db, s,
          timeCost: 100000, cashReceived: 200000);
      expect(r.debtAdded, 0);
      expect(r.paidNow, 100000); // chỉ thu đúng số tiền
    });

    test('Giảm giá không vượt tổng tiền', () async {
      final t = tableByName('Lỗ 04');
      final s = await BidaBusinessLogic.openTable(db, table: t, at: DateTime.now());
      final r = await BidaBusinessLogic.checkoutSession(db, s,
          timeCost: 70000, discount: 999999, cashReceived: 70000);
      expect(r.discount, 70000); // clamp về tối đa
      expect(r.grandTotal, 0);
    });
  });

  group('XV + XVI + XIX. Nhập hàng / NCC / công nợ NCC', () {
    test('Ví dụ XIX: Coca Cola nợ đúng 5 triệu trong seed', () async {
      final sup = await db.bidaSuppliers
          .filter()
          .supplierIdEqualTo('ncc_cocacola')
          .findFirst();
      expect(sup!.totalImported, 25000000);
      expect(sup.totalPaid, 20000000);
      expect(sup.debtBalance, 5000000);
    });

    test('Nhập hàng mới: tồn kho tăng, giá vốn bình quân gia quyền, nợ NCC tăng',
        () async {
      final sup = await db.bidaSuppliers
          .filter()
          .supplierIdEqualTo('ncc_doan')
          .findFirst();
      final nem = itemById('bfo005');
      final stockBefore = nem.stock;
      final debtBefore = sup!.debtBalance;

      // Nhập 10 Nem x 25k = 250k, VAT 10% = 25k -> 275k, trả trước 75k.
      final result = await BidaBusinessLogic.importGoods(
        db,
        supplier: sup,
        lines: [(item: nem, qty: 10, unitPrice: 25000.0)],
        invoiceNo: 'PN-TEST-01',
        vatPercent: 10,
        paidNow: 75000,
      );
      expect(result.subTotal, 250000);
      expect(result.vatAmount, closeTo(25000, 0.01));
      expect(result.grandTotal, closeTo(275000, 0.01));
      expect(nem.stock, stockBefore + 10);
      // Giá vốn mới = bình quân gia quyền (cũ 25k, nhập 25k) = đúng 25k.
      expect(nem.costPrice, closeTo(25000, 0.01));
      expect(sup.debtBalance, closeTo(debtBefore + 200000, 0.01));

      // Phiếu nhập lưu đủ thông tin VAT/NCC/số phiếu.
      final pn = await db.bidaInventoryTxs
          .filter()
          .invoiceNoEqualTo('PN-TEST-01')
          .findFirst();
      expect(pn, isNotNull);
      expect(pn!.vatPercent, 10);
      expect(pn.supplierName, 'Cửa Hàng Đồ Ăn Nhanh Số 1');

      // Trả tiếp 175k -> hết nợ đợt này.
      await BidaBusinessLogic.paySupplierDebt(db, sup, 175000,
          invoiceNo: 'PN-TEST-01');
      expect(sup.debtBalance, closeTo(debtBefore + 25000, 0.01));

      // Không cho trả vượt nợ.
      expect(() => BidaBusinessLogic.paySupplierDebt(db, sup, 99999999),
          throwsException);
    });
  });

  group('XXV-XXIX. Báo cáo doanh thu / chi phí / lợi nhuận / dashboard', () {
    final from = DateTime(2020, 1, 1);
    final to = DateTime(2100, 1, 1);

    test('XXV. Doanh thu tổng hợp từ phiên PAID + breakdown nhóm hàng', () async {
      final rev = await BidaBusinessLogic.revenueReport(db, from, to);
      final sessions = await db.bidaSessions
          .filter()
          .statusEqualTo(BidaSessionStatus.PAID)
          .findAll();
      final expectedTime =
          sessions.fold<double>(0, (s, x) => s + x.totalTimeCost);
      final expectedItems =
          sessions.fold<double>(0, (s, x) => s + x.totalItemCost);
      expect(rev['time'], expectedTime);
      expect(rev['drink']! + rev['beer']! + rev['food']! + rev['tobacco']! + rev['other']!,
          expectedItems);
      expect(rev['total'], expectedTime + expectedItems);
      // Bia phải nằm riêng nhóm BEER (seed Tiger/Saigon/Heineken).
      expect(rev['beer']!, greaterThan(0));
    });

    test('XXVI-XXVII. Chi phí + lợi nhuận = doanh thu - giá vốn - chi phí',
        () async {
      final expenses =
          await BidaBusinessLogic.expenseReport(db, from, to);
      // Seed có 7 phiếu chi (thuê, điện, nước, internet, lương, mkt + trả NCC).
      expect(expenses.length, greaterThanOrEqualTo(6));
      final profit = await BidaBusinessLogic.profitReport(db, from, to);
      expect(profit['profit'],
          profit['revenue']! - profit['cogs']! - profit['expense']!);
      expect(profit['expense']!,
          expenses.values.fold<double>(0, (s, v) => s + v));
    });

    test('XXVIII. Cân đối kế toán: phải thu / phải trả / tồn kho > 0', () async {
      final bs = await BidaBusinessLogic.balanceSheet(db);
      // Tiền mặt có thể âm (chi phí vận hành seed lớn hơn doanh thu mẫu)
      // nhưng công thức phải khớp và các chỉ số còn lại dương.
      expect(bs['inventory'], greaterThan(0));
      expect(bs['receivable'], greaterThan(0));
      expect(bs['payable'], greaterThan(0));
    });

    test('XXIX. Dashboard: hôm nay/tháng + top bán chạy/khách/bàn', () async {
      final dash = await BidaBusinessLogic.dashboardSummary(db);
      // Các test chức năng phía trên vừa thanh toán vài phiên hôm nay.
      expect(dash['todayRevenue'], greaterThanOrEqualTo(170000));
      final monthRevenue = dash['monthRevenue'] as double;
      expect(monthRevenue, greaterThanOrEqualTo(dash['todayRevenue'] as double));
      expect(dash['monthExpense'], greaterThan(0));
      final topItems = dash['topItems'] as List;
      expect(topItems, isNotEmpty);
      final topTables = dash['topTables'] as List;
      expect(topTables, isNotEmpty);
    });
  });

  group('XXXI. Sao lưu', () {
    test('Module Bida đăng ký backup trong bảng quản lý chung (CRM)', () {
      final registered =
          ModuleBackupService.modules.any((m) => m.id == 'bida');
      expect(registered, isTrue);
    });
  });
}

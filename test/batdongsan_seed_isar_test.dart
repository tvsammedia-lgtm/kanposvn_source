import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/broker.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/customer.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/floor_fee.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/property.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/transaction.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/repositories/isar_db.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/services/batdongsan_business_logic.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/services/batdongsan_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// PathProvider giả trỏ vào temp dir cho test.
class FakePathProvider extends PathProviderPlatform {
  final String tempPath;
  FakePathProvider(this.tempPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => tempPath;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Isar isar;

  setUpAll(() async {
    // Nạp Isar core DLL từ pub cache (mạng test bị chặn).
    final dllName = Platform.isWindows
        ? 'windows\\isar.dll'
        : 'libisar.so';
    final candidates = <String>[
      r'C:\Users\Administrator\AppData\Local\Pub\Cache\hosted\pub.dev',
      '${Platform.environment['LOCALAPPDATA']}\\Pub\\Cache\\hosted\\pub.dev',
      '${Platform.environment['HOME']}/.pub-cache/hosted/pub.dev',
    ];
    File? dll;
    for (final base in candidates) {
      final root = Directory(base);
      if (!root.existsSync()) continue;
      for (final e in root.listSync()) {
        if (e.path.contains('isar_flutter_libs') &&
            e is Directory &&
            File('${e.path}\\$dllName').existsSync()) {
          dll = File('${e.path}\\$dllName');
          break;
        }
      }
      if (dll != null) break;
    }
    expect(dll, isNotNull, reason: 'Không tìm thấy isar.dll trong pub cache');
    await Isar.initializeIsarCore(download: false, libraries: {
      Abi.windowsX64: dll!.path,
    });

    tempDir = await Directory.systemTemp.createTemp('bds_test_');
    PathProviderPlatform.instance = FakePathProvider(tempDir.path);
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
    if (tempDir.existsSync()) tempDir.deleteSync(recursive: true);
  });

    group('Seed dữ liệu mẫu BĐS + logic trên dữ liệu thật', () {
      test('seed đủ số lượng và tiếng Việt không lỗi font', () async {
      isar = await KanBatDongSanIsarDB.getInstance();
      KanBatDongSanIsarDB.debugOverride = isar;

      await BatDongSanSeedData.seedIfEmpty();
      // Gọi lần 2 phải bỏ qua (idempotent).
      await BatDongSanSeedData.seedIfEmpty();

      expect(await isar.brokers.count(), 6);
      expect(await isar.customers.count(), 11); // 5 bán + 6 mua
      expect(await isar.propertys.count(), 12);
      expect(await isar.transactionRecords.count(), 13);
      expect(await isar.floorFees.count(), 10);

      final broker = await isar.brokers.filter().brokerCodeEqualTo('MB001').findFirst();
      expect(broker!.fullName, 'Trần Văn Minh');

      final prop =
          await isar.propertys.filter().propertyCodeEqualTo('BDS0003').findFirst();
      expect(prop!.title, contains('góc 2 mặt tiền'));
      expect(prop.propertyType, 'Nhà mặt phố');
    });

    test('đủ phân loại 4 nhóm theo PRD §8', () async {
      final props = await isar.propertys.where().findAll();
      final cats = props.map((p) => BdsBusinessLogic.propertyCategory(p.propertyType)).toSet();
      expect(cats.containsAll(['Đất', 'Nhà', 'Chung cư', 'Mặt bằng']), true);
    });

    test('đủ 5 trạng thái giao dịch theo PRD §12', () async {
      final txs = await isar.transactionRecords.where().findAll();
      final statuses = txs.map((t) => t.status).toSet();
      expect(statuses.length, 5, reason: 'Cần đủ 5 trạng thái: $statuses');
    });

    test('đủ loại phí sàn theo PRD §14 (thu + chi khác)', () async {
      final fees = await isar.floorFees.where().findAll();
      final types = fees.map((f) => f.feeType).toSet();
      expect(types.length, FloorFeeType.values.length,
          reason: 'Cần đủ 5 loại phí: $types');
      final hasExpense = fees.any((f) => f.feeType.isExpense);
      final hasIncome = fees.any((f) => !f.feeType.isExpense);
      expect(hasExpense && hasIncome, true);
    });

    test('so khớp tự động chạy đúng trên seed (§11)', () async {
      final buyers = await isar.customers
          .filter()
          .typeEqualTo(CustomerType.buyer)
          .findAll();
      final huy = buyers.firstWhere((b) => b.phone == '0904444555');
      final props = await isar.propertys.where().findAll();

      // Mặc định loại BĐS đã bán → BDS0001 (đã sold) KHÔNG xuất hiện.
      final defaultMatches =
          BdsBusinessLogic.matchPropertiesForBuyer(huy, props);
      expect(
        defaultMatches.any((r) => r.property.propertyCode == 'BDS0001'),
        false,
      );

      // Cho phép cả đã bán → BDS0001 đạt điểm cao (khớp gần hoàn hảo).
      final withSold = BdsBusinessLogic.matchPropertiesForBuyer(
          huy, props,
          excludeSold: false);
      expect(withSold, isNotEmpty);
      expect(withSold.first.property.propertyCode, 'BDS0001');
      expect(withSold.first.score, greaterThanOrEqualTo(75));
      expect(withSold.first.reasons, contains('Giá trong tầm tiền'));
    });

    test('dashboard có giao dịch hôm nay & tháng này (§4.1)', () async {
      final props = await isar.propertys.where().findAll();
      final custs = await isar.customers.where().findAll();
      final txs = await isar.transactionRecords.where().findAll();
      final fees = await isar.floorFees.where().findAll();

      final m = BdsBusinessLogic.dashboardMetrics(
          properties: props,
          customers: custs,
          transactions: txs,
          fees: fees);
      expect(m['totalProperties'], 12);
      expect(m['todayTransactions']! >= 1, true,
          reason: 'GD0013 là hôm nay');
      expect(m['monthTransactions']! >= 1, true);
      expect(m['revenue'], greaterThan(0));
    });

    test('profitReport khớp tính tay trên seed', () async {
      final txs = await isar.transactionRecords.where().findAll();
      final fees = await isar.floorFees.where().findAll();
      final r = BdsBusinessLogic.profitReport(txs, fees);

      // GD hoàn thành: GD0001(.039+.078), GD0002(.065+.130), GD0003(.032+.065)
      expect(r.transactionIncome, closeTo(0.409, 1e-9));
      // Phí thu: .039+.005+.020+.015+.004+.008+.064+.020 = 0.175
      expect(r.feeIncome, closeTo(0.175, 1e-9));
      expect(r.revenue, closeTo(0.584, 1e-9));
      // Payout: GD1 .078*40%+.005 ; GD2 .130*45%+.01-.005 ; GD3 .065*35%
      expect(r.brokerPayout, closeTo(0.0362 + 0.0635 + 0.02275, 1e-9));
      // Chi khác: .012 + .006
      expect(r.otherExpense, closeTo(0.018, 1e-9));
      expect(r.profit, closeTo(0.584 - 0.12245 - 0.018, 1e-9));
    });

    test('xếp hạng môi giới: MB004 dẫn đầu KPI', () async {
      final brokers = await isar.brokers.where().findAll();
      final txs = await isar.transactionRecords.where().findAll();
      final rankings = BdsBusinessLogic.brokerRankings(brokers, txs);
      expect(rankings.first.broker.brokerCode, 'MB004',
          reason: 'MB004 có GD0002 doanh số lớn nhất (hoàn thành)');
      expect(rankings.first.dealCount, 1);
      expect(rankings.first.salesValue, closeTo(4.35, 1e-9));

      // MB002 có nhiều GD nhưng chưa cái nào hoàn thành → 0 deal.
      final mb2 = rankings.firstWhere((r) => r.broker.brokerCode == 'MB002');
      expect(mb2.dealCount, 0);
    });

    test('sinh mã kế tiếp trên dữ liệu seed', () async {
      final txs = await isar.transactionRecords.where().findAll();
      expect(BdsBusinessLogic.nextTransactionCode(txs), 'GD0014');
      final props = await isar.propertys.where().findAll();
      expect(BdsBusinessLogic.nextPropertyCode(props), 'BDS0013');
      final fees = await isar.floorFees.where().findAll();
      expect(BdsBusinessLogic.nextFeeCode(fees), 'PFS0011');
    });

    test('báo cáo khách hàng: VIP = 3 (2 mua + 1 bán)', () async {
      final custs = await isar.customers.where().findAll();
      final txs = await isar.transactionRecords.where().findAll();
      final r = BdsBusinessLogic.customerReport(custs, txs);
      expect(r.vipCount, 3);
      expect(r.newBuyersThisMonth, 6, reason: 'updatedAt = now khi seed');
      expect(r.newSellersThisMonth, 5);
      expect(r.buyersInTransaction >= 1, true,
          reason: 'Có khách đang đàm phán/cọc');
    });
  });
}

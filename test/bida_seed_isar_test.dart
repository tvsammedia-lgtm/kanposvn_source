import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_finance.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_inventory_tx.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_item.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_partner.dart';
import 'package:kanposvn/modules/kanposvnbida/models/bida_table.dart';
import 'package:kanposvn/modules/kanposvnbida/services/bida_isar_service.dart';
import 'package:kanposvn/modules/kanposvnbida/services/bida_seed_data.dart';
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

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('bida_open_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDownAll(() async {
    try {
      final isar = await service.db;
      await isar.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Mở DB bida + seedIfEmpty không lỗi (mô phỏng mở module)', () async {
    service = BidaIsarService();
    final db = await service.db;
    expect(db.isOpen, isTrue);

    await BidaSeedData.seedIfEmpty(service);

    final tables = await db.bidaTables.where().findAll();
    final items = await db.bidaItems.where().findAll();
    expect(tables, isNotEmpty, reason: 'Bàn phải được seed');
    expect(items, isNotEmpty, reason: 'Menu item phải được seed');

    // ── Dữ liệu mẫu theo quanbida.md ──
    // XII. Danh mục đủ nhóm Nước/Bia/Đồ ăn/Thuốc lá/Khăn lạnh/Đá.
    expect(items.any((i) => i.name == 'Coca'), isTrue);
    expect(items.any((i) => i.category == BidaItemCategory.BEER), isTrue);
    expect(items.any((i) => i.category == BidaItemCategory.TOWEL), isTrue);
    expect(items.any((i) => i.category == BidaItemCategory.ICE), isTrue);

    // XIV. Ví dụ Coca: nhập 500 lon -> tồn 180.
    final coca = items.firstWhere((i) => i.itemId == 'bdr009');
    expect(coca.stock, 180);
    final cocaImports = await db.bidaInventoryTxs
        .filter()
        .itemIdEqualTo('bdr009')
        .quantityGreaterThan(0)
        .findAll();
    expect(cocaImports.fold<int>(0, (s, t) => s + t.quantity), 500);

    // IV + VII. Rule giá khung giờ & block/combo đã seed.
    expect(await db.bidaPricingRules.count(), greaterThanOrEqualTo(6));
    expect(await db.bidaBlockPlans.count(), 2);

    // XVI-XIX. Khách hàng & nhà cung cấp mẫu.
    final vana = await db.bidaCustomers
        .filter()
        .customerIdEqualTo('kh_vana')
        .findFirst();
    expect(vana!.debtBalance, 550000); // XVIII: nợ 850k - trả 300k
    final cocacola = await db.bidaSuppliers
        .filter()
        .supplierIdEqualTo('ncc_cocacola')
        .findFirst();
    expect(cocacola!.debtBalance, 5000000); // XIX: 25tr - 20tr

    // XX-XXI. Phiếu thu/chi mẫu.
    expect(await db.bidaFinanceTxs.count(), greaterThanOrEqualTo(8));
    expect(
        await db.bidaFinanceTxs.filter().isIncomeEqualTo(true).count(),
        greaterThanOrEqualTo(2));
  });
}

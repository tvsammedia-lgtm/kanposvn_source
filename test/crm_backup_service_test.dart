import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/core/db/database_service.dart' as core_db;
import 'package:kanposvn/core/db/isar_models/data_entity.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/broker.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/property.dart';
import 'package:kanposvn/modules/kanposvncrm/services/module_backup_service.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUpAll(() async {
    final dllName =
        Platform.isWindows ? r'windows\isar.dll' : 'libisar.so';
    File? dll;
    final root = Directory(
        r'C:\Users\Administrator\AppData\Local\Pub\Cache\hosted\pub.dev');
    if (root.existsSync()) {
      for (final e in root.listSync()) {
        if (e.path.contains('isar_flutter_libs') &&
            e is Directory &&
            File('${e.path}\\$dllName').existsSync()) {
          dll = File('${e.path}\\$dllName');
          break;
        }
      }
    }
    expect(dll, isNotNull, reason: 'Không tìm thấy isar.dll trong pub cache');
    await Isar.initializeIsarCore(download: false, libraries: {
      Abi.windowsX64: dll!.path,
    });

    tempDir = await Directory.systemTemp.createTemp('bds_backup_test_');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
    await ModuleBackupService.initDocsCache();
  });

  tearDownAll(() async {
    // Đóng mọi instance Isar còn mở trước khi xóa temp dir.
    for (final name in Isar.instanceNames.toList()) {
      final inst = Isar.getInstance(name);
      if (inst != null && inst.isOpen) await inst.close(deleteFromDisk: true);
    }
    if (tempDir.existsSync()) tempDir.deleteSync(recursive: true);
  });

  final bdsEntry = ModuleBackupService.modules
      .firstWhere((m) => m.id == 'batdongsan');

  test('Registry có đủ các module có DB riêng', () {
    final ids = ModuleBackupService.modules.map((m) => m.id).toSet();
    expect(
        ids.containsAll(['core', 'crm', 'restaurant', 'vantai', 'batdongsan', 'hrpayroll']),
        true);
    // Module có seed phải khai báo resetToSeed.
    expect(bdsEntry.resetToSeed, isNotNull);
    final core =
        ModuleBackupService.modules.firstWhere((m) => m.id == 'core');
    expect(core.resetToSeed, isNull, reason: 'Core DB dùng chung, không seed');
  });

  test('Backup -> xóa dữ liệu -> Restore lấy lại nguyên trạng', () async {
    final isar = await bdsEntry.open();

    // Seed dữ liệu ban đầu.
    await isar.writeTxn(() async {
      await isar.propertys.put(BdsProperty()
        ..propertyCode = 'BDSTEST'
        ..title = 'Nhà test backup'
        ..updatedAt = DateTime.now());
    });
    expect(await isar.propertys.count(), 1);
    expect(await ModuleBackupService.dbSize(bdsEntry), greaterThan(0));

    // 1) Tạo bản sao lưu.
    final backup = await ModuleBackupService.createBackup(bdsEntry);
    expect(backup.existsSync(), true);
    final backups = ModuleBackupService.listBackups(bdsEntry);
    expect(backups, isNotEmpty);
    expect(backups.first.sizeBytes, greaterThan(0));

    // 2) Xóa trắng dữ liệu (giống thao tác Reset).
    await isar.writeTxn(() => isar.clear());
    expect(await isar.propertys.count(), 0);

    // 3) Phục hồi từ bản sao lưu.
    await ModuleBackupService.restoreFromBackup(bdsEntry, backup);

    // Sau restore, mở lại DB và kiểm tra dữ liệu đã quay về như lúc backup.
    final reopened = await bdsEntry.open();
    expect(reopened.name, 'kanbatdongsan_v2');
    final restored = await reopened.propertys.where().findAll();
    expect(restored.length, 1);
    expect(restored.first.propertyCode, 'BDSTEST');
    expect(restored.first.title, 'Nhà test backup');

    // 4) Xóa bản sao lưu.
    ModuleBackupService.deleteBackup(backup);
    expect(backup.existsSync(), false);
  });

  test('resetToSeed hoạt động trên module BĐS', () async {
    final isar = await bdsEntry.open();
    await ModuleBackupService.resetToSeed(bdsEntry);
    // Seed BĐS nạp lại 12 bất động sản mẫu.
    expect(await isar.propertys.count(), 12);
    expect(await isar.brokers.count(), 6);
  });

  test('REGR: Backup module CHƯA TỪNG MỞ (DB mới tạo đủ schema thật)',
      () async {
    // Bug cũ: bridge mở DB bằng schema rỗng [] vào DB chưa tồn tại ->
    // tạo DB 0 collection, hoặc schema mismatch khi DB đã có dữ liệu
    // -> "isar error" khi bấm Tạo bản sao lưu Nhà hàng.
    final entries = ModuleBackupService.modules;
    for (final id in ['restaurant', 'vantai', 'crm', 'core']) {
      final m = entries.firstWhere((x) => x.id == id);
      final isar = await m.open();
      expect(isar.isOpen, true, reason: id);
      // copyToFile phải thành công trên DB schema đầy đủ.
      final f = await ModuleBackupService.createBackup(m);
      expect(f.existsSync(), true, reason: id);
      expect(f.lengthSync(), greaterThan(0), reason: id);
      ModuleBackupService.deleteBackup(f);
    }
  });

  test('Backup JSON tách RIÊNG theo appCode trong DB dùng chung', () async {
    // Nạp dữ liệu giả cho 2 module dùng chung vào kanposvn_data.
    final shared = await ModuleBackupService.modules
        .firstWhere((m) => m.id == 'core')
        .open();

    Future<void> putRows(String appCode, List<String> itemIds) async {
      await shared.writeTxn(() async {
        for (var i = 0; i < itemIds.length; i++) {
          await shared.dataEntitys.put(DataEntity()
            ..collection = 'products'
            ..appCode = appCode
            ..itemId = itemIds[i]
            ..jsonData = '{"name":"SP-$i"}'
            ..updatedAt = DateTime.now());
        }
      });
    }

    const cafe = 'kanposvncafe';
    const vlxd = 'kanposvnvlxd';
    await putRows(cafe, ['c1', 'c2', 'c3']);
    await putRows(vlxd, ['v1', 'v2']);

    // listSharedModules phải thấy cả 2 appCode với đúng số bản ghi.
    final modules = await ModuleBackupService.listSharedModules();
    final cafeInfo =
        modules.where((m) => m.appCode == cafe).firstWhere((_) => true,
            orElse: () => (appCode: '', label: '', records: -1));
    expect(cafeInfo.records, 3);
    final vlxdInfo = modules
        .where((m) => m.appCode == vlxd)
        .firstWhere((_) => true,
            orElse: () => (appCode: '', label: '', records: -1));
    expect(vlxdInfo.records, 2);

    // Backup riêng CAFE -> file chỉ chứa 3 dòng của cafe.
    final cafeBackup = await ModuleBackupService.createSharedBackup(cafe);
    expect(cafeBackup.existsSync(), true);
    expect(
        ModuleBackupService.listSharedBackups(cafe), isNotEmpty);

    // Xóa sạch dữ liệu cafe (giả lập mất dữ liệu) — VLXD không bị đụng.
    await ModuleBackupService.resetSharedModule(cafe);
    var rows = await shared.dataEntitys.filter().appCodeEqualTo(cafe).findAll();
    expect(rows, isEmpty);
    rows = await shared.dataEntitys.filter().appCodeEqualTo(vlxd).findAll();
    expect(rows.length, 2, reason: 'Dữ liệu VLXD phải còn nguyên');

    // Phục hồi riêng cafe từ file JSON.
    final restored = await ModuleBackupService.restoreSharedBackup(
        cafe, cafeBackup);
    expect(restored, 3);
    rows = await shared.dataEntitys.filter().appCodeEqualTo(cafe).findAll();
    expect(rows.length, 3);
    expect(rows.first.jsonData, contains('SP-'));
    // VLXD vẫn nguyên.
    rows = await shared.dataEntitys.filter().appCodeEqualTo(vlxd).findAll();
    expect(rows.length, 2);

    // Restore file sai appCode phải bị chặn.
    await expectLater(
      ModuleBackupService.restoreSharedBackup(vlxd, cafeBackup),
      throwsException,
    );
  });

  test('Quản lý DB cửa hàng Cloud (isar_store_*)', () async {
    // Tạo 1 DB cửa hàng giả qua openStoreIsar rồi thêm vài bản ghi.
    final storeIsar = await core_db.DatabaseService.openStoreIsar('999');
    await storeIsar.writeTxn(() async {
      await storeIsar.dataEntitys.put(DataEntity()
        ..collection = 'orders'
        ..appCode = 'kanposvncafe'
        ..itemId = 'o1'
        ..jsonData = '{"total":50000}'
        ..updatedAt = DateTime.now());
    });

    // Phải được phát hiện trong danh sách DB cửa hàng.
    final stores = ModuleBackupService.listStoreDbs()
        .where((s) => ModuleBackupService.storeIdOf(s) == '999')
        .toList();
    expect(stores, isNotEmpty);

    // Backup file DB cửa hàng.
    final backup =
        await ModuleBackupService.createStoreDbBackup(stores.first);
    expect(backup.existsSync(), true);

    // Xóa trắng DB cửa hàng rồi restore lại.
    await storeIsar.writeTxn(() => storeIsar.dataEntitys.clear());
    expect(await storeIsar.dataEntitys.count(), 0);

    await ModuleBackupService.restoreStoreDb(stores.first, backup);
    final reopened =
        await core_db.DatabaseService.openStoreIsar('999');
    expect(await reopened.dataEntitys.count(), 1);

    // Danh sách backup của cửa hàng có ít nhất 1 file.
    expect(
        ModuleBackupService.listStoreDbBackups('999'), isNotEmpty);
  });
}

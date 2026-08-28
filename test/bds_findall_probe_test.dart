import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/core/db/isar_models/data_entity.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/broker.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/customer.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/floor_fee.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/property.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/transaction.dart';

void main() {
  setUpAll(() async {
    await Isar.initializeIsarCore();
  });

  test('probe: batdongsan findAll AFTER store instances are open (app order)',
      () async {
    final dir = await Directory.systemTemp.createTemp('bdsmulti');

    debugPrint('[PROBE] open kanposvn_data (store core DB)');
    final store = await Isar.open(
      [DataEntitySchema],
      directory: dir.path,
      name: 'kanposvn_data',
    );
    debugPrint('[PROBE] open isar_store (per-store DB)');
    final storeDb = await Isar.open(
      [DataEntitySchema],
      directory: dir.path,
      name: 'isar_store_demo',
    );
    debugPrint('[PROBE] open batdongsan (5 typed schemas)');
    final bds = await Isar.open(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dir.path,
      name: 'kanbatdongsan_v2',
    );
    debugPrint('[PROBE] all 3 open OK, instances=${Isar.instanceNames}');

    debugPrint('[PROBE] store write+read');
    await store.writeTxn(() async {
      await store.dataEntitys.put(DataEntity()
        ..collection = 'store'
        ..appCode = 'kanposvncafe'
        ..itemId = 'i1'
        ..jsonData = '{}');
    });
    final storeCount = await store.dataEntitys.count();
    debugPrint('[PROBE] store count=$storeCount');

    debugPrint('[PROBE] bds count (empty)');
    final bdsCount = await bds.propertys.count();
    debugPrint('[PROBE] bds count=$bdsCount');

    debugPrint('[PROBE] bds findAll on EMPTY');
    final empty = await bds.propertys.where().findAll();
    debugPrint('[PROBE] empty findAll=${empty.length}');

    debugPrint('[PROBE] bds write 1 property');
    await bds.writeTxn(() async {
      await bds.propertys.put(BdsProperty()..propertyCode = 'P1');
    });
    debugPrint('[PROBE] bds write done');

    debugPrint('[PROBE] bds findAll after write');
    final all = await bds.propertys.where().findAll();
    debugPrint('[PROBE] bds findAll DONE=${all.length}');

    await bds.close(deleteFromDisk: true);
    await storeDb.close(deleteFromDisk: true);
    await store.close(deleteFromDisk: true);
    await dir.delete(recursive: true);
  }, timeout: const Timeout(Duration(seconds: 45)));

  test('probe: batdongsan findAll in REAL Documents dir (many isar dbs nearby)',
      () async {
    final docs = Directory('${Platform.environment['USERPROFILE']}\\Documents');
    debugPrint('[PROBE-R] docs exists=${docs.existsSync()}');

    debugPrint('[PROBE-R] open batdongsan-ish db in Documents');
    final bds = await Isar.open(
      [BdsPropertySchema],
      directory: docs.path,
      name: 'bdsprobe_tmpdb',
    );
    debugPrint('[PROBE-R] open OK');

    debugPrint('[PROBE-R] write 1 property');
    await bds.writeTxn(() async {
      await bds.propertys.put(BdsProperty()..propertyCode = 'P1');
    });
    debugPrint('[PROBE-R] write done');

    final c = await bds.propertys.count();
    debugPrint('[PROBE-R] count=$c');

    debugPrint('[PROBE-R] findAll START');
    final all = await bds.propertys.where().findAll();
    debugPrint('[PROBE-R] findAll DONE=${all.length}');

    await bds.close(deleteFromDisk: true);
  }, timeout: const Timeout(Duration(seconds: 45)));

  test('probe: findAll over REAL-WORLD BdsProperty row (features list etc)',
      () async {
    final dir = await Directory.systemTemp.createTemp('bdsprow');
    final isar = await Isar.open(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dir.path,
      name: 'kanbatdongsan_probe',
    );

    final prop = BdsProperty()
      ..remoteId = 'r1'
      ..propertyCode = 'BDS0001'
      ..title = 'Đất nền khu dân cư Linh Xuân Thủ Đức'
      ..description =
          'Đất nền 5x20m hạ tầng hoàn thiện, sổ đỏ riêng, cách xa lộ Hà Nội 800m'
      ..ownerId = 'o1'
      ..brokerId = 'b1'
      ..province = 'TP. Hồ Chí Minh'
      ..district = 'Thủ Đức'
      ..ward = 'Phường Linh Xuân'
      ..area = 'Khu dân cư hiện hữu'
      ..price = 2.6
      ..areaSize = 100
      ..width = 5
      ..length = 20
      ..propertyType = 'Đất nền'
      ..legalStatus = 'Sổ đỏ'
      ..direction = 'Đông'
      ..frontage = 'Hẻm xe hơi'
      ..features = ['Gần trường', 'Gần chợ'];

    debugPrint('[PROBE-P] write real-world row');
    await isar.writeTxn(() async {
      await isar.propertys.put(prop);
    });
    debugPrint('[PROBE-P] write done');

    debugPrint('[PROBE-P] count');
    final c = await isar.propertys.count();
    debugPrint('[PROBE-P] count=$c');

    debugPrint('[PROBE-P] findAll START');
    final all = await isar.propertys.where().findAll();
    debugPrint('[PROBE-P] findAll DONE=${all.length} features=${all.first.features}');

    await isar.close(deleteFromDisk: true);
    await dir.delete(recursive: true);
  }, timeout: const Timeout(Duration(seconds: 45)));

  test('probe: CONCURRENT findAll on multiple collections (app-like burst)',
      () async {
    final dir = await Directory.systemTemp.createTemp('bdsconc');
    final isar = await Isar.open(
      [
        BdsPropertySchema,
        CustomerSchema,
        TransactionRecordSchema,
        BrokerSchema,
        FloorFeeSchema
      ],
      directory: dir.path,
      name: 'kanbatdongsan_conc',
    );

    await isar.writeTxn(() async {
      await isar.propertys.putAll([
        for (var i = 0; i < 12; i++)
          BdsProperty()
            ..propertyCode = 'BDS$i'
            ..features = const ['Gần trường', 'Gần chợ'],
      ]);
      await isar.customers.putAll([
        Customer()..name = 'C1',
        Customer()..name = 'C2',
      ]);
      await isar.transactionRecords.putAll([
        TransactionRecord()..transactionCode = 'T1',
        TransactionRecord()..transactionCode = 'T2',
      ]);
      await isar.brokers.putAll([Broker()..brokerCode = 'B1']);
      await isar.floorFees.putAll([FloorFee()..feeCode = 'F1']);
    });
    debugPrint('[PROBE-C] seed done');

    debugPrint('[PROBE-C] launch 5 concurrent findAll');
    final results = await Future.wait([
      isar.propertys.where().findAll(),
      isar.customers.where().findAll(),
      isar.transactionRecords.where().findAll(),
      isar.brokers.where().findAll(),
      isar.floorFees.where().findAll(),
    ]);
    debugPrint('[PROBE-C] all done counts=${results.map((e) => e.length).toList()}');

    await isar.close(deleteFromDisk: true);
    await dir.delete(recursive: true);
  }, timeout: const Timeout(Duration(seconds: 45)));
}
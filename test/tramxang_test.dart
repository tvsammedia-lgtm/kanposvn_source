import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/core.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/inventory.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/product.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/sale.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/tank.dart';
import 'package:kanposvn/modules/kanposvntramxang/services/tramxang_isar_service.dart';

/// Kiểm thử toàn bộ chức năng module Trạm Xăng + POS tạp hóa
/// dựa trên bộ dữ liệu mẫu TramXangSeedData.
void main() {
  late Directory tempDir;
  late TramXangIsarService service;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('tramxang_test');
    service = TramXangIsarService(
        directory: tempDir, instanceName: 'tramxang_test_db');
    db = await service.db;
  });

  tearDownAll(() async {
    try {
      await db.close(deleteFromDisk: true);
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  Future<TramXangProduct> product(String id) async {
    final p = await db.tramXangProducts.getByProductId(id);
    return p!;
  }

  Future<TramXangTank> tank(String id) async {
    final t = await db.tramXangTanks.getByTankId(id);
    return t!;
  }

  Future<TramXangPumpNozzle> nozzle(String id) async {
    final n = await db.tramXangPumpNozzles.getByNozzleId(id);
    return n!;
  }

  test('1) Seed nạp đủ dữ liệu mẫu', () async {
    await service.ensureSeeded();
    expect(await db.tramXangCompanys.count(), 1);
    expect(await db.tramXangStations.count(), greaterThanOrEqualTo(1));
    expect(await db.tramXangCategorys.count(), 4);
    expect(await db.tramXangProducts.count(), 11);
    expect(await db.tramXangTanks.count(), 3);
    expect(await db.tramXangPumpNozzles.count(), 4);
    expect(await db.tramXangCustomers.count(), 3);
    expect(await db.tramXangSuppliers.count(), 3);
    expect(TramXangIsarService.currentStationId, 'station_thong_dac');

    // Bồn RON95 có tồn, bồn DO cạn để demo nhập nhiên liệu.
    final doTank = await tank('tank_do');
    expect(doTank.currentQuantity, 0);
    expect(doTank.openingQuantity, 8000);

    final ron95 = await product('fuel_ron95');
    expect(ron95.retailPrice, 23500);
    expect(ron95.importPrice, 22000);
  });

  test('2) Không cho bán khi chưa mở ca', () async {
    final coca = await product('grocery_coca');
    expect(
      () => service.createSale(
        items: [
          TramXangSaleItem(
              product: coca, quantity: 1, unitPrice: coca.retailPrice),
        ],
        paymentMethod: 'CASH',
      ),
      throwsA(isA<StateError>()),
    );
  });

  test('3) Mở ca + bán tạp hóa bằng tiền mặt (trừ kho + ghi sổ)', () async {
    await service.saveShift(TramXangShift()
      ..shiftId = 'shift_1'
      ..stationId = 'station_thong_dac'
      ..employeeId = 'EMP_OWNER'
      ..openedAt = DateTime.now()
      ..openingCash = 500000
      ..status = 'OPEN');

    final coca = await product('grocery_coca');
    final lavie = await product('grocery_lavie');
    final sale = await service.createSale(
      items: [
        TramXangSaleItem(
            product: coca, quantity: 2, unitPrice: coca.retailPrice),
        TramXangSaleItem(
            product: lavie, quantity: 3, unitPrice: lavie.retailPrice),
      ],
      paymentMethod: 'CASH',
    );

    // subtotal = 2*18000 + 3*10000 = 66000; tax = 6600; total = 72600
    expect(sale.subtotal, 66000);
    expect(sale.tax, 6600);
    expect(sale.total, 72600);
    expect(sale.paid, 72600);
    expect(sale.debt, 0);
    expect(sale.saleType, 'GROCERY');
    expect(sale.shiftId, 'shift_1');
    expect(sale.saleNo, startsWith('HD-'));

    final lines = await service.getSaleLines(saleId: sale.saleId);
    expect(lines.length, 2);

    // Hàng đã trừ kho: Coca 120 -> 118, Lavie 200 -> 197
    expect(await service.getProductStock('grocery_coca'), 118);
    expect(await service.getProductStock('grocery_lavie'), 197);

    final invTxs = await service.getInventoryTransactions(productId: sale.saleId.isEmpty ? '' : 'grocery_coca');
    expect(invTxs.any((tx) => tx.documentType == 'SALE' && tx.outQty == 2), isTrue);
  });

  test('4) Bán xăng qua vòi (giảm bồn + tổng meter + PumpTransaction)', () async {
    final ron95 = await product('fuel_ron95');
    final nozzleA1 = await nozzle('pump_a_1');
    final tankRon95 = await tank('tank_ron95');
    final beforeTank = tankRon95.currentQuantity;
    final beforeTotalizer = nozzleA1.totalizerClose;

    final sale = await service.createSale(
      items: [
        TramXangSaleItem(
          product: ron95,
          quantity: 30,
          unitPrice: ron95.retailPrice,
          nozzle: nozzleA1,
          tank: tankRon95,
        ),
      ],
      paymentMethod: 'CASH',
    );
    expect(sale.saleType, 'FUEL');
    expect(sale.total, (30 * 23500) + (30 * 23500 * 10 / 100)); // 775500

    final afterTank = await tank('tank_ron95');
    expect(afterTank.currentQuantity, beforeTank - 30);

    final afterNozzle = await nozzle('pump_a_1');
    expect(afterNozzle.totalizerClose, beforeTotalizer + 30);

    final ptxs = await db.tramXangPumpTransactions
        .filter()
        .saleIdEqualTo(sale.saleId)
        .findAll();
    expect(ptxs.length, 1);
    expect(ptxs.first.quantity, 30);
    expect(ptxs.first.totalizerBefore, beforeTotalizer);
    expect(ptxs.first.totalizerAfter, beforeTotalizer + 30);
    expect(ptxs.first.nozzleId, 'pump_a_1');

    final lines = await service.getSaleLines(saleId: sale.saleId);
    expect(lines.length, 1);
    expect(lines.first.tankId, 'tank_ron95');
    expect(lines.first.nozzleId, 'pump_a_1');
  });

  test('5) Bán chịu (DEBT) cho khách công ty', () async {
    final customer = await db.tramXangCustomers.getByCustomerId('cust_tantien');
    final mi = await product('grocery_mi');
    final sale = await service.createSale(
      items: [
        TramXangSaleItem(product: mi, quantity: 10, unitPrice: mi.retailPrice),
      ],
      paymentMethod: 'DEBT',
      customer: customer!,
    );
    expect(sale.paymentMethod, 'DEBT');
    expect(sale.paid, 0);
    expect(sale.debt, sale.total);
    expect(sale.customerId, 'cust_tantien');
    // subtotal 10*9500=95000; tax 9500; total 104500
    expect(sale.total, 104500);
  });

  test('6) Nhập nhiên liệu vào bồn (tăng tồn + Purchase + giới hạn dung tích)',
      () async {
    final doTank = await tank('tank_do');
    final fuelDo = await product('fuel_do');
    final petrolimex =
        await db.tramXangSuppliers.getBySupplierId('sup_petrolimex');
    expect(doTank.currentQuantity, 0);

    final purchase = await service.importInventory(
      product: fuelDo,
      quantity: 5000,
      unitCost: fuelDo.importPrice,
      supplier: petrolimex!,
      warehouseId: 'TANK-DO',
      tank: doTank,
    );
    expect(purchase.productId, 'fuel_do');
    expect(purchase.supplierId, 'sup_petrolimex');
    expect(purchase.tankId, 'tank_do');
    expect(purchase.total, closeTo(105600000, 1)); // 5000 * 19200 * 1.1

    final afterImport = await tank('tank_do');
    expect(afterImport.currentQuantity, 5000);
    expect(await service.getProductStock('fuel_do'), 8000 + 5000);

    // Nhập vượt dung tích bồn (12000L) thì bị chặn.
    final fullTank = await tank('tank_do');
    expect(
      () => service.importInventory(
        product: fuelDo,
        quantity: 100000,
        unitCost: fuelDo.importPrice,
        supplier: petrolimex,
        warehouseId: 'TANK-DO',
        tank: fullTank,
      ),
      throwsA(isA<StateError>()),
    );
    expect((await tank('tank_do')).currentQuantity, 5000);

    final purchases = await db.tramXangPurchases.where().findAll();
    expect(purchases.length, 1);
  });

  test('7) Đối chiếu bồn (lý thuyết vs đo thực tế)', () async {
    final recon = await service.getTankReconciliation();
    final ron95 = recon.singleWhere((r) => r.tank.tankId == 'tank_ron95');
    // Mở đầu 10500, đã bán 30 qua test 4.
    expect(ron95.opening, 10500);
    expect(ron95.sold, 30);
    expect(ron95.imported, 0);
    expect(ron95.theoretical, 10500 - 30);
    expect(ron95.actual, 10500 - 30);
    expect(ron95.diff, 0);

    final doTank = recon.singleWhere((r) => r.tank.tankId == 'tank_do');
    // Mở đầu 8000, nhập thêm 5000.
    expect(doTank.opening, 8000);
    expect(doTank.imported, 5000);
    expect(doTank.theoretical, 13000);
  });

  test('8) Tổng hợp ca + đóng ca cân đối (BALANCED)', () async {
    final totals = await service.getShiftTotals('shift_1');
    expect(totals.count, 3);
    expect(totals.cash, 848100); // 72600 + 775500
    expect(totals.debt, 104500);
    expect(totals.total, 952600);
    expect(totals.tax, 86600); // 6600 + 70500 + 9500

    final shift = await service.getActiveShift();
    expect(shift, isNotNull);
    final closed =
        await service.closeShiftWithCash(shift!, 500000 + totals.cash);
    expect(closed.status, 'BALANCED');
    expect(closed.expectedCash, 500000 + totals.cash);
    expect(closed.difference, 0);
    expect(closed.closedAt, isNotNull);
  });

  test('9) Đóng ca lệch tiền (SHORT) + mở ca mới', () async {
    expect(await service.getActiveShift(), isNull);

    await service.saveShift(TramXangShift()
      ..shiftId = 'shift_2'
      ..stationId = 'station_thong_dac'
      ..employeeId = 'EMP_OWNER'
      ..openedAt = DateTime.now()
      ..openingCash = 0
      ..status = 'OPEN');

    // Bán tạp hóa 1 chai Lavie: total 11000
    final lavie = await product('grocery_lavie');
    await service.createSale(
      items: [
        TramXangSaleItem(
            product: lavie, quantity: 1, unitPrice: lavie.retailPrice),
      ],
      paymentMethod: 'CASH',
    );

    final shift2 = await service.getActiveShift();
    final closed = await service.closeShiftWithCash(shift2!, 11000 - 20000);
    expect(closed.status, 'SHORT');
    expect(closed.difference, -20000);
  });

  test('10) Doanh thu & giá vốn trong khoảng thời gian', () async {
    final now = DateTime.now();
    final totals = await service.getSalesTotalsBetween(
        now.subtract(const Duration(hours: 1)), now.add(const Duration(minutes: 1)));
    expect(totals.count, greaterThanOrEqualTo(4));

    final cost = await service.getCostOfGoodsBetween(
        now.subtract(const Duration(hours: 1)), now.add(const Duration(minutes: 1)));
    // Giá vốn > 0 vì có 2 hóa đơn chứa mặt hàng có costAmount.
    expect(cost, greaterThan(0));
  });
}
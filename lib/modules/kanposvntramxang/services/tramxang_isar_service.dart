import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/core.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../models/sale.dart';
import '../models/inventory.dart';

class TramXangIsarService {
  late Future<Isar> db;
  
  static String currentStationId = '';

  TramXangIsarService({Directory? directory, String? instanceName}) {
    db = openDB(directory: directory, instanceName: instanceName);
  }

  Future<Isar> openDB({Directory? directory, String? instanceName}) async {
    final dbName = instanceName ?? 'tramxang_db';
    if (Isar.instanceNames.contains(dbName)) {
      return Isar.getInstance(dbName)!;
    }
    final dir = directory ?? await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path, dbName, inspector: directory == null);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$dbName.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/${dbName}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path, dbName, inspector: directory == null);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath, String dbName, {required bool inspector}) {
    return Isar.open(
      [
        TramXangCompanySchema,
        TramXangStationSchema,
        TramXangBranchSchema,
        TramXangUserSchema,
        TramXangCategorySchema,
        TramXangProductSchema,
        TramXangTankSchema,
        TramXangTankReadingSchema,
        TramXangPumpSchema,
        TramXangPumpNozzleSchema,
        TramXangShiftSchema,
        TramXangCustomerSchema,
        TramXangSaleSchema,
        TramXangSaleLineSchema,
        TramXangPumpTransactionSchema,
        TramXangSupplierSchema,
        TramXangInventoryTransactionSchema,
      ],
      inspector: inspector,
      directory: dirPath,
      name: dbName,
    );
  }

  // ================= PRODUCTS =================
  Future<List<TramXangProduct>> getProducts() async {
    final isar = await db;
    return await isar.tramXangProducts.where().findAll();
  }

  Future<void> saveProduct(TramXangProduct product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangProducts.put(product);
      await product.category.save();
    });
  }

  // ================= TANKS & PUMPS =================
  Future<List<TramXangTank>> getTanks() async {
    final isar = await db;
    return await isar.tramXangTanks.where().findAll();
  }

  Future<void> saveTank(TramXangTank tank) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangTanks.put(tank);
      await tank.product.save();
    });
  }

  Future<List<TramXangPump>> getPumps() async {
    final isar = await db;
    return await isar.tramXangPumps.where().findAll();
  }
  
  Future<List<TramXangPumpNozzle>> getPumpNozzles() async {
    final isar = await db;
    return await isar.tramXangPumpNozzles.where().findAll();
  }

  Future<void> savePumpNozzle(TramXangPumpNozzle nozzle) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangPumpNozzles.put(nozzle);
      await nozzle.pump.save();
      await nozzle.product.save();
      await nozzle.tank.save();
    });
  }

  // ================= SHIFTS & SALES =================
  Future<List<TramXangShift>> getShifts() async {
    final isar = await db;
    return await isar.tramXangShifts.where().findAll();
  }

  Future<TramXangShift?> getActiveShift() async {
    final isar = await db;
    return await isar.tramXangShifts.filter().statusEqualTo('OPEN').findFirst();
  }

  Future<void> saveShift(TramXangShift shift) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangShifts.put(shift);
    });
  }

  Future<List<TramXangSale>> getSales() async {
    final isar = await db;
    return await isar.tramXangSales.where().findAll();
  }

  Future<void> saveSale(TramXangSale sale, List<TramXangSaleLine> lines) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangSales.put(sale);
      await isar.tramXangSaleLines.putAll(lines);
      
      await sale.shift.save();
      await sale.customer.save();
      
      for(var line in lines) {
        line.sale.value = sale;
        await line.sale.save();
        await line.product.save();
        await line.tank.save();
        await line.pumpNozzle.save();
      }
    });
  }
  
  // ================= PUMP TRANSACTIONS =================
  Future<void> savePumpTransaction(TramXangPumpTransaction tx) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangPumpTransactions.put(tx);
      await tx.pump.save();
      await tx.nozzle.save();
      await tx.sale.save();
    });
  }
}

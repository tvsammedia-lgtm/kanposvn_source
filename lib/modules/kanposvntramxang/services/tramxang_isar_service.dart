import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/account.dart';
import '../models/account_default.dart';
import '../models/accounting_entry.dart';
import '../models/core.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../models/sale.dart';
import '../models/inventory.dart';
import 'tramxang_seed_data.dart';

/// Một dòng hàng trong giỏ bán (tái sử dụng cho Bán Xăng & POS tạp hóa).
class TramXangSaleItem {
  final TramXangProduct product;
  final double quantity;
  final double unitPrice;
  final double lineDiscount; // chiết khấu theo dòng (VNĐ)
  final TramXangTank? tank; // chỉ với mặt hàng FUEL
  final TramXangPumpNozzle? nozzle; // chỉ với mua xăng tại vòi

  TramXangSaleItem({
    required this.product,
    required this.quantity,
    required this.unitPrice,
    this.lineDiscount = 0,
    this.tank,
    this.nozzle,
  });
}

class TramXangShiftTotals {
  int count = 0;
  double subtotal = 0;
  double tax = 0;
  double total = 0;
  double cash = 0;
  double transfer = 0;
  double qr = 0;
  double debt = 0;

  TramXangShiftTotals({
    this.count = 0,
    this.subtotal = 0,
    this.tax = 0,
    this.total = 0,
    this.cash = 0,
    this.transfer = 0,
    this.qr = 0,
    this.debt = 0,
  });

  double get nonCash => transfer + qr;
}

class TramXangTankRecon {
  final TramXangTank tank;
  final double opening;
  final double imported;
  final double sold;
  final double theoretical;
  final double actual;
  final double diff;

  TramXangTankRecon({
    required this.tank,
    required this.opening,
    required this.imported,
    required this.sold,
    required this.theoretical,
    required this.actual,
    required this.diff,
  });
}

class TramXangIsarService {
  late Future<Isar> db;

  static String currentStationId = '';
  static String currentEmployeeId = '';

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
        TramXangPurchaseSchema,
        TramXangInventoryTransactionSchema,
        TramXangAccountSchema,
        TramXangAccountDefaultSchema,
        TramXangAccountingEntrySchema,
        TramXangAccountingEntryLineSchema,
      ],
      inspector: inspector,
      directory: dirPath,
      name: dbName,
    );
  }

  // ================= SEED =================
  Future<void> ensureSeeded() async {
    final db = await this.db;
    if (await db.tramXangCompanys.count() == 0) {
      await TramXangSeedData.seedSampleData(this, force: true);
    }
  }

  /// Xoá toàn bộ dữ liệu hiện tại rồi nạp lại bộ dữ liệu mẫu.
  Future<void> resetAndSeed() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
    currentStationId = '';
    await TramXangSeedData.seedSampleData(this, force: true);
  }

  // ================= COMPANIES / STATIONS =================
  Future<TramXangStation?> getDefaultStation() async {
    final isar = await db;
    if (currentStationId.isNotEmpty) {
      final s = await isar.tramXangStations.getByStationId(currentStationId);
      if (s != null) return s;
    }
    return await isar.tramXangStations.where().findFirst();
  }

  // ================= CATEGORIES =================
  Future<List<TramXangCategory>> getCategories() async {
    final isar = await db;
    return await isar.tramXangCategorys.where().findAll();
  }

  Future<void> saveCategory(TramXangCategory category) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangCategorys.put(category);
    });
  }

  // ================= PRODUCTS =================
  Future<List<TramXangProduct>> getProducts() async {
    final isar = await db;
    return await isar.tramXangProducts.where().findAll();
  }

  Future<TramXangProduct?> getProductById(String productId) async {
    final isar = await db;
    return await isar.tramXangProducts.getByProductId(productId);
  }

  Future<void> saveProduct(TramXangProduct product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await product.category.save();
      await isar.tramXangProducts.put(product);
    });
  }

  /// Tồn khả dụng của sản phẩm = tổng NHẬP - tổng XUẤT từ InventoryTransaction.
  Future<double> getProductStock(String productId) async {
    final isar = await db;
    final txs = await isar.tramXangInventoryTransactions.filter().productIdEqualTo(productId).findAll();
    double stock = 0;
    for (final tx in txs) {
      stock += tx.inQty - tx.outQty;
    }
    return stock;
  }

  // ================= TANKS & READS =================
  Future<List<TramXangTank>> getTanks() async {
    final isar = await db;
    return await isar.tramXangTanks.where().findAll();
  }

  Future<TramXangTank?> getTankById(String tankId) async {
    final isar = await db;
    return await isar.tramXangTanks.getByTankId(tankId);
  }

  Future<void> saveTank(TramXangTank tank) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await tank.product.save();
      await isar.tramXangTanks.put(tank);
    });
  }

  Future<List<TramXangTankReading>> getTankReadings({String? tankId}) async {
    final isar = await db;
    if (tankId != null) {
      return await isar.tramXangTankReadings
          .where()
          .filter()
          .tank((t) => t.tankIdEqualTo(tankId))
          .sortByReadingTimeDesc()
          .findAll();
    }
    return await isar.tramXangTankReadings.where().sortByReadingTimeDesc().findAll();
  }

  /// Ghi nhận số đo bồn: lưu TankReading + cập nhật tồn bồn theo số đo thực tế.
  Future<TramXangTankReading> addTankReading(
    TramXangTank tank,
    TramXangTankReading reading,
  ) async {
    final isar = await db;
    await isar.writeTxn(() async {
      reading.tank.value = tank;
      await isar.tramXangTankReadings.put(reading);
      tank.currentQuantity = reading.quantity;
      await isar.tramXangTanks.put(tank);
    });
    return reading;
  }

  // ================= PUMPS / NOZZLES =================
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
      await nozzle.pump.save();
      await nozzle.product.save();
      await nozzle.tank.save();
      await isar.tramXangPumpNozzles.put(nozzle);
    });
  }

  Future<List<TramXangPumpTransaction>> getPumpTransactions() async {
    final isar = await db;
    return await isar.tramXangPumpTransactions.where().findAll();
  }

  // ================= SHIFTS =================
  Future<List<TramXangShift>> getShifts() async {
    final isar = await db;
    return await isar.tramXangShifts.where().sortByOpenedAtDesc().findAll();
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

  /// Tổng hợp 1 ca: doanh thu theo phương thức thanh toán, thuế, công nợ.
  Future<TramXangShiftTotals> getShiftTotals(String shiftId) async {
    final isar = await db;
    final sales = await isar.tramXangSales.filter().shiftIdEqualTo(shiftId).findAll();
    final t = TramXangShiftTotals();
    for (final s in sales) {
      t.total += s.total;
      t.tax += s.tax;
      t.subtotal += s.subtotal;
      switch (s.paymentMethod) {
        case 'CASH':
          t.cash += s.total - s.debt;
          break;
        case 'TRANSFER':
          t.transfer += s.total - s.debt;
          break;
        case 'QR':
          t.qr += s.total - s.debt;
          break;
      }
      t.debt += s.debt;
      if (s.status != 'CANCELLED') t.count++;
    }
    return t;
  }

  /// Đóng ca: tính tiền phải có = tiền đầu ca + doanh thu tiền mặt (+ thu nợ),
  /// so sánh với tiền thực tế để ra SHORT / OVER / BALANCED.
  Future<TramXangShift> closeShiftWithCash(TramXangShift shift, double actualCash) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      final totals = await getShiftTotals(shift.shiftId);
      final expected = shift.openingCash + totals.cash;
      final diff = actualCash - expected;
      shift.expectedCash = expected;
      shift.actualCash = actualCash;
      shift.difference = diff;
      shift.status = diff < 0 ? 'SHORT' : (diff > 0 ? 'OVER' : 'BALANCED');
      shift.closedAt = DateTime.now();
      await isar.tramXangShifts.put(shift);
      return shift;
    });
  }

  // ================= SALES =================
  Future<List<TramXangSale>> getSales() async {
    final isar = await db;
    return await isar.tramXangSales.where().sortByCreatedAtDesc().findAll();
  }

  Future<List<TramXangSale>> getSalesBetween(DateTime start, DateTime end) async {
    final isar = await db;
    return await isar.tramXangSales
        .filter()
        .createdAtBetween(start, end)
        .sortByCreatedAtDesc()
        .findAll();
  }

  Future<List<TramXangSaleLine>> getSaleLines({String? saleId}) async {
    final isar = await db;
    if (saleId != null) {
      return await isar.tramXangSaleLines
          .where()
          .filter()
          .saleIdEqualTo(saleId)
          .sortByCreatedAtDesc()
          .findAll();
    }
    return await isar.tramXangSaleLines.where().sortByCreatedAtDesc().findAll();
  }

  Future<String> _nextSaleNo() async {
    final isar = await db;
    final d = DateTime.now();
    final prefix = 'HD-${d.year}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}-';
    final count = await isar.tramXangSales.filter().saleNoStartsWith(prefix).count();
    return '$prefix${(count + 1).toString().padLeft(4, '0')}';
  }

  /// Tạo Sale + SaleLine + giảm tồn bồn (FUEL) + InventoryTransaction + PumpTransaction
  /// trong một transaction. Ném StateError khi: chưa mở ca, bán vượt tồn bồn/hàng.
  Future<TramXangSale> createSale({
    required List<TramXangSaleItem> items,
    required String paymentMethod, // CASH, TRANSFER, QR, DEBT
    TramXangCustomer? customer,
    double discount = 0, // chiết khấu hoá đơn (VNĐ)
    String employeeId = '',
    String stationId = '',
  }) async {
    final isar = await db;
    if (items.isEmpty) {
      throw StateError('Giỏ hàng trống');
    }

    final shift = await getActiveShift();
    if (shift == null) {
      throw StateError('Chưa mở ca bán hàng. Hãy mở ca trước khi bán.');
    }

    final created = await isar.writeTxn(() async {
      // 1) Kiểm tra tồn trước khi ghi nhận
      for (final item in items) {
        if (item.product.productType == 'FUEL') {
          final tank = item.tank ?? (await getTankByNozzleProduct(item));
          if (tank == null) throw StateError('Chưa chọn bồn cho ${item.product.name}');
          if (tank.currentQuantity < item.quantity) {
            throw StateError('Bồn ${tank.name} chỉ còn ${tank.currentQuantity} L');
          }
        } else {
          final stock = await getProductStock(item.product.productId);
          if (item.product.trackInventory && stock < item.quantity) {
            throw StateError('${item.product.name} chỉ còn $stock ${item.product.unit}');
          }
        }
      }

      // 2) Tính tiền
      double subtotal = 0;
      double tax = 0;
      for (final item in items) {
        final amount = (item.quantity * item.unitPrice) - item.lineDiscount;
        subtotal += amount;
        tax += amount * item.product.taxRate / 100;
      }
      final total = (subtotal - discount) + tax;
      final isDebt = paymentMethod == 'DEBT';
      final paid = isDebt ? 0.0 : total;
      final debt = isDebt ? total : 0.0;

      final sale = TramXangSale()
        ..saleId = '${DateTime.now().microsecondsSinceEpoch}_${items.length}'
        ..saleNo = await _nextSaleNo()
        ..stationId = stationId.isNotEmpty ? stationId : (await getDefaultStation())?.stationId ?? currentStationId
        ..shift.value = shift
        ..shiftId = shift.shiftId
        ..saleType = items.every((i) => i.product.productType == 'FUEL') ? 'FUEL' : 'GROCERY'
        ..paymentMethod = paymentMethod
        ..subtotal = subtotal
        ..discount = discount
        ..tax = tax
        ..total = total
        ..paid = paid
        ..debt = debt
        ..status = 'COMPLETED'
        ..createdBy = employeeId.isNotEmpty ? employeeId : currentEmployeeId;

      if (customer != null) {
        sale.customer.value = customer;
        sale.customerId = customer.customerId;
      }
      await isar.tramXangSales.put(sale);

      // 3) Dòng hàng + kho + bồn + vòi bơm
      for (final item in items) {
        final unitPrice = item.unitPrice;
        final amount = (item.quantity * unitPrice) - item.lineDiscount;
        final line = TramXangSaleLine()
          ..saleLineId = '${sale.saleId}_${item.product.productId}'
          ..sale.value = sale
          ..saleId = sale.saleId
          ..product.value = item.product
          ..productId = item.product.productId
          ..quantity = item.quantity
          ..unit = item.product.unit
          ..unitPrice = unitPrice
          ..discount = item.lineDiscount
          ..taxRate = item.product.taxRate
          ..taxAmount = amount * item.product.taxRate / 100
          ..costPrice = item.product.importPrice
          ..costAmount = item.quantity * item.product.importPrice
          ..amount = amount;
        if (item.tank != null) {
          line.tank.value = item.tank;
          line.tankId = item.tank!.tankId;
        }
        if (item.nozzle != null) {
          line.pumpNozzle.value = item.nozzle;
          line.nozzleId = item.nozzle!.nozzleId;
        }
        await isar.tramXangSaleLines.put(line);

        // GIẢM TỒN BỒN (xăng dầu)
        if (item.product.productType == 'FUEL') {
          final tank = item.tank ?? (await getTankByNozzleProduct(item));
          if (tank != null) {
            tank.currentQuantity -= item.quantity;
            await isar.tramXangTanks.put(tank);
          }
          if (item.nozzle != null) {
            final lastTx = await isar.tramXangPumpTransactions
                .filter()
                .nozzleIdEqualTo(item.nozzle!.nozzleId)
                .sortByTransactionTimeDesc()
                .findFirst();
            final before = lastTx?.totalizerAfter ?? item.nozzle!.totalizerClose;
            final after = before + item.quantity;
            item.nozzle!.totalizerClose = after;
            await isar.tramXangPumpNozzles.put(item.nozzle!);

            final ptx = TramXangPumpTransaction()
              ..transactionId = '${sale.saleId}_pump_${item.nozzle!.nozzleId}'
              ..stationId = sale.stationId
              ..pumpId = item.nozzle!.pumpId
              ..nozzleId = item.nozzle!.nozzleId
              ..saleId = sale.saleId
              ..sale.value = sale
              ..transactionTime = DateTime.now()
              ..totalizerBefore = before
              ..totalizerAfter = after
              ..quantity = item.quantity
              ..unitPrice = unitPrice
              ..amount = amount
              ..employeeId = employeeId.isNotEmpty ? employeeId : currentEmployeeId;
            await isar.tramXangPumpTransactions.put(ptx);
          }
        }

        // GHI InventoryTransaction (XUẤT BÁN)
        final balance = (await _recomputeStock(item.product)) - item.quantity;
        await isar.tramXangInventoryTransactions.put(
          TramXangInventoryTransaction()
            ..transactionId = '${sale.saleId}_inv_${item.product.productId}'
            ..warehouseId = item.product.productType == 'FUEL' ? 'TANK-${item.product.sku}' : 'SHOP'
            ..product.value = item.product
            ..productId = item.product.productId
            ..documentType = 'SALE'
            ..documentId = sale.saleId
            ..inQty = 0
            ..outQty = item.quantity
            ..unitCost = item.product.importPrice
            ..balanceQty = balance
            ..balanceValue = balance * item.product.importPrice,
        );
      }

      return sale;
    });
    await _postSaleAccounting(created);
    return created;
  }

  Future<TramXangTank?> getTankByNozzleProduct(TramXangSaleItem item) async {
    if (item.nozzle != null) return item.nozzle!.tank.value;
    final isar = await db;
    // Bồn default của loại nhiên liệu (nếu không chọn vòi)
    return await isar.tramXangTanks
        .filter()
        .productIdEqualTo(item.product.productId)
        .findFirst();
  }

  Future<double> _recomputeStock(TramXangProduct product) async {
    return getProductStock(product.productId);
  }

  // ================= PURCHASE / NHẬP HÀNG =================
  Future<List<TramXangPurchase>> getPurchases() async {
    final isar = await db;
    return await isar.tramXangPurchases.where().sortByInvoiceDateDesc().findAll();
  }

  /// Nhập nhiên liệu vào bồn (hoặc nhập hàng vào kho SHOP/WAREHOUSE).
  /// Tăng tồn bồn, tạo Purchase, sinh InventoryTransaction IMPORT.
  Future<TramXangPurchase> importInventory({
    required TramXangProduct product,
    required double quantity,
    required double unitCost,
    required TramXangSupplier supplier,
    double taxRate = 10,
    String invoiceNo = '',
    String warehouseId = 'SHOP',
    TramXangTank? tank,
    String employeeId = '',
  }) async {
    final isar = await db;
    if (quantity <= 0) throw StateError('Số lượng nhập phải > 0');
    if (tank != null && tank.currentQuantity + quantity > tank.capacityLiter) {
      throw StateError('Vượt dung tích bồn ${tank.name} (${tank.capacityLiter} L)');
    }

    final created = await isar.writeTxn(() async {
      final amount = quantity * unitCost;
      final taxAmount = amount * taxRate / 100;
      final purchase = TramXangPurchase()
        ..purchaseId = '${DateTime.now().microsecondsSinceEpoch}_imp'
        ..supplier.value = supplier
        ..supplierId = supplier.supplierId
        ..product.value = product
        ..productId = product.productId
        ..invoiceNo = invoiceNo.isNotEmpty ? invoiceNo : 'PN-${DateTime.now().millisecondsSinceEpoch}'
        ..invoiceDate = DateTime.now()
        ..warehouseId = warehouseId
        ..quantity = quantity
        ..unitCost = unitCost
        ..taxRate = taxRate
        ..taxAmount = taxAmount
        ..total = amount + taxAmount
        ..status = 'COMPLETED'
        ..createdBy = employeeId.isNotEmpty ? employeeId : currentEmployeeId;
      if (tank != null) {
        purchase.tank.value = tank;
        purchase.tankId = tank.tankId;
      }
      await isar.tramXangPurchases.put(purchase);

      if (tank != null) {
        tank.currentQuantity += quantity;
        await isar.tramXangTanks.put(tank);
      }

      final balance = (await _recomputeStock(product)) + quantity;
      await isar.tramXangInventoryTransactions.put(
        TramXangInventoryTransaction()
          ..transactionId = '${purchase.purchaseId}_inv'
          ..warehouseId = warehouseId
          ..product.value = product
          ..productId = product.productId
          ..documentType = 'IMPORT'
          ..documentId = purchase.purchaseId
          ..inQty = quantity
          ..outQty = 0
          ..unitCost = unitCost
          ..balanceQty = balance
          ..balanceValue = balance * unitCost,
      );

      return purchase;
    });
    await _postPurchaseAccounting(created);
    return created;
  }

  // ================= INVENTORY =================
  Future<List<TramXangInventoryTransaction>> getInventoryTransactions({String? productId}) async {
    final isar = await db;
    if (productId != null) {
      return await isar.tramXangInventoryTransactions
          .where()
          .filter()
          .productIdEqualTo(productId)
          .sortByCreatedAtDesc()
          .findAll();
    }
    return await isar.tramXangInventoryTransactions.where().sortByCreatedAtDesc().findAll();
  }

  // ================= CUSTOMERS / SUPPLIERS =================
  Future<List<TramXangCustomer>> getCustomers() async {
    final isar = await db;
    return await isar.tramXangCustomers.where().findAll();
  }

  Future<void> saveCustomer(TramXangCustomer customer) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangCustomers.put(customer);
    });
  }

  Future<List<TramXangSupplier>> getSuppliers() async {
    final isar = await db;
    return await isar.tramXangSuppliers.where().findAll();
  }

  Future<void> saveSupplier(TramXangSupplier supplier) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tramXangSuppliers.put(supplier);
    });
  }

  // ================= REPORTS =================

  /// Đối chiếu bồn: tồn đầu + nhập - bán = tồn lý thuyết vs tồn đo thực tế.
  Future<List<TramXangTankRecon>> getTankReconciliation() async {
    final isar = await db;
    final tanks = await isar.tramXangTanks.where().findAll();
    final result = <TramXangTankRecon>[];
    for (final tank in tanks) {
      final productId = tank.productId;
      final txs = await isar.tramXangInventoryTransactions
          .filter()
          .productIdEqualTo(productId)
          .findAll();
      double imported = 0;
      double sold = 0;
      for (final tx in txs) {
        if (tx.documentType == 'SALE') sold += tx.outQty;
        if (tx.documentType == 'IMPORT') imported += tx.inQty;
      }
      final theoretical = tank.openingQuantity + imported - sold;
      result.add(TramXangTankRecon(
        tank: tank,
        opening: tank.openingQuantity,
        imported: imported,
        sold: sold,
        theoretical: theoretical,
        actual: tank.currentQuantity,
        diff: tank.currentQuantity - theoretical,
      ));
    }
    return result;
  }

  /// Doanh thu trong khoảng thời gian (không tính hoá đơn đã hủy).
  Future<TramXangShiftTotals> getSalesTotalsBetween(DateTime start, DateTime end) async {
    final isar = await db;
    final sales = (await isar.tramXangSales
            .filter()
            .createdAtBetween(start, end)
            .findAll())
        .where((s) => s.status != 'CANCELLED')
        .toList();
    final t = TramXangShiftTotals();
    for (final s in sales) {
      t.total += s.total;
      t.tax += s.tax;
      t.subtotal += s.subtotal;
      switch (s.paymentMethod) {
        case 'CASH':
          t.cash += s.total - s.debt;
          break;
        case 'TRANSFER':
          t.transfer += s.total - s.debt;
          break;
        case 'QR':
          t.qr += s.total - s.debt;
          break;
      }
      t.debt += s.debt;
      t.count++;
    }
    return t;
  }

  Future<double> getCostOfGoodsBetween(DateTime start, DateTime end) async {
    final isar = await db;
    final sales = (await isar.tramXangSales
            .filter()
            .createdAtBetween(start, end)
            .findAll())
        .where((s) => s.status != 'CANCELLED')
        .toList();
    double cost = 0;
    for (final s in sales) {
      final lines = await isar.tramXangSaleLines.filter().saleIdEqualTo(s.saleId).findAll();
      for (final l in lines) {
        cost += l.costAmount;
      }
    }
    return cost;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // KẾ TOÁN (ACCOUNTING) — TT133
  //
  // Nghiệp vụ chính của trạm xăng:
  //  • Mua xăng dầu nhập kho:  Nợ 1561 (giá mua) + Nợ 1331 (VAT) / Có 331
  //      (hoặc Có 1111/1121 nếu trả ngay).
  //  • Bán xăng dầu thu tiền:  Nợ 1111/1121/131 / Có 5111 (doanh thu) + Có 3331 (VAT).
  //  • Kết chuyển giá vốn:     Nợ 632 / Có 1561.
  // Nguyên tắc bắt buộc: Tổng Nợ = Tổng Có trong mọi bút toán.
  // ─────────────────────────────────────────────────────────────────────────

  // ---------- CHART OF ACCOUNTS ----------
  Future<List<TramXangAccount>> getAllAccounts() async {
    final isar = await db;
    return await isar.tramXangAccounts.where().sortByAccountNumber().findAll();
  }

  Future<TramXangAccount?> getAccountByNumber(String number) async {
    final isar = await db;
    return await isar.tramXangAccounts.getByAccountNumber(number);
  }

  Future<int> saveAccount(TramXangAccount account) async {
    final isar = await db;
    account.updatedAt = DateTime.now();
    account.needsSync = true;
    return await isar.writeTxn(() => isar.tramXangAccounts.put(account));
  }

  Future<List<int>> saveAccounts(List<TramXangAccount> accounts) async {
    final isar = await db;
    return await isar.writeTxn(() => isar.tramXangAccounts.putAll(accounts));
  }

  Future<List<TramXangAccountDefault>> getAllAccountDefaults() async {
    final isar = await db;
    return await isar.tramXangAccountDefaults.where().findAll();
  }

  // ---------- JOURNAL ENTRIES ----------
  Future<List<TramXangAccountingEntry>> getEntriesByMonth(int year, int month) async {
    final isar = await db;
    return await isar.tramXangAccountingEntrys
        .filter()
        .yearEqualTo(year)
        .monthEqualTo(month)
        .sortByPostingDateDesc()
        .findAll();
  }

  Future<List<TramXangAccountingEntry>> getAllEntries() async {
    final isar = await db;
    return await isar.tramXangAccountingEntrys.where().sortByPostingDateDesc().findAll();
  }

  Future<List<TramXangAccountingEntryLine>> getEntryLinesByJournal(String journalID) async {
    final isar = await db;
    return await isar.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(journalID)
        .sortByLineOrder()
        .findAll();
  }

  Future<List<TramXangAccountingEntry>> getEntriesByJournalID(String journalID) async {
    final isar = await db;
    return await isar.tramXangAccountingEntrys.filter().journalIDEqualTo(journalID).findAll();
  }

  Future<int> saveAccountingEntry(TramXangAccountingEntry entry) async {
    final isar = await db;
    entry.updatedAt = DateTime.now();
    entry.needsSync = true;
    return await isar.writeTxn(() => isar.tramXangAccountingEntrys.put(entry));
  }

  Future<List<int>> saveAccountingEntryLines(List<TramXangAccountingEntryLine> lines) async {
    final isar = await db;
    return await isar.writeTxn(() => isar.tramXangAccountingEntryLines.putAll(lines));
  }

  /// Ghi sổ (posted) bút toán theo journalID.
  Future<void> postEntry(String journalID, String postedBy) async {
    final isar = await db;
    final entry = await isar.tramXangAccountingEntrys
        .filter()
        .journalIDEqualTo(journalID)
        .findFirst();
    if (entry == null) throw StateError('Không tìm thấy bút toán $journalID');
    entry.status = TramXangEntryStatus.posted;
    entry.postedDate = DateTime.now();
    entry.postedBy = postedBy;
    entry.updatedAt = DateTime.now();
    await isar.writeTxn(() => isar.tramXangAccountingEntrys.put(entry));
  }

  /// Đảo bút toán (reversed) — không xoá, chỉ đổi trạng thái + ghi chú.
  Future<void> reverseEntry(String journalID, String reversedBy) async {
    final isar = await db;
    final entry = await isar.tramXangAccountingEntrys
        .filter()
        .journalIDEqualTo(journalID)
        .findFirst();
    if (entry == null) throw StateError('Không tìm thấy bút toán $journalID');
    entry.status = TramXangEntryStatus.reversed;
    entry.notes = '${entry.notes ?? ''}\nĐảo bút toán bởi $reversedBy';
    entry.updatedAt = DateTime.now();
    await isar.writeTxn(() => isar.tramXangAccountingEntrys.put(entry));
  }

  /// Sinh số chứng từ dạng "PN-2026/09-001" (prefix + năm/tháng + STT).
  Future<String> _nextVoucherNo(String prefix) async {
    final isar = await db;
    final d = DateTime.now();
    final ym = '${d.year}/${d.month.toString().padLeft(2, '0')}';
    final count = await isar.tramXangAccountingEntrys
        .filter()
        .voucherNumberStartsWith('$prefix-$ym-')
        .count();
    return '$prefix-$ym-${(count + 1).toString().padLeft(3, '0')}';
  }

  // ---------- TỰ ĐỘNG HẠCH TOÁN TỪ NGHIỆP VỤ ----------

  Future<String?> _customerName(String? customerId) async {
    if (customerId == null || customerId.isEmpty) return null;
    final isar = await db;
    final c = await isar.tramXangCustomers.getByCustomerId(customerId);
    return c?.name;
  }

  /// Hạch toán 1 hoá đơn bán:
  ///   BÚT TOÁN DOANH THU:  Nợ 1111/1121/131 (theo phương thức) / Có 5111 + 3331
  ///   BÚT TOÁN GIÁ VỐN:    Nợ 632 / Có 1561
  Future<void> _postSaleAccounting(TramXangSale sale) async {
    final isar = await db;
    final lines = await isar.tramXangSaleLines.filter().saleIdEqualTo(sale.saleId).findAll();
    double cost = 0;
    for (final l in lines) {
      cost += l.costAmount;
    }
    final d = sale.createdAt;
    final revenue = sale.subtotal - sale.discount;
    final customerName = await _customerName(sale.customerId);

    final saleJournal = 'JRN-BAN-${sale.saleId}';
    final debitAccount = sale.paymentMethod == 'DEBT'
        ? '131'
        : (sale.paymentMethod == 'TRANSFER' || sale.paymentMethod == 'QR' ? '1121' : '1111');
    final saleEntry = TramXangAccountingEntry()
      ..voucherNumber = sale.saleNo
      ..journalID = saleJournal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelSale
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 1111
      ..description = 'Doanh thu bán hàng hoá đơn ${sale.saleNo}'
      ..objectCode = sale.customerId
      ..objectName = customerName
      ..totalDebit = sale.total
      ..totalCredit = sale.total
      ..paymentMethod = sale.paymentMethod == 'DEBT'
          ? 'debt'
          : (sale.paymentMethod == 'TRANSFER' || sale.paymentMethod == 'QR' ? 'bank' : 'cash')
      ..isAutoGenerated = true;

    final saleLinesBk = <TramXangAccountingEntryLine>[
      TramXangAccountingEntryLine()
        ..journalID = saleJournal
        ..lineOrder = 0
        ..debitAccountNumber = debitAccount
        ..creditAccountNumber = ''
        ..amount = sale.total
        ..objectCode = sale.customerId
        ..objectName = customerName
        ..description = 'Thu tiền bán hàng',
      TramXangAccountingEntryLine()
        ..journalID = saleJournal
        ..lineOrder = 1
        ..debitAccountNumber = ''
        ..creditAccountNumber = '5111'
        ..amount = revenue
        ..description = 'Doanh thu bán hàng hoá',
      TramXangAccountingEntryLine()
        ..journalID = saleJournal
        ..lineOrder = 2
        ..debitAccountNumber = ''
        ..creditAccountNumber = '3331'
        ..amount = sale.tax
        ..description = 'Thuế GTGT đầu ra',
    ];

    final costJournal = 'JRN-GV-${sale.saleId}';
    final costEntry = TramXangAccountingEntry()
      ..voucherNumber = await _nextVoucherNo('GV')
      ..journalID = costJournal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelCost
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 6321
      ..description = 'Kết chuyển giá vốn hoá đơn ${sale.saleNo}'
      ..totalDebit = cost
      ..totalCredit = cost
      ..isAutoGenerated = true;
    final costLinesBk = <TramXangAccountingEntryLine>[
      TramXangAccountingEntryLine()
        ..journalID = costJournal
        ..lineOrder = 0
        ..debitAccountNumber = '632'
        ..creditAccountNumber = ''
        ..amount = cost
        ..description = 'Giá vốn hàng bán',
      TramXangAccountingEntryLine()
        ..journalID = costJournal
        ..lineOrder = 1
        ..debitAccountNumber = ''
        ..creditAccountNumber = '1561'
        ..amount = cost
        ..description = 'Xuất kho hàng hoá (xăng dầu)',
    ];

    await isar.writeTxn(() async {
      await isar.tramXangAccountingEntrys.putAll([saleEntry, costEntry]);
      await isar.tramXangAccountingEntryLines.putAll([...saleLinesBk, ...costLinesBk]);
    });
  }

  /// Hạch toán 1 phiếu nhập kho (mua xăng dầu):
  ///   Nợ 1561 (giá mua) + Nợ 1331 (VAT đầu vào) / Có 331 (phải trả NCC).
  Future<void> _postPurchaseAccounting(TramXangPurchase purchase) async {
    final isar = await db;
    final d = purchase.invoiceDate;
    final amount = purchase.total - purchase.taxAmount;
    final journal = 'JRN-MUA-${purchase.purchaseId}';
    final supplierName = await _supplierName(purchase.supplierId);

    final entry = TramXangAccountingEntry()
      ..voucherNumber = purchase.invoiceNo.isNotEmpty ? purchase.invoiceNo : await _nextVoucherNo('PN')
      ..journalID = journal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelPurchase
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 1550
      ..description = 'Mua xăng dầu nhập kho phiếu ${purchase.invoiceNo}'
      ..objectCode = purchase.supplierId
      ..objectName = supplierName
      ..totalDebit = purchase.total
      ..totalCredit = purchase.total
      ..paymentMethod = 'debt'
      ..isAutoGenerated = true;

    final lines = <TramXangAccountingEntryLine>[
      TramXangAccountingEntryLine()
        ..journalID = journal
        ..lineOrder = 0
        ..debitAccountNumber = '1561'
        ..creditAccountNumber = ''
        ..amount = amount
        ..objectCode = purchase.supplierId
        ..objectName = supplierName
        ..description = 'Giá mua hàng hoá chưa thuế',
      TramXangAccountingEntryLine()
        ..journalID = journal
        ..lineOrder = 1
        ..debitAccountNumber = '1331'
        ..creditAccountNumber = ''
        ..amount = purchase.taxAmount
        ..description = 'Thuế GTGT được khấu trừ',
      TramXangAccountingEntryLine()
        ..journalID = journal
        ..lineOrder = 2
        ..debitAccountNumber = ''
        ..creditAccountNumber = '331'
        ..amount = purchase.total
        ..description = 'Phải trả người bán (nhà cung cấp)',
    ];

    await isar.writeTxn(() async {
      await isar.tramXangAccountingEntrys.put(entry);
      await isar.tramXangAccountingEntryLines.putAll(lines);
    });
  }

  Future<String?> _supplierName(String? supplierId) async {
    if (supplierId == null || supplierId.isEmpty) return null;
    final isar = await db;
    final s = await isar.tramXangSuppliers.getBySupplierId(supplierId);
    return s?.name;
  }

  // ---------- BÚT TOÁN MẪU (THỦ CÔNG) ----------

  TramXangAccountingEntryLine _entryLine(
    String journalID,
    int order, {
    required String debit,
    required String credit,
    required double amount,
    String? description,
    String? objectCode,
    String? objectName,
  }) {
    return TramXangAccountingEntryLine()
      ..journalID = journalID
      ..lineOrder = order
      ..debitAccountNumber = debit
      ..creditAccountNumber = credit
      ..amount = amount
      ..description = description
      ..objectCode = objectCode
      ..objectName = objectName;
  }

  /// BÚT TOÁN MẪU MUA XĂNG DẦU (Nợ 1561 + Nợ 1331 / Có 331 hoặc 1111/1121).
  /// Không đổi kho — chỉ tạo bút toán kế toán.
  Future<TramXangAccountingEntry> createFuelPurchaseEntry({
    required TramXangProduct product,
    required double quantity,
    required double unitCost,
    double taxRate = 10,
    String method = '331', // 331 (chịu), 1111 (tiền mặt), 1121 (ngân hàng)
    String? voucherNo,
    TramXangSupplier? supplier,
    String? postedBy = 'User',
  }) async {
    final isar = await db;
    final amount = quantity * unitCost;
    final taxAmount = amount * taxRate / 100;
    final total = amount + taxAmount;
    final d = DateTime.now();
    final journal = 'JRN-${d.year}${d.month.toString().padLeft(2, '0')}-MUA-${DateTime.now().microsecondsSinceEpoch}';
    final no = voucherNo ?? (await _nextVoucherNo('MUA'));
    final name = supplier?.name;

    final entry = TramXangAccountingEntry()
      ..voucherNumber = no
      ..journalID = journal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelPurchase
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 1550
      ..description = 'Mua ${product.name} $quantity ${product.unit} ($unitCost/ĐV)'
      ..objectCode = supplier?.supplierId
      ..objectName = name
      ..totalDebit = total
      ..totalCredit = total
      ..paymentMethod = method == '331' ? 'debt' : (method == '1121' ? 'bank' : 'cash')
      ..isAutoGenerated = false
      ..createdBy = postedBy ?? 'User';

    await isar.writeTxn(() async {
      await isar.tramXangAccountingEntrys.put(entry);
      await isar.tramXangAccountingEntryLines.putAll([
        _entryLine(journal, 0,
            debit: '1561',
            credit: '',
            amount: amount,
            description: 'Giá mua ${product.name} chưa thuế',
            objectCode: supplier?.supplierId,
            objectName: name),
        _entryLine(journal, 1,
            debit: '1331',
            credit: '',
            amount: taxAmount,
            description: 'Thuế GTGT được khấu trừ'),
        _entryLine(journal, 2,
            debit: '',
            credit: method,
            amount: total,
            description: method == '331' ? 'Phải trả người bán' : 'Thanh toán ngay',
            objectCode: supplier?.supplierId,
            objectName: name),
      ]);
    });
    return entry;
  }

  /// BÚT TOÁN MẪU BÁN XĂNG DẦU (Nợ 1111/1121/131 / Có 5111 + Có 3331).
  /// Không đổi kho — chỉ tạo bút toán kế toán.
  Future<TramXangAccountingEntry> createFuelSaleEntry({
    required TramXangProduct product,
    required double quantity,
    required double unitPrice,
    double taxRate = 10,
    String method = '1111', // 1111 (tiền mặt), 1121 (ngân hàng), 131 (chịu)
    String? voucherNo,
    TramXangCustomer? customer,
    String? postedBy = 'User',
  }) async {
    final isar = await db;
    final amount = quantity * unitPrice;
    final tax = amount * taxRate / 100;
    final total = amount + tax;
    final d = DateTime.now();
    final journal = 'JRN-${d.year}${d.month.toString().padLeft(2, '0')}-BAN-${DateTime.now().microsecondsSinceEpoch}';
    final no = voucherNo ?? (await _nextVoucherNo('HD'));
    final name = customer?.name;

    final entry = TramXangAccountingEntry()
      ..voucherNumber = no
      ..journalID = journal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelSale
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 1111
      ..description = 'Bán ${product.name} $quantity ${product.unit} ($unitPrice/ĐV)'
      ..objectCode = customer?.customerId
      ..objectName = name
      ..totalDebit = total
      ..totalCredit = total
      ..paymentMethod = method == '131'
          ? 'debt'
          : (method == '1121' ? 'bank' : 'cash')
      ..isAutoGenerated = false
      ..createdBy = postedBy ?? 'User';

    await isar.writeTxn(() async {
      await isar.tramXangAccountingEntrys.put(entry);
      await isar.tramXangAccountingEntryLines.putAll([
        _entryLine(journal, 0,
            debit: method,
            credit: '',
            amount: total,
            description: 'Thu tiền bán hàng',
            objectCode: customer?.customerId,
            objectName: name),
        _entryLine(journal, 1,
            debit: '',
            credit: '5111',
            amount: amount,
            description: 'Doanh thu bán ${product.name} chưa thuế'),
        _entryLine(journal, 2,
            debit: '',
            credit: '3331',
            amount: tax,
            description: 'Thuế GTGT đầu ra'),
      ]);
    });
    return entry;
  }

  /// BÚT TOÁN MẪU KẾT CHUYỂN GIÁ VỐN (Nợ 632 / Có 1561).
  Future<TramXangAccountingEntry> createFuelCostEntry({
    required TramXangProduct product,
    required double quantity,
    required double unitCost,
    String? voucherNo,
    String? postedBy = 'User',
  }) async {
    final isar = await db;
    final cost = quantity * unitCost;
    final d = DateTime.now();
    final journal = 'JRN-${d.year}${d.month.toString().padLeft(2, '0')}-GV-${DateTime.now().microsecondsSinceEpoch}';
    final no = voucherNo ?? (await _nextVoucherNo('GV'));

    final entry = TramXangAccountingEntry()
      ..voucherNumber = no
      ..journalID = journal
      ..year = d.year
      ..month = d.month
      ..entryType = TramXangEntryType.fuelCost
      ..status = TramXangEntryStatus.posted
      ..postingDate = d
      ..documentDate = d
      ..postedDate = d
      ..refType = 6321
      ..description = 'Kết chuyển giá vốn ${product.name} $quantity ${product.unit}'
      ..totalDebit = cost
      ..totalCredit = cost
      ..isAutoGenerated = false
      ..createdBy = postedBy ?? 'User';

    await isar.writeTxn(() async {
      await isar.tramXangAccountingEntrys.put(entry);
      await isar.tramXangAccountingEntryLines.putAll([
        _entryLine(journal, 0,
            debit: '632', credit: '', amount: cost, description: 'Giá vốn hàng bán'),
        _entryLine(journal, 1,
            debit: '', credit: '1561', amount: cost, description: 'Xuất kho (xăng dầu)'),
      ]);
    });
    return entry;
  }

  /// Tổng hợp bút toán theo tháng (phục vụ màn hình Sổ cái GL).
  Future<Map<String, dynamic>> getAccountingSummary(int year, int month) async {
    final entries = await getEntriesByMonth(year, month);
    var totalDebit = 0.0;
    var totalCredit = 0.0;
    var posted = 0;
    var drafts = 0;
    for (final e in entries) {
      totalDebit += e.totalDebit;
      totalCredit += e.totalCredit;
      if (e.status == TramXangEntryStatus.posted) posted++;
      if (e.status == TramXangEntryStatus.draft) drafts++;
    }
    return {
      'totalEntries': entries.length,
      'postedEntries': posted,
      'draftEntries': drafts,
      'totalDebit': totalDebit,
      'totalCredit': totalCredit,
    };
  }
}
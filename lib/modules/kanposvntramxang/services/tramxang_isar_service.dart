import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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

    return await isar.writeTxn(() async {
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

    return await isar.writeTxn(() async {
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
}
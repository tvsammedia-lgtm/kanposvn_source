import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_product.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_partner.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_loyalty.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_order.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_stock.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_finance.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_sync_model.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_isar_service.dart';

export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_product.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_partner.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_loyalty.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_order.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_stock.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_finance.dart';
export 'package:kanposvn/modules/kanposvntruyenthong/models/tt_sync_model.dart';

/// Bộ dữ liệu mẫu ổn định cho các test workflow / báo cáo / dashboard.
///
/// Gồm: 2 sản phẩm (Cà chua, Rau muống), 2 khách hàng (Chị Lan, Chú Ba),
/// 1 nhà cung cấp, 1 quy tắc tích điểm (100.000đ = 1 điểm, min 50.000đ),
/// 3 lô hàng (L1: Cà chua 10kg@10k HSD +3 ngày; L2: Cà chua 20kg@12k HSD +10 ngày;
/// L3: Rau muống 5kg@8k đã quá hạn), movements nhập tương ứng,
/// 2 nhóm chi phí (Hao hụt/hư hỏng, Vận chuyển), 1 hóa đơn huỷ (bị loại khỏi báo cáo).
///
/// Mọi ngày trong bộ dữ liệu đều nằm trong khoảng [đầu tháng, hiện tại]
/// để các báo cáo với from = đầu tháng, to = hiện tại tìm thấy dữ liệu.
class TtTestFixture {
  late Isar isar;
  late TtIsarService service;
  late Directory tempDir;

  late TtProduct caChua;
  late TtProduct rauMuong;
  late TtCustomer lan;
  late TtCustomer chuBa;
  late TtSupplier supplier;
  late TtLoyaltyRule rule;
  late TtExpenseCategory wasteCat;
  late TtExpenseCategory transportCat;
  late TtStockLot l1CaChua;
  late TtStockLot l2CaChua;
  late TtStockLot l3RauMuong;

  late DateTime now;
  late DateTime from;
  late DateTime to;

  /// Ngày cách đây [daysAgo] ngày, nhưng luôn trong [from, now].
  DateTime txn(int daysAgo) {
    final t = now.subtract(Duration(days: daysAgo));
    return t.isBefore(from) ? now : t;
  }

  /// Ngày nhập/giao cố định cách đây [daysAgo] ngày theo giờ [hour].
  /// Không clamp để các lô luôn có thứ tự FIFO rõ ràng (lô cũ nhập trước).
  DateTime lotDate(int daysAgo, int hour) {
    final t = now.subtract(Duration(days: daysAgo));
    return DateTime(t.year, t.month, t.day, hour);
  }

  Future<List<TtSalesInvoice>> sales() async =>
      isar.ttSalesInvoices.where().findAll();

  Future<TtCustomer> customer(String code) async =>
      (await isar.ttCustomers.where().findAll()).firstWhere((c) => c.code == code);

  Future<TtSupplier> supplierByName(String name) async =>
      (await isar.ttSuppliers.where().findAll()).firstWhere((s) => s.name == name);

  Future<TtStockLot> lot(String lotId) async =>
      (await isar.ttStockLots.where().findAll()).firstWhere((l) => l.lotId == lotId);

  Future<List<TtStockMovement>> movements() async =>
      isar.ttStockMovements.where().findAll();

  Future<List<TtExpense>> expenses() async => isar.ttExpenses.where().findAll();

  Future<List<TtLoyaltyTransaction>> loyaltyTx() async =>
      isar.ttLoyaltyTransactions.where().findAll();
}

bool _initialized = false;

Future<TtTestFixture> createTtTestFixture() async {
  if (!_initialized) {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);
    _initialized = true;
  }

  final f = TtTestFixture();
  f.tempDir = await Directory.systemTemp.createTemp('tt_fixture_');
  f.isar = await Isar.open(
    [
      TtCategorySchema,
      TtUnitSchema,
      TtProductSchema,
      TtCustomerSchema,
      TtSupplierSchema,
      TtLoyaltyRuleSchema,
      TtLoyaltyTransactionSchema,
      TtSalesInvoiceSchema,
      TtSalesItemSchema,
      TtPurchaseInvoiceSchema,
      TtPurchaseItemSchema,
      TtStockLotSchema,
      TtStockIssueSchema,
      TtStockMovementSchema,
      TtReceiptSchema,
      TtExpenseCategorySchema,
      TtExpenseSchema,
      TtSyncQueueSchema,
      TtSyncConfigSchema,
      TtAppConfigSchema,
    ],
    directory: f.tempDir.path,
  );
  f.service = TtIsarService.forIsar(f.isar);

  final now = DateTime.now();
  f.now = now;
  f.from = DateTime(now.year, now.month, 1);
  // to mở rộng thêm 1 ngày để bao gồm các giao dịch được ghi bằng
  // DateTime.now() thực tế (bán hàng, xuất kho, chi phí phát sinh khi chạy test).
  f.to = now.add(const Duration(days: 1));

  final uuid = const Uuid();

  final cat = TtCategory()
    ..categoryId = uuid.v4()
    ..name = 'Rau lá';

  final caChua = TtProduct()
    ..productId = uuid.v4()
    ..sku = 'SP001'
    ..name = 'Cà chua'
    ..category.value = cat
    ..baseUnit = 'kg'
    ..purchaseUnit = 'kg'
    ..saleUnit = 'kg'
    ..conversionRate = 1
    ..defaultPurchasePrice = 15000
    ..defaultSalePrice = 25000
    ..minStock = 5
    ..maxStock = 50
    ..reorderLevel = 10
    ..shelfLifeDays = 10
    ..isPerishable = true
    ..isActive = true;

  final rauMuong = TtProduct()
    ..productId = uuid.v4()
    ..sku = 'SP002'
    ..name = 'Rau muống'
    ..category.value = cat
    ..baseUnit = 'kg'
    ..purchaseUnit = 'kg'
    ..saleUnit = 'kg'
    ..conversionRate = 1
    ..defaultPurchasePrice = 8000
    ..defaultSalePrice = 12000
    ..minStock = 5
    ..maxStock = 40
    ..reorderLevel = 5
    ..shelfLifeDays = 2
    ..isPerishable = true
    ..isActive = true;

  final lan = TtCustomer()
    ..customerId = uuid.v4()
    ..code = 'KH01'
    ..name = 'Chị Lan'
    ..customerType = TtCustomerType.QUAN_AN;

  final chuBa = TtCustomer()
    ..customerId = uuid.v4()
    ..code = 'KH02'
    ..name = 'Chú Ba'
    ..customerType = TtCustomerType.SI;

  final supplier = TtSupplier()
    ..supplierId = uuid.v4()
    ..name = 'Vựa A';

  final rule = TtLoyaltyRule()
    ..ruleId = uuid.v4()
    ..ruleName = 'Tích điểm test'
    ..amountPerPoint = 100000
    ..pointPerAmount = 100000
    ..minimumInvoice = 50000
    ..isActive = true;

  final wasteCat = TtExpenseCategory()
    ..categoryId = uuid.v4()
    ..name = 'Hao hụt/hư hỏng';

  final transportCat = TtExpenseCategory()
    ..categoryId = uuid.v4()
    ..name = 'Vận chuyển';

  final unit = TtUnit()
    ..unitId = uuid.v4()
    ..name = 'kg'
    ..conversionRate = 1
    ..baseUnit = 'kg';

  f.caChua = caChua;
  f.rauMuong = rauMuong;
  f.lan = lan;
  f.chuBa = chuBa;
  f.supplier = supplier;
  f.rule = rule;
  f.wasteCat = wasteCat;
  f.transportCat = transportCat;

  await f.isar.writeTxn(() async {
    await f.isar.ttCategorys.put(cat);
    await f.isar.ttProducts.putAll([caChua, rauMuong]);
    await f.isar.ttCustomers.putAll([lan, chuBa]);
    await f.isar.ttSuppliers.put(supplier);
    await f.isar.ttLoyaltyRules.put(rule);
    await f.isar.ttExpenseCategorys.putAll([wasteCat, transportCat]);
    await f.isar.ttUnits.put(unit);
  });

  final l1 = TtStockLot()
    ..lotId = 'TT-L1'
    ..lotNumber = 'L1-TEST'
    ..product.value = caChua
    ..supplier.value = supplier
    ..purchaseDate = f.lotDate(7, 8)
    ..expiryDate = now.add(const Duration(days: 3))
    ..quantityIn = 10
    ..quantityRemaining = 10
    ..unitCost = 10000;

  final l2 = TtStockLot()
    ..lotId = 'TT-L2'
    ..lotNumber = 'L2-TEST'
    ..product.value = caChua
    ..supplier.value = supplier
    ..purchaseDate = f.lotDate(3, 9)
    ..expiryDate = now.add(const Duration(days: 10))
    ..quantityIn = 20
    ..quantityRemaining = 20
    ..unitCost = 12000;

  final l3 = TtStockLot()
    ..lotId = 'TT-L3'
    ..lotNumber = 'L3-TEST'
    ..product.value = rauMuong
    ..supplier.value = supplier
    ..purchaseDate = f.lotDate(5, 10)
    ..expiryDate = now.subtract(const Duration(days: 1))
    ..quantityIn = 5
    ..quantityRemaining = 5
    ..unitCost = 8000;

  f.l1CaChua = l1;
  f.l2CaChua = l2;
  f.l3RauMuong = l3;

  await f.isar.writeTxn(() async {
    await f.isar.ttStockLots.putAll([l1, l2, l3]);
    for (final l in [l1, l2, l3]) {
      await l.product.save();
      await l.supplier.save();
    }
    await f.isar.ttStockMovements.putAll([
      TtStockMovement()
        ..movementId = uuid.v4()
        ..product.value = caChua
        ..lot.value = l1
        ..movementType = TtMovementType.PURCHASE
        ..referenceId = 'PNB-BASE-1'
        ..quantity = 10
        ..unitCost = 10000
        ..totalCost = 100000
        ..createdAt = l1.purchaseDate,
      TtStockMovement()
        ..movementId = uuid.v4()
        ..product.value = caChua
        ..lot.value = l2
        ..movementType = TtMovementType.PURCHASE
        ..referenceId = 'PNB-BASE-2'
        ..quantity = 20
        ..unitCost = 12000
        ..totalCost = 240000
        ..createdAt = l2.purchaseDate,
      TtStockMovement()
        ..movementId = uuid.v4()
        ..product.value = rauMuong
        ..lot.value = l3
        ..movementType = TtMovementType.PURCHASE
        ..referenceId = 'PNB-BASE-3'
        ..quantity = 5
        ..unitCost = 8000
        ..totalCost = 40000
        ..createdAt = l3.purchaseDate,
    ]);
  });

  // 1 hóa đơn hủy (phải bị loại khỏi mọi báo cáo doanh thu)
  await f.isar.writeTxn(() async {
    await f.isar.ttSalesInvoices.put(TtSalesInvoice()
      ..invoiceId = 'TT-C1'
      ..invoiceNumber = 'HDB-CANC'
      ..saleDate = f.txn(0)
      ..totalAmount = 9999999
      ..paidAmount = 0
      ..debtAmount = 0
      ..status = TtSaleStatus.CANCELLED
      ..paymentMethod = TtPaymentMethod.CASH);
  });

  return f;
}
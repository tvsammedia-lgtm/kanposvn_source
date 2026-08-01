import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/vlxd_product.dart';
import '../models/vlxd_order.dart';
import '../models/vlxd_inventory.dart';
import '../models/vlxd_partner.dart';
import '../models/vlxd_finance.dart';
import 'vlxd_isar_service.dart';

class VlxdSeedData {
  static Future<void> seedIfEmpty(VlxdIsarService isarService) async {
    final db = await isarService.db;
    final categoryCount = await db.vlxdProductCategorys.count();
    final uuid = const Uuid();
    
    if (categoryCount == 0) {
      // Categories
      final cats = [
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Sắt Thép',
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Xi Măng',
        VlxdProductCategory()..categoryId = uuid.v4()..name = 'Gạch Cát Đá',
      ];
      
      await db.writeTxn(() async {
        await db.vlxdProductCategorys.putAll(cats);
      });
      
      final savedCats = await db.vlxdProductCategorys.where().findAll();
      final catSat = savedCats.firstWhere((c) => c.name == 'Sắt Thép');
      final catXiMang = savedCats.firstWhere((c) => c.name == 'Xi Măng');
      final catGach = savedCats.firstWhere((c) => c.name == 'Gạch Cát Đá');

      // Products
      final products = [
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'THP-D10'
          ..productName = 'Thép Hòa Phát D10'
          ..unit = 'Cây'
          ..specification = '11.7m'
          ..purchasePrice = 95000
          ..retailPrice = 105000
          ..wholesalePrice = 100000
          ..category.value = catSat,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'THP-D12'
          ..productName = 'Thép Hòa Phát D12'
          ..unit = 'Cây'
          ..specification = '11.7m'
          ..purchasePrice = 140000
          ..retailPrice = 155000
          ..wholesalePrice = 150000
          ..category.value = catSat,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'XM-HT'
          ..productName = 'Xi Măng Hà Tiên 1'
          ..unit = 'Bao'
          ..specification = '50kg'
          ..purchasePrice = 85000
          ..retailPrice = 92000
          ..wholesalePrice = 89000
          ..category.value = catXiMang,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'CAT-XD'
          ..productName = 'Cát xây tô'
          ..unit = 'Khối'
          ..specification = 'Khối'
          ..purchasePrice = 200000
          ..retailPrice = 250000
          ..wholesalePrice = 240000
          ..category.value = catGach,
          
        VlxdProduct()
          ..productId = uuid.v4()
          ..productCode = 'GACH-TUYNEL'
          ..productName = 'Gạch Tuynel 4 lỗ'
          ..unit = 'Viên'
          ..specification = '8x8x18'
          ..purchasePrice = 1100
          ..retailPrice = 1300
          ..wholesalePrice = 1250
          ..category.value = catGach,
      ];
      
      await db.writeTxn(() async {
        for (var p in products) {
          await db.vlxdProducts.put(p);
          await p.category.save();
        }
      });
    }

    await _seedBusinessData(db);
  }

  static Future<void> _seedBusinessData(Isar db) async {
    final orderCount = await db.vlxdOrders.count();
    if (orderCount > 0) return;

    final uuid = const Uuid();
    final products = await db.vlxdProducts.where().findAll();
    if (products.isEmpty) return;

    // Partners
    final c1 = VlxdCustomer()
      ..customerId = uuid.v4()
      ..name = 'Khách lẻ Nguyễn Văn An'
      ..phone = '0911111222'
      ..deliveryAddress = 'Thanh Xuân, Hà Nội'
      ..type = CustomerType.RETAIL;

    final c2 = VlxdCustomer()
      ..customerId = uuid.v4()
      ..name = 'Đại lý Phương Đông'
      ..phone = '0902222333'
      ..email = 'daiphongdong@gmail.com'
      ..deliveryAddress = 'Mỹ Đình, Hà Nội'
      ..type = CustomerType.AGENCY
      ..currentDebt = 5000000
      ..debtLimit = 50000000
      ..discountRate = 3;

    final c3 = VlxdCustomer()
      ..customerId = uuid.v4()
      ..name = 'Công trình Nhà Anh Tuấn'
      ..taxCode = '0101234567'
      ..phone = '0903333444'
      ..email = 'ctanhtuan@gmail.com'
      ..deliveryAddress = 'Gia Lâm, Hà Nội'
      ..type = CustomerType.PROJECT
      ..currentDebt = 20000000
      ..debtLimit = 100000000;

    final s1 = VlxdSupplier()
      ..supplierId = uuid.v4()
      ..name = 'Nhà máy Thép Hòa Phát'
      ..phone = '0241111222'
      ..address = 'KCN Phố Nối, Hưng Yên'
      ..contactPerson = 'Anh Sơn';

    final s2 = VlxdSupplier()
      ..supplierId = uuid.v4()
      ..name = 'Đại lý Xi măng Hà Tiên'
      ..phone = '0242222333'
      ..address = 'Long Biên, Hà Nội'
      ..contactPerson = 'Chị Mai'
      ..currentDebt = 2000000;

    await db.writeTxn(() async {
      await db.vlxdCustomers.putAll([c1, c2, c3]);
      await db.vlxdSuppliers.putAll([s1, s2]);
    });

    // Warehouse
    final wh = VlxdWarehouse()
      ..warehouseId = uuid.v4()
      ..name = 'Kho Trung Tâm'
      ..address = 'Số 1 Nguyễn Trãi, Thanh Xuân, Hà Nội';
    await db.writeTxn(() async {
      await db.vlxdWarehouses.put(wh);
    });

    // Inventory stocks
    final p0 = products[0];
    final p1 = products[1];
    final p2 = products[2];
    final p3 = products[3];
    final p4 = products[4];

    final stockDefs = [
      (p0, 200.0, 50.0, 500.0),
      (p1, 150.0, 50.0, 400.0),
      (p2, 800.0, 200.0, 2000.0),
      (p3, 120.0, 30.0, 300.0),
      (p4, 10000.0, 2000.0, 50000.0),
    ];

    await db.writeTxn(() async {
      for (final (product, qty, min, max) in stockDefs) {
        final stock = VlxdInventoryStock()
          ..stockId = uuid.v4()
          ..currentQuantity = qty
          ..minQuantity = min
          ..maxQuantity = max;
        stock.warehouse.value = wh;
        stock.product.value = product;
        await db.vlxdInventoryStocks.put(stock);
        await stock.warehouse.save();
        await stock.product.save();
      }
    });

    // Inventory transactions: import + export
    await db.writeTxn(() async {
      final txImport = VlxdInventoryTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PN001'
        ..type = VlxdInventoryTransactionType.IMPORT
        ..note = 'Nhập thép từ nhà máy'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 30))
        ..createdBy = 'Admin';
      txImport.warehouse.value = wh;
      txImport.supplier.value = s1;
      await db.vlxdInventoryTransactions.put(txImport);
      await txImport.warehouse.save();
      await txImport.supplier.save();

      final importDetails = [
        (p0, 200.0, 95000.0),
        (p1, 150.0, 140000.0),
      ];
      for (final (product, qty, price) in importDetails) {
        final d = VlxdInventoryTransactionDetail()
          ..quantity = qty
          ..unitPrice = price
          ..totalAmount = qty * price;
        d.transaction.value = txImport;
        d.product.value = product;
        await db.vlxdInventoryTransactionDetails.put(d);
        await d.transaction.save();
        await d.product.save();
      }

      final txExport = VlxdInventoryTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PX001'
        ..type = VlxdInventoryTransactionType.EXPORT
        ..note = 'Xuất xi măng giao công trình'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 5))
        ..createdBy = 'Admin';
      txExport.warehouse.value = wh;
      await db.vlxdInventoryTransactions.put(txExport);
      await txExport.warehouse.save();

      final exportDetail = VlxdInventoryTransactionDetail()
        ..quantity = 100.0
        ..unitPrice = 92000.0
        ..totalAmount = 9200000.0;
      exportDetail.transaction.value = txExport;
      exportDetail.product.value = p2;
      await db.vlxdInventoryTransactionDetails.put(exportDetail);
      await exportDetail.transaction.save();
      await exportDetail.product.save();
    });

    // Orders
    await db.writeTxn(() async {
      final o1 = VlxdOrder()
        ..orderId = uuid.v4()
        ..orderCode = 'HD-2025-001'
        ..isWholesaleContract = true
        ..subTotal = 12400000
        ..discount = 0
        ..vatAmount = 0
        ..shippingFee = 500000
        ..totalAmount = 12900000
        ..paidAmount = 8000000
        ..paymentMethod = PaymentMethod.DEBT
        ..status = OrderStatus.DELIVERING
        ..orderDate = DateTime.now().subtract(const Duration(days: 5))
        ..expectedDeliveryDate = DateTime.now().add(const Duration(days: 10))
        ..notes = 'Công trình chưa thanh toán đủ';
      o1.customer.value = c3;
      await db.vlxdOrders.put(o1);
      await o1.customer.save();

      final o1d1 = VlxdOrderDetail()
        ..quantity = 100
        ..deliveredQuantity = 60
        ..unitPrice = 100000
        ..discountAmount = 0
        ..total = 10000000;
      o1d1.order.value = o1;
      o1d1.product.value = p0;
      await db.vlxdOrderDetails.put(o1d1);
      await o1d1.order.save();
      await o1d1.product.save();

      final o1d2 = VlxdOrderDetail()
        ..quantity = 10
        ..deliveredQuantity = 5
        ..unitPrice = 240000
        ..discountAmount = 0
        ..total = 2400000;
      o1d2.order.value = o1;
      o1d2.product.value = p3;
      await db.vlxdOrderDetails.put(o1d2);
      await o1d2.order.save();
      await o1d2.product.save();

      final o2 = VlxdOrder()
        ..orderId = uuid.v4()
        ..orderCode = 'HD-2025-002'
        ..isWholesaleContract = true
        ..subTotal = 30000000
        ..discount = 0
        ..vatAmount = 0
        ..shippingFee = 0
        ..totalAmount = 30000000
        ..paidAmount = 30000000
        ..paymentMethod = PaymentMethod.CASH
        ..status = OrderStatus.COMPLETED
        ..orderDate = DateTime.now().subtract(const Duration(days: 20));
      o2.customer.value = c2;
      await db.vlxdOrders.put(o2);
      await o2.customer.save();

      final o2d1 = VlxdOrderDetail()
        ..quantity = 200
        ..deliveredQuantity = 200
        ..unitPrice = 150000
        ..discountAmount = 0
        ..total = 30000000;
      o2d1.order.value = o2;
      o2d1.product.value = p1;
      await db.vlxdOrderDetails.put(o2d1);
      await o2d1.order.save();
      await o2d1.product.save();

      final o3 = VlxdOrder()
        ..orderId = uuid.v4()
        ..orderCode = 'BH-0001'
        ..isWholesaleContract = false
        ..subTotal = 2490000
        ..discount = 0
        ..vatAmount = 0
        ..shippingFee = 0
        ..totalAmount = 2490000
        ..paidAmount = 2490000
        ..paymentMethod = PaymentMethod.CASH
        ..status = OrderStatus.COMPLETED
        ..orderDate = DateTime.now();
      o3.customer.value = c1;
      await db.vlxdOrders.put(o3);
      await o3.customer.save();

      final o3d1 = VlxdOrderDetail()
        ..quantity = 20
        ..deliveredQuantity = 20
        ..unitPrice = 92000
        ..discountAmount = 0
        ..total = 1840000;
      o3d1.order.value = o3;
      o3d1.product.value = p2;
      await db.vlxdOrderDetails.put(o3d1);
      await o3d1.order.save();
      await o3d1.product.save();

      final o3d2 = VlxdOrderDetail()
        ..quantity = 500
        ..deliveredQuantity = 500
        ..unitPrice = 1300
        ..discountAmount = 0
        ..total = 650000;
      o3d2.order.value = o3;
      o3d2.product.value = p4;
      await db.vlxdOrderDetails.put(o3d2);
      await o3d2.order.save();
      await o3d2.product.save();
    });

    // Finance transactions
    await db.writeTxn(() async {
      final f1 = VlxdFinanceTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PT001'
        ..type = FinanceTransactionType.RECEIPT
        ..amount = 8000000
        ..category = 'Thu tiền công trình'
        ..paymentMethod = 'Chuyển khoản'
        ..description = 'Thanh toán đợt 1 hợp đồng HD-2025-001'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 3))
        ..createdBy = 'Admin';
      f1.customer.value = c3;
      await db.vlxdFinanceTransactions.put(f1);
      await f1.customer.save();

      final f2 = VlxdFinanceTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PT002'
        ..type = FinanceTransactionType.RECEIPT
        ..amount = 30000000
        ..category = 'Thanh toán hợp đồng'
        ..paymentMethod = 'Chuyển khoản'
        ..description = 'Thanh toán đủ hợp đồng HD-2025-002'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 20))
        ..createdBy = 'Admin';
      f2.customer.value = c2;
      await db.vlxdFinanceTransactions.put(f2);
      await f2.customer.save();

      final f3 = VlxdFinanceTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PC001'
        ..type = FinanceTransactionType.PAYMENT
        ..amount = 20000000
        ..category = 'Thanh toán NCC Thép'
        ..paymentMethod = 'Chuyển khoản'
        ..description = 'Trả tiền nhập thép PN001'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 15))
        ..createdBy = 'Admin';
      f3.supplier.value = s1;
      await db.vlxdFinanceTransactions.put(f3);
      await f3.supplier.save();

      final f4 = VlxdFinanceTransaction()
        ..transactionId = uuid.v4()
        ..documentCode = 'PC002'
        ..type = FinanceTransactionType.PAYMENT
        ..amount = 5000000
        ..category = 'Tiền lương'
        ..paymentMethod = 'Tiền mặt'
        ..description = 'Lương nhân viên tháng 7'
        ..transactionDate = DateTime.now().subtract(const Duration(days: 1))
        ..createdBy = 'Admin';
      await db.vlxdFinanceTransactions.put(f4);
    });
  }
}

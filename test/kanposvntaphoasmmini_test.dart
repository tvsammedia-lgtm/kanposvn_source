import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:isar/src/native/isar_core.dart' show initializeCoreBinary;
import 'package:kanposvn/modules/kanposvntaphoasmmini/models/invoice.dart';
import 'package:kanposvn/modules/kanposvntaphoasmmini/models/sync_model.dart';
import 'package:kanposvn/core/reports/crystal_report_models.dart';
import 'package:kanposvn/modules/kanposvntaphoasmmini/services/taphoa_isar_service.dart';
import 'package:kanposvn/modules/kanposvntaphoasmmini/services/taphoa_report_service.dart';
import 'package:kanposvn/modules/kanposvntaphoasmmini/services/taphoa_seed_data.dart';

Future<void> _initIsarCore() async {
  if (!Platform.isWindows) return;
  const candidates = [
    'build/windows/x64/runner/Debug/isar.dll',
    'build/windows/x64/runner/Release/isar.dll',
  ];
  for (final c in candidates) {
    final dll = File(c);
    if (dll.existsSync()) {
      await initializeCoreBinary(libraries: {Abi.windowsX64: dll.absolute.path});
      return;
    }
  }
}

void main() {
  setUpAll(_initIsarCore);
  late Directory tempDir;
  late TapHoaIsarService service;
  final dbName = 'taphoa_test_${DateTime.now().millisecondsSinceEpoch}';

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('taphoa_test');
    service = TapHoaIsarService(directory: tempDir, instanceName: dbName);
    await TapHoaSeedData.seedIfEmpty(service);
  });

  tearDown(() async {
    final isar = await service.db;
    await isar.close(deleteFromDisk: true);
    await tempDir.delete(recursive: true);
  });

  test('seed: danh mục, sản phẩm, tồn kho, đối tác, hóa đơn có sẵn', () async {
    final products = await service.getProducts();
    expect(products.length, greaterThan(0));

    final inventory = await service.getInventoryItems();
    expect(inventory.length, greaterThan(0));

    final customers = await service.getCustomers();
    expect(customers.length, greaterThanOrEqualTo(5));

    final suppliers = await service.getSuppliers();
    expect(suppliers.length, greaterThanOrEqualTo(5));

    final invoices = await service.getInvoices();
    expect(invoices.length, greaterThan(0));
    expect(invoices.first.items.length, greaterThan(0));
    expect(invoices.first.items.first.productName, isNotEmpty);

    final cash = await service.getCashTransactions();
    expect(cash.length, greaterThan(0));
  });

  test('checkout: lưu HD + chi tiết (link load được), trừ kho, ghi thu, tích điểm, sync queue',
      () async {
    final product =
        (await service.getProducts()).firstWhere((p) => p.productCode == 'HH001');
    final invBefore = (await service.getInventoryItems())
        .firstWhere((i) => i.productId == product.productId)
        .currentStock;
    final customer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == 'CUS_NVA');
    final spentBefore = customer.totalSpent;
    final pointsBefore = customer.rewardPoints;
    final qty = 2.0;
    final total = product.retailPrice * qty;

    final invoice = TapHoaInvoice()
      ..invoiceId = 'INV_TEST_1'
      ..invoiceNumber = 'T001'
      ..createdAt = DateTime.now()
      ..paymentMethod = 'cash'
      ..status = 'completed'
      ..customerId = customer.customerId
      ..customerName = customer.name
      ..totalAmount = total
      ..finalAmount = total
      ..amountPaid = total;
    final items = [
      TapHoaInvoiceItem()
        ..invoiceItemId = 'ITEM_TEST_1'
        ..invoiceId = 'INV_TEST_1'
        ..productId = product.productId
        ..productName = product.productName
        ..productCode = product.productCode
        ..price = product.retailPrice
        ..quantity = qty
        ..total = total,
    ];

    await service.processCheckout(invoice, items, customer: customer);

    final saved =
        (await service.getInvoices()).firstWhere((i) => i.invoiceId == 'INV_TEST_1');
    expect(saved.items.length, 1);
    expect(saved.items.first.productId, product.productId);
    expect(saved.items.first.total, total);

    final invAfter = (await service.getInventoryItems())
        .firstWhere((i) => i.productId == product.productId);
    expect(invAfter.currentStock, invBefore - qty);

    final cash = await service.getCashTransactions();
    expect(cash.any((c) => c.title.contains('T001')), isTrue);

    final updatedCustomer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == customer.customerId);
    expect(updatedCustomer.totalSpent, spentBefore + total);
    expect(updatedCustomer.rewardPoints, pointsBefore + (total / 10000).floor());

    final isar = await service.db;
    final queue = await isar.tapHoaSyncQueues.where().findAll();
    expect(queue.any((q) => q.recordId == 'INV_TEST_1'), isTrue);
  });

  test('checkout trả bằng công nợ: không ghi thu tiền mặt, cộng nợ khách', () async {
    final product =
        (await service.getProducts()).firstWhere((p) => p.productCode == 'HH002');
    final customer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == 'CUS_NVA');
    final debtBefore = customer.debtAmount;
    final cashBefore = (await service.getCashTransactions()).length;
    final total = product.retailPrice * 1;

    final invoice = TapHoaInvoice()
      ..invoiceId = 'INV_TEST_2'
      ..invoiceNumber = 'T002'
      ..createdAt = DateTime.now()
      ..paymentMethod = 'debt'
      ..status = 'completed'
      ..customerId = customer.customerId
      ..customerName = customer.name
      ..totalAmount = total
      ..finalAmount = total
      ..amountPaid = 0;
    final items = [
      TapHoaInvoiceItem()
        ..invoiceItemId = 'ITEM_TEST_2'
        ..invoiceId = 'INV_TEST_2'
        ..productId = product.productId
        ..productName = product.productName
        ..price = product.retailPrice
        ..quantity = 1
        ..total = total,
    ];

    await service.processCheckout(invoice, items, customer: customer);

    final cash = await service.getCashTransactions();
    expect(cash.length, cashBefore);

    final updatedCustomer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == customer.customerId);
    expect(updatedCustomer.debtAmount, debtBefore + total);
  });

  test('nhập hàng: tăng tồn kho và ghi phiếu nhập', () async {
    final product =
        (await service.getProducts()).firstWhere((p) => p.productCode == 'HH001');
    final stockBefore = (await service.getInventoryItems())
        .firstWhere((i) => i.productId == product.productId)
        .currentStock;

    await service.processImport(
      productId: product.productId,
      productName: product.productName,
      quantity: 50,
      costPrice: 0,
      unit: product.unit,
      note: 'Nhập test',
    );

    final stockAfter = (await service.getInventoryItems())
        .firstWhere((i) => i.productId == product.productId);
    expect(stockAfter.currentStock, stockBefore + 50);

    final txs = await service.getInventoryTransactions();
    expect(txs.first.type, 'IMPORT');
    expect(txs.first.productName, product.productName);
    expect(txs.first.newStock, stockBefore + 50);
  });

  test('trả nợ khách hàng & nhà cung cấp: giảm nợ, ghi thu/chi', () async {
    final customer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == 'CUS_NVA');
    final debtBefore = customer.debtAmount;
    final cashBefore = (await service.getCashTransactions()).length;

    await service.processDebtPayment(
      partnerId: customer.customerId,
      isCustomer: true,
      partnerName: customer.name,
      amount: 50000,
    );

    final updatedCustomer = (await service.getCustomers())
        .firstWhere((c) => c.customerId == customer.customerId);
    expect(updatedCustomer.debtAmount, debtBefore - 50000);

    final cash = await service.getCashTransactions();
    expect(cash.length, cashBefore + 1);
    expect(cash.first.type, 'INCOME');

    final supplier = (await service.getSuppliers())
        .firstWhere((s) => s.supplierId == 'SUP_NSGK');
    final supDebtBefore = supplier.debtAmount;

    await service.processDebtPayment(
      partnerId: supplier.supplierId,
      isCustomer: false,
      partnerName: supplier.name,
      amount: 100000,
    );

    final updatedSupplier = (await service.getSuppliers())
        .firstWhere((s) => s.supplierId == 'SUP_NSGK');
    expect(updatedSupplier.debtAmount, supDebtBefore - 100000);
  });

  test('CRUD sản phẩm: thêm, sửa, xóa', () async {
    final newProduct = (await service.getProducts()).first;
    newProduct.productName = 'Sản phẩm đã sửa';
    await service.saveProduct(newProduct);

    var products = await service.getProducts();
    expect(products.any((p) => p.productName == 'Sản phẩm đã sửa'), isTrue);

    final productId = products.first.productId;
    await service.deleteProduct(productId);
    products = await service.getProducts();
    expect(products.any((p) => p.productId == productId), isFalse);
  });

  test('CRUD khách hàng & nhà cung cấp: thêm, xóa', () async {
    await service.saveCustomer(
      (await service.getCustomers()).first,
    );

    final suppliers = await service.getSuppliers();
    final supplierId = suppliers.first.supplierId;
    await service.deleteSupplier(supplierId);
    final after = await service.getSuppliers();
    expect(after.any((s) => s.supplierId == supplierId), isFalse);
  });

  test('Báo cáo chung: 13 báo cáo .rpt (Sổ quỹ tiền mặt, thu/chi, bán hàng, NXT, công nợ)',
      () async {
    final reportService = TapHoaReportService(service);
    final products = await service.getProducts();
    final customers = await service.getCustomers();
    final suppliers = await service.getSuppliers();
    final from = DateTime(2020);
    final to = DateTime(2100);

    final reports = <CrystalReportModel>[
      await reportService.buildCashBook(from: from, to: to),
      await reportService.buildReceiptPayment(from: from, to: to, isReceipt: true),
      await reportService.buildReceiptPayment(from: from, to: to, isReceipt: false),
      await reportService.buildShiftReport(from: from, to: to),
      await reportService.buildSalesDetail(from: from, to: to),
      await reportService.buildSalesSummary(from: from, to: to),
      await reportService.buildLossReport(from: from, to: to),
      await reportService.buildStockLedger(
          from: from, to: to, productId: products.first.productId),
      await reportService.buildStockSummary(from: from, to: to),
      await reportService.buildCustomerDebt(from: from, to: to),
      await reportService.buildSupplierDebt(from: from, to: to),
      await reportService.buildPaymentDetail(
          from: from,
          to: to,
          forCustomer: true,
          partnerId: customers.first.customerId),
      await reportService.buildPaymentDetail(
          from: from,
          to: to,
          forCustomer: false,
          partnerId: suppliers.first.supplierId),
    ];

    expect(reports.length, 13);
    for (final r in reports) {
      expect(r.title, isNotEmpty);
      expect(r.headerRows, isNotEmpty);
      expect(r.rows, isNotEmpty);
      for (final row in r.rows) {
        expect(row.cells.length, lessThanOrEqualTo(r.columnFlex.length));
      }
    }

    final cashBook = reports[0];
    expect(cashBook.title, 'SỔ QUỸ TIỀN MẶT');
    final salesDetail = reports[4];
    expect(salesDetail.title, 'BÁO CÁO CHI TIẾT BÁN HÀNG');
    expect(
      salesDetail.rows.any((row) => row.cells.any((c) => c.text == 'Coca-Cola 330ml')),
      isTrue,
    );
  });
}

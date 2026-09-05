import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kanposvn/modules/kanposvntruyenthong/providers/tt_providers.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_stock_service.dart';

import 'kanposvntruyenthong_test_data.dart';

void main() {
  late TtTestFixture f;

  setUp(() async {
    f = await createTtTestFixture();
    await applyDashboardOps(f);
  });

  tearDown(() async {
    try {
      await f.isar.close();
    } catch (_) {}
    try {
      await f.tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Dashboard', () {
    test('các chỉ số tài chính, tồn kho và trung thành đúng', () async {
      final container = ProviderContainer(overrides: [
        ttIsarServiceProvider.overrideWithValue(f.service),
      ]);
      addTearDown(container.dispose);

      final dash = await container.read(ttDashboardProvider.future);

      expect(dash['productCount'], 2);
      expect(dash['salesCount'], greaterThanOrEqualTo(2),
          reason: '2 hóa đơn bán + 1 hóa đơn hủy');

      expect(dash['monthRevenue'], closeTo(348000, 0.001),
          reason: '300.000 + 48.000, loại hóa đơn hủy');
      expect(dash['monthProfit'], closeTo(68000, 0.001),
          reason: '348.000 - 124.000 chi phí - 156.000 giá vốn');

      expect(dash['receivable'], closeTo(23600, 0.001),
          reason: 'Chú Ba nợ 33.600 trả 10.000');
      expect(dash['payable'], closeTo(90000, 0.001),
          reason: 'PNB-R1 90.000 chưa trả NCC');

      expect(dash['cashBalance'], closeTo(-114000, 0.001),
          reason: '10.000 thu - 124.000 chi');

      expect(dash['inventoryValue'], closeTo(328000, 0.001),
          reason: 'Cà chua: lô L2 còn 16kg (20-2-2)x15.000=240.000; '
              'Rau muống: 1kg (L3) + 10kg (nhập mới) = 11x8.000=88.000');

      expect(dash['expired'], greaterThanOrEqualTo(1),
          reason: 'L3 Rau muống quá hạn 1 ngày');
      expect(dash['soonExpiring'], greaterThanOrEqualTo(1),
          reason: 'L1 Cà chua còn 3 ngày');

      expect(dash['loyaltyPointOut'], closeTo(3, 0.001),
          reason: 'HDB-A tích 3 điểm, HDB-B dưới hạn mức');
      expect(dash['lowStock'], greaterThanOrEqualTo(0));
      expect(dash['outOfStock'], greaterThanOrEqualTo(0));
      final sales2 = await f.sales();
      expect(sales2.where((i) => i.status == TtSaleStatus.CANCELLED).length, 1);
    });
  });
}

Future<void> applyDashboardOps(TtTestFixture f) async {
  final pinv = TtPurchaseInvoice()
    ..purchaseId = 'P'
    ..invoiceNumber = 'PNB-R1'
    ..supplier.value = f.supplier
    ..purchaseDate = f.txn(2)
    ..totalAmount = 90000
    ..paidAmount = 0
    ..debtAmount = 90000;
  final pitem = TtPurchaseItem()
    ..purchaseInvoice.value = pinv
    ..product.value = f.rauMuong
    ..quantity = 10
    ..unit = 'kg'
    ..unitPrice = 9000
    ..amount = 90000
    ..expiryDate = f.now.add(const Duration(days: 4));
  await TtPurchasesNotifier(f.service).createPurchase(pinv, [pitem], [f.supplier]);

  final invA = TtSalesInvoice()
    ..invoiceId = 'A'
    ..invoiceNumber = 'HDB-A'
    ..customer.value = f.lan
    ..saleDate = f.txn(1)
    ..subtotal = 300000
    ..totalAmount = 300000
    ..paidAmount = 300000
    ..debtAmount = 0
    ..costAmount = 124000
    ..status = TtSaleStatus.COMPLETED
    ..paymentMethod = TtPaymentMethod.CASH;
  final itemsA = [
    TtSalesItem()
      ..lotId = f.l1CaChua.lotId
      ..product.value = f.caChua
      ..invoice.value = invA
      ..quantity = 10
      ..unit = 'kg'
      ..unitPrice = 25000
      ..costPrice = 10000
      ..amount = 250000,
    TtSalesItem()
      ..lotId = f.l2CaChua.lotId
      ..product.value = f.caChua
      ..invoice.value = invA
      ..quantity = 2
      ..unit = 'kg'
      ..unitPrice = 25000
      ..costPrice = 12000
      ..amount = 50000,
  ];
  await TtSalesNotifier(f.service).createSale(invA, itemsA, [f.lan]);

  final invB = TtSalesInvoice()
    ..invoiceId = 'B'
    ..invoiceNumber = 'HDB-B'
    ..customer.value = f.chuBa
    ..saleDate = f.txn(0)
    ..subtotal = 48000
    ..totalAmount = 48000
    ..paidAmount = 14400
    ..debtAmount = 33600
    ..costAmount = 32000
    ..status = TtSaleStatus.DEBT
    ..paymentMethod = TtPaymentMethod.CASH;
  final itemsB = [
    TtSalesItem()
      ..lotId = f.l3RauMuong.lotId
      ..product.value = f.rauMuong
      ..invoice.value = invB
      ..quantity = 4
      ..unit = 'kg'
      ..unitPrice = 12000
      ..costPrice = 8000
      ..amount = 48000,
  ];
  await TtSalesNotifier(f.service).createSale(invB, itemsB, [f.chuBa]);

  final r = TtReceipt()
    ..receiptId = 'R'
    ..receiptNumber = 'PT-R1'
    ..customer.value = f.chuBa
    ..type = TtReceiptType.CUSTOMER_PAYMENT
    ..amount = 10000
    ..paymentMethod = 'Tiền mặt'
    ..date = f.txn(0);
  await TtFinanceNotifier(f.service).addReceipt(r);

  final e = TtExpense()
    ..expenseId = 'E1'
    ..expenseNumber = 'PC-E1'
    ..category.value = f.transportCat
    ..amount = 100000
    ..paymentMethod = 'Tiền mặt'
    ..date = f.txn(2)
    ..description = 'Vận chuyển test';
  await f.isar.writeTxn(() async {
    await f.isar.ttExpenses.put(e);
    await e.category.save();
  });

  await TtStockService(f.isar).createStockIssue(
    product: f.caChua,
    qty: 2,
    issueType: TtIssueType.WASTE,
    note: 'Hao hụt báo cáo',
  );
}
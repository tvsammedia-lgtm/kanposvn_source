import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:kanposvn/modules/kanposvntruyenthong/providers/tt_providers.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_stock_service.dart';

import 'kanposvntruyenthong_test_data.dart';

void main() {
  late TtTestFixture f;

  setUp(() async {
    f = await createTtTestFixture();
  });

  tearDown(() async {
    try {
      await f.isar.close();
    } catch (_) {}
    try {
      await f.tempDir.delete(recursive: true);
    } catch (_) {}
  });

  TtSalesInvoice buildSale({
    required String id,
    required String number,
    required double total,
    required double paid,
    required double debt,
    double costAmount = 0,
    TtSaleStatus status = TtSaleStatus.COMPLETED,
  }) {
    return TtSalesInvoice()
      ..invoiceId = id
      ..invoiceNumber = number
      ..saleDate = f.txn(0)
      ..subtotal = total
      ..totalAmount = total
      ..paidAmount = paid
      ..debtAmount = debt
      ..costAmount = costAmount
      ..status = status
      ..paymentMethod = TtPaymentMethod.CASH
      ..createdBy = 'test';
  }

  TtSalesItem saleItem(
    TtStockLot lot,
    TtSalesInvoice invoice,
    double qty,
    double unitPrice,
    double costPrice,
  ) {
    return TtSalesItem()
      ..lotId = lot.lotId
      ..product.value = lot.product.value
      ..invoice.value = invoice
      ..quantity = qty
      ..unit = 'kg'
      ..unitPrice = unitPrice
      ..costPrice = costPrice
      ..amount = qty * unitPrice;
  }

  group('Tạo phiếu nhập', () {
    test('createPurchase tạo lô, ghi movement, tăng công nợ NCC', () async {
      final inv = TtPurchaseInvoice()
        ..purchaseId = 'P1'
        ..invoiceNumber = 'PNB-T1'
        ..supplier.value = f.supplier
        ..purchaseDate = f.txn(0)
        ..totalAmount = 500000
        ..paidAmount = 200000
        ..debtAmount = 300000
        ..paymentMethod = TtPaymentMethod.CASH;

      final item = TtPurchaseItem()
        ..purchaseInvoice.value = inv
        ..product.value = f.caChua
        ..quantity = 50
        ..unit = 'kg'
        ..unitPrice = 10000
        ..amount = 500000
        ..expiryDate = f.now.add(const Duration(days: 10));

      await TtPurchasesNotifier(f.service).createPurchase(inv, [item], [f.supplier]);

      final created = await f.isar.ttStockLots.where().findAll();
      final newLot = created.firstWhere((l) => l.lotNumber == 'LPNB-T1');
      expect(newLot.quantityRemaining, closeTo(50, 0.001));
      expect(newLot.unitCost, closeTo(10000, 0.001));

      final s = await f.supplierByName('Vựa A');
      expect(s.currentDebt, closeTo(300000, 0.001),
          reason: 'Công nợ NCC tăng theo debtAmount của phiếu nhập');

      final movs = await f.movements();
      expect(movs.any((m) => m.referenceId == 'PNB-T1'), isTrue,
          reason: 'Phải có movement PURCHASE cho phiếu nhập');
    });
  });

  group('Tạo hóa đơn bán', () {
    test('createSale trừ đúng lô, ghi nhận giá vốn, tích điểm', () async {
      final inv = buildSale(
        id: 'S1',
        number: 'HDB-FIFO',
        total: 300000,
        paid: 300000,
        debt: 0,
        costAmount: 124000,
      )..customer.value = f.lan;

      final items = [
        saleItem(f.l1CaChua, inv, 10, 25000, 10000),
        saleItem(f.l2CaChua, inv, 2, 25000, 12000),
      ];

      await TtSalesNotifier(f.service).createSale(inv, items, [f.lan]);

      final l1 = await f.lot('TT-L1');
      final l2 = await f.lot('TT-L2');
      expect(l1.quantityRemaining, closeTo(0, 0.001), reason: 'L1 bán hết');
      expect(l2.quantityRemaining, closeTo(18, 0.001), reason: 'L2 còn 18 kg');

      final c = await f.customer('KH01');
      expect(c.totalPurchase, closeTo(300000, 0.001));
      expect(c.currentDebt, closeTo(0, 0.001));
      expect(c.loyaltyPoint, closeTo(3, 0.001),
          reason: '300.000đ / 100.000đ = 3 điểm');

      final txs = await f.loyaltyTx();
      final earn = txs.firstWhere((t) => t.type == TtLoyaltyType.EARN);
      expect(earn.points, closeTo(3, 0.001));
      expect(earn.balanceAfter, closeTo(3, 0.001));

      final movs = await f.movements();
      final saleMov = movs.firstWhere((m) => m.referenceId == 'HDB-FIFO');
      expect(saleMov.movementType, TtMovementType.SALE);
    });

    test('createSale không tích điểm khi dưới hóa đơn tối thiểu', () async {
      final inv = buildSale(
        id: 'S2',
        number: 'HDB-SMALL',
        total: 25000,
        paid: 25000,
        debt: 0,
        costAmount: 12000,
      )..customer.value = f.lan;

      await TtSalesNotifier(f.service)
          .createSale(inv, [saleItem(f.l2CaChua, inv, 1, 25000, 12000)], [f.lan]);

      final c = await f.customer('KH01');
      expect(c.loyaltyPoint, closeTo(0, 0.001),
          reason: 'Hóa đơn 25.000đ < 50.000đ không được tích điểm');
      expect(await f.loyaltyTx(), isEmpty);
    });

    test('createSale ghi nhận công nợ khi bán nợ', () async {
      final inv = buildSale(
        id: 'S3',
        number: 'HDB-DEBT',
        total: 100000,
        paid: 0,
        debt: 100000,
        costAmount: 40000,
        status: TtSaleStatus.DEBT,
      )..customer.value = f.lan;

      await TtSalesNotifier(f.service)
          .createSale(inv, [saleItem(f.l1CaChua, inv, 4, 25000, 10000)], [f.lan]);

      final c = await f.customer('KH01');
      expect(c.currentDebt, closeTo(100000, 0.001));
    });
  });

  group('Phiếu thu', () {
    test('addReceipt khách trả nợ giảm công nợ khách', () async {
      final inv = buildSale(
        id: 'S4',
        number: 'HDB-DEBT2',
        total: 100000,
        paid: 0,
        debt: 100000,
        costAmount: 40000,
        status: TtSaleStatus.DEBT,
      )..customer.value = f.lan;
      await TtSalesNotifier(f.service)
          .createSale(inv, [saleItem(f.l1CaChua, inv, 4, 25000, 10000)], [f.lan]);

      final r = TtReceipt()
        ..receiptId = 'R1'
        ..receiptNumber = 'PT01'
        ..customer.value = f.lan
        ..type = TtReceiptType.CUSTOMER_PAYMENT
        ..amount = 40000
        ..paymentMethod = 'Tiền mặt'
        ..date = f.txn(0);
      await TtFinanceNotifier(f.service).addReceipt(r);

      final c = await f.customer('KH01');
      expect(c.currentDebt, closeTo(60000, 0.001), reason: '100.000 - 40.000');
      expect(c.totalPayment, closeTo(40000, 0.001));
    });

    test('addReceipt trả NCC giảm công nợ nhà cung cấp', () async {
      final inv = TtPurchaseInvoice()
        ..purchaseId = 'P2'
        ..invoiceNumber = 'PNB-T2'
        ..supplier.value = f.supplier
        ..purchaseDate = f.txn(0)
        ..totalAmount = 500000
        ..paidAmount = 200000
        ..debtAmount = 300000;
      final item = TtPurchaseItem()
        ..purchaseInvoice.value = inv
        ..product.value = f.caChua
        ..quantity = 50
        ..unit = 'kg'
        ..unitPrice = 10000
        ..amount = 500000;
      await TtPurchasesNotifier(f.service).createPurchase(inv, [item], [f.supplier]);

      final r = TtReceipt()
        ..receiptId = 'R2'
        ..receiptNumber = 'PT02'
        ..supplier.value = f.supplier
        ..type = TtReceiptType.SUPPLIER_PAYMENT
        ..amount = 100000
        ..paymentMethod = 'Chuyển khoản'
        ..date = f.txn(0);
      await TtFinanceNotifier(f.service).addReceipt(r);

      final s = await f.supplierByName('Vựa A');
      expect(s.currentDebt, closeTo(200000, 0.001),
          reason: 'Công nợ NCC phải giảm khi trả nhà cung cấp');
    });
  });

  group('Xuất kho hao hụt/hư hỏng', () {
    test('createStockIssue trừ FIFO theo giá vốn lô và hạch toán chi phí hao hụt', () async {
      final issue = await TtStockService(f.isar).createStockIssue(
        product: f.caChua,
        qty: 3,
        issueType: TtIssueType.WASTE,
        note: 'Hao hụt test',
      );

      expect(issue.totalCost, closeTo(30000, 0.001), reason: '3kg x 10.000 giá vốn lô L1');
      final l1 = await f.lot('TT-L1');
      expect(l1.quantityRemaining, closeTo(7, 0.001));

      final moves = await f.movements();
      final waste = moves.firstWhere((m) => m.movementType == TtMovementType.WASTE);
      expect(waste.quantity, closeTo(-3, 0.001));
      expect(waste.unitCost, closeTo(10000, 0.001));

      final expenses = await f.expenses();
      final exp = expenses.firstWhere((e) => e.category.value?.id == f.wasteCat.id);
      expect(exp.amount, closeTo(30000, 0.001));
      expect(exp.description, contains(issue.issueNumber));
    });

    test('createStockIssue thiếu tồn -> StateError và hủy toàn bộ giao dịch', () async {
      final service = TtStockService(f.isar);
      await expectLater(
        service.createStockIssue(
          product: f.caChua,
          qty: 999,
          issueType: TtIssueType.DAMAGE,
          note: 'Thiếu tồn',
        ),
        throwsA(isA<StateError>()),
      );

      final l1 = await f.lot('TT-L1');
      final l2 = await f.lot('TT-L2');
      final l3 = await f.lot('TT-L3');
      expect(l1.quantityRemaining, closeTo(10, 0.001));
      expect(l2.quantityRemaining, closeTo(20, 0.001));
      expect(l3.quantityRemaining, closeTo(5, 0.001),
          reason: 'Không được thay đổi tồn khi lỗi');

      expect(await f.isar.ttStockIssues.count(), 0,
          reason: 'Không ghi phiếu xuất khi lỗi');
      expect(await f.isar.ttExpenses.count(), 0,
          reason: 'Không hạch toán chi phí khi lỗi');
      expect(await f.isar.ttStockMovements.count(), 3,
          reason: 'Không ghi movement khi lỗi');
    });
  });

  group('Đổi điểm thưởng', () {
    test('createSale(redeemPoints) trừ điểm và ghi REDEEM trước khi EARN', () async {
      f.lan.loyaltyPoint = 10;
      await f.isar.writeTxn(() => f.isar.ttCustomers.put(f.lan));

      final inv = buildSale(
        id: 'S5',
        number: 'HDB-REDEEM',
        total: 300000,
        paid: 300000,
        debt: 0,
        costAmount: 124000,
      )..customer.value = f.lan;

      final items = [
        saleItem(f.l1CaChua, inv, 10, 25000, 10000),
        saleItem(f.l2CaChua, inv, 2, 25000, 12000),
      ];
      await TtSalesNotifier(f.service).createSale(inv, items, [f.lan],
          redeemPoints: 5);

      final after = await f.customer('KH01');
      // 10 (có sẵn) - 5 (đổi) + 3 (tích mới) = 8
      expect(after.loyaltyPoint, closeTo(8, 0.001));

      final txs = await f.loyaltyTx();
      final redeem = txs.firstWhere((t) => t.type == TtLoyaltyType.REDEEM);
      expect(redeem.points, closeTo(-5, 0.001));
      expect(redeem.balanceAfter, closeTo(5, 0.001));
      expect(redeem.description, contains('Đổi điểm'));
    });

    test('redeemPoints bị giới hạn theo số điểm hiện có', () async {
      f.lan.loyaltyPoint = 2;
      await f.isar.writeTxn(() => f.isar.ttCustomers.put(f.lan));

      final inv = buildSale(
        id: 'S6',
        number: 'HDB-REDEEM2',
        total: 225000,
        paid: 225000,
        debt: 0,
        costAmount: 92000,
      )..customer.value = f.lan;

      final items = [
        saleItem(f.l1CaChua, inv, 8, 25000, 10000),
        saleItem(f.l2CaChua, inv, 1, 25000, 12000),
      ];
      await TtSalesNotifier(f.service).createSale(inv, items, [f.lan],
          redeemPoints: 999);

      final after = await f.customer('KH01');
      // 2 - 2 (clamp) + 2 (EARN 225.000/100.000) = 2
      expect(after.loyaltyPoint, closeTo(2, 0.001));
      final txs = await f.loyaltyTx();
      final redeem = txs.firstWhere((t) => t.type == TtLoyaltyType.REDEEM);
      expect(redeem.points, closeTo(-2, 0.001));
    });
  });
}
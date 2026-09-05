import 'package:flutter_test/flutter_test.dart';

import 'package:kanposvn/core/reports/crystal_report_models.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/providers/tt_providers.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_report_service.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_stock_service.dart';

import 'kanposvntruyenthong_test_data.dart';

/// Chạy một chuỗi nghiệp vụ ổn định:
/// - PNB-R1: nhập Rau muống 10kg@9.000 -> nợ NCC 90.000
/// - HDB-A: bán Cà chua 10kg (lô L1) + 2kg (lô L2) @25.000 = 300.000
///          + đổi 0 điểm, giá vốn 10 x 10.000 + 2 x 12.000 = 124.000
/// - HDB-B: bán nợ Rau muống 4kg@12.000 = 48.000, trả 30% = 14.400, nợ 33.600,
///          giá vốn 4 x 8.000 = 32.000
/// - Phiếu thu CUSTOMER_PAYMENT 10.000 (Chú Ba trả nợ)
/// - Chi phí Vận chuyển 100.000
/// - Xuất kho hao hụt 2kg Cà chua (lô L2, giá vốn 12.000) -> chi phí 24.000
///
/// Kỳ vọng:
///   Doanh thu 348.000 | Giá vốn 156.000 | Lãi gộp 192.000
///   Chi phí vận hành 100.000 | Hao hụt 24.000 | LN ròng 68.000
///   Tổng thu 358.000 | Tổng chi 124.000 | Chênh lệch 234.000
///   Công nợ Chú Ba 23.600 | Công nợ Vựa A 90.000
Future<void> applyReportOps(TtTestFixture f) async {
  // Nhập hàng
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

  // Bán hàng A
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

  // Bán nợ B
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

  // Khách trả nợ
  final r = TtReceipt()
    ..receiptId = 'R'
    ..receiptNumber = 'PT-R1'
    ..customer.value = f.chuBa
    ..type = TtReceiptType.CUSTOMER_PAYMENT
    ..amount = 10000
    ..paymentMethod = 'Tiền mặt'
    ..date = f.txn(0);
  await TtFinanceNotifier(f.service).addReceipt(r);

  // Chi phí vận chuyển
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

  // Hao hụt 2kg Cà chua (FIFO: lô L1 đã hết, lấy lô L2 giá 12.000)
  await TtStockService(f.isar).createStockIssue(
    product: f.caChua,
    qty: 2,
    issueType: TtIssueType.WASTE,
    note: 'Hao hụt báo cáo',
  );
}

List<String> allCellTexts(CrystalReportModel m) {
  return [
    for (final r in [...m.rows, ...m.totalRows])
      for (final c in r.cells) c.text,
  ];
}

String? cellContaining(CrystalReportModel m, String needle) {
  for (final r in [...m.rows, ...m.totalRows]) {
    for (final c in r.cells) {
      if (c.text.contains(needle)) return c.text;
    }
  }
  return null;
}

ReportRow? rowWith(CrystalReportModel m, String needle) {
  for (final r in [...m.rows, ...m.totalRows]) {
    if (r.cells.any((c) => c.text.contains(needle))) return r;
  }
  return null;
}

String? pctCellOfRowWith(CrystalReportModel m, String label) {
  final row = rowWith(m, label);
  if (row == null) return null;
  for (final c in row.cells) {
    if (c.text.endsWith('%')) return c.text;
  }
  return null;
}

void main() {
  late TtTestFixture f;
  late TtReportService report;

  setUp(() async {
    f = await createTtTestFixture();
    report = TtReportService(f.service);
    await applyReportOps(f);
  });

  tearDown(() async {
    try {
      await f.isar.close();
    } catch (_) {}
    try {
      await f.tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Doanh thu', () {
    test('báo cáo theo ngày gom đủ doanh thu, loại hóa đơn hủy', () async {
      final m = await report.buildRevenueByDay(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(m, 'TỔNG CỘNG'), isNotNull);
      expect(allCellTexts(m), contains(formatMoney(348000)),
          reason: '300.000 + 48.000, hóa đơn hủy 9.999.999 bị loại');
      expect(allCellTexts(m).where((t) => t.contains('9999999')), isEmpty);
    });

    test('báo cáo theo tháng có doanh thu', () async {
      final m = await report.buildRevenueByMonth(
        from: f.from,
        to: f.to,
      );
      expect(allCellTexts(m), contains(formatMoney(348000)));
    });

    test('báo cáo theo sản phẩm xếp theo doanh thu giảm dần', () async {
      final m = await report.buildRevenueByProduct(
        from: f.from,
        to: f.to,
      );
      expect(m.rows, isNotEmpty);
      expect(m.rows.first.cells.first.text, 'Cà chua',
          reason: 'Cà chua 300.000 > Rau muống 48.000 -> đứng đầu');
      expect(allCellTexts(m), contains(formatMoney(300000)));
      expect(allCellTexts(m), contains(formatMoney(48000)));
    });

    test('báo cáo theo khách hàng có doanh thu từng khách', () async {
      final m = await report.buildRevenueByCustomer(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(m, 'Chị Lan'), isNotNull);
      expect(cellContaining(m, 'Chú Ba'), isNotNull);
      expect(cellContaining(m, formatMoney(300000)), isNotNull);
      expect(cellContaining(m, formatMoney(48000)), isNotNull);
    });
  });

  group('Chi phí', () {
    test('phần trăm theo tổng chi phí (Vận chuyển 80.6%, Hao hụt 19.4%)', () async {
      final m = await report.buildExpenseByCategory(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(m, formatMoney(124000)), isNotNull,
          reason: '100.000 + 24.000');
      final transportPct = pctCellOfRowWith(m, 'Vận chuyển');
      final wastePct = pctCellOfRowWith(m, 'Hao hụt/hư hỏng');
      expect(transportPct, isNotNull);
      expect(wastePct, isNotNull);
      expect(transportPct, '80.6%', reason: '100.000 / 124.000');
      expect(wastePct, '19.4%', reason: '24.000 / 124.000');
      final total = double.parse(transportPct!.replaceAll('%', '')) +
          double.parse(wastePct!.replaceAll('%', ''));
      expect(total, closeTo(100, 0.4));
    });
  });

  group('Kho', () {
    test('báo cáo tồn kho tóm tắt và chi tiết', () async {
      final sum = await report.buildStockSummary(from: f.from, to: f.to);
      expect(cellContaining(sum, 'Cà chua'), isNotNull);
      expect(cellContaining(sum, 'Rau muống'), isNotNull);

      final detail = await report.buildStockDetail(from: f.from, to: f.to);
      expect(cellContaining(detail, 'Cà chua'), isNotNull);
      expect(cellContaining(detail, 'Rau muống'), isNotNull);
      expect(cellContaining(detail, 'PNB-R1'), isNotNull,
          reason: 'Lô nhập PNB-R1 có giao dịch trong kỳ');
      expect(cellContaining(detail, 'HDB-A'), isNotNull,
          reason: 'Hóa đơn HDB-A có movement xuất trong kỳ');
    });

    test('báo cáo kiểm kê có tồn và tổng cộng', () async {
      final m = await report.buildStockCountReport(from: f.from, to: f.to);
      expect(cellContaining(m, 'TỔNG CỘNG'), isNotNull);
      expect(cellContaining(m, 'Cà chua'), isNotNull);
      expect(cellContaining(m, 'Rau muống'), isNotNull);
    });

    test('báo cáo rủi ro hết hạn: hết hạn + còn hạn', () async {
      final m = await report.buildExpiryRisk(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(m, 'Đã hết hạn'), isNotNull,
          reason: 'L3 Rau muống đã quá hạn');
      expect(cellContaining(m, 'Còn'), isNotNull,
          reason: 'L1/L2 Cà chua còn hạn');
    });
  });

  group('Công nợ', () {
    test('công nợ khách hàng', () async {
      final sum = await report.buildCustomerDebtSummary(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(sum, 'Chú Ba'), isNotNull);
      expect(cellContaining(sum, formatMoney(23600)), isNotNull,
          reason: '33.600 - 10.000 đã trả');
      expect(cellContaining(sum, 'Chị Lan'), isNull,
          reason: 'Khách không còn nợ không xuất hiện (hoặc dòng bằng 0)');

      final detail = await report.buildCustomerDebtDetail(from: f.from, to: f.to);
      expect(cellContaining(detail, 'Chú Ba'), isNotNull);
      expect(cellContaining(detail, formatMoney(23600)), isNotNull);
    });

    test('công nợ nhà cung cấp', () async {
      final sum = await report.buildSupplierDebtSummary(
        from: f.from,
        to: f.to,
      );
      expect(cellContaining(sum, 'Vựa A'), isNotNull);
      expect(cellContaining(sum, formatMoney(90000)), isNotNull,
          reason: 'PNB-R1 chưa trả đồng nào');
    });
  });

  group('Kết quả kinh doanh', () {
    test('lãi lỗ: doanh thu, giá vốn, hao hụt, chi phí vận hành, lãi ròng', () async {
      final m = await report.buildProfitLoss(from: f.from, to: f.to);
      expect(cellContaining(m, formatMoney(348000)), isNotNull);
      expect(cellContaining(m, formatMoney(192000)), isNotNull,
          reason: 'lãi gộp = 348.000 - 156.000');
      final netRow = rowWith(m, 'LỢI NHUẬN RÒNG');
      expect(netRow, isNotNull);
      expect(netRow!.cells.last.text, formatMoney(68000),
          reason: '192.000 - 100.000 (vận hành) - 24.000 (hao hụt)');
    });

    test('cân đối thu chi: số liệu và chênh lệch', () async {
      final m = await report.buildRevenueExpenseBalance(
        from: f.from,
        to: f.to,
      );
      final inRow = rowWith(m, 'Tổng thu');
      final outRow = rowWith(m, 'Tổng chi');
      final diffRow = rowWith(m, 'Chênh lệch');
      expect(inRow, isNotNull);
      expect(outRow, isNotNull);
      expect(diffRow, isNotNull);
      expect(cellContaining(m, formatMoney(358000)), isNotNull,
          reason: '348.000 bán + 10.000 thu hồi nợ');
      expect(cellContaining(m, formatMoney(124000)), isNotNull,
          reason: '100.000 vận chuyển + 24.000 hao hụt');
      expect(cellContaining(m, formatMoney(234000)), isNotNull,
          reason: 'chênh lệch = 358.000 - 124.000');
    });
  });

  group('Sổ quỹ', () {
    test('sổ quỹ: thu, chi và số dư cuối kỳ', () async {
      final m = await report.buildCashBook(from: f.from, to: f.to);
      final sumRow = rowWith(m, 'Cộng phát sinh trong kỳ');
      expect(sumRow, isNotNull);
      expect(sumRow!.cells[3].text, formatMoney(10000), reason: 'tiền thu');
      expect(sumRow.cells[4].text, formatMoney(124000), reason: 'tiền chi');

      final endRow = rowWith(m, 'Số dư cuối kỳ');
      expect(endRow, isNotNull);
      expect(endRow!.cells.last.text, formatMoney(-114000),
          reason: '0 (đầu kỳ) + 10.000 - 124.000');
    });
  });

  group('Bán chạy/chậm', () {
    test('buildFastestSlowest bán chạy/trung bình/chậm', () async {
      final fastest = await report.buildFastestSlowest(
        from: f.from,
        to: f.to,
        fastest: true,
      );
      expect(cellContaining(fastest, 'Cà chua'), isNotNull,
          reason: 'Cà chua bán 12kg > Rau muống 4kg');
      expect(cellContaining(fastest, 'Rau muống'), isNotNull);

      final slowest = await report.buildFastestSlowest(
        from: f.from,
        to: f.to,
        fastest: false,
      );
      expect(cellContaining(slowest, 'Rau muống'), isNotNull);
    });

    test('mọi báo cáo có tiêu đề và ít nhất 1 dòng', () async {
      final builds = <String, Future<CrystalReportModel> Function()>{
        'cashBook': () => report.buildCashBook(from: f.from, to: f.to),
        'revenueByDay': () =>
            report.buildRevenueByDay(from: f.from, to: f.to),
        'revenueByMonth': () =>
            report.buildRevenueByMonth(from: f.from, to: f.to),
        'revenueByProduct': () =>
            report.buildRevenueByProduct(from: f.from, to: f.to),
        'revenueByCustomer': () =>
            report.buildRevenueByCustomer(from: f.from, to: f.to),
        'expenseByCategory': () =>
            report.buildExpenseByCategory(from: f.from, to: f.to),
        'stockSummary': () =>
            report.buildStockSummary(from: f.from, to: f.to),
        'stockDetail': () =>
            report.buildStockDetail(from: f.from, to: f.to),
        'customerDebtSummary': () =>
            report.buildCustomerDebtSummary(from: f.from, to: f.to),
        'customerDebtDetail': () =>
            report.buildCustomerDebtDetail(from: f.from, to: f.to),
        'supplierDebtSummary': () =>
            report.buildSupplierDebtSummary(from: f.from, to: f.to),
        'profitLoss': () => report.buildProfitLoss(from: f.from, to: f.to),
        'revenueExpenseBalance': () =>
            report.buildRevenueExpenseBalance(from: f.from, to: f.to),
        'expiryRisk': () =>
            report.buildExpiryRisk(from: f.from, to: f.to),
        'fastest': () =>
            report.buildFastestSlowest(from: f.from, to: f.to, fastest: true),
        'slowest': () =>
            report.buildFastestSlowest(from: f.from, to: f.to, fastest: false),
        'stockCountReport': () =>
            report.buildStockCountReport(from: f.from, to: f.to),
      };

      for (final entry in builds.entries) {
        final m = await entry.value();
        expect(m.title.isNotEmpty, isTrue, reason: '${entry.key} thiếu tiêu đề');
        expect(m.rows, isNotEmpty, reason: '${entry.key} báo cáo rỗng');
        expect(m.headerRows.isNotEmpty, isTrue,
            reason: '${entry.key} thiếu header');
      }
    });
  });
}
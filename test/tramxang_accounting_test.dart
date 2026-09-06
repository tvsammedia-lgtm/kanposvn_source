import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/accounting_entry.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/core.dart';
import 'package:kanposvn/modules/kanposvntramxang/models/product.dart';
import 'package:kanposvn/modules/kanposvntramxang/services/tramxang_isar_service.dart';
import 'package:kanposvn/modules/kanposvntramxang/services/tramxang_report_service.dart';

/// Kiểm thử hệ thống kế toán TT133 của Trạm Xăng:
/// - seed bút toán mẫu mua/bán xăng dầu (1561 · 1331 / 5111 · 3331 · 632)
/// - nguyên tắc DR = CR luôn đúng
/// - post/reverse
/// - bộ máy báo cáo Crystal (.rpt) trả về model hợp lệ.
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
    tempDir = await Directory.systemTemp.createTemp('tramxang_accounting_test');
    service = TramXangIsarService(
        directory: tempDir, instanceName: 'tramxang_accounting_test_db');
    db = await service.db;
    await service.ensureSeeded();
  });

  tearDownAll(() async {
    try {
      await db.close(deleteFromDisk: true);
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  Future<TramXangProduct> fuel(String id) async {
    return (await db.tramXangProducts.getByProductId(id))!;
  }

  Future<double> totalDr(String journalID) async {
    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(journalID)
        .findAll();
    return lines
        .where((l) => l.debitAccountNumber.isNotEmpty)
        .fold<double>(0, (s, l) => s + l.amount);
  }

  Future<double> totalCr(String journalID) async {
    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(journalID)
        .findAll();
    return lines
        .where((l) => l.creditAccountNumber.isNotEmpty)
        .fold<double>(0, (s, l) => s + l.amount);
  }

  test('1) Seed tạo hệ thống tài khoản TT133 + bút toán mẫu', () async {
    final accounts = await service.getAllAccounts();
    expect(accounts.length, 27);

    final codes = accounts.map((a) => a.accountNumber).toSet();
    for (final code in ['1111', '1121', '131', '1331', '1561', '331', '3331', '5111', '632']) {
      expect(codes.contains(code), isTrue, reason: 'Thiếu tài khoản $code');
    }

    final entries = await service.getAllEntries();
    expect(entries.length, greaterThanOrEqualTo(3));

    final types = entries.map((e) => e.entryType).toSet();
    expect(types.contains(TramXangEntryType.fuelPurchase), isTrue);
    expect(types.contains(TramXangEntryType.fuelSale), isTrue);
    expect(types.contains(TramXangEntryType.fuelCost), isTrue);
  });

  test('2) Bút toán mẫu MUA xăng: Nợ 1561+1331 / Có 331, DR=CR', () async {
    final purchase = await db.tramXangAccountingEntrys
        .filter()
        .entryTypeEqualTo(TramXangEntryType.fuelPurchase)
        .findFirst();
    expect(purchase, isNotNull);
    final dr = await totalDr(purchase!.journalID);
    final cr = await totalCr(purchase.journalID);
    expect(dr, closeTo(purchase.totalDebit, 0.001));
    expect(cr, closeTo(purchase.totalCredit, 0.001));
    expect(dr, closeTo(cr, 0.001));

    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(purchase.journalID)
        .findAll();
    expect(lines.length, 3);
    // Mua 5000L RON95 @22000 → hàng 110tr, thuế 11tr, trả 121tr.
    final dr1561 = lines.firstWhere((l) => l.debitAccountNumber == '1561');
    final dr1331 = lines.firstWhere((l) => l.debitAccountNumber == '1331');
    final cr331 = lines.firstWhere((l) => l.creditAccountNumber == '331');
    expect(dr1561.amount, closeTo(110000000, 0.001));
    expect(dr1331.amount, closeTo(11000000, 0.001));
    expect(cr331.amount, closeTo(121000000, 0.001));
  });

  test('3) Bút toán mẫu BÁN xăng: Nợ 1111 / Có 5111+3331, DR=CR', () async {
    final sale = await db.tramXangAccountingEntrys
        .filter()
        .entryTypeEqualTo(TramXangEntryType.fuelSale)
        .findFirst();
    expect(sale, isNotNull);
    final dr = await totalDr(sale!.journalID);
    final cr = await totalCr(sale.journalID);
    expect(dr, closeTo(cr, 0.001));

    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(sale.journalID)
        .findAll();
    expect(lines.length, 3);
    final cr5111 = lines.firstWhere((l) => l.creditAccountNumber == '5111');
    final cr3331 = lines.firstWhere((l) => l.creditAccountNumber == '3331');
    // Bán 3000L @23500 → DT 70,5tr + VAT 7,05tr = 77,55tr thu tiền mặt.
    expect(cr5111.amount, closeTo(70500000, 0.001));
    expect(cr3331.amount, closeTo(7050000, 0.001));
    expect(dr, closeTo(77550000, 0.001));
  });

  test('4) Bút toán mẫu GIÁ VỐN: Nợ 632 / Có 1561', () async {
    final cost = await db.tramXangAccountingEntrys
        .filter()
        .entryTypeEqualTo(TramXangEntryType.fuelCost)
        .findFirst();
    expect(cost, isNotNull);
    final dr = await totalDr(cost!.journalID);
    final cr = await totalCr(cost.journalID);
    expect(dr, closeTo(cr, 0.001));
    expect(dr, closeTo(66000000, 0.001));

    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(cost.journalID)
        .findAll();
    expect(lines.any((l) => l.debitAccountNumber == '632'), isTrue);
    expect(lines.any((l) => l.creditAccountNumber == '1561'), isTrue);
  });

  test('5) Tạo bút toán mới theo phương thức 1121 (ngân hàng)', () async {
    final ron95 = await fuel('fuel_ron95');
    final entry = await service.createFuelSaleEntry(
      product: ron95,
      quantity: 1000,
      unitPrice: 24000,
      taxRate: 10,
      method: '1121',
    );
    expect(entry.voucherNumber, startsWith('HD-'));
    final dr = await totalDr(entry.journalID);
    final cr = await totalCr(entry.journalID);
    expect(dr, closeTo(cr, 0.001));
    // Doanh thu 24tr + VAT 2,4tr = 26,4tr
    expect(dr, closeTo(26400000, 0.001));
    expect(entry.paymentMethod, 'bank');

    final lines = await db.tramXangAccountingEntryLines
        .filter()
        .journalIDEqualTo(entry.journalID)
        .findAll();
    expect(lines.any((l) => l.debitAccountNumber == '1121'), isTrue);
  });

  test('6) Ghi sổ & đảo bút toán không sinh thêm bút toán', () async {
    final draft = await service.createFuelCostEntry(
      product: await fuel('fuel_ron95'),
      quantity: 100,
      unitCost: 22000,
    );
    expect(draft.status, TramXangEntryStatus.posted);

    final countBefore = await db.tramXangAccountingEntrys.count();

    await service.postEntry(draft.journalID, 'test_user');
    await service.reverseEntry(draft.journalID, 'test_user');

    final after = await db.tramXangAccountingEntrys
        .filter()
        .journalIDEqualTo(draft.journalID)
        .findFirst();
    expect(after, isNotNull);
    expect(after!.status, TramXangEntryStatus.reversed);
    expect(after.postedDate, isNotNull);
    expect(await db.tramXangAccountingEntrys.count(), countBefore);
  });

  test('7) Tổng hợp kế toán theo tháng cân bằng DR/CR', () async {
    final now = DateTime.now();
    final summary = await service.getAccountingSummary(now.year, now.month);
    final totalDebit = summary['totalDebit'] as double;
    final totalCredit = summary['totalCredit'] as double;
    expect(totalDebit, closeTo(totalCredit, 0.001));
    expect((summary['totalEntries'] as int), greaterThanOrEqualTo(3));
  });

  test('8) Báo cáo Crystal trả về model hợp lệ cho mọi loại', () async {
    final rs = TramXangReportService(service);
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, 1);
    final to = DateTime(now.year, now.month, now.day).add(const Duration(hours: 23, minutes: 59));

    final reports = <Future>[
      rs.buildCashBook(from: from, to: to),
      rs.buildCashFundSummary(from: from, to: to),
      rs.buildReceiptPayment(from: from, to: to, isReceipt: true),
      rs.buildReceiptPayment(from: from, to: to, isReceipt: false),
      rs.buildSalesDetail(from: from, to: to),
      rs.buildSalesSummary(from: from, to: to),
      rs.buildTankStockSummary(from: from, to: to),
      rs.buildStockSummary(from: from, to: to),
      rs.buildShiftReport(from: from, to: to),
      rs.buildProfitLoss(from: from, to: to),
      rs.buildCustomerDebt(from: from, to: to),
      rs.buildSupplierDebt(from: from, to: to),
      rs.buildPaymentDetail(from: from, to: to, forCustomer: true, partnerId: ''),
      rs.buildPaymentDetail(from: from, to: to, forCustomer: false, partnerId: ''),
    ];

    for (final future in reports) {
      final report = await future;
      expect(report.title, isNotEmpty, reason: 'Thiếu tiêu đề báo cáo');
      expect(report.rows, isNotNull);
    }
  });
}
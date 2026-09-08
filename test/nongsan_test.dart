import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvndailynongsan/models/nongsan_accounting.dart';
import 'package:kanposvn/modules/kanposvndailynongsan/models/nongsan_product.dart';
import 'package:kanposvn/modules/kanposvndailynongsan/services/nongsan_business_logic.dart';
import 'package:kanposvn/modules/kanposvndailynongsan/services/nongsan_isar_service.dart';
import 'package:kanposvn/modules/kanposvndailynongsan/services/nongsan_seed_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// Stub path_provider để mở Isar trong môi trường test.
class _FakePathProvider extends PathProviderPlatform {
  final String dirPath;
  _FakePathProvider(this.dirPath);

  @override
  Future<String?> getApplicationDocumentsPath() async => dirPath;
}

void main() {
  late Directory tempDir;
  late NongSanIsarService service;
  late NongSanBusinessLogic bl;
  late Isar db;

  Future<List<NongSanLot>> gaoLots() async =>
      (await bl.lots()).where((l) => l.productId == NongSanSeedData.gaoSt25).toList();

  Future<List<NongSanLot>> calots() async =>
      (await bl.lots()).where((l) => l.productId == NongSanSeedData.caBasa).toList();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('nongsan_logic_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);

    service = NongSanIsarService();
    bl = NongSanBusinessLogic(service);
    db = await service.db;
    await NongSanSeedData.seedIfEmpty(bl);
  });

  tearDownAll(() async {
    try {
      await db.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  group('Seed dữ liệu mẫu theo agri_trade_manager_spec.md', () {
    test('§2/§5 Sản phẩm đủ 4 nhóm hàng + giá tham khảo', () async {
      final products = await bl.products();
      expect(products.length, 8);
      expect(products.any((p) => p.category == 'Nông sản'), isTrue);
      expect(products.any((p) => p.category == 'Lâm sản'), isTrue);
      expect(products.any((p) => p.category == 'Thủy sản'), isTrue);
      expect(products.any((p) => p.category == 'Hải sản'), isTrue);
      final gao = products.firstWhere((p) => p.id == NongSanSeedData.gaoSt25);
      expect(gao.unit, 'Kg');
      expect(gao.referencePrice, 17500);
      expect(gao.salePriceRef, 25000);
      expect(gao.sku, isNotEmpty);
    });

    test('§6 Kho đủ các loại (Nguyên liệu, Đông lạnh, Hàng khô)', () async {
      final whs = await bl.warehouses();
      expect(whs.length, 3);
      expect(whs.map((w) => w.type).toSet(),
          containsAll(['Nguyên liệu', 'Đông lạnh', 'Hàng khô']));
    });

    test('§8.1 Tiêu chuẩn chất lượng lưu mức độ ẩm/tạp chất/tỷ lệ hao hụt', () async {
      final quals = await bl.qualities();
      expect(quals.length, 6);
      final gaoQ = quals.firstWhere((q) => q.productId == NongSanSeedData.gaoSt25);
      expect(gaoQ.grade, 'Loại 1');
      expect(gaoQ.humidity, 14);
      expect(gaoQ.impurityRate, 1);
      final cpQ = quals.firstWhere((q) => q.productId == NongSanSeedData.caphe);
      expect(cpQ.lossRate, 1);
    });

    test('§14 Nhà cung cấp có hạn mức công nợ + điều khoản thanh toán', () async {
      final suppliers = await bl.suppliers();
      expect(suppliers.length, 3);
      final mekong = suppliers.firstWhere((s) => s.id == NongSanSeedData.nccMekong);
      expect(mekong.creditLimit, 500000000);
      expect(mekong.paymentTermDays, 30);
      expect(mekong.taxId, isNotEmpty);
      expect(mekong.contactPerson, isNotEmpty);
    });

    test('§15 Khách hàng có hạn mức tín dụng', () async {
      final customers = await bl.customers();
      expect(customers.length, 3);
      final sieuthi = customers.firstWhere((c) => c.id == NongSanSeedData.khSieuthi);
      expect(sieuthi.creditLimit, 200000000);
      expect(sieuthi.paymentTermDays, 45);
    });

    test('§12.1 Đơn đặt hàng nhập: đủ trạng thái', () async {
      final pos = await bl.purchaseOrders();
      expect(pos.length, 3);
      expect(pos.where((p) => p.status == 'APPROVED').length, 2);
      expect(pos.where((p) => p.status == 'DRAFT').length, 1);
      expect(pos.any((p) => p.productId == NongSanSeedData.caphe), isTrue);
    });

    test('§9.2 Phiếu cân: TL hàng = Gross - Tare - Bì', () async {
      final tickets = await bl.weighingTickets();
      expect(tickets.length, 2);
      final gaoW = tickets.firstWhere((t) => t.id == 'weigh_gao_v1');
      expect(gaoW.netWeight, 20500 - 14900 - 0);
      expect(gaoW.vehiclePlate, '51C-123.45');
      final caW = tickets.firstWhere((t) => t.id == 'weigh_ca_v1');
      expect(caW.netWeight, 2600 - 1100);
    });

    test('§9.3 Kiểm phẩm: trừ kém phẩm bằng đúng chênh lệch nhập', () async {
      final insps = await bl.inspections();
      expect(insps.length, 2);
      final gaoK = insps.firstWhere((i) => i.productId == NongSanSeedData.gaoSt25);
      expect(gaoK.humidity, 15.5);
      expect(gaoK.deductedWeight, 600);
      final gaoR = await bl.receiptById('pn_gao_v1');
      final gaoW2 = await bl.weighingTicketById(gaoR!.weighingTicketId);
      expect(gaoR.finalQuantity, (gaoW2!.netWeight) - gaoK.deductedWeight);
      final caK = insps.firstWhere((i) => i.productId == NongSanSeedData.caBasa);
      expect(caK.deductedWeight, 300);
    });

    test('§9.4 Phiếu nhập: Tổng = Tiền hàng + Phí vận chuyển + Bốc xếp + Sơ chế', () async {
      final receipts = await bl.receipts();
      expect(receipts.length, 2);
      final rGao = receipts.firstWhere((r) => r.id == 'pn_gao_v1');
      expect(rGao.totalAmount, 5000 * 17500);
      expect(rGao.grandTotal, 87500000 + 1000000 + 200000);
      expect(rGao.inputTax, (5000 * 17500) * 0.05);
      expect(rGao.status, 'POSTED');
      // Giá vốn phân bổ chi phí thu mua (§9.4)
      final lotGao = (await gaoLots())[0];
      expect(lotGao.costPrice, 88700000 / 5000);
      final rCa = receipts.firstWhere((r) => r.id == 'pn_ca_v1');
      expect(rCa.grandTotal, 52800000 + 300000 + 150000);
      final lotCa = (await calots())[0];
      expect(lotCa.costPrice, 53250000 / 1200);
    });

    test('§42/§53 Toàn bộ quy trình mua ghi trong cùng transaction', () async {
      final txs = await bl.stockTransactions();
      expect(txs.where((t) => t.type == 'IMPORT').length, 2);
      final journals = await bl.journals();
      expect(journals.where((j) => j.refType == 'PURCHASE').length, 2);
      // Công nợ 331 = Tiền hàng + Phí + Thuế GTGT (§14/§42)
      final mekong = (await bl.supplierById(NongSanSeedData.nccMekong))!;
      expect(mekong.debtAmount, (88700000 + 4375000) - 50000000);
      final biendong = (await bl.supplierById(NongSanSeedData.nccBiendong))!;
      expect(biendong.debtAmount, 53250000 + 2640000);
    });

    test('§43 Bán Gạo ST25 tiền mặt: hóa đơn đầy đủ + doanh thu + giá vốn', () async {
      final invoice = await bl.invoiceById('hd_gao_v1');
      expect(invoice, isNotNull);
      expect(invoice!.grossAmount, 2000 * 25000);
      expect(invoice.discount, 500000);
      expect(invoice.tax, (50000000 - 500000) * 0.08);
      expect(invoice.shippingFee, 0);
      expect(invoice.totalPayment, (50000000 - 500000) + 3960000);
      expect(invoice.paymentMethod, 'CASH');
      expect(invoice.status, 'POSTED');
      // Giá vốn FIFO từ lô gạo
      final issues = await bl.stockIssues();
      final gaoIssue = issues.firstWhere((i) => i.invoiceId == 'hd_gao_v1');
      expect(gaoIssue.quantity, 2000);
      expect(gaoIssue.unitCost, 17740);
      expect(gaoIssue.lineCost, 2000 * 17740);
      // Tồn lô sau bán
      final lots = await gaoLots();
      expect(lots.fold<double>(0, (s, l) => s + l.currentQuantity), 3000);
      // Khách hàng thanh toán ngay toàn bộ
      final sieuthi = (await bl.customerById(NongSanSeedData.khSieuthi))!;
      expect(sieuthi.totalSales, 53460000);
      expect(sieuthi.totalCollected, 53460000);
      expect(sieuthi.debtAmount, 0);
    });

    test('§43 Bán Cá basa ghi nợ: hóa đơn có phí vận chuyển + công nợ 131', () async {
      final invoice = await bl.invoiceById('hd_ca_v1');
      expect(invoice, isNotNull);
      expect(invoice!.grossAmount, 800 * 65000);
      expect(invoice.tax, 52000000 * 0.08);
      expect(invoice.shippingFee, 500000);
      expect(invoice.totalPayment, 52000000 + 4160000 + 500000);
      expect(invoice.paymentMethod, 'DEBT');
      expect(invoice.receivableAmount, invoice.totalPayment);
      final issues = await bl.stockIssues();
      final caIssue = issues.firstWhere((i) => i.invoiceId == 'hd_ca_v1');
      expect(caIssue.lineCost, 800 * 44375);
      final lots = await calots();
      expect(lots.fold<double>(0, (s, l) => s + l.currentQuantity), 400);
      final nhahang = (await bl.customerById(NongSanSeedData.khNhahang))!;
      expect(nhahang.totalSales, 56660000);
    });

    test('§15 Thu tiền khách hàng giảm công nợ + tổng thu tăng', () async {
      final nhahang = (await bl.customerById(NongSanSeedData.khNhahang))!;
      expect(nhahang.debtAmount, 56660000 - 30000000);
      expect(nhahang.totalCollected, 30000000);
      final pay = await bl.payments();
      expect(pay.where((p) => p.kind == 'CUSTOMER_RECEIPT').length, 1);
    });

    test('§16 Chi phí bán hàng + QLDN ghi nhận', () async {
      final expenses = await bl.expenses();
      expect(expenses.length, 2);
      expect(expenses.fold<double>(0, (s, e) => s + e.amount), 3200000);
      expect(expenses.any((e) => e.accountCode == '641'), isTrue);
      expect(expenses.any((e) => e.accountCode == '642'), isTrue);
    });

    test('§18 Bút toán tự động luôn cân bằng + số chứng từ tăng dần', () async {
      final journals = await bl.journalListing();
      expect(journals.length, 10);
      for (final j in journals) {
        expect(j.isBalanced, isTrue, reason: '${j.narration} không cân');
      }
      final numbers = journals.map((j) => j.entryNumber).toList();
      expect(numbers, orderedEquals(numbers.toList()..sort()));
      expect(numbers.toSet().length, numbers.length);
      expect(journals.map((j) => j.refType).toSet(),
          containsAll(['PURCHASE', 'SALE', 'COGS', 'RECEIPT', 'PAYMENT', 'EXPENSE']));
    });

    test('§19 Sổ cái các tài khoản đúng theo bút toán (156/133/331/131/511/333/632/111)',
        () async {
      final inv = await bl.generalLedger('156');
      expect(inv['balance'], (88700000 + 53250000) - (35480000 + 35500000));
      final vat = await bl.generalLedger('133');
      expect(vat['balance'], 4375000 + 2640000);
      final payable = await bl.generalLedger('331');
      expect(payable['credit'], 93075000 + 55890000);
      expect(payable['balance'], 50000000 - (93075000 + 55890000));
      final recv = await bl.generalLedger('131');
      expect(recv['balance'], 56660000 - 30000000);
      final rev = await bl.generalLedger('511');
      // Phí vận chuyển tính vào doanh thu (§12.4: phí thu thêm từ khách)
      expect(rev['balance'], -(49500000 + 52000000 + 500000));
      final outVat = await bl.generalLedger('333');
      expect(outVat['balance'], -(3960000 + 4160000));
      final cogs = await bl.generalLedger('632');
      expect(cogs['balance'], 35480000 + 35500000);
    });

    test('§44/§24 Báo cáo nhập-xuất-tồn: khóa đúng theo sản phẩm', () async {
      final report = await bl.inventoryReport();
      final gaoRow = report.firstWhere((r) => r['productId'] == NongSanSeedData.gaoSt25);
      expect(gaoRow['imported'], 5000);
      expect(gaoRow['exported'], -2000);
      expect(gaoRow['closing'], 3000);
      expect(gaoRow['unitCost'], 17740);
      expect(gaoRow['value'], 3000 * 17740);
      final caRow = report.firstWhere((r) => r['productId'] == NongSanSeedData.caBasa);
      expect(caRow['closing'], 400);
      expect(caRow['value'], 400 * 44375);
      final totalValue = report.fold<double>(0, (s, r) => s + (r['value'] as num));
      expect(totalValue, 3000 * 17740 + 400 * 44375);
    });

    test('§25 Báo cáo mua hàng theo NCC và sản phẩm', () async {
      final report = await bl.purchaseReport();
      expect(report['purchaseTotal'], (88700000 + 53250000).roundToDouble());
      expect(report['quantity'], 6200);
      expect(report['count'], 2);
      expect((report['bySupplier'] as Map<String, double>)[NongSanSeedData.nccMekong], 88700000);
      expect((report['bySupplier'] as Map<String, double>)[NongSanSeedData.nccBiendong], 53250000);
      final avg = (report['avgPrice'] as num).toDouble();
      expect(avg, closeTo(141950000 / 6200, 0.01));
    });

    test('§26 Báo cáo bán hàng: doanh thu, chiết khấu, thuế, giá vốn, lãi', () async {
      final report = await bl.salesReport();
      expect(report['grossRevenue'], 50000000 + 52000000);
      expect(report['discount'], 500000);
      expect(report['tax'], 3960000 + 4160000);
      expect(report['invoiceTotal'], 53460000 + 56660000);
      expect(report['refund'], 0);
      expect(report['netRevenue'], 110120000);
      expect(report['cogs'], 35480000 + 35500000);
      expect(report['profit'], 39140000);
      expect((report['byCustomer'] as Map<String, double>)[NongSanSeedData.khSieuthi], 53460000);
      expect((report['byCustomer'] as Map<String, double>)[NongSanSeedData.khNhahang], 56660000);
    });

    test('§22/§23 Báo cáo lãi/lỗ', () async {
      final pl = await bl.profitLoss();
      expect(pl['revenue'], 110120000);
      expect(pl['cogs'], 70980000);
      expect(pl['grossProfit'], 39140000);
      expect(pl['expense'], 3200000);
      expect(pl['operatingProfit'], 35940000);
    });

    test('§14/§15 Bảng tổng hợp công nợ nhà cung cấp và khách hàng', () async {
      final s = await bl.supplierDebtSummary(NongSanSeedData.nccMekong);
      expect(s['purchased'], 93075000);
      expect(s['paid'], 50000000);
      expect(s['closing'], 43075000);
      final c = await bl.customerDebtSummary(NongSanSeedData.khNhahang);
      expect(c['sales'], 56660000);
      expect(c['collected'], 30000000);
      expect(c['closing'], 26660000);
    });

    test('§34 Dashboard: công nợ phải thu/phải trả + giá trị tồn kho', () async {
      final dash = await bl.dashboardSummary();
      expect(dash['receivable'], 26660000);
      expect(dash['payable'], 93075000 + 55890000 - 50000000);
      expect(dash['inventoryValue'], 3000 * 17740 + 400 * 44375);
    });
  });

  group('Xử lý nghiệp vụ bổ sung theo đặc tả', () {
    test('§10/§44 Nhập thêm lô (FIFO): bán lấy theo giá vốn lô cũ trước', () async {
      await bl.receivePurchase(
        id: 'pn_gao_v2',
        supplierId: NongSanSeedData.nccMekong,
        productId: NongSanSeedData.gaoSt25,
        warehouseId: NongSanSeedData.khoKho,
        finalQuantity: 1000,
        unitPrice: 18000,
        shippingFee: 0,
        loadingFee: 0,
        vatRate: 0.05,
      );
      final lots = (await gaoLots())
        ..sort((a, b) => a.importDate.compareTo(b.importDate));
      expect(lots.length, 2);
      expect(lots[0].currentQuantity, 3000);
      expect(lots[0].costPrice, 17740);
      expect(lots[1].currentQuantity, 1000);
      expect(lots[1].costPrice, 18000);
      expect(await bl.availableStock(NongSanSeedData.gaoSt25), 4000);

      final issues = await bl.issueStock(
        productId: NongSanSeedData.gaoSt25,
        warehouseId: NongSanSeedData.khoKho,
        quantity: 3500,
        referenceId: 'test-xk-1',
        note: 'Xuất đa lô FIFO',
      );
      expect(issues.length, 2);
      expect(issues[0].quantity, 3000);
      expect(issues[0].unitCost, 17740);
      expect(issues[1].quantity, 500);
      expect(issues[1].unitCost, 18000);
      expect(issues.fold<double>(0, (s, i) => s + i.lineCost),
          3000 * 17740 + 500 * 18000);
      expect(await bl.availableStock(NongSanSeedData.gaoSt25), 500);
      expect(await bl.averageUnitCost(NongSanSeedData.gaoSt25), 18000);

      await expectLater(
        bl.issueStock(
          productId: NongSanSeedData.gaoSt25,
          warehouseId: NongSanSeedData.khoKho,
          quantity: 501,
          referenceId: 'test-xk-2',
        ),
        throwsA(isA<StateError>()),
      );
    });

    test('§10.2 Chuyển kho giữ nguyên giá vốn', () async {
      final source = (await gaoLots()).firstWhere((l) => l.costPrice == 18000);
      await bl.transferStock(
        lotId: source.id,
        toWarehouseId: NongSanSeedData.khoNguyenlieu,
        quantity: 200,
        note: 'Điều chuyển sang kho nguyên liệu',
      );
      final target = (await bl.lots())
          .firstWhere((l) => l.warehouseId == NongSanSeedData.khoNguyenlieu &&
              l.productId == NongSanSeedData.gaoSt25);
      expect(target.currentQuantity, 200);
      expect(target.costPrice, 18000);
      expect(await bl.availableStock(NongSanSeedData.gaoSt25, NongSanSeedData.khoNguyenlieu), 200);
      expect((await bl.stockTransfers()).length, 1);
      expect(
          await bl.availableStock(NongSanSeedData.gaoSt25, NongSanSeedData.khoKho), 300);
    });

    test('§10.2 Điều chỉnh kho (kiểm kê/haohụt) + chặn âm kho', () async {
      final source = (await gaoLots())
          .firstWhere((l) => l.costPrice == 18000 && l.warehouseId == NongSanSeedData.khoKho);
      final before = source.currentQuantity;
      await bl.adjustStock(
        lotId: source.id,
        quantityDelta: -50,
        reason: 'Hao hụt kiểm kê',
      );
      final after = (await bl.lotById(source.id))!;
      expect(after.currentQuantity, before - 50);
      final adjs = await bl.stockAdjustments();
      expect(adjs.length, 1);
      final tx = (await bl.stockTransactions())
          .where((t) => t.type == 'ADJUSTMENT')
          .toList();
      expect(tx.length, 1);
      expect(tx.first.quantity, -50);
      await expectLater(
        bl.adjustStock(lotId: source.id, quantityDelta: -999999, reason: 'Âm kho'),
        throwsA(isA<StateError>()),
      );
    });

    test('§13 Trả lại hàng bán: giảm công nợ, nhập lại kho, hoàn giá vốn', () async {
      final beforeList = await calots();
      final beforeQty =
          beforeList.fold<double>(0, (s, l) => s + l.currentQuantity);
      final beforeDebt =
          (await bl.customerById(NongSanSeedData.khNhahang))!.debtAmount;
      final beforeAvg = await bl.averageUnitCost(NongSanSeedData.caBasa);

      final ret = await bl.returnSale(
        id: 'tr_ca_v1',
        invoiceId: 'hd_ca_v1',
        quantity: 200,
        refundAmount: 200 * 65000,
        reason: 'Kém chất lượng',
      );
      expect(ret.status, 'POSTED');
      expect(ret.cogsRefund, 200 * beforeAvg);
      // Phải thu khách hàng giảm (§15)
      final afterDebt =
          (await bl.customerById(NongSanSeedData.khNhahang))!.debtAmount;
      expect(afterDebt, beforeDebt - 200 * 65000);
      // Nhập lại kho
      final afterQty = (await calots())
          .fold<double>(0, (s, l) => s + l.currentQuantity);
      expect(afterQty, beforeQty + 200);
      await expectLater(bl.invoiceById('hd_ca_v1'), isNotNull);
      // Báo cáo bán hàng phản ánh hoàn tiền
      final report = await bl.salesReport();
      expect(report['refund'], 200 * 65000);
      expect(report['netRevenue'], 110120000 - 200 * 65000);
    });

    test('§18.1 Không cho ghi bút toán không cân bằng', () async {
      await expectLater(
        bl.postJournalEntry(
          narration: 'Bút toán sai',
          lines: [
            NongSanJournalLine(
                accountCode: '111', accountName: 'Tiền mặt', debit: 100),
          ],
        ),
        throwsA(isA<StateError>()),
      );
      final ok = await bl.postJournalEntry(
        narration: 'Bút toán điều chỉnh',
        lines: [
          NongSanJournalLine(
              accountCode: '111', accountName: 'Tiền mặt', debit: 200),
          NongSanJournalLine(
              accountCode: '511', accountName: 'Doanh thu', credit: 200),
        ],
      );
      expect(ok.isBalanced, isTrue);
      expect((await bl.journalListing()).length, 14);
    });

    test('§48 Chỉ đơn bán PENDING được duyệt; chứng từ POSTED không xóa được', () async {
      await expectLater(
        bl.approveSalesOrder('so_gao_v1'),
        throwsA(isA<StateError>()),
      );
      await expectLater(
        bl.deleteDocument('NongSanSalesInvoice', 'hd_gao_v1'),
        throwsA(isA<StateError>()),
      );
      await expectLater(
        bl.deleteDocument('NongSanPurchaseReceipt', 'pn_gao_v1'),
        throwsA(isA<StateError>()),
      );
      // Chứng từ DRAFT thì xóa mềm được
      await bl.deleteDocument('NongSanPurchaseOrder', 'po_cp_draft');
      final pos = await bl.purchaseOrders();
      expect(pos.where((p) => p.id == 'po_cp_draft'), isEmpty);
    });
  });
}
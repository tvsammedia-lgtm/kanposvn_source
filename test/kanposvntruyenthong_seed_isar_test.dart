import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_product.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_partner.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_loyalty.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_order.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_stock.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_finance.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/models/tt_sync_model.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_isar_service.dart';
import 'package:kanposvn/modules/kanposvntruyenthong/services/tt_seed_data.dart';

void main() {
  late Isar isar;
  late Directory tempDir;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Isar.initializeIsarCore(download: true);

    tempDir = await Directory.systemTemp.createTemp('kanposvntruyenthong_test');
    isar = await Isar.open(
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
      directory: tempDir.path,
      inspector: true,
    );
  });

  tearDownAll(() async {
    try {
      await isar.close();
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('Seed dữ liệu mẫu kanposvntruyenthong đầy đủ', () async {
    // Seed dữ liệu nếu DB rỗng
    final seedService = TtIsarService.forIsar(isar);
    await TtSeedData.seedIfEmpty(seedService);

    // ===== 1. Kiểm tra danh mục =====
    final categories = await isar.ttCategorys.where().findAll();
    expect(categories.length, greaterThanOrEqualTo(7),
        reason: 'Phải có đủ 7 danh mục: Rau lá, Củ, Quả, Đậu, Gia vị, Nấm, Khác');

    // Kiểm tra các danh mục quan trọng
    final catNames = categories.map((c) => c.name).toSet();
    expect(catNames.contains('Rau lá'), isTrue, reason: 'Thiếu danh mục Rau lá');
    expect(catNames.contains('Củ'), isTrue, reason: 'Thiếu danh mục Củ');
    expect(catNames.contains('Quả'), isTrue, reason: 'Thiếu danh mục Quả');
    expect(catNames.contains('Đậu'), isTrue, reason: 'Thiếu danh mục Đậu');

    // ===== 2. Kiểm tra đơn vị tính =====
    final units = await isar.ttUnits.where().findAll();
    expect(units.length, greaterThanOrEqualTo(11),
        reason: 'Phải có đủ 11 đơn vị: kg, gram, bó, túi, quả, củ, thùng, bao, rổ, khay, cái');

    // Kiểm tra các đơn vị quan trọng
    final unitNames = units.map((u) => u.name).toSet();
    expect(unitNames.contains('kg'), isTrue, reason: 'Thiếu đơn vị kg');
    expect(unitNames.contains('gram'), isTrue, reason: 'Thiếu đơn vị gram');
    expect(unitNames.contains('bó'), isTrue, reason: 'Thiếu đơn vị bó');
    expect(unitNames.contains('túi'), isTrue, reason: 'Thiếu đơn vị túi');
    expect(unitNames.contains('quả'), isTrue, reason: 'Thiếu đơn vị quả');
    expect(unitNames.contains('củ'), isTrue, reason: 'Thiếu đơn vị củ');
    expect(unitNames.contains('cái'), isTrue, reason: 'Thiếu đơn vị cái');
    expect(unitNames.contains('thùng'), isTrue, reason: 'Thiếu đơn vị thùng');
    expect(unitNames.contains('bao'), isTrue, reason: 'Thiếu đơn vị bao');

    // Kiểm tra quy đổi
    final bao = units.firstWhere((u) => u.name == 'bao');
    expect(bao.conversionRate, equals(25), reason: '1 bao = 25 kg');

    // ===== 3. Kiểm tra sản phẩm =====
    final products = await isar.ttProducts.where().findAll();
    expect(products.length, greaterThanOrEqualTo(24),
        reason: 'Phải có đủ 24 mặt hàng rau củ quả');

    // Kiểm tra các sản phẩm quan trọng từ markdown
    final productNames = products.map((p) => p.name).toSet();
    final importantProducts = [
      'Cà chua', 'Cà tím', 'Dưa leo', 'Rau muống', 'Rau má',
      'Hành lá', 'Su hào', 'Cà rốt', 'Khoai lang', 'Khoai sọ',
      'Củ tỏi', 'Tỏi', 'Hành củ', 'Gừng', 'Ớt chuông', 'Đậu cô ve', 'Đậu đũa'
    ];
    for (final pName in importantProducts) {
      expect(productNames.contains(pName), isTrue,
          reason: 'Thiếu sản phẩm quan trọng: $pName');
    }

    // Kiểm tra thuộc tính sản phẩm
    final caChua = products.firstWhere((p) => p.name == 'Cà chua', orElse: () => throw 'Not found');
    expect(caChua.isPerishable, isTrue, reason: 'Cà chua nên là hàng dễ hư');
    expect(caChua.shelfLifeDays, greaterThan(0), reason: 'Cà chua nên có hạn sử dụng');
    expect(caChua.defaultPurchasePrice, greaterThan(0), reason: 'Cà chua nên có giá nhập');
    expect(caChua.defaultSalePrice, greaterThan(0), reason: 'Cà chua nên có giá bán');

    // Kiểm tra min/max stock
    final rauMa = products.firstWhere((p) => p.name == 'Rau má', orElse: () => throw 'Not found');
    expect(rauMa.minStock, greaterThan(0), reason: 'Rau má có minStock');
    expect(rauMa.maxStock, greaterThan(rauMa.minStock), reason: 'Rau má maxStock > minStock');

    // ===== 4. Kiểm tra khách hàng =====
    final customers = await isar.ttCustomers.where().findAll();
    expect(customers.length, greaterThanOrEqualTo(4),
        reason: 'Phải có đủ 4 khách hàng mẫu');

    // Kiểm tra các loại khách hàng
    final customerTypes = customers.map((c) => c.customerType).toSet();
    expect(customerTypes.contains(TtCustomerType.QUAN_AN), isTrue, reason: 'Thiếu Quán ăn');
    expect(customerTypes.contains(TtCustomerType.SI), isTrue, reason: 'Thiếu Khách sỉ');
    expect(customerTypes.contains(TtCustomerType.LO_LE), isTrue, reason: 'Thiếu Khách lẻ');

    // Kiểm tra công nợ khách hàng: currentDebt = openingDebt + totalPurchase - totalPayment
    final khachLan = customers.firstWhere((c) => c.code == 'KH001', orElse: () => throw 'Not found');
    expect(khachLan.customerType, equals(TtCustomerType.QUAN_AN), reason: 'KH001 là Quán ăn');
    for (final c in customers) {
      final expected = c.openingDebt + c.totalPurchase - c.totalPayment;
      expect(c.currentDebt, closeTo(expected, 0.001),
          reason: 'Công nợ ${c.code} phải = opening + mua - trả');
    }
    expect(customers.any((c) => c.currentDebt > 0), isTrue,
        reason: 'Phải có khách còn công nợ sau giao dịch mẫu');

    // ===== 5. Kiểm tra nhà cung cấp =====
    final suppliers = await isar.ttSuppliers.where().findAll();
    expect(suppliers.length, greaterThanOrEqualTo(3),
        reason: 'Phải có đủ 3 nhà cung cấp mẫu');

    // Kiểm tra công nợ NCC (>= 0 và có NCC còn nợ từ các phiếu nhập trả một phần)
    final vuaBinh = suppliers.firstWhere((s) => s.name == 'Vựa rau Bình Điền', orElse: () => throw 'Not found');
    expect(vuaBinh.currentDebt, greaterThanOrEqualTo(0), reason: 'Công nợ NCC không âm');
    expect(suppliers.any((s) => s.currentDebt > 0), isTrue,
        reason: 'Phải có NCC còn nợ sau các phiếu nhập trả một phần');

    // ===== 6. Kiểm tra quy tắc điểm thưởng =====
    final loyaltyRules = await isar.ttLoyaltyRules.where().findAll();
    expect(loyaltyRules.length, greaterThanOrEqualTo(1),
        reason: 'Phải có quy tắc điểm thưởng');
    final rule = loyaltyRules.first;
    expect(rule.ruleName, equals('Quy đổi 100.000đ = 1 điểm'),
        reason: 'Quy tắc điểm mặc định');
    expect(rule.amountPerPoint, equals(100000), reason: '100.000đ = 1 điểm');
    expect(rule.minimumInvoice, equals(50000), reason: 'Điều kiện tích điểm 50.000đ');

    // ===== 7. Kiểm tra chi tiêu =====
    final expenseCategories = await isar.ttExpenseCategorys.where().findAll();
    expect(expenseCategories.length, greaterThanOrEqualTo(11),
        reason: 'Phải có đủ 11 nhóm chi phí');

    final importantCategories = [
      'Nhập hàng', 'Vận chuyển', 'Thuê sạp', 'Điện', 'Nước',
      'Nhân công', 'Bao bì', 'Đá', 'Vệ sinh', 'Chi phí khác'
    ];
    for (final catName in importantCategories) {
      expect(expenseCategories.any((c) => c.name == catName), isTrue,
          reason: 'Thiếu nhóm chi phí: $catName');
    }

    // ===== 8. Kiểm tra tồn kho lô =====
    final stockLots = await isar.ttStockLots.where().findAll();
    expect(stockLots.length, greaterThanOrEqualTo(10),
        reason: 'Phải có ít nhất 10 lô hàng từ 10 phiếu nhập');

    // ===== 9. Kiểm tra Movimiento (stock movements) =====
    final stockMovements = await isar.ttStockMovements.where().findAll();
    expect(stockMovements.length, greaterThanOrEqualTo(50),
        reason: 'Phải có đủ stock movements (nhập + bán + hao hụt)');
    expect(stockMovements.any((m) => m.movementType == TtMovementType.WASTE), isTrue,
        reason: 'Phải có movement hao hụt (WASTE)');

    // ===== 9b. Phiếu thu, Sync & cảnh báo hạn =====
    final now = DateTime.now();
    final receipts = await isar.ttReceipts.where().findAll();
    expect(receipts.length, greaterThanOrEqualTo(4),
        reason: 'Phải có ít nhất 4 phiếu thu: 2 khách trả nợ + 1 trả NCC + 1 thu khác');
    expect(receipts.any((r) => r.type == TtReceiptType.CUSTOMER_PAYMENT), isTrue,
        reason: 'Phải có phiếu thu khách trả nợ');
    expect(receipts.any((r) => r.type == TtReceiptType.SUPPLIER_PAYMENT), isTrue,
        reason: 'Phải có phiếu thu trả nhà cung cấp');
    expect(receipts.any((r) => r.type == TtReceiptType.OTHER_INCOME), isTrue,
        reason: 'Phải có phiếu thu khác');

    final syncConfigs = await isar.ttSyncConfigs.where().findAll();
    expect(syncConfigs.length, greaterThanOrEqualTo(1), reason: 'Phải có SyncConfig');
    final syncQueues = await isar.ttSyncQueues.where().findAll();
    expect(syncQueues.length, greaterThanOrEqualTo(3),
        reason: 'Phải có ít nhất 3 SyncQueue');
    expect(syncQueues.any((q) => q.status == TtSyncStatus.PENDING), isTrue,
        reason: 'Phải có ít nhất 1 thao tác chờ đồng bộ (PENDING)');

    final aliveLots = stockLots.where((l) => l.quantityRemaining > 0).toList();
    expect(aliveLots.length, greaterThanOrEqualTo(2),
        reason: 'Cần ≥ 2 lô còn tồn để kiểm tra cảnh báo hạn');
    expect(aliveLots.any((l) => l.expiryDate != null && l.expiryDate!.isBefore(now)), isTrue,
        reason: 'Phải có lô đã quá hạn để báo cáo ExpiryRisk');
    expect(
        aliveLots.any((l) =>
            l.expiryDate != null &&
            !l.expiryDate!.isBefore(now) &&
            l.expiryDate!.difference(now).inDays <= 7),
        isTrue,
        reason: 'Phải có lô sắp hết hạn trong 7 ngày');

    // ===== 10. Kiểm tra idempotency =====
    // Seed lại không làm tăng dữ liệu
    await TtSeedData.seedIfEmpty(seedService);
    expect(await isar.ttProducts.count(), products.length);
    expect(await isar.ttCustomers.count(), customers.length);
    expect(await isar.ttSuppliers.count(), suppliers.length);
    expect(await isar.ttLoyaltyRules.count(), loyaltyRules.length);
    expect(await isar.ttExpenseCategorys.count(), expenseCategories.length);

    // ===== 11. Kiểm tra báo cáo dashboard =====
    final dashboardSales = await isar.ttSalesInvoices.where().findAll();
    // Doanh thu không âm
    for (final s in dashboardSales) {
      if (s.status != TtSaleStatus.CANCELLED) {
        expect(s.totalAmount, greaterThanOrEqualTo(0),
            reason: 'Doanh thu không âm');
        expect(s.totalAmount, greaterThanOrEqualTo(s.paidAmount),
            reason: 'Đã thu <= Tổng tiền');
      }
    }

    print('=== TỔNG KẾT TEST KANPOSVNTRUYENTHONG ===');
    print('Danh mục: ${categories.length}');
    print('Đơn vị: ${units.length}');
    print('Sản phẩm: ${products.length}');
    print('Khách hàng: ${customers.length}');
    print('Nhà cung cấp: ${suppliers.length}');
    print('Quy tắc điểm: ${loyaltyRules.length}');
    print('Nhóm chi phí: ${expenseCategories.length}');
    print('Lô hàng: ${stockLots.length}');
    print('Movement: ${stockMovements.length}');
    print('===============================');
  });
}
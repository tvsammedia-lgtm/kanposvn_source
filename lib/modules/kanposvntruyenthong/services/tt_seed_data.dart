import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_product.dart';
import '../models/tt_partner.dart';
import '../models/tt_loyalty.dart';
import '../models/tt_finance.dart';
import 'tt_isar_service.dart';

/// Seed dữ liệu KanPosVN Truyền Thống (Sạp Rau Củ Quả): danh mục, đơn vị tính,
/// mặt hàng rau củ quả, khách hàng, nhà cung cấp, quy tắc điểm thưởng, nhóm chi phí.
class TtSeedData {
  static Future<void> seedIfEmpty(TtIsarService isarService) async {
    final db = await isarService.db;
    final categoryCount = await db.ttCategorys.count();
    if (categoryCount > 0) return;
    final uuid = const Uuid();

    // ----------------------------------------------------------------
    // 1. Danh mục
    // ----------------------------------------------------------------
    final cats = [
      TtCategory()..categoryId = uuid.v4()..name = 'Rau lá',
      TtCategory()..categoryId = uuid.v4()..name = 'Củ',
      TtCategory()..categoryId = uuid.v4()..name = 'Quả',
      TtCategory()..categoryId = uuid.v4()..name = 'Đậu',
      TtCategory()..categoryId = uuid.v4()..name = 'Gia vị',
      TtCategory()..categoryId = uuid.v4()..name = 'Nấm',
      TtCategory()..categoryId = uuid.v4()..name = 'Khác',
    ];
    await db.writeTxn(() async {
      await db.ttCategorys.putAll(cats);
    });

    final savedCats = await db.ttCategorys.where().findAll();
    final cRauLa = savedCats.firstWhere((c) => c.name == 'Rau lá');
    final cCu = savedCats.firstWhere((c) => c.name == 'Củ');
    final cQua = savedCats.firstWhere((c) => c.name == 'Quả');
final cDau = savedCats.firstWhere((c) => c.name == 'Đậu');
    final cNam = savedCats.firstWhere((c) => c.name == 'Nấm');

    // ----------------------------------------------------------------
    // 2. Đơn vị tính + quy đổi
    // ----------------------------------------------------------------
    final units = [
      TtUnit()..unitId = uuid.v4()..name = 'kg'..conversionRate = 1..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'gram'..conversionRate = 0.001..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'bó'..conversionRate = 0.5..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'túi'..conversionRate = 1..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'quả'..conversionRate = 0.1..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'củ'..conversionRate = 0.2..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'thùng'..conversionRate = 10..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'bao'..conversionRate = 25..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'rổ'..conversionRate = 8..baseUnit = 'kg',
      TtUnit()..unitId = uuid.v4()..name = 'khay'..conversionRate = 3..baseUnit = 'kg',
    ];
    await db.ttUnits.putAll(units);

    // ----------------------------------------------------------------
    // 3. Mặt hàng rau củ quả (giá theo chợ truyền thống)
    // ----------------------------------------------------------------
    TtProduct p(String name, TtCategory cat, double buy, double sell,
        {String unit = 'kg', int shelfDays = 3, double minStock = 5}) {
      return TtProduct()
        ..productId = uuid.v4()
        ..sku = 'RC${name.hashCode.abs()}'.substring(0, 8)
        ..name = name
        ..category.value = cat
        ..baseUnit = unit
        ..purchaseUnit = unit
        ..saleUnit = unit
        ..defaultPurchasePrice = buy
        ..defaultSalePrice = sell
        ..minStock = minStock
        ..maxStock = minStock * 8
        ..reorderLevel = minStock * 2
        ..shelfLifeDays = shelfDays
        ..isPerishable = true;
    }

    final products = <TtProduct>[
      p('Cải xanh', cRauLa, 8000, 12000, shelfDays: 3, minStock: 10),
      p('Cải ngọt', cRauLa, 9000, 14000, shelfDays: 3, minStock: 10),
      p('Cải thìa', cRauLa, 10000, 15000, shelfDays: 3, minStock: 8),
      p('Bắp cải', cRauLa, 12000, 18000, shelfDays: 7, minStock: 10),
      p('Rau muống', cRauLa, 8000, 12000, shelfDays: 2, minStock: 10),
      p('Rau má', cRauLa, 15000, 25000, shelfDays: 2, minStock: 3),
      p('Hành lá', cRauLa, 15000, 25000, shelfDays: 2, minStock: 3),
      p('Su hào', cCu, 10000, 15000, shelfDays: 10, minStock: 8),
      p('Cà rốt', cCu, 15000, 22000, shelfDays: 14, minStock: 8),
      p('Khoai lang', cCu, 18000, 26000, shelfDays: 30, minStock: 15),
      p('Khoai sọ', cCu, 22000, 32000, shelfDays: 30, minStock: 10),
      p('Củ tỏi', cCu, 40000, 55000, shelfDays: 60, minStock: 3),
      p('Gừng', cCu, 25000, 36000, shelfDays: 30, minStock: 3),
      p('Cà chua', cQua, 15000, 25000, shelfDays: 5, minStock: 10),
      p('Cà tím', cQua, 12000, 18000, shelfDays: 5, minStock: 5),
      p('Dưa leo', cQua, 13000, 20000, shelfDays: 5, minStock: 8),
      p('Ớt chuông', cQua, 28000, 40000, shelfDays: 7, minStock: 3),
      p('Đậu cô ve', cDau, 22000, 32000, shelfDays: 5, minStock: 5),
      p('Đậu đũa', cDau, 25000, 35000, shelfDays: 4, minStock: 5),
      p('Nấm rơm', cNam, 55000, 75000, shelfDays: 2, minStock: 2),
      p('Bí đỏ', cQua, 15000, 22000, shelfDays: 21, minStock: 8),
      p('Chanh', cQua, 12000, 18000, shelfDays: 14, minStock: 3),
    ];
    await db.writeTxn(() async {
      await db.ttProducts.putAll(products);
    });

    // ----------------------------------------------------------------
    // 4. Khách hàng
    // ----------------------------------------------------------------
    final customers = [
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH001'
        ..name = 'Chị Lan - Quán Ăn'
        ..phone = '0901000111'
        ..customerType = TtCustomerType.QUAN_AN
        ..currentDebt = 120000,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH002'
        ..name = 'Anh Tuấn - Nhà Hàng'
        ..phone = '0901000222'
        ..customerType = TtCustomerType.NHA_HANG
        ..currentDebt = 350000,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH003'
        ..name = 'Chú Ba - Khách Sỉ'
        ..phone = '0901000333'
        ..customerType = TtCustomerType.SI
        ..currentDebt = 0,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH004'
        ..name = 'Khách lẻ'
        ..customerType = TtCustomerType.LO_LE
        ..currentDebt = 0,
    ];
    await db.ttCustomers.putAll(customers);

    // ----------------------------------------------------------------
    // 5. Nhà cung cấp
    // ----------------------------------------------------------------
    final suppliers = [
      TtSupplier()..supplierId = uuid.v4()..name = 'Vựa rau Bình Điền'..contactPerson = 'Chú Tư'..phone = '0911111111',
      TtSupplier()..supplierId = uuid.v4()..name = 'Hợp tác xã Củ Quả Lâm Đồng'..contactPerson = 'Anh Hùng'..phone = '0912222222',
      TtSupplier()..supplierId = uuid.v4()..name = 'Vựa nấm Xuân Thới'..contactPerson = 'Cô Mai'..phone = '0913333333',
    ];
    await db.ttSuppliers.putAll(suppliers);

    // ----------------------------------------------------------------
    // 6. Quy tắc điểm thưởng
    // ----------------------------------------------------------------
    await db.ttLoyaltyRules.put(TtLoyaltyRule()
      ..ruleId = uuid.v4()
      ..ruleName = 'Quy đổi 100.000đ = 1 điểm'
      ..amountPerPoint = 100000
      ..pointPerAmount = 100000
      ..minimumInvoice = 50000
      ..isActive = true);

    // ----------------------------------------------------------------
    // 7. Nhóm chi phí
    // ----------------------------------------------------------------
    final expCats = [
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Nhập hàng',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Vận chuyển',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Thuê sạp',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Điện',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Nước',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Nhân công',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Bao bì',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Đá',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Vệ sinh',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Hao hụt/hư hỏng',
      TtExpenseCategory()..categoryId = uuid.v4()..name = 'Chi phí khác',
    ];
    await db.ttExpenseCategorys.putAll(expCats);
  }
}

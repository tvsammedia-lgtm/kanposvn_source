import 'dart:math';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_product.dart';
import '../models/tt_partner.dart';
import '../models/tt_loyalty.dart';
import '../models/tt_finance.dart';
import '../models/tt_order.dart';
import '../models/tt_stock.dart';
import '../models/tt_sync_model.dart';
import 'tt_isar_service.dart';

/// Seed dữ liệu KanPosVN Truyền Thống (Sạp Rau Củ Quả): danh mục, đơn vị tính,
/// mặt hàng, khách hàng, nhà cung cấp, quy tắc, chi phí, và các giao dịch mẫu
/// (nhập, bán, thu/chi, hao hụt, phiếu thu công nợ, dữ liệu đồng bộ).
///
/// Dữ liệu mẫu được sinh **ổn định** (Random seed cố định) để test lặp lại được,
/// và luôn giữ nhất quán kế toán:
/// - Công nợ khách = openingDebt + Σ(debtAmount bán) - Σ(phiếu thu khách)
/// - Công nợ NCC = openingDebt + Σ(debtAmount nhập) - Σ(phiếu chi cho NCC)
/// - Điểm thưởng = Σ(EARN) - Σ(REDEEM) ... (qua LoyaltyTransaction)
/// - Tồn kho hình thành từ StockMovement / StockLot.
class TtSeedData {
  static Future<void> seedIfEmpty(TtIsarService isarService) async {
    final db = await isarService.db;
    final categoryCount = await db.ttCategorys.count();

    // Nếu chưa có danh mục thì seed dữ liệu cơ bản
    if (categoryCount == 0) {
      await _seedBaseData(db);
    }

    // Nếu chưa có hoá đơn bán hàng nào, thì seed giao dịch mẫu
    final salesCount = await db.ttSalesInvoices.count();
    if (salesCount == 0) {
      await _seedMockTransactions(db);
    }
  }

  static Future<void> _seedBaseData(Isar db) async {
    final uuid = const Uuid();

    // 1. Danh mục
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

    // 2. Đơn vị tính + quy đổi (kg, gram, bó, túi, quả, củ, thùng, bao, rổ, khay, cái)
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
      TtUnit()..unitId = uuid.v4()..name = 'cái'..conversionRate = 0.2..baseUnit = 'kg',
    ];
    await db.writeTxn(() async {
      await db.ttUnits.putAll(units);
    });

    // 3. Mặt hàng rau củ quả
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
        ..isPerishable = true
        ..isActive = true
        ..createdAt = DateTime.now();
    }

    final products = <TtProduct>[
      p('Cải xanh', cRauLa, 8000, 12000, shelfDays: 3, minStock: 10),
      p('Cải ngọt', cRauLa, 9000, 14000, shelfDays: 3, minStock: 10),
      p('Cải thìa', cRauLa, 10000, 15000, shelfDays: 3, minStock: 8),
      p('Bắp cải', cRauLa, 12000, 18000, shelfDays: 7, minStock: 10),
      p('Rau muống', cRauLa, 8000, 12000, shelfDays: 2, minStock: 10),
      p('Rau má', cRauLa, 15000, 25000, shelfDays: 2, minStock: 3),
      p('Hành lá', cRauLa, 15000, 25000, shelfDays: 2, minStock: 3),
      p('Hành củ', cCu, 20000, 30000, shelfDays: 20, minStock: 3),
      p('Su hào', cCu, 10000, 15000, shelfDays: 10, minStock: 8),
      p('Cà rốt', cCu, 15000, 22000, shelfDays: 14, minStock: 8),
      p('Khoai lang', cCu, 18000, 26000, shelfDays: 30, minStock: 15),
      p('Khoai sọ', cCu, 22000, 32000, shelfDays: 30, minStock: 10),
      p('Củ tỏi', cCu, 40000, 55000, shelfDays: 60, minStock: 3),
      p('Tỏi', cCu, 30000, 45000, shelfDays: 60, minStock: 3),
      p('Gừng', cCu, 25000, 36000, shelfDays: 30, minStock: 3),
      p('Cà chua', cQua, 15000, 25000, shelfDays: 5, minStock: 10),
      p('Cà tím', cQua, 12000, 18000, shelfDays: 5, minStock: 5),
      p('Dưa leo', cQua, 13000, 20000, shelfDays: 5, minStock: 8),
      p('Ớt chuông', cQua, 28000, 40000, shelfDays: 7, minStock: 3),
      p('Bí đỏ', cQua, 15000, 22000, shelfDays: 21, minStock: 8),
      p('Chanh', cQua, 12000, 18000, shelfDays: 14, minStock: 3),
      p('Đậu cô ve', cDau, 22000, 32000, shelfDays: 5, minStock: 5),
      p('Đậu đũa', cDau, 25000, 35000, shelfDays: 4, minStock: 5),
      p('Nấm rơm', cNam, 55000, 75000, shelfDays: 2, minStock: 2),
    ];
    await db.writeTxn(() async {
      await db.ttProducts.putAll(products);
    });

    // 4. Khách hàng
    final customers = [
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH001'
        ..name = 'Chị Lan - Quán Ăn'
        ..phone = '0901000111'
        ..address = 'Chợ Bình Điền'
        ..customerType = TtCustomerType.QUAN_AN
        ..openingDebt = 0
        ..currentDebt = 0,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH002'
        ..name = 'Anh Tuấn - Nhà Hàng'
        ..phone = '0901000222'
        ..customerType = TtCustomerType.NHA_HANG
        ..openingDebt = 0
        ..currentDebt = 0,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH003'
        ..name = 'Chú Ba - Khách Sỉ'
        ..phone = '0901000333'
        ..customerType = TtCustomerType.SI
        ..openingDebt = 0
        ..currentDebt = 0,
      TtCustomer()
        ..customerId = uuid.v4()
        ..code = 'KH004'
        ..name = 'Khách lẻ'
        ..customerType = TtCustomerType.LO_LE
        ..openingDebt = 0
        ..currentDebt = 0,
    ];
    await db.writeTxn(() async {
      await db.ttCustomers.putAll(customers);
    });

    // 5. Nhà cung cấp
    final suppliers = [
      TtSupplier()..supplierId = uuid.v4()..name = 'Vựa rau Bình Điền'..contactPerson = 'Chú Tư'..phone = '0911111111',
      TtSupplier()..supplierId = uuid.v4()..name = 'Hợp tác xã Củ Quả Lâm Đồng'..contactPerson = 'Anh Hùng'..phone = '0912222222',
      TtSupplier()..supplierId = uuid.v4()..name = 'Vựa nấm Xuân Thới'..contactPerson = 'Cô Mai'..phone = '0913333333',
    ];
    await db.writeTxn(() async {
      await db.ttSuppliers.putAll(suppliers);
    });

    // 6. Quy tắc điểm thưởng (100.000đ = 1 điểm, 1 điểm = 1.000đ)
    await db.writeTxn(() async {
      await db.ttLoyaltyRules.put(TtLoyaltyRule()
        ..ruleId = uuid.v4()
        ..ruleName = 'Quy đổi 100.000đ = 1 điểm'
        ..amountPerPoint = 100000
        ..pointPerAmount = 100000
        ..minimumInvoice = 50000
        ..isActive = true);
    });

    // 7. Nhóm chi phí
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
    await db.writeTxn(() async {
      await db.ttExpenseCategorys.putAll(expCats);
    });
  }

  static Future<void> _seedMockTransactions(Isar db) async {
    final uuid = const Uuid();
    final random = Random(42);

    // Lấy dữ liệu cơ sở
    final products = await db.ttProducts.where().findAll();
    final suppliers = await db.ttSuppliers.where().findAll();
    final customers = await db.ttCustomers.where().findAll();
    final expCats = await db.ttExpenseCategorys.where().findAll();

    if (products.isEmpty || suppliers.isEmpty || customers.isEmpty) return;

    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final daysAvail = now.day < 1 ? 1 : now.day;
    DateTime dayInMonth(int i) =>
        startOfMonth.add(Duration(days: i % daysAvail, hours: 6 + (i % 6)));

    await db.writeTxn(() async {
      // =====================================================================
      // 1. NHẬP HÀNG (Purchase Invoices) - 10 phiếu, một số thanh toán một phần
      //    để tạo công nợ nhà cung cấp.
      // =====================================================================
      int purchaseCount = 1;
      for (int i = 0; i < 10; i++) {
        final date = dayInMonth(i);
        final supplier = suppliers[random.nextInt(suppliers.length)];

        final pInv = TtPurchaseInvoice()
          ..purchaseId = uuid.v4()
          ..invoiceNumber = 'PNB${purchaseCount.toString().padLeft(3, '0')}'
          ..supplier.value = supplier
          ..purchaseDate = date
          ..paymentMethod = random.nextBool() ? TtPaymentMethod.CASH : TtPaymentMethod.TRANSFER
          ..createdBy = 'Admin';

        double totalAmt = 0;
        final pItems = <TtPurchaseItem>[];
        final sLots = <TtStockLot>[];
        final sMovements = <TtStockMovement>[];

        final numItems = random.nextInt(6) + 5;
        final selectedProducts = products.toList()..shuffle(random);

        for (int j = 0; j < numItems && j < selectedProducts.length; j++) {
          final prod = selectedProducts[j];
          final qty = (random.nextInt(40) + 10).toDouble(); // 10 -> 50 kg
          final price = prod.defaultPurchasePrice;
          final amount = qty * price;
          totalAmt += amount;

          // Tạo lô - hạn sử dụng = ngày nhập + shelfLifeDays
          final lot = TtStockLot()
            ..lotId = uuid.v4()
            ..product.value = prod
            ..supplier.value = supplier
            ..lotNumber = 'LOT${date.millisecondsSinceEpoch.toString().substring(5)}'
            ..purchaseDate = date
            ..expiryDate = date.add(Duration(days: prod.shelfLifeDays))
            ..quantityIn = qty
            ..quantityOut = 0
            ..quantityRemaining = qty
            ..unitCost = price;
          sLots.add(lot);

          final item = TtPurchaseItem()
            ..purchaseInvoice.value = pInv
            ..product.value = prod
            ..lot.value = lot
            ..quantity = qty
            ..unit = prod.baseUnit
            ..unitPrice = price
            ..amount = amount
            ..expiryDate = lot.expiryDate;
          pItems.add(item);

          // Biến động tồn kho (PURCHASE)
          sMovements.add(TtStockMovement()
            ..movementId = uuid.v4()
            ..product.value = prod
            ..lot.value = lot
            ..movementType = TtMovementType.PURCHASE
            ..referenceId = pInv.invoiceNumber
            ..quantity = qty
            ..unitCost = price
            ..totalCost = amount
            ..createdAt = date);
        }

        // Cứ 3 phiếu thì 1 phiếu trả một phần 50% -> công nợ NCC
        final paidRatio = i % 3 == 0 ? 0.5 : 1.0;
        pInv.totalAmount = totalAmt;
        pInv.paidAmount = totalAmt * paidRatio;
        pInv.debtAmount = totalAmt - pInv.paidAmount;

        await db.ttPurchaseInvoices.put(pInv);
        await pInv.supplier.save();
        await db.ttStockLots.putAll(sLots);
        for (final lot in sLots) {
          await lot.product.save();
          await lot.supplier.save();
        }
        supplier.currentDebt += pInv.debtAmount;
        await db.ttSuppliers.put(supplier);
        await db.ttPurchaseItems.putAll(pItems);
        for (final item in pItems) {
          await item.purchaseInvoice.save();
          await item.product.save();
          await item.lot.save();
        }
        await db.ttStockMovements.putAll(sMovements);
        for (final mov in sMovements) {
          await mov.product.save();
          await mov.lot.save();
        }
        purchaseCount++;
      }

      // =====================================================================
      // 2. BÁN HÀNG (Sales Invoices) - 30 hóa đơn, một số ghi công nợ 70%.
      //    Tồn giảm theo FIFO, giá vốn ghi theo lô, tích điểm cho khách quen.
      // =====================================================================
      int salesCount = 1;
      for (int i = 0; i < 30; i++) {
        final date = dayInMonth(i);
        final customer = customers[random.nextInt(customers.length)];

        final isDebtSale = i == 2 || i % 5 == 3;
        final sInv = TtSalesInvoice()
          ..invoiceId = uuid.v4()
          ..invoiceNumber = 'HDB${salesCount.toString().padLeft(3, '0')}'
          ..customer.value = customer
          ..saleDate = date
          ..paymentMethod = isDebtSale
              ? TtPaymentMethod.DEBT
              : (random.nextBool() ? TtPaymentMethod.CASH : TtPaymentMethod.TRANSFER)
          ..status = TtSaleStatus.COMPLETED
          ..createdBy = 'Admin';

        double totalAmt = 0;
        double totalCost = 0;
        final sItems = <TtSalesItem>[];
        final sMovements = <TtStockMovement>[];

        final numItems = random.nextInt(4) + 1;
        final selectedProducts = products.toList()..shuffle(random);

        for (int j = 0; j < numItems && j < selectedProducts.length; j++) {
          final prod = selectedProducts[j];
          final qty = (random.nextInt(5) + 1).toDouble(); // Bán 1 -> 5 kg
          final price = prod.defaultSalePrice;

          // Lấy lô cũ nhất còn tồn để bán (FIFO)
          final lots = await db.ttStockLots.filter()
              .product((q) => q.productIdEqualTo(prod.productId))
              .quantityRemainingGreaterThan(0)
              .sortByPurchaseDate()
              .findAll();

          if (lots.isEmpty) continue;

          final lot = lots.first;
          final sellQty = qty <= lot.quantityRemaining ? qty : lot.quantityRemaining;
          final amount = sellQty * price;
          final costAmount = sellQty * lot.unitCost;

          totalAmt += amount;
          totalCost += costAmount;

          lot.quantityOut += sellQty;
          lot.quantityRemaining -= sellQty;
          await db.ttStockLots.put(lot);

          final item = TtSalesItem()
            ..invoice.value = sInv
            ..product.value = prod
            ..lotId = lot.lotId
            ..quantity = sellQty
            ..unit = prod.baseUnit
            ..unitPrice = price
            ..costPrice = lot.unitCost
            ..amount = amount;
          sItems.add(item);

          sMovements.add(TtStockMovement()
            ..movementId = uuid.v4()
            ..product.value = prod
            ..lot.value = lot
            ..movementType = TtMovementType.SALE
            ..referenceId = sInv.invoiceNumber
            ..quantity = -sellQty
            ..unitCost = lot.unitCost
            ..totalCost = costAmount
            ..createdAt = date);
        }

        if (totalAmt <= 0) continue;

        final paid = isDebtSale ? totalAmt * 0.3 : totalAmt;
        sInv.subtotal = totalAmt;
        sInv.totalAmount = totalAmt;
        sInv.paidAmount = paid;
        sInv.debtAmount = totalAmt - paid;
        sInv.costAmount = totalCost;
        sInv.status = isDebtSale ? TtSaleStatus.DEBT : TtSaleStatus.COMPLETED;

        await db.ttSalesInvoices.put(sInv);
        await sInv.customer.save();
        await db.ttSalesItems.putAll(sItems);
        for (final item in sItems) {
          await item.invoice.save();
          await item.product.save();
        }
        await db.ttStockMovements.putAll(sMovements);
        for (final mov in sMovements) {
          await mov.product.save();
          await mov.lot.save();
        }
        salesCount++;

        // Cập nhật công nợ + tích điểm khách hàng (giữ nhất quán kế toán)
        customer.totalPurchase += sInv.totalAmount;
        customer.totalPayment += sInv.paidAmount;
        customer.currentDebt += sInv.debtAmount;
        if (customer.customerType != TtCustomerType.LO_LE) {
          final points = (totalAmt / 100000).floor().toDouble();
          if (points > 0) {
            customer.loyaltyPoint += points;
            final lTxn = TtLoyaltyTransaction()
              ..loyaltyTxId = uuid.v4()
              ..customer.value = customer
              ..invoiceId = sInv.invoiceId
              ..type = TtLoyaltyType.EARN
              ..points = points
              ..balanceAfter = customer.loyaltyPoint
              ..description = 'Tích điểm đơn ${sInv.invoiceNumber}'
              ..createdAt = date;
            await db.ttLoyaltyTransactions.put(lTxn);
            await lTxn.customer.save();
          }
        }
        await db.ttCustomers.put(customer);
      }

      // =====================================================================
      // 3. CHI PHÍ (Expenses) - 6 phiếu chi, đảm bảo có nhóm Hao hụt/hư hỏng.
      // =====================================================================
      for (int i = 0; i < 6; i++) {
        final date = dayInMonth(i);
        final cat = i == 5
            ? expCats.firstWhere((c) => c.name == 'Hao hụt/hư hỏng', orElse: () => expCats.last)
            : expCats[random.nextInt(expCats.length)];
        final exp = TtExpense()
          ..expenseId = uuid.v4()
          ..expenseNumber = 'PC${(i + 1).toString().padLeft(3, '0')}'
          ..category.value = cat
          ..amount = (random.nextInt(50) + 10) * 10000.0 // 100k -> 590k
          ..paymentMethod = 'Tiền mặt'
          ..date = date
          ..description = 'Chi phí ${cat.name}'
          ..createdBy = 'Admin';

        await db.ttExpenses.put(exp);
        await exp.category.save();
      }

      // =====================================================================
      // 4. PHIẾU THU (Receipts) - khách trả nợ, trả nhà cung cấp, thu khác.
      //    Làm giảm công nợ tương ứng (giữ nhất quán).
      // =====================================================================
      int ptNo = 1;
      for (final c in customers) {
        if (c.currentDebt <= 0 || ptNo > 2) continue;
        final amount = c.currentDebt * 0.4;
        final receipt = TtReceipt()
          ..receiptId = uuid.v4()
          ..receiptNumber = 'PT${ptNo.toString().padLeft(3, '0')}'
          ..customer.value = c
          ..type = TtReceiptType.CUSTOMER_PAYMENT
          ..amount = amount
          ..paymentMethod = 'Tiền mặt'
          ..date = dayInMonth(1)
          ..note = 'Khách trả nợ'
          ..createdBy = 'Admin';
        await db.ttReceipts.put(receipt);
        await receipt.customer.save();
        c.currentDebt -= amount;
        c.totalPayment += amount;
        await db.ttCustomers.put(c);
        ptNo++;
      }
      for (final s in suppliers) {
        if (s.currentDebt <= 0) break;
        final amount = s.currentDebt * 0.3;
        final receipt = TtReceipt()
          ..receiptId = uuid.v4()
          ..receiptNumber = 'PT${ptNo.toString().padLeft(3, '0')}'
          ..supplier.value = s
          ..type = TtReceiptType.SUPPLIER_PAYMENT
          ..amount = amount
          ..paymentMethod = 'Chuyển khoản'
          ..date = dayInMonth(2)
          ..note = 'Thanh toán nhà cung cấp'
          ..createdBy = 'Admin';
        await db.ttReceipts.put(receipt);
        await receipt.supplier.save();
        s.currentDebt -= amount;
        await db.ttSuppliers.put(s);
        ptNo++;
        break;
      }
      final otherReceipt = TtReceipt()
        ..receiptId = uuid.v4()
        ..receiptNumber = 'PT${ptNo.toString().padLeft(3, '0')}'
        ..type = TtReceiptType.OTHER_INCOME
        ..amount = 80000
        ..paymentMethod = 'Tiền mặt'
        ..date = dayInMonth(3)
        ..note = 'Thu tiền thùng/bao'
        ..createdBy = 'Admin';
      await db.ttReceipts.put(otherReceipt);
    });

    // =====================================================================
    // 5. HAO HỤT HƯ HỎNG (Stock Issues) - chuyển một số lô còn tồn thành hao hụt.
    // =====================================================================
    final lotsToWaste = await db.ttStockLots.filter().quantityRemainingGreaterThan(5).findAll();
    for (final lot in lotsToWaste.take(3)) {
      await lot.product.load();
    }
    await db.writeTxn(() async {
      for (int i = 0; i < 3 && i < lotsToWaste.length; i++) {
        final lot = lotsToWaste[i];
        final date = dayInMonth(i + 4);

        final wasteQty = 2.0;
        final totalCost = wasteQty * lot.unitCost;

        lot.quantityOut += wasteQty;
        lot.quantityRemaining -= wasteQty;
        await db.ttStockLots.put(lot);

        final issue = TtStockIssue()
          ..issueId = uuid.v4()
          ..issueNumber = 'XK${(i + 1).toString().padLeft(3, '0')}'
          ..issueType = TtIssueType.WASTE
          ..date = date
          ..note = 'Hao hụt tự nhiên'
          ..totalCost = totalCost
          ..createdBy = 'Admin';
        await db.ttStockIssues.put(issue);

        final movement = TtStockMovement()
          ..movementId = uuid.v4()
          ..product.value = lot.product.value
          ..lot.value = lot
          ..movementType = TtMovementType.WASTE
          ..referenceId = issue.issueNumber
          ..quantity = -wasteQty
          ..unitCost = lot.unitCost
          ..totalCost = totalCost
          ..createdAt = date;
        await db.ttStockMovements.put(movement);
        await movement.product.save();
        await movement.lot.save();
      }
    });

    // =====================================================================
    // 6. CẢNH BÁO HẠN SỬ DỤNG + DỮ LIỆU ĐỒNG BỘ
    //    Đảm bảo có ít nhất 1 lô đã hết hạn và 1 lô sắp hết hạn còn tồn,
    //    plus SyncConfig / SyncQueue biểu trưng cho trạng thái đồng bộ.
    // =====================================================================
    final aliveLots = await db.ttStockLots.filter().quantityRemainingGreaterThan(0).findAll();
    await db.writeTxn(() async {
      if (aliveLots.isNotEmpty) {
        final expiredLot = aliveLots[0];
        expiredLot.expiryDate = now.subtract(const Duration(days: 1));
        await db.ttStockLots.put(expiredLot);
        if (aliveLots.length > 1) {
          final soonLot = aliveLots[1];
          soonLot.expiryDate = now.add(const Duration(days: 2));
          await db.ttStockLots.put(soonLot);
        }
      }

      await db.ttSyncConfigs.put(TtSyncConfig()
        ..lastSyncToken = 'seed-last-token'
        ..lastSyncTime = now.subtract(const Duration(hours: 1)));

      Future<void> queueOp(
        String entityType, String entityId, TtSyncOperation op, TtSyncStatus status) async {
        final q = TtSyncQueue()
          ..operationId = uuid.v4()
          ..entityType = entityType
          ..entityId = entityId
          ..operation = op
          ..payload = '{}'
          ..createdAt = now
          ..retryCount = 0
          ..status = status;
        await db.ttSyncQueues.put(q);
      }

      await queueOp('TtPurchaseInvoice', 'PNB001', TtSyncOperation.CREATE, TtSyncStatus.SYNCED);
      await queueOp('TtSalesInvoice', 'HDB001', TtSyncOperation.CREATE, TtSyncStatus.SYNCED);
      await queueOp('TtSalesInvoice', 'HDB002', TtSyncOperation.UPDATE, TtSyncStatus.PENDING);
    });
  }
}
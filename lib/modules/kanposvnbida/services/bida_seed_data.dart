import 'package:uuid/uuid.dart';
import 'bida_isar_service.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../models/bida_inventory_tx.dart';
import '../models/bida_partner.dart';
import '../models/bida_finance.dart';

class BidaSeedData {
  static Future<void> seedIfEmpty(BidaIsarService isarService) async {
    final db = await isarService.db;
    final tableCount = await db.bidaTables.count();

    if (tableCount == 0) {
      await db.writeTxn(() async {
        // ── Tables ────────────────────────────────────────────────
        final tables = <BidaTable>[];
        for (int i = 1; i <= 8; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn Libre ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.LIBRE
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 60000);
        }
        for (int i = 1; i <= 4; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn Lỗ ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.LO
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 70000);
        }
        for (int i = 1; i <= 3; i++) {
          tables.add(BidaTable()
            ..tableId = const Uuid().v4()
            ..name = 'Bàn 3 Băng ${i.toString().padLeft(2, '0')}'
            ..type = BidaTableType.BANG_3
            ..status = BidaTableStatus.EMPTY
            ..hourlyPrice = 90000);
        }
        await db.bidaTables.putAll(tables);

        // ── Items ─────────────────────────────────────────────────
        final items = <BidaItem>[
          BidaItem()
            ..itemId = 'bdr001'
            ..name = 'Sting Dâu'
            ..category = BidaItemCategory.DRINK
            ..price = 15000
            ..stock = 120,
          BidaItem()
            ..itemId = 'bdr002'
            ..name = 'Redbull'
            ..category = BidaItemCategory.DRINK
            ..price = 20000
            ..stock = 80,
          BidaItem()
            ..itemId = 'bdr003'
            ..name = 'Pepsi'
            ..category = BidaItemCategory.DRINK
            ..price = 12000
            ..stock = 150,
          BidaItem()
            ..itemId = 'bdr004'
            ..name = 'Cà phê sữa'
            ..category = BidaItemCategory.DRINK
            ..price = 25000
            ..stock = 60,
          BidaItem()
            ..itemId = 'bdr005'
            ..name = 'Nước chanh'
            ..category = BidaItemCategory.DRINK
            ..price = 15000
            ..stock = 70,
          BidaItem()
            ..itemId = 'bdr006'
            ..name = 'Trà đá'
            ..category = BidaItemCategory.DRINK
            ..price = 5000
            ..stock = 200,
          BidaItem()
            ..itemId = 'bdr007'
            ..name = 'Bia Tiger'
            ..category = BidaItemCategory.BEER
            ..price = 20000
            ..costPrice = 14000
            ..stock = 100,
          BidaItem()
            ..itemId = 'bdr008'
            ..name = 'Bia Saigon'
            ..category = BidaItemCategory.BEER
            ..price = 18000
            ..costPrice = 13000
            ..stock = 100,
          // XII. Nước: Coca — ví dụ XIV: Nhập 500 / Bán 320 / Tồn 180.
          BidaItem()
            ..itemId = 'bdr009'
            ..name = 'Coca'
            ..category = BidaItemCategory.DRINK
            ..price = 12000
            ..costPrice = 8000
            ..stock = 180,
          // Bia: Heineken.
          BidaItem()
            ..itemId = 'bdr010'
            ..name = 'Bia Heineken'
            ..category = BidaItemCategory.BEER
            ..price = 35000
            ..costPrice = 25000
            ..stock = 60,
          // Khăn lạnh & Đá.
          BidaItem()
            ..itemId = 'bot003'
            ..name = 'Khăn lạnh'
            ..category = BidaItemCategory.TOWEL
            ..price = 5000
            ..costPrice = 3000
            ..stock = 150,
          BidaItem()
            ..itemId = 'bot004'
            ..name = 'Đá ly'
            ..category = BidaItemCategory.ICE
            ..price = 3000
            ..costPrice = 1000
            ..stock = 999,
          BidaItem()
            ..itemId = 'bfo001'
            ..name = 'Mì trứng xúc xích'
            ..category = BidaItemCategory.FOOD
            ..price = 35000
            ..stock = 40,
          BidaItem()
            ..itemId = 'bfo002'
            ..name = 'Khoai tây chiên'
            ..category = BidaItemCategory.FOOD
            ..price = 30000
            ..stock = 35,
          BidaItem()
            ..itemId = 'bfo003'
            ..name = 'Bánh mì thịt'
            ..category = BidaItemCategory.FOOD
            ..price = 20000
            ..stock = 50,
          BidaItem()
            ..itemId = 'bfo004'
            ..name = 'Gà rán (6 miếng)'
            ..category = BidaItemCategory.FOOD
            ..price = 65000
            ..stock = 20,
          BidaItem()
            ..itemId = 'bfo005'
            ..name = 'Nem chua rán'
            ..category = BidaItemCategory.FOOD
            ..price = 40000
            ..stock = 25,
          BidaItem()
            ..itemId = 'btb001'
            ..name = 'Thuốc lá 555'
            ..category = BidaItemCategory.TOBACCO
            ..price = 30000
            ..stock = 40,
          BidaItem()
            ..itemId = 'btb002'
            ..name = 'Thuốc lá Jet'
            ..category = BidaItemCategory.TOBACCO
            ..price = 25000
            ..stock = 50,
          BidaItem()
            ..itemId = 'bot001'
            ..name = 'Găng tay bida'
            ..category = BidaItemCategory.OTHER
            ..price = 50000
            ..stock = 30,
          BidaItem()
            ..itemId = 'bot002'
            ..name = 'Phấn tay'
            ..category = BidaItemCategory.OTHER
            ..price = 10000
            ..stock = 100,
        ];
        // Giá vốn tham chiếu để tính báo cáo lãi lỗ (XXVII).
        const costPrices = {
          'bdr001': 10000, 'bdr002': 14000, 'bdr003': 8000,
          'bdr004': 12000, 'bdr005': 6000, 'bdr006': 2000,
          'bfo001': 18000, 'bfo002': 15000, 'bfo003': 10000,
          'bfo004': 40000, 'bfo005': 25000,
          'btb001': 22000, 'btb002': 18000,
          'bot001': 35000, 'bot002': 6000,
        };
        for (final it in items) {
          final c = costPrices[it.itemId];
          if (c != null) it.costPrice = c.toDouble();
        }
        await db.bidaItems.putAll(items);

        // ── Seed 12 Paid Sessions ─────────────────────────────────
        final now = DateTime.now();
        final sessions = <BidaSession>[];

        final paidData = [
          // sessionIdx, tableIdx, hours, minutes, itemQuantities: {itemId: qty}
          [0, 1, 1, 30, {0: 2, 3: 1}],
          [1, 3, 0, 45, {1: 2}],
          [2, 5, 2, 15, {2: 3, 8: 1, 10: 2}],
          [3, 0, 1, 0, {4: 1, 9: 1}],
          [4, 2, 0, 30, {5: 3}],
          [5, 4, 3, 0, {0: 4, 8: 2, 12: 1}],
          [6, 6, 1, 45, {6: 2, 7: 1, 11: 2}],
          [7, 8, 2, 30, {3: 1, 9: 1, 13: 1}],
          [8, 10, 0, 50, {2: 2, 14: 2}],
          [9, 7, 1, 20, {0: 1, 10: 1}],
          [10, 9, 4, 0, {6: 3, 11: 3, 4: 2}],
          [11, 11, 1, 5, {5: 2, 12: 1}],
        ];

        for (int d = 0; d < paidData.length; d++) {
          final data = paidData[d];
          final tableIdx = data[1] as int;
          final hours = data[2] as int;
          final minutes = data[3] as int;
          final itemQts = data[4] as Map<int, int>;

          final table = tables[tableIdx];
          final hourlyPrice = table.hourlyPrice;
          final timeCost = hourlyPrice * (hours + minutes / 60.0);

          final orderLines = <BidaOrderLine>[];
          for (final entry in itemQts.entries) {
            final item = items[entry.key];
            orderLines.add(BidaOrderLine()
              ..itemId = item.itemId
              ..itemName = item.name
              ..price = item.price
              ..quantity = entry.value);
          }

          final startTime = now.subtract(Duration(hours: 24 * (paidData.length - d), minutes: 15));
          final endTime = startTime.add(Duration(hours: hours, minutes: minutes));

          final session = BidaSession()
            ..sessionId = 'seed_paid_${d}_${now.millisecondsSinceEpoch}'
            ..startTime = startTime
            ..endTime = endTime
            ..status = BidaSessionStatus.PAID
            ..hourlyPrice = hourlyPrice
            ..totalTimeCost = timeCost
            ..orderLines = orderLines;
          session.table.value = table;
          sessions.add(session);
        }

        // 3 currently OPEN sessions
        final openData = [
          [tables[0], 0, 0, <int, int>{}],
          [tables[3], 0, 25, <int, int>{0: 2, 9: 1}],
          [tables[7], 0, 10, <int, int>{5: 3}],
        ];
        for (int d = 0; d < openData.length; d++) {
          final data = openData[d];
          final table = data[0] as BidaTable;
          final itemQts = data[3] as Map<int, int>;

          final orderLines = <BidaOrderLine>[];
          for (final entry in itemQts.entries) {
            final item = items[entry.key];
            orderLines.add(BidaOrderLine()
              ..itemId = item.itemId
              ..itemName = item.name
              ..price = item.price
              ..quantity = entry.value);
          }

          final session = BidaSession()
            ..sessionId = 'seed_open_${d}_${now.millisecondsSinceEpoch}'
            ..startTime = now.subtract(Duration(minutes: 30 * (d + 1)))
            ..status = BidaSessionStatus.OPEN
            ..hourlyPrice = table.hourlyPrice
            ..totalTimeCost = 0
            ..orderLines = orderLines;
          session.table.value = table;
          sessions.add(session);

          table.status = BidaTableStatus.PLAYING;
          await db.bidaTables.put(table);
        }

        await db.bidaSessions.putAll(sessions);
        for (final s in sessions) {
          await s.table.save();
        }

        // ── Inventory Transactions ────────────────────────────────
        final txs = <BidaInventoryTx>[
          BidaInventoryTx()
            ..itemId = 'bdr001'
            ..itemName = 'Sting Dâu'
            ..quantity = 200
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập kho đầu kỳ'
            ..createdAt = now.subtract(const Duration(days: 30)),
          BidaInventoryTx()
            ..itemId = 'bdr002'
            ..itemName = 'Redbull'
            ..quantity = 150
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập kho đầu kỳ'
            ..createdAt = now.subtract(const Duration(days: 30)),
          BidaInventoryTx()
            ..itemId = 'bdr003'
            ..itemName = 'Pepsi'
            ..quantity = 300
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập kho Pepsi 3 thùng'
            ..createdAt = now.subtract(const Duration(days: 28)),
          BidaInventoryTx()
            ..itemId = 'bdr001'
            ..itemName = 'Sting Dâu'
            ..quantity = -10
            ..type = BidaInventoryTxType.EXPORT
            ..note = 'Xuất tiêu howng tuần 1'
            ..createdAt = now.subtract(const Duration(days: 21)),
          BidaInventoryTx()
            ..itemId = 'bdr004'
            ..itemName = 'Cà phê sữa'
            ..quantity = 100
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập cà phê nguyên liệu'
            ..createdAt = now.subtract(const Duration(days: 20)),
          BidaInventoryTx()
            ..itemId = 'bfo001'
            ..itemName = 'Mì trứng xúc xích'
            ..quantity = 80
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập mì gói'
            ..createdAt = now.subtract(const Duration(days: 18)),
          BidaInventoryTx()
            ..itemId = 'bfo001'
            ..itemName = 'Mì trứng xúc xích'
            ..quantity = -3
            ..type = BidaInventoryTxType.EXPORT
            ..note = 'Hư hỏng / hết hạn'
            ..createdAt = now.subtract(const Duration(days: 14)),
          BidaInventoryTx()
            ..itemId = 'bdr007'
            ..itemName = 'Bia Tiger'
            ..quantity = 200
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập bia Tiger 5 thùng'
            ..createdAt = now.subtract(const Duration(days: 10)),
          BidaInventoryTx()
            ..itemId = 'bdr008'
            ..itemName = 'Bia Saigon'
            ..quantity = 200
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập bia Saigon 5 thùng'
            ..createdAt = now.subtract(const Duration(days: 10)),
          BidaInventoryTx()
            ..itemId = 'bfo002'
            ..itemName = 'Khoai tây chiên'
            ..quantity = -8
            ..type = BidaInventoryTxType.EXPORT
            ..note = 'Xuất tiêu howng tuần 3'
            ..createdAt = now.subtract(const Duration(days: 7)),
          BidaInventoryTx()
            ..itemId = 'bfo004'
            ..itemName = 'Gà rán (6 miếng)'
            ..quantity = 40
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập gà đông lạnh'
            ..createdAt = now.subtract(const Duration(days: 5)),
          BidaInventoryTx()
            ..itemId = 'bdr001'
            ..itemName = 'Sting Dâu'
            ..quantity = -5
            ..type = BidaInventoryTxType.EXPORT
            ..note = 'Hết hạn sử dụng'
            ..createdAt = now.subtract(const Duration(days: 3)),
          BidaInventoryTx()
            ..itemId = 'btb001'
            ..itemName = 'Thuốc lá 555'
            ..quantity = 60
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập thuốc lá 555'
            ..createdAt = now.subtract(const Duration(days: 2)),
          BidaInventoryTx()
            ..itemId = 'bot002'
            ..itemName = 'Phấn tay'
            ..quantity = 5
            ..type = BidaInventoryTxType.EXPORT
            ..note = 'Phấn bị ẩm, loại bỏ'
            ..createdAt = now.subtract(const Duration(days: 1)),
          BidaInventoryTx()
            ..itemId = 'bdr005'
            ..itemName = 'Nước chanh'
            ..quantity = 30
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập chanh và nước đóng chai'
            ..createdAt = now.subtract(const Duration(hours: 12)),
          BidaInventoryTx()
            ..itemId = 'bfo005'
            ..itemName = 'Nem chua rán'
            ..quantity = 50
            ..type = BidaInventoryTxType.IMPORT
            ..note = 'Nhập nem chua rán đóng hộp'
            ..createdAt = now.subtract(const Duration(hours: 6)),
          // XIV. Ví dụ Coca: Nhập 500 lon từ Công ty Coca Cola.
          BidaInventoryTx()
            ..itemId = 'bdr009'
            ..itemName = 'Coca'
            ..quantity = 500
            ..type = BidaInventoryTxType.IMPORT
            ..unitPrice = 8000
            ..supplierId = 'ncc_cocacola'
            ..supplierName = 'Công ty Coca Cola'
            ..invoiceNo = 'PN-COCACOLA-001'
            ..note = 'Nhập 10 thùng Coca (500 lon)'
            ..createdAt = now.subtract(const Duration(days: 25)),
        ];
        await db.bidaInventoryTxs.putAll(txs);

        // ── XVII-XVIII. Khách hàng mẫu ────────────────────────────
        // Ví dụ XVIII: Nguyễn Văn A nợ 850.000, đã trả 300.000, còn 550.000.
        final customers = <BidaCustomer>[
          BidaCustomer()
            ..customerId = 'kh_vana'
            ..name = 'Nguyễn Văn A'
            ..phone = '0901112233'
            ..points = 55
            ..isMember = true
            ..debtBalance = 550000
            ..totalSpent = 4200000
            ..createdAt = now.subtract(const Duration(days: 60)),
          BidaCustomer()
            ..customerId = 'kh_thib'
            ..name = 'Trần Thị B'
            ..phone = '0912223344'
            ..points = 1200
            ..isMember = true
            ..debtBalance = 0
            ..totalSpent = 12500000
            ..createdAt = now.subtract(const Duration(days: 120)),
          BidaCustomer()
            ..customerId = 'kh_vanc'
            ..name = 'Lê Văn C'
            ..phone = '0923334455'
            ..points = 30
            ..isMember = false
            ..debtBalance = 0
            ..totalSpent = 350000
            ..createdAt = now.subtract(const Duration(days: 15)),
        ];
        await db.bidaCustomers.putAll(customers);

        // ── XVI + XIX. Nhà cung cấp mẫu ───────────────────────────
        // Ví dụ XIX: Coca Cola đã nhập 25.000.000, đã trả 20.000.000 -> còn nợ 5.000.000.
        final suppliers = <BidaSupplier>[
          BidaSupplier()
            ..supplierId = 'ncc_cocacola'
            ..name = 'Công ty Coca Cola'
            ..address = 'KCN Tân Tạo, Q.Bình Tân, TP.HCM'
            ..phone = '02837688888'
            ..email = 'sale@coca.com.vn'
            ..totalImported = 25000000
            ..totalPaid = 20000000
            ..createdAt = now.subtract(const Duration(days: 90)),
          BidaSupplier()
            ..supplierId = 'ncc_bia'
            ..name = 'NPP Bia Tổng Hợp'
            ..address = '123 Lý Thường Kiệt, Q.10, TP.HCM'
            ..phone = '02838383838'
            ..email = 'bia@tonghop.vn'
            ..totalImported = 12000000
            ..totalPaid = 12000000
            ..createdAt = now.subtract(const Duration(days: 80)),
          BidaSupplier()
            ..supplierId = 'ncc_doan'
            ..name = 'Cửa Hàng Đồ Ăn Nhanh Số 1'
            ..address = '45 Cách Mạng Tháng 8, Q.3, TP.HCM'
            ..phone = '02839393939'
            ..email = 'doan@so1.vn'
            ..totalImported = 6500000
            ..totalPaid = 5000000
            ..createdAt = now.subtract(const Duration(days: 45)),
        ];
        await db.bidaSuppliers.putAll(suppliers);

        // ── IV. Giá theo khung giờ / cuối tuần / loại bàn ─────────
        // Ngày thường 08-17: 70k · 17-23: 90k · Cuối tuần: 100k (spec IV).
        final pricingRules = <BidaPricingRule>[
          for (final t in [BidaTableType.LIBRE, BidaTableType.LO]) ...[
            BidaPricingRule()
              ..ruleId = 'gia_${t.name}_ngaythuong'
              ..name = 'Ngày thường (08:00-17:00)'
              ..tableType = t
              ..fromMinuteOfDay = 8 * 60
              ..toMinuteOfDay = 17 * 60
              ..weekendOnly = false
              ..pricePerHour = 70000
              ..priority = 1,
            BidaPricingRule()
              ..ruleId = 'gia_${t.name}_cautoi'
              ..name = 'Ca tối (17:00-23:00)'
              ..tableType = t
              ..fromMinuteOfDay = 17 * 60
              ..toMinuteOfDay = 23 * 60
              ..weekendOnly = false
              ..pricePerHour = 90000
              ..priority = 2,
            BidaPricingRule()
              ..ruleId = 'gia_${t.name}_cuoituan'
              ..name = 'Cuối tuần (08:00-23:00)'
              ..tableType = t
              ..fromMinuteOfDay = 8 * 60
              ..toMinuteOfDay = 23 * 60
              ..weekendOnly = true
              ..pricePerHour = 100000
              ..priority = 3,
          ],
        ];
        await db.bidaPricingRules.putAll(pricingRules);

        // ── VII. Block / Combo ────────────────────────────────────
        final blockPlans = <BidaBlockPlan>[
          BidaBlockPlan()
            ..planId = 'block3h'
            ..name = 'Block 3 giờ đầu (sau đó 80k/giờ)'
            ..tableType = BidaTableType.LIBRE
            ..blockHours = 3
            ..blockPrice = 250000
            ..extraHourPrice = 80000,
          BidaBlockPlan()
            ..planId = 'combo4h'
            ..name = 'Combo 4 giờ trọn gói'
            ..tableType = BidaTableType.LO
            ..blockHours = 4
            ..blockPrice = 300000
            ..extraHourPrice = 90000,
        ];
        await db.bidaBlockPlans.putAll(blockPlans);

        // ── XX-XXI. Phiếu thu / chi mẫu trong tháng ───────────────
        final monthAgo = DateTime(now.year, now.month, 1);
        final financeTxs = <BidaFinanceTx>[
          // Thu công nợ Nguyễn Văn A 300k (đối chiếu ví dụ XVIII).
          BidaFinanceTx()
            ..financeId = 'thu_seed_vana'
            ..isIncome = true
            ..amount = 300000
            ..incomeCategory = BidaIncomeCategory.DEBT_COLLECTION.name
            ..note = 'Thu công nợ Nguyễn Văn A'
            ..createdAt = monthAgo.add(const Duration(days: 2)),
          BidaFinanceTx()
            ..financeId = 'thu_seed_khac'
            ..isIncome = true
            ..amount = 250000
            ..incomeCategory = BidaIncomeCategory.OTHER_INCOME.name
            ..note = 'Thu khác - cho thuê bàn tổ chức sự kiện'
            ..createdAt = monthAgo.add(const Duration(days: 5)),
          // Chi phí vận hành quán (XXI).
          BidaFinanceTx()
            ..financeId = 'chi_seed_thue'
            ..isIncome = false
            ..amount = 8000000
            ..expenseCategory = BidaExpenseCategory.RENT.name
            ..note = 'Tiền thuê mặt bằng tháng này'
            ..createdAt = monthAgo.add(const Duration(days: 1)),
          BidaFinanceTx()
            ..financeId = 'chi_seed_dien'
            ..isIncome = false
            ..amount = 2100000
            ..expenseCategory = BidaExpenseCategory.ELECTRICITY.name
            ..note = 'Tiền điện kỳ này'
            ..createdAt = monthAgo.add(const Duration(days: 3)),
          BidaFinanceTx()
            ..financeId = 'chi_seed_nuoc'
            ..isIncome = false
            ..amount = 450000
            ..expenseCategory = BidaExpenseCategory.WATER.name
            ..note = 'Tiền nước kỳ này'
            ..createdAt = monthAgo.add(const Duration(days: 3, hours: 1)),
          BidaFinanceTx()
            ..financeId = 'chi_seed_internet'
            ..isIncome = false
            ..amount = 300000
            ..expenseCategory = BidaExpenseCategory.INTERNET.name
            ..note = 'Internet Wifi quán'
            ..createdAt = monthAgo.add(const Duration(days: 4)),
          BidaFinanceTx()
            ..financeId = 'chi_seed_luong'
            ..isIncome = false
            ..amount = 12000000
            ..expenseCategory = BidaExpenseCategory.SALARY.name
            ..note = 'Lương nhân viên tháng này'
            ..createdAt = monthAgo.add(const Duration(days: 5)),
          BidaFinanceTx()
            ..financeId = 'chi_seed_mkt'
            ..isIncome = false
            ..amount = 1000000
            ..expenseCategory = BidaExpenseCategory.MARKETING.name
            ..note = 'Chạy quảng cáo địa phương'
            ..createdAt = monthAgo.add(const Duration(days: 6)),
        ];
        await db.bidaFinanceTxs.putAll(financeTxs);
      });
    }
  }
}

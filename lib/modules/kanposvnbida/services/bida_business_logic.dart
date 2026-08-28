import 'package:isar/isar.dart';
import '../../../core/utils/formatters.dart';
import '../models/bida_table.dart';
import '../models/bida_item.dart';
import '../models/bida_session.dart';
import '../models/bida_inventory_tx.dart';
import '../models/bida_partner.dart';
import '../models/bida_finance.dart';

/// Kết quả thanh toán một phiên chơi.
class BidaCheckoutResult {
  final double timeCost;
  final double itemCost;
  final double discount;
  final double grandTotal;
  final double paidNow;
  final double debtAdded;
  final int pointsEarned;

  BidaCheckoutResult({
    required this.timeCost,
    required this.itemCost,
    required this.discount,
    required this.grandTotal,
    required this.paidNow,
    required this.debtAdded,
    required this.pointsEarned,
  });
}

/// Kết quả một phiếu nhập hàng.
class BidaImportResult {
  final double subTotal;
  final double vatAmount;
  final double discountAmount;
  final double grandTotal;

  BidaImportResult({
    required this.subTotal,
    required this.vatAmount,
    required this.discountAmount,
    required this.grandTotal,
  });
}

/// Toàn bộ quy trình nghiệp vụ Quán Bida theo quanbida.md.
class BidaBusinessLogic {
  // ══════════════ IV + VI + VII. TÍNH GIỜ ══════════════

  /// IV. Giá giờ theo khung giờ / cuối tuần / loại bàn.
  /// Chọn rule khớp có priority cao nhất; không có thì dùng giá gốc của bàn.
  static double resolveHourlyPrice({
    required BidaTable table,
    required DateTime at,
    required List<BidaPricingRule> rules,
  }) {
    final minuteOfDay = at.hour * 60 + at.minute;
    final isWeekend =
        at.weekday == DateTime.saturday || at.weekday == DateTime.sunday;
    BidaPricingRule? best;
    for (final r in rules) {
      if (r.tableType != table.type) continue;
      if (r.weekendOnly != isWeekend) continue;
      final inWindow =
          minuteOfDay >= r.fromMinuteOfDay && minuteOfDay < r.toMinuteOfDay;
      if (!inWindow) continue;
      if (best == null || r.priority > best.priority) best = r;
    }
    return best?.pricePerHour ?? table.hourlyPrice;
  }

  /// VI. Làm tròn phút theo block của bàn (15/30/60...), tối thiểu 1 block.
  static int billableMinutes(DateTime start, DateTime end, int blockMinutes) {
    if (end.isBefore(start)) return 0;
    final actual = end.difference(start).inMinutes;
    final blocks = (actual / blockMinutes).ceil();
    return (blocks < 1 ? 1 : blocks) * blockMinutes;
  }

  /// VII. Tính tiền theo block/combo:
  /// - Chơi <= blockHours -> trọn giá blockPrice.
  /// - Vượt thêm h giờ    -> + h * extraHourPrice.
  /// Trả về null nếu KHÔNG áp plan (tính theo giờ thường).
  static double? calcBlockCost({
    required double pricePerHour,
    required int roundedMinutes,
    BidaBlockPlan? plan,
  }) {
    if (plan == null || plan.blockHours <= 0) return null;
    final playedHours = roundedMinutes / 60.0;
    if (playedHours <= plan.blockHours) return plan.blockPrice;
    final extraHours = playedHours - plan.blockHours;
    final extra = plan.extraHourPrice > 0
        ? extraHours * plan.extraHourPrice
        : extraHours * pricePerHour;
    return plan.blockPrice + extra;
  }

  /// VI+VII. Tổng hợp tiền giờ: làm tròn block rồi áp plan (nếu có).
  static ({int minutes, double cost}) calcTimeCost({
    required DateTime start,
    required DateTime end,
    required double pricePerHour,
    required int roundingMinutes,
    BidaBlockPlan? plan,
  }) {
    final minutes = billableMinutes(start, end, roundingMinutes);
    final blockCost = calcBlockCost(
        pricePerHour: pricePerHour, roundedMinutes: minutes, plan: plan);
    if (blockCost != null) return (minutes: minutes, cost: blockCost);
    return (minutes: minutes, cost: pricePerHour / 60.0 * minutes);
  }

  // ══════════════ III + V. MỞ BÀN / TRẠNG THÁI ══════════════

  /// Mở bàn: tạo phiên OPEN, ghi cọc (VIII), lưu khách (XVII); giá giờ
  /// được chốt theo rule khung giờ TẠI THỜI ĐIỂM mở bàn.
  static Future<BidaSession> openTable(
    Isar db, {
    required BidaTable table,
    List<BidaPricingRule> rules = const [],
    double deposit = 0,
    BidaCustomer? customer,
    String staffName = '',
    DateTime? at,
  }) async {
    if (table.status == BidaTableStatus.PLAYING) {
      throw Exception('Bàn ${table.name} đang chơi, không thể mở thêm.');
    }
    final start = at ?? DateTime.now();
    final session = BidaSession()
      ..sessionId =
          's_${start.millisecondsSinceEpoch}_${table.name.hashCode.abs()}'
      ..startTime = start
      ..status = BidaSessionStatus.OPEN
      ..hourlyPrice = resolveHourlyPrice(table: table, at: start, rules: rules)
      ..deposit = deposit
      ..customerCode = customer?.customerId ?? ''
      ..customerName = customer?.name ?? '';
    await db.writeTxn(() async {
      table.status = BidaTableStatus.PLAYING;
      await db.bidaTables.put(table);
      await db.bidaSessions.put(session);
      session.table.value = table;
      await session.table.save();
    });
    return session;
  }

  /// III. Đặt trước bàn (kèm cọc nếu muốn).
  static Future<void> reserveTable(Isar db, BidaTable table,
      {double deposit = 0}) async {
    await db.writeTxn(() async {
      table.status = BidaTableStatus.RESERVED;
      await db.bidaTables.put(table);
    });
  }

  /// III. Vệ sinh xong -> bàn trở lại Trống.
  static Future<void> finishCleaning(Isar db, BidaTable table) async {
    await db.writeTxn(() async {
      table.status = BidaTableStatus.EMPTY;
      await db.bidaTables.put(table);
    });
  }

  /// III. Đánh dấu bảo trì / hủy bảo trì.
  static Future<void> setMaintenance(Isar db, BidaTable table,
      {required bool on}) async {
    await db.writeTxn(() async {
      table.status = on ? BidaTableStatus.MAINTENANCE : BidaTableStatus.EMPTY;
      await db.bidaTables.put(table);
    });
  }

  // ══════════════ XIII. BÁN HÀNG TRONG PHIÊN ══════════════

  /// Gọi món vào phiên — tự trừ kho, hết hàng thì từ chối.
  static Future<void> addItemToSession(
      Isar db, BidaSession session, BidaItem item,
      {int quantity = 1}) async {
    if (item.stock < quantity) {
      throw Exception('${item.name} chỉ còn ${item.stock}, không đủ bán!');
    }
    await db.writeTxn(() async {
      final lines = List<BidaOrderLine>.from(session.orderLines);
      final idx = lines.indexWhere((l) => l.itemId == item.itemId);
      if (idx >= 0) {
        lines[idx].quantity += quantity;
      } else {
        lines.add(BidaOrderLine()
          ..itemId = item.itemId
          ..itemName = item.name
          ..price = item.price
          ..quantity = quantity);
      }
      session.orderLines = lines;
      await db.bidaSessions.put(session);
      item.stock -= quantity;
      await db.bidaItems.put(item);
      await db.bidaInventoryTxs.put(BidaInventoryTx()
        ..itemId = item.itemId
        ..itemName = item.name
        ..quantity = -quantity
        ..type = BidaInventoryTxType.EXPORT
        ..note = 'Bán tại bàn');
    });
  }

  // ══════════════ IX. CHUYỂN BÀN ══════════════

  /// Chuyển bàn: toàn bộ thời gian chơi + tiền giờ giữ nguyên.
  static Future<void> transferTable(
      Isar db, BidaSession session, BidaTable newTable) async {
    if (newTable.status != BidaTableStatus.EMPTY &&
        newTable.status != BidaTableStatus.RESERVED) {
      throw Exception('Bàn ${newTable.name} không trống, không chuyển được.');
    }
    await session.table.load();
    await db.writeTxn(() async {
      final oldTable = session.table.value;
      if (oldTable != null) {
        oldTable.status = BidaTableStatus.EMPTY;
        await db.bidaTables.put(oldTable);
      }
      newTable.status = BidaTableStatus.PLAYING;
      await db.bidaTables.put(newTable);
      session.table.value = newTable;
      await session.table.save();
    });
  }

  // ══════════════ X. GHÉP BÀN ══════════════

  /// Ghép 2 bàn -> 1 hóa đơn: món + tiền giờ bàn nguồn dồn vào đích.
  static Future<void> mergeTables(
      Isar db, BidaSession source, BidaSession target,
      {double sourceTimeCost = -1}) async {
    await source.table.load();
    await target.table.load();
    await db.writeTxn(() async {
      final lines = List<BidaOrderLine>.from(target.orderLines);
      final cost = sourceTimeCost >= 0
          ? sourceTimeCost
          : source.totalTimeCost > 0
              ? source.totalTimeCost
              : _liveTimeCost(source);
      lines.add(BidaOrderLine()
        ..itemId = 'MERGE_TIME_${source.sessionId}'
        ..itemName = 'Tiền giờ ghép từ ${source.table.value?.name ?? '?'}'
        ..price = cost
        ..quantity = 1);
      for (final l in source.orderLines) {
        final i = lines.indexWhere((x) => x.itemId == l.itemId);
        if (i >= 0) {
          lines[i].quantity += l.quantity;
        } else {
          lines.add(l);
        }
      }
      target.orderLines = lines;
      await db.bidaSessions.put(target);

      source.status = BidaSessionStatus.CANCELLED;
      source.endTime = DateTime.now();
      await db.bidaSessions.put(source);
      final srcTable = source.table.value;
      if (srcTable != null) {
        srcTable.status = BidaTableStatus.EMPTY;
        await db.bidaTables.put(srcTable);
      }
    });
  }

  static double _liveTimeCost(BidaSession s) {
    if (s.startTime == null) return 0;
    final mins = billableMinutes(s.startTime!, DateTime.now(), 1);
    return s.hourlyPrice / 60 * mins;
  }

  // ══════════════ XI. TÁCH HÓA ĐƠN ══════════════

  /// Tách hóa đơn: chuyển các món [lineItemIds] khỏi phiên gốc thành
  /// hóa đơn mới trên cùng bàn (nhóm khách này trả món của nhóm họ).
  static Future<BidaSession> splitSession(
      Isar db, BidaSession session, List<String> lineItemIds) async {
    if (lineItemIds.isEmpty) {
      throw Exception('Chọn ít nhất 1 món để tách.');
    }
    await session.table.load();
    late BidaSession newSession;
    await db.writeTxn(() async {
      final stay = List<BidaOrderLine>.from(session.orderLines);
      final moved = <BidaOrderLine>[];
      for (final id in lineItemIds) {
        final i = stay.indexWhere((l) => l.itemId == id);
        if (i < 0) continue;
        moved.add(stay.removeAt(i));
      }
      if (moved.isEmpty) throw Exception('Không có món hợp lệ để tách.');

      session.orderLines = stay;
      await db.bidaSessions.put(session);

      newSession = BidaSession()
        ..sessionId = 'split_${session.sessionId}_${moved.first.itemId}'
        ..startTime = session.startTime
        ..status = BidaSessionStatus.OPEN
        ..hourlyPrice = 0 // tiền giờ nằm ở hóa đơn gốc
        ..deposit = 0;
      newSession.orderLines = moved;
      newSession.table.value = session.table.value;
      await db.bidaSessions.put(newSession);
      await newSession.table.save();
    });
    return newSession;
  }

  // ══════════════ VIII + XVII-XVIII. THANH TOÁN / CỌC / CÔNG NỢ ══════════════

  /// Thanh toán phiên:
  /// grandTotal = tiền giờ + món - giảm giá; cọc trừ trước; thiếu thì
  /// cộng nợ khách (nếu có chọn khách) và tích điểm trên tiền thực thu.
  /// Sau thanh toán bàn chuyển sang ĐANG VỆ SINH (III).
  static Future<BidaCheckoutResult> checkoutSession(
    Isar db,
    BidaSession session, {
    required double timeCost,
    double discount = 0,
    double cashReceived = 0,
    BidaCustomer? customer,
    int pointRatePer10k = 1,
  }) async {
    await session.table.load();
    final itemCost = session.orderLines.fold(0.0, (s, l) => s + l.total);
    final deposit = session.deposit;
    final safeDiscount = discount.clamp(0, timeCost + itemCost).toDouble();
    final grandTotal = safeDouble(timeCost + itemCost - safeDiscount);
    final available = cashReceived + deposit;
    var paidNow = available.clamp(0.0, grandTotal).toDouble();
    var debtAdded = 0.0;

    if (paidNow < grandTotal && customer == null) {
      paidNow = grandTotal; // khách vãng lai: coi như đã nhận đủ tiền mặt
    } else if (customer != null && available < grandTotal) {
      debtAdded = grandTotal - available;
      paidNow = available;
    }

    final points =
        customer == null || pointRatePer10k <= 0 ? 0 : (paidNow ~/ 10000) * pointRatePer10k;

    await db.writeTxn(() async {
      session.status = BidaSessionStatus.PAID;
      session.endTime = DateTime.now();
      session.totalTimeCost = timeCost;
      session.discount = safeDiscount;
      session.earnedPoints = points;
      if (customer != null) {
        session.customerCode = customer.customerId;
        session.customerName = customer.name;
        final fresh = await db.bidaCustomers
            .filter()
            .customerIdEqualTo(customer.customerId)
            .findFirst();
        if (fresh != null) {
          fresh.debtBalance += debtAdded;
          fresh.points += points;
          fresh.totalSpent += paidNow;
          await db.bidaCustomers.put(fresh);
        }
      }
      await db.bidaSessions.put(session);

      final table = session.table.value;
      if (table != null) {
        table.status = BidaTableStatus.CLEANING;
        await db.bidaTables.put(table);
      }
    });

    return BidaCheckoutResult(
      timeCost: timeCost,
      itemCost: itemCost,
      discount: safeDiscount,
      grandTotal: grandTotal,
      paidNow: paidNow,
      debtAdded: debtAdded,
      pointsEarned: points,
    );
  }

  /// XVIII. Thu công nợ khách hàng -> tạo phiếu thu.
  static Future<void> collectCustomerDebt(
      Isar db, BidaCustomer customer, double amount,
      {String note = ''}) async {
    if (amount <= 0) throw Exception('Số tiền thu phải > 0.');
    await db.writeTxn(() async {
      customer.debtBalance -= amount;
      await db.bidaCustomers.put(customer);
      await db.bidaFinanceTxs.put(BidaFinanceTx()
        ..financeId = 'thu_${DateTime.now().millisecondsSinceEpoch}'
        ..isIncome = true
        ..amount = amount
        ..incomeCategory = BidaIncomeCategory.DEBT_COLLECTION.name
        ..note = note.isEmpty ? 'Thu nợ ${customer.name}' : note);
    });
  }

  // ══════════════ XIV-XVI + XIX. KHO / NHẬP HÀNG / NCC ══════════════

  /// XV. Nhập hàng: cập nhật kho + giá vốn, ghi phiếu nhập có VAT/chiết khấu,
  /// công nợ NCC tăng phần chưa trả (XIX).
  static Future<BidaImportResult> importGoods(
    Isar db, {
    required BidaSupplier supplier,
    required List<({BidaItem item, int qty, double unitPrice})> lines,
    String invoiceNo = '',
    double vatPercent = 0,
    double discountAmount = 0,
    double paidNow = 0,
    DateTime? at,
  }) async {
    if (lines.isEmpty) throw Exception('Phiếu nhập trống.');
    final date = at ?? DateTime.now();
    final subTotal =
        lines.fold<double>(0, (s, l) => s + l.qty * l.unitPrice);
    final afterDiscount = (subTotal - discountAmount).clamp(0, double.infinity);
    final vatAmount = afterDiscount * vatPercent / 100.0;
    final grandTotal = afterDiscount + vatAmount;

    await db.writeTxn(() async {
      for (final l in lines) {
        l.item.stock += l.qty;
        // Giá vốn trung bình gia quyền sau nhập mới.
        final oldQty = l.item.stock - l.qty;
        final oldCost = oldQty * l.item.costPrice;
        l.item.costPrice =
            (oldCost + l.qty * l.unitPrice) / (l.item.stock == 0 ? 1 : l.item.stock);
        await db.bidaItems.put(l.item);
        await db.bidaInventoryTxs.put(BidaInventoryTx()
          ..itemId = l.item.itemId
          ..itemName = l.item.name
          ..quantity = l.qty
          ..type = BidaInventoryTxType.IMPORT
          ..unitPrice = l.unitPrice
          ..vatPercent = vatPercent
          ..discountAmount = discountAmount / lines.length
          ..supplierId = supplier.supplierId
          ..supplierName = supplier.name
          ..invoiceNo = invoiceNo
          ..note = 'Nhập hàng từ ${supplier.name}'
          ..createdAt = date);
      }
      supplier.totalImported += grandTotal;
      supplier.totalPaid += paidNow.clamp(0.0, grandTotal);
      await db.bidaSuppliers.put(supplier);
    });
    return BidaImportResult(
      subTotal: subTotal,
      vatAmount: vatAmount,
      discountAmount: discountAmount,
      grandTotal: grandTotal,
    );
  }

  /// XIX. Trả tiền cho nhà cung cấp -> tạo phiếu chi mua hàng/trả NCC.
  static Future<void> paySupplierDebt(
      Isar db, BidaSupplier supplier, double amount,
      {String invoiceNo = ''}) async {
    if (amount <= 0) throw Exception('Số tiền trả phải > 0.');
    if (amount > supplier.debtBalance) {
      throw Exception('Vượt công nợ NCC (${supplier.debtBalance}).');
    }
    await db.writeTxn(() async {
      supplier.totalPaid += amount;
      await db.bidaSuppliers.put(supplier);
      await db.bidaFinanceTxs.put(BidaFinanceTx()
        ..financeId = 'chi_${DateTime.now().millisecondsSinceEpoch}'
        ..isIncome = false
        ..amount = amount
        ..expenseCategory = BidaExpenseCategory.GOODS_PURCHASE.name
        ..note = 'Trả nợ NCC ${supplier.name} $invoiceNo'.trim());
    });
  }

  // ══════════════ XX-XXI. PHIẾU THU / PHIẾU CHI THỦ CÔNG ══════════════

  static Future<BidaFinanceTx> addFinanceTx(Isar db,
      {required bool isIncome,
      required double amount,
      required String category,
      String note = '',
      DateTime? at}) async {
    late BidaFinanceTx tx;
    await db.writeTxn(() async {
      tx = BidaFinanceTx()
        ..financeId =
            '${isIncome ? 'thu' : 'chi'}_${DateTime.now().millisecondsSinceEpoch}_'
                '${amount.round()}'
        ..isIncome = isIncome
        ..amount = amount
        ..incomeCategory = isIncome ? category : ''
        ..expenseCategory = isIncome ? '' : category
        ..note = note
        ..createdAt = at ?? DateTime.now();
      await db.bidaFinanceTxs.put(tx);
    });
    return tx;
  }

  // ══════════════ XXV-XXVIII. BÁO CÁO ══════════════

  static bool _inRange(DateTime? d, DateTime from, DateTime to) =>
      d != null && !d.isBefore(from) && d.isBefore(to);

  /// XXV. Doanh thu theo khoảng ngày: tách tiền giờ / từng nhóm món.
  static Future<Map<String, double>> revenueReport(
      Isar db, DateTime from, DateTime to) async {
    final sessions = await db.bidaSessions
        .filter()
        .statusEqualTo(BidaSessionStatus.PAID)
        .findAll();
    final items = await db.bidaItems.where().findAll();
    final catOf = {for (final i in items) i.itemId: i.category};

    double time = 0, drink = 0, beer = 0, food = 0, tobacco = 0, other = 0;
    for (final s in sessions) {
      if (!_inRange(s.startTime, from, to)) continue;
      time += s.totalTimeCost;
      for (final l in s.orderLines) {
        switch (catOf[l.itemId]) {
          case BidaItemCategory.DRINK:
            drink += l.total;
            break;
          case BidaItemCategory.BEER:
            beer += l.total;
            break;
          case BidaItemCategory.FOOD:
            food += l.total;
            break;
          case BidaItemCategory.TOBACCO:
            tobacco += l.total;
            break;
          default:
            other += l.total;
        }
      }
    }
    return {
      'time': time,
      'drink': drink,
      'beer': beer,
      'food': food,
      'tobacco': tobacco,
      'other': other,
      'total': time + drink + beer + food + tobacco + other,
    };
  }

  /// XXVI. Chi phí theo nhóm trong khoảng ngày.
  static Future<Map<String, double>> expenseReport(
      Isar db, DateTime from, DateTime to) async {
    final txs = await db.bidaFinanceTxs
        .filter()
        .isIncomeEqualTo(false)
        .findAll();
    final out = <String, double>{};
    for (final t in txs) {
      if (!_inRange(t.createdAt, from, to)) continue;
      final key = t.expenseCategory.isEmpty
          ? BidaExpenseCategory.OTHER_EXPENSE.name
          : t.expenseCategory;
      out[key] = (out[key] ?? 0) + t.amount;
    }
    return out;
  }

  /// XXVII. Lợi nhuận = doanh thu - giá vốn - chi phí.
  static Future<Map<String, double>> profitReport(
      Isar db, DateTime from, DateTime to) async {
    final rev = await revenueReport(db, from, to);
    final expenses = await expenseReport(db, from, to);
    final expenseTotal =
        expenses.values.fold<double>(0, (s, v) => s + v);

    final sessions = await db.bidaSessions
        .filter()
        .statusEqualTo(BidaSessionStatus.PAID)
        .findAll();
    final items = await db.bidaItems.where().findAll();
    final costOf = {for (final i in items) i.itemId: i.costPrice};
    var cogs = 0.0;
    for (final s in sessions) {
      if (!_inRange(s.startTime, from, to)) continue;
      for (final l in s.orderLines) {
        cogs += (costOf[l.itemId] ?? 0) * l.quantity;
      }
    }
    final revenue = rev['total'] ?? 0;
    return {
      'revenue': revenue,
      'cogs': cogs,
      'expense': expenseTotal,
      'profit': revenue - cogs - expenseTotal,
    };
  }

  /// XXVIII. Bảng cân đối kế toán rút gọn.
  /// Tiền mặt = tổng thu (phiên đã trả + phiếu thu) - tổng chi (phiếu chi).
  static Future<Map<String, double>> balanceSheet(Isar db) async {
    final sessions =
        await db.bidaSessions.filter().statusEqualTo(BidaSessionStatus.PAID).findAll();
    final cashFromSales =
        sessions.fold<double>(0, (s, x) => s + x.grandTotal);
    final txs = await db.bidaFinanceTxs.where().findAll();
    var income = 0.0, expense = 0.0;
    for (final t in txs) {
      if (t.isIncome) {
        income += t.amount;
      } else {
        expense += t.amount;
      }
    }
    final items = await db.bidaItems.where().findAll();
    final inventoryValue =
        items.fold<double>(0, (s, i) => s + i.stock * i.costPrice);
    final customers = await db.bidaCustomers.where().findAll();
    final suppliers = await db.bidaSuppliers.where().findAll();

    return {
      // TÀI SẢN
      'cash': cashFromSales + income - expense,
      'inventory': inventoryValue,
      'receivable':
          customers.fold<double>(0, (s, c) => s + c.debtBalance.clamp(0, double.infinity)),
      // NGUỒN VỐN
      'payable':
          suppliers.fold<double>(0, (s, x) => s + x.debtBalance.clamp(0, double.infinity)),
    };
  }

  // ══════════════ XXIX. DASHBOARD ══════════════

  /// Số liệu hôm nay / tháng + top bán chạy & top khách & top bàn.
  static Future<Map<String, dynamic>> dashboardSummary(Isar db) async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month);
    final sessions =
        await db.bidaSessions.filter().statusEqualTo(BidaSessionStatus.PAID).findAll();
    final tables = await db.bidaTables.where().findAll();

    double todayRev = 0, monthRev = 0;
    for (final s in sessions) {
      if (_inRange(s.startTime, todayStart, todayStart.add(const Duration(days: 1)))) {
        todayRev += s.grandTotal;
      }
      if (_inRange(s.startTime, monthStart, DateTime(now.year, now.month + 1))) {
        monthRev += s.grandTotal;
      }
    }
    final expenses = await expenseReport(
        db, monthStart, DateTime(now.year, now.month + 1));
    final monthExpense = expenses.values.fold<double>(0, (s, v) => s + v);

    // Top món bán chạy (theo số lượng).
    final soldQty = <String, int>{};
    final soldName = <String, String>{};
    for (final s in sessions) {
      for (final l in s.orderLines) {
        soldQty[l.itemId] = (soldQty[l.itemId] ?? 0) + l.quantity;
        soldName[l.itemId] = l.itemName;
      }
    }
    final topItems = soldQty.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Top khách chi tiêu.
    final spentByCustomer = <String, double>{};
    for (final s in sessions) {
      if (s.customerCode.isEmpty) continue;
      spentByCustomer[s.customerCode] =
          (spentByCustomer[s.customerCode] ?? 0) + s.grandTotal;
    }
    final topCustomers = spentByCustomer.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Top bàn hoạt động nhiều (số phiên).
    await Future.wait(sessions.map((s) => s.table.load()));
    final countByTable = <String, int>{};
    for (final s in sessions) {
      final name = s.table.value?.name ?? '?';
      countByTable[name] = (countByTable[name] ?? 0) + 1;
    }
    final topTables = countByTable.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'playingTables': tables.where((t) => t.status == BidaTableStatus.PLAYING).length,
      'emptyTables': tables.where((t) => t.status == BidaTableStatus.EMPTY).length,
      'todayRevenue': todayRev,
      'monthRevenue': monthRev,
      'monthExpense': monthExpense,
      'monthProfit': monthRev - monthExpense,
      'topItems': [
        for (final e in topItems.take(5))
          {'name': soldName[e.key] ?? e.key, 'qty': e.value}
      ],
      'topCustomers': [
        for (final e in topCustomers.take(5))
          {'code': e.key, 'spent': e.value}
      ],
      'topTables': [
        for (final e in topTables.take(5)) {'name': e.key, 'sessions': e.value}
      ],
    };
  }
}


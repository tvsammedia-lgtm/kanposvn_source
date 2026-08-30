import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../services/tt_isar_service.dart';
import '../models/tt_product.dart';
import '../models/tt_partner.dart';
import '../models/tt_loyalty.dart';
import '../models/tt_order.dart';
import '../models/tt_stock.dart';
import '../models/tt_finance.dart';

final ttIsarServiceProvider = Provider<TtIsarService>((ref) {
  return TtIsarService();
});

final ttCategoriesProvider = FutureProvider<List<TtCategory>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttCategorys.where().findAll();
  list.removeWhere((c) => c.deletedAt != null);
  list.sort((a, b) => a.name.compareTo(b.name));
  return list;
});

class TtProductsNotifier extends StateNotifier<AsyncValue<List<TtProduct>>> {
  final TtIsarService _isarService;

  TtProductsNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final products = await db.ttProducts.where().findAll();
      final active = products.where((p) => p.deletedAt == null).toList()
        ..sort((a, b) => a.name.compareTo(b.name));
      for (final p in active) {
        await p.category.load();
      }
      state = AsyncValue.data(active);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final ttProductsProvider = StateNotifierProvider<TtProductsNotifier, AsyncValue<List<TtProduct>>>((ref) {
  return TtProductsNotifier(ref.watch(ttIsarServiceProvider));
});

class TtCustomersNotifier extends StateNotifier<AsyncValue<List<TtCustomer>>> {
  final TtIsarService _isarService;

  TtCustomersNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final list = await db.ttCustomers.where().findAll();
      list.removeWhere((c) => c.deletedAt != null);
      list.sort((a, b) => a.name.compareTo(b.name));
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final ttCustomersProvider = StateNotifierProvider<TtCustomersNotifier, AsyncValue<List<TtCustomer>>>((ref) {
  return TtCustomersNotifier(ref.watch(ttIsarServiceProvider));
});

final ttSuppliersProvider = FutureProvider<List<TtSupplier>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttSuppliers.where().findAll();
  list.removeWhere((s) => s.deletedAt != null);
  list.sort((a, b) => a.name.compareTo(b.name));
  return list;
});

final ttLoyaltyRulesProvider = FutureProvider<List<TtLoyaltyRule>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  return await db.ttLoyaltyRules.where().findAll();
});

final ttExpenseCategoriesProvider = FutureProvider<List<TtExpenseCategory>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttExpenseCategorys.where().findAll();
  list.removeWhere((c) => c.deletedAt != null);
  list.sort((a, b) => a.name.compareTo(b.name));
  return list;
});

class TtSalesNotifier extends StateNotifier<AsyncValue<List<TtSalesInvoice>>> {
  final TtIsarService _isarService;

  TtSalesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadSales();
  }

  Future<void> loadSales() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final list = await db.ttSalesInvoices.where().sortBySaleDateDesc().findAll();
      for (final s in list) {
        await s.customer.load();
      }
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Tạo hóa đơn bán: giảm tồn kho theo lô FIFO, ghi nhận giá vốn,
  /// tăng công nợ khách, tích điểm thưởng.
  Future<TtSalesInvoice> createSale(
    TtSalesInvoice invoice,
    List<TtSalesItem> items,
    List<TtCustomer> buyers,
  ) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.ttSalesInvoices.put(invoice);
      if (invoice.customer.value != null) {
        await invoice.customer.save();
      }
      for (final d in items) {
        await db.ttSalesItems.put(d);
        await d.invoice.save();
        await d.product.save();
        // Giảm tồn lô
        if (d.lotId.isNotEmpty) {
          final lot = await db.ttStockLots.where().lotIdEqualTo(d.lotId).findFirst();
          if (lot != null) {
            lot.quantityOut += d.quantity;
            lot.quantityRemaining -= d.quantity;
            await db.ttStockLots.put(lot);
          }
        }
        // Ghi nhận movement SALE
        await db.ttStockMovements.put(TtStockMovement()
          ..movementId = DateTime.now().microsecondsSinceEpoch.toString()
          ..product.value = d.product.value
          ..movementType = TtMovementType.SALE
          ..referenceId = invoice.invoiceNumber
          ..quantity = -d.quantity
          ..unitCost = d.costPrice
          ..totalCost = -d.amount);
      }
      // Công nợ khách
      if (invoice.customer.value != null) {
        final c = invoice.customer.value!;
        c.totalPurchase += invoice.totalAmount;
        c.totalPayment += invoice.paidAmount;
        c.currentDebt += invoice.debtAmount;
        // Tích điểm
        final rules = await db.ttLoyaltyRules.where().findAll();
        if (rules.isNotEmpty) {
          final rule = rules.firstWhere((r) => r.isActive, orElse: () => rules.first);
          if (rule.amountPerPoint > 0 && invoice.totalAmount >= rule.minimumInvoice) {
            final points = (invoice.totalAmount / rule.amountPerPoint).floorToDouble();
            if (points > 0) {
              c.loyaltyPoint += points;
              await db.ttLoyaltyTransactions.put(TtLoyaltyTransaction()
                ..loyaltyTxId = DateTime.now().microsecondsSinceEpoch.toString()
                ..customer.value = c
                ..invoiceId = invoice.invoiceId
                ..type = TtLoyaltyType.EARN
                ..points = points
                ..balanceAfter = c.loyaltyPoint
                ..description = 'Tích điểm từ HĐ ${invoice.invoiceNumber}');
            }
          }
        }
        await db.ttCustomers.put(c);
      }
      for (final b in buyers) {
        await db.ttCustomers.put(b);
      }
    });
    await loadSales();
    return invoice;
  }
}

final ttSalesProvider = StateNotifierProvider<TtSalesNotifier, AsyncValue<List<TtSalesInvoice>>>((ref) {
  return TtSalesNotifier(ref.watch(ttIsarServiceProvider));
});

class TtPurchasesNotifier extends StateNotifier<AsyncValue<List<TtPurchaseInvoice>>> {
  final TtIsarService _isarService;

  TtPurchasesNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadPurchases();
  }

  Future<void> loadPurchases() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final list = await db.ttPurchaseInvoices.where().sortByPurchaseDateDesc().findAll();
      for (final p in list) {
        await p.supplier.load();
      }
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Tạo phiếu nhập: tạo lô tồn kho, cộng tồn, tăng công nợ NCC.
  Future<TtPurchaseInvoice> createPurchase(
    TtPurchaseInvoice invoice,
    List<TtPurchaseItem> items,
    List<TtSupplier> suppliers,
  ) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.ttPurchaseInvoices.put(invoice);
      if (invoice.supplier.value != null) {
        await invoice.supplier.save();
      }
      for (final d in items) {
        // Tạo lô
        final lot = TtStockLot()
          ..lotId = '${DateTime.now().microsecondsSinceEpoch}${d.product.value?.id ?? 0}'
          ..lotNumber = 'L${invoice.invoiceNumber}'
          ..purchaseDate = invoice.purchaseDate
          ..expiryDate = d.expiryDate
          ..quantityIn = d.quantity
          ..quantityOut = 0
          ..quantityRemaining = d.quantity
          ..unitCost = d.unitPrice
          ..product.value = d.product.value
          ..supplier.value = invoice.supplier.value;
        await db.ttStockLots.put(lot);
        d.lot.value = lot;
        await d.product.save();
        await d.lot.save();
        await db.ttPurchaseItems.put(d);
        await d.purchaseInvoice.save();
        // Ghi nhận movement PURCHASE
        await db.ttStockMovements.put(TtStockMovement()
          ..movementId = DateTime.now().microsecondsSinceEpoch.toString()
          ..product.value = d.product.value
          ..lot.value = lot
          ..movementType = TtMovementType.PURCHASE
          ..referenceId = invoice.invoiceNumber
          ..quantity = d.quantity
          ..unitCost = d.unitPrice
          ..totalCost = d.amount);
      }
      if (invoice.supplier.value != null) {
        final s = invoice.supplier.value!;
        s.currentDebt += invoice.debtAmount;
        await db.ttSuppliers.put(s);
      }
      for (final s in suppliers) {
        await db.ttSuppliers.put(s);
      }
    });
    await loadPurchases();
    return invoice;
  }
}

final ttPurchasesProvider = StateNotifierProvider<TtPurchasesNotifier, AsyncValue<List<TtPurchaseInvoice>>>((ref) {
  return TtPurchasesNotifier(ref.watch(ttIsarServiceProvider));
});

final ttStockLotsProvider = FutureProvider<List<TtStockLot>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttStockLots.where().findAll();
  for (final l in list) {
    await l.product.load();
    await l.supplier.load();
  }
  list.removeWhere((l) => l.deletedAt != null);
  return list;
});

final ttStockMovementsProvider = FutureProvider<List<TtStockMovement>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttStockMovements.where().sortByCreatedAtDesc().findAll();
  for (final m in list) {
    await m.product.load();
    await m.lot.load();
  }
  return list;
});

final ttStockIssuesProvider = FutureProvider<List<TtStockIssue>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  return await db.ttStockIssues.where().sortByDateDesc().findAll();
});

class TtFinanceNotifier extends StateNotifier<AsyncValue<List<TtReceipt>>> {
  final TtIsarService _isarService;

  TtFinanceNotifier(this._isarService) : super(const AsyncValue.loading()) {
    loadReceipts();
  }

  Future<void> loadReceipts() async {
    try {
      state = const AsyncValue.loading();
      final db = await _isarService.db;
      final list = await db.ttReceipts.where().sortByDateDesc().findAll();
      for (final r in list) {
        await r.customer.load();
        await r.supplier.load();
      }
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReceipt(TtReceipt receipt) async {
    final db = await _isarService.db;
    await db.writeTxn(() async {
      await db.ttReceipts.put(receipt);
      if (receipt.customer.value != null) {
        // Khách trả nợ -> giảm công nợ khách
        receipt.customer.value!.currentDebt -= receipt.amount;
        receipt.customer.value!.totalPayment += receipt.amount;
        await db.ttCustomers.put(receipt.customer.value!);
      }
      if (receipt.supplier.value != null) {
        await db.ttSuppliers.put(receipt.supplier.value!);
      }
    });
    await loadReceipts();
  }
}

final ttFinanceProvider = StateNotifierProvider<TtFinanceNotifier, AsyncValue<List<TtReceipt>>>((ref) {
  return TtFinanceNotifier(ref.watch(ttIsarServiceProvider));
});

final ttExpensesProvider = FutureProvider<List<TtExpense>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttExpenses.where().sortByDateDesc().findAll();
  for (final e in list) {
    await e.category.load();
    await e.supplier.load();
  }
  return list;
});

final ttLoyaltyTxProvider = FutureProvider<List<TtLoyaltyTransaction>>((ref) async {
  final db = await ref.watch(ttIsarServiceProvider).db;
  final list = await db.ttLoyaltyTransactions.where().sortByCreatedAtDesc().findAll();
  for (final t in list) {
    await t.customer.load();
  }
  return list;
});

final ttDashboardProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  ref.watch(ttSalesProvider);
  ref.watch(ttPurchasesProvider);
  ref.watch(ttProductsProvider);
  ref.watch(ttCustomersProvider);
  ref.watch(ttFinanceProvider);
  ref.watch(ttExpensesProvider);
  ref.watch(ttStockLotsProvider);

  final db = await ref.watch(ttIsarServiceProvider).db;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final sales = await db.ttSalesInvoices.where().findAll();
  double todayRevenue = 0, monthRevenue = 0, totalRevenue = 0, todayCollected = 0;
  double todayExpense = 0, monthExpense = 0, todayProfit = 0, monthProfit = 0;
  double monthCOGS = 0, todayCOGS = 0;
  for (final s in sales) {
    if (s.status == TtSaleStatus.CANCELLED) continue;
    totalRevenue += s.totalAmount;
    if (s.saleDate.year == today.year && s.saleDate.month == today.month && s.saleDate.day == today.day) {
      todayRevenue += s.totalAmount;
      todayCollected += s.paidAmount;
      todayCOGS += s.costAmount;
    }
    if (s.saleDate.year == today.year && s.saleDate.month == today.month) {
      monthRevenue += s.totalAmount;
      monthCOGS += s.costAmount;
    }
  }

  final expenses = await db.ttExpenses.where().findAll();
  for (final e in expenses) {
    if (e.date.year == today.year && e.date.month == today.month && e.date.day == today.day) {
      todayExpense += e.amount;
    }
    if (e.date.year == today.year && e.date.month == today.month) {
      monthExpense += e.amount;
    }
  }

  todayProfit = todayRevenue - todayExpense - todayCOGS;
  monthProfit = monthRevenue - monthExpense - monthCOGS;

  double receivable = 0, payable = 0, cashBalance = 0;
  final customers = await db.ttCustomers.where().findAll();
  for (final c in customers) {
    receivable += c.currentDebt;
  }
  final suppliers = await db.ttSuppliers.where().findAll();
  for (final s in suppliers) {
    payable += s.currentDebt;
  }
  final receipts = await db.ttReceipts.where().findAll();
  double totalReceipt = 0;
  for (final r in receipts) {
    totalReceipt += r.amount;
  }
  cashBalance = totalReceipt - monthExpense;
  final totalExpense = expenses.fold<double>(0, (sum, e) => sum + e.amount);
  cashBalance = totalReceipt - totalExpense;

  // Tồn kho & cảnh báo hạn
  final products = await db.ttProducts.where().findAll();
  final lots = await db.ttStockLots.where().findAll();
  double inventoryValue = 0;
  int lowStock = 0, outOfStock = 0;
  Map<int, double> stockMap = {};
  for (final l in lots) {
    stockMap[l.product.value?.id ?? -1] = (stockMap[l.product.value?.id ?? -1] ?? 0) + l.quantityRemaining;
  }
  for (final p in products) {
    final qty = stockMap[p.id] ?? 0;
    inventoryValue += qty * p.defaultPurchasePrice;
    if (qty <= 0) outOfStock++;
    if (p.minStock > 0 && qty < p.minStock) lowStock++;
  }

  int soonExpiring = 0, expired = 0;
  for (final l in lots) {
    final e = l.expiryDate;
    if (e == null) continue;
    if (e.isBefore(now)) {
      expired++;
    } else {
      final diff = e.difference(now).inDays;
      if (diff <= 7) soonExpiring++;
    }
  }

  return {
    'todayRevenue': todayRevenue,
    'monthRevenue': monthRevenue,
    'totalRevenue': totalRevenue,
    'todayCollected': todayCollected,
    'todayExpense': todayExpense,
    'monthExpense': monthExpense,
    'todayProfit': todayProfit,
    'monthProfit': monthProfit,
    'receivable': receivable,
    'payable': payable,
    'cashBalance': cashBalance,
    'inventoryValue': inventoryValue,
    'productCount': products.length,
    'lowStock': lowStock,
    'outOfStock': outOfStock,
    'soonExpiring': soonExpiring,
    'expired': expired,
    'salesCount': sales.length,
    'purchaseCount': (await db.ttPurchaseInvoices.where().count()),
'loyaltyPointOut': customers.fold<double>(0, (s, c) => s + c.loyaltyPoint),
  };
});

/// �?c danh s�ch kh�ch h�ng c� s?n cho dialog/ch?n (ch? n?p xong n?u c?n).
Future<List<TtCustomer>> ttLoadCustomersForUi(WidgetRef ref) async {
  final notifier = ref.read(ttCustomersProvider.notifier);
  final current = ref.read(ttCustomersProvider).value;
  if (current == null) {
    await notifier.loadCustomers();
    return ref.read(ttCustomersProvider).value ?? [];
  }
  return current;
}

/// �?c danh s�ch s?n ph?m c� s?n cho dialog/ch?n (ch? n?p xong n?u c?n).
Future<List<TtProduct>> ttLoadProductsForUi(WidgetRef ref) async {
  final notifier = ref.read(ttProductsProvider.notifier);
  final current = ref.read(ttProductsProvider).value;
  if (current == null) {
    await notifier.loadProducts();
    return ref.read(ttProductsProvider).value ?? [];
  }
  return current;
}

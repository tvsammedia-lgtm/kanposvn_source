import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cafe_table.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_recipe.dart';
import '../models/cafe_order.dart';
import '../models/cafe_inventory.dart';
import '../models/cafe_customer_supplier.dart';
import '../models/cafe_finance_accounting.dart';
import '../services/cafe_isar_service.dart';
import '../services/cafe_neon_sync_service.dart';
import '../services/cafe_backup_restore_service.dart';

final cafeIsarServiceProvider = Provider<CafeIsarService>(
  (ref) => CafeIsarService(),
);
final cafeNeonSyncServiceProvider = Provider<CafeNeonSyncService>(
  (ref) => CafeNeonSyncService(),
);
final cafeBackupRestoreServiceProvider =
    ChangeNotifierProvider<CafeBackupRestoreService>(
      (ref) => CafeBackupRestoreService(),
    );

// --- AREAS & TABLES PROVIDER ---
class CafeTablesNotifier extends StateNotifier<List<CafeTable>> {
  final CafeIsarService _isar;
  CafeTablesNotifier(this._isar) : super([]) {
    loadTables();
  }

  void loadTables() {
    state = _isar.getTables();
  }

  Future<void> setActiveOrder(String tableId, String? orderId) async {
    final index = state.indexWhere((t) => t.id == tableId);
    if (index != -1) {
      final updated = state[index].copyWith(activeOrderId: orderId);
      await _isar.saveTable(updated);
      loadTables();
    }
  }

  static const _sentinel = Object();

  Future<void> updateTableStatus(
    String tableId,
    TableStatus status, {
    Object? customerInfo = _sentinel,
  }) async {
    final index = state.indexWhere((t) => t.id == tableId);
    if (index != -1) {
      final updated = state[index].copyWith(
        status: status,
        customerInfo: customerInfo == _sentinel
            ? state[index].customerInfo
            : customerInfo as TableCustomerInfo?,
      );
      await _isar.saveTable(updated);
      loadTables();
    }
  }

  Future<void> clearTable(String tableId) async {
    final index = state.indexWhere((t) => t.id == tableId);
    if (index != -1) {
      final table = state[index];
      final updated = CafeTable(
        id: table.id,
        name: table.name,
        areaId: table.areaId,
        areaName: table.areaName,
        seatCount: table.seatCount,
        status: TableStatus.trong,
      );
      await _isar.saveTable(updated);
      loadTables();
    }
  }

  Future<void> moveTable(String sourceTableId, String targetTableId) async {
    final sourceIndex = state.indexWhere((t) => t.id == sourceTableId);
    final targetIndex = state.indexWhere((t) => t.id == targetTableId);

    if (sourceIndex != -1 && targetIndex != -1) {
      final source = state[sourceIndex];
      final target = state[targetIndex];

      final newTarget = target.copyWith(
        status: TableStatus.coKhach,
        customerInfo: source.customerInfo,
        activeOrderId: source.activeOrderId,
      );

      final newSource = source.copyWith(
        status: TableStatus.trong,
        customerInfo: null,
        activeOrderId: null,
      );

      await _isar.saveTable(newTarget);
      await _isar.saveTable(newSource);
      loadTables();
    }
  }

  Future<void> mergeTables(String tableId1, String tableId2) async {
    final index1 = state.indexWhere((t) => t.id == tableId1);
    final index2 = state.indexWhere((t) => t.id == tableId2);

    if (index1 != -1 && index2 != -1) {
      final t1 = state[index1];
      final t2 = state[index2];

      double combinedTotal =
          (t1.customerInfo?.currentTotal ?? 0) +
          (t2.customerInfo?.currentTotal ?? 0);
      int combinedGuests =
          (t1.customerInfo?.guestCount ?? 1) +
          (t2.customerInfo?.guestCount ?? 1);

      final newT1 = t1.copyWith(
        name: '${t1.name} + ${t2.name}',
        customerInfo: TableCustomerInfo(
          customerName: t1.customerInfo?.customerName ?? 'Khách ghép',
          guestCount: combinedGuests,
          checkInTime: t1.customerInfo?.checkInTime ?? DateTime.now(),
          currentTotal: combinedTotal,
        ),
      );

      final newT2 = t2.copyWith(status: TableStatus.trong, customerInfo: null);

      await _isar.saveTable(newT1);
      await _isar.saveTable(newT2);
      loadTables();
    }
  }
}

final cafeTablesProvider =
    StateNotifierProvider<CafeTablesNotifier, List<CafeTable>>((ref) {
      return CafeTablesNotifier(ref.watch(cafeIsarServiceProvider));
    });

final cafeAreasProvider = Provider<List<CafeArea>>((ref) {
  return ref.watch(cafeIsarServiceProvider).getAreas();
});

// --- MENU PROVIDERS ---
final cafeCategoriesProvider = Provider<List<CafeCategory>>((ref) {
  return ref.watch(cafeIsarServiceProvider).getCategories();
});

class CafeMenuNotifier extends StateNotifier<List<CafeMenuItem>> {
  final CafeIsarService _isar;
  CafeMenuNotifier(this._isar) : super([]) {
    loadMenu();
  }

  void loadMenu() {
    state = _isar.getMenuItems();
  }

  Future<void> saveMenuItem(CafeMenuItem item) async {
    await _isar.saveMenuItem(item);
    loadMenu();
  }
}

final cafeMenuProvider =
    StateNotifierProvider<CafeMenuNotifier, List<CafeMenuItem>>((ref) {
      return CafeMenuNotifier(ref.watch(cafeIsarServiceProvider));
    });

final cafeRecipesProvider = Provider<List<CafeRecipe>>((ref) {
  return ref.watch(cafeIsarServiceProvider).getRecipes();
});

// --- CURRENT POS ORDER CART PROVIDER ---
class CafePosCartNotifier extends StateNotifier<CafeOrder> {
  final CafeIsarService _isar;

  CafePosCartNotifier(this._isar)
    : super(
        CafeOrder(
          id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
          orderCode:
              'HD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
          items: [],
        ),
      );

  Future<void> startNewOrder({
    String? tableId,
    String? tableName,
    OrderType type = OrderType.taiBan,
  }) async {
    state = CafeOrder(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      orderCode:
          'HD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      tableId: tableId,
      tableName: tableName,
      orderType: type,
      items: [],
      sellerName: state.sellerName,
      occupiedAt: tableId != null ? DateTime.now() : null,
    );
    if (tableId != null) {
      await _save();
    }
  }

  void loadOrder(CafeOrder order) {
    state = order;
  }

  Future<void> _save() async {
    await _isar.saveOrder(state);
  }

  Future<void> addItem(
    CafeMenuItem item, {
    MenuItemSize? size,
    List<MenuItemTopping>? toppings,
    int quantity = 1,
    String note = '',
  }) async {
    final selectedSize =
        size ??
        (item.sizes.isNotEmpty
            ? item.sizes.first
            : MenuItemSize(name: 'M', extraPrice: 0));
    final selectedToppings = toppings ?? [];

    final existingIndex = state.items.indexWhere(
      (i) =>
          i.menuItemId == item.id &&
          i.selectedSize.name == selectedSize.name &&
          i.note == note,
    );

    List<CafeOrderItem> updatedItems = List.from(state.items);
    if (existingIndex != -1) {
      final existing = updatedItems[existingIndex];
      updatedItems[existingIndex] = existing.copyWith(
        quantity: existing.quantity + quantity,
      );
    } else {
      updatedItems.add(
        CafeOrderItem(
          id: 'ITEM-${DateTime.now().millisecondsSinceEpoch}-${updatedItems.length}',
          menuItemId: item.id,
          menuItemName: item.name,
          selectedSize: selectedSize,
          selectedToppings: selectedToppings,
          quantity: quantity,
          unitPrice: item.basePrice,
          note: note,
        ),
      );
    }

    state = state.copyWith(items: updatedItems);
    if (state.tableId != null) await _save();
  }

  Future<void> removeItem(int index) async {
    List<CafeOrderItem> updatedItems = List.from(state.items);
    if (index >= 0 && index < updatedItems.length) {
      updatedItems.removeAt(index);
      state = state.copyWith(items: updatedItems);
      if (state.tableId != null) await _save();
    }
  }

  Future<void> updateQuantity(int index, int delta) async {
    List<CafeOrderItem> updatedItems = List.from(state.items);
    if (index >= 0 && index < updatedItems.length) {
      final item = updatedItems[index];
      final newQty = item.quantity + delta;
      if (newQty <= 0) {
        updatedItems.removeAt(index);
      } else {
        updatedItems[index] = item.copyWith(quantity: newQty);
      }
      state = state.copyWith(items: updatedItems);
      if (state.tableId != null) await _save();
    }
  }

  void setDiscounts({
    double percent = 0,
    double amount = 0,
    String voucher = '',
  }) {
    state = state.copyWith(
      discountPercent: percent,
      discountAmount: amount,
      voucherCode: voucher,
    );
  }

  void setOrderType(OrderType type) {
    state = state.copyWith(orderType: type);
  }

  void setCustomer(String name, String phone) {
    state = state.copyWith(customerName: name, customerPhone: phone);
  }

  void setDelivery(DeliveryPartner partner, String address, double fee) {
    state = state.copyWith(
      orderType: OrderType.giaoHang,
      deliveryPartner: partner,
      deliveryAddress: address,
      shippingFee: fee,
    );
  }

  Future<CafeOrder> checkout(PaymentMethod method, WidgetRef ref) async {
    final completedOrder = state.copyWith(
      status: OrderStatus.daThanhToan,
      paymentMethod: method,
      paidAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Save order
    await _isar.saveOrder(completedOrder);

    // Auto deduct inventory based on Recipe
    await _isar.deductInventoryForOrder(completedOrder);

    // Record cash revenue
    await _isar.saveCashTransaction(
      CashTransaction(
        id: 'CTX-${DateTime.now().millisecondsSinceEpoch}',
        title: 'Doanh thu đơn ${completedOrder.orderCode}',
        type: 'INCOME',
        category: 'Doanh thu bán hàng',
        amount: completedOrder.grandTotal,
        paymentMethod: method.label,
        performerName: completedOrder.sellerName,
      ),
    );

    // Update table status if table order
    if (completedOrder.tableId != null) {
      ref
          .read(cafeTablesProvider.notifier)
          .setActiveOrder(completedOrder.tableId!, null);
      ref
          .read(cafeTablesProvider.notifier)
          .updateTableStatus(
            completedOrder.tableId!,
            TableStatus.daThanhToan,
            customerInfo: null,
          );
    }

    // Refresh inventory & finance
    ref.read(cafeInventoryProvider.notifier).loadInventory();
    ref.read(cafeOrdersProvider.notifier).loadOrders();

    // Trigger sync
    ref.read(cafeNeonSyncServiceProvider).triggerSync();

    // Reset cart
    startNewOrder();

    return completedOrder;
  }
}

final cafePosCartProvider =
    StateNotifierProvider<CafePosCartNotifier, CafeOrder>((ref) {
      return CafePosCartNotifier(ref.watch(cafeIsarServiceProvider));
    });

// --- ORDERS PROVIDER ---
class CafeOrdersNotifier extends StateNotifier<List<CafeOrder>> {
  final CafeIsarService _isar;
  CafeOrdersNotifier(this._isar) : super([]) {
    loadOrders();
  }

  void loadOrders() {
    state = _isar.getOrders();
  }

  List<CafeOrder> getOrdersByDateRange(DateTime from, DateTime to) {
    if (state.isEmpty) return [];
    final endOfDay = DateTime(to.year, to.month, to.day, 23, 59, 59);
    return state.where((o) => o.createdAt.isAfter(from) && o.createdAt.isBefore(endOfDay)).toList();
  }

  CafeOrder? getOrderByCode(String orderCode) {
    if (state.isEmpty) return null;
    try {
      return state.firstWhere((o) => o.orderCode == orderCode);
    } catch (_) {
      return null;
    }
  }
}

final cafeOrdersProvider =
    StateNotifierProvider<CafeOrdersNotifier, List<CafeOrder>>((ref) {
      return CafeOrdersNotifier(ref.watch(cafeIsarServiceProvider));
    });

// --- INVENTORY PROVIDER ---
class CafeInventoryNotifier extends StateNotifier<List<InventoryItem>> {
  final CafeIsarService _isar;
  CafeInventoryNotifier(this._isar) : super([]) {
    loadInventory();
  }

  void loadInventory() {
    state = _isar.getInventoryItems();
  }

  Future<void> saveItem(InventoryItem item) async {
    await _isar.saveInventoryItem(item);
    loadInventory();
  }
}

final cafeInventoryProvider =
    StateNotifierProvider<CafeInventoryNotifier, List<InventoryItem>>((ref) {
      return CafeInventoryNotifier(ref.watch(cafeIsarServiceProvider));
    });

final cafeInventoryTransactionsProvider = Provider<List<InventoryTransaction>>((
  ref,
) {
  return ref.watch(cafeIsarServiceProvider).getInventoryTransactions();
});

// --- CUSTOMERS & SUPPLIERS PROVIDERS ---
class CafeCustomersNotifier extends StateNotifier<List<CafeCustomer>> {
  final CafeIsarService _isar;
  CafeCustomersNotifier(this._isar) : super([]) {
    load();
  }

  void load() {
    state = _isar.getCustomers();
  }

  Future<void> save(CafeCustomer customer) async {
    await _isar.saveCustomer(customer);
    load();
  }

  Future<void> delete(String id) async {
    await _isar.deleteCustomer(id);
    load();
  }
}

final cafeCustomersProvider =
    StateNotifierProvider<CafeCustomersNotifier, List<CafeCustomer>>((ref) {
      return CafeCustomersNotifier(ref.watch(cafeIsarServiceProvider));
    });

class CafeSuppliersNotifier extends StateNotifier<List<CafeSupplier>> {
  final CafeIsarService _isar;
  CafeSuppliersNotifier(this._isar) : super([]) {
    load();
  }

  void load() {
    state = _isar.getSuppliers();
  }

  Future<void> save(CafeSupplier supplier) async {
    await _isar.saveSupplier(supplier);
    load();
  }

  Future<void> delete(String id) async {
    await _isar.deleteSupplier(id);
    load();
  }
}

final cafeSuppliersProvider =
    StateNotifierProvider<CafeSuppliersNotifier, List<CafeSupplier>>((ref) {
      return CafeSuppliersNotifier(ref.watch(cafeIsarServiceProvider));
    });

// --- FINANCE PROVIDERS ---
class CafeCashTransactionsNotifier
    extends StateNotifier<List<CashTransaction>> {
  final CafeIsarService _isar;
  CafeCashTransactionsNotifier(this._isar) : super([]) {
    load();
  }

  void load() {
    state = _isar.getCashTransactions();
  }

  Future<void> save(CashTransaction tx) async {
    await _isar.saveCashTransaction(tx);
    load();
  }

  Future<void> delete(String id) async {
    await _isar.deleteCashTransaction(id);
    load();
  }
}

final cafeCashTransactionsProvider =
    StateNotifierProvider<CafeCashTransactionsNotifier, List<CashTransaction>>((
      ref,
    ) {
      return CafeCashTransactionsNotifier(ref.watch(cafeIsarServiceProvider));
    });

// --- ACCOUNTING SUMMARY CALCULATOR ---
final cafeAccountingSummaryProvider = Provider<AccountingSummaryReport>((ref) {
  final orders = ref.watch(cafeOrdersProvider);
  final txs = ref.watch(cafeCashTransactionsProvider);
  final inventory = ref.watch(cafeInventoryProvider);
  final customers = ref.watch(cafeCustomersProvider);
  final suppliers = ref.watch(cafeSuppliersProvider);

  double totalRevenue = orders
      .where((o) => o.status == OrderStatus.daThanhToan)
      .fold(0, (sum, o) => sum + o.grandTotal);

  double totalCostOfGoods = inventory.fold(
    0,
    (sum, inv) => sum + (inv.currentStock * inv.costPrice),
  );

  double totalExpenses = txs
      .where((t) => t.type == 'EXPENSE')
      .fold(0, (sum, t) => sum + t.amount);

  double netProfit = totalRevenue - (totalCostOfGoods * 0.3) - totalExpenses;

  double cashInHand = txs
      .where((t) => t.paymentMethod == 'Tiền mặt')
      .fold(0, (sum, t) => sum + (t.type == 'INCOME' ? t.amount : -t.amount));

  double bankBalance = txs
      .where((t) => t.paymentMethod != 'Tiền mặt')
      .fold(0, (sum, t) => sum + (t.type == 'INCOME' ? t.amount : -t.amount));

  double customerDebts = customers.fold(0, (sum, c) => sum + c.debtAmount);
  double supplierDebts = suppliers.fold(0, (sum, s) => sum + s.debtAmount);
  double inventoryVal = inventory.fold(
    0,
    (sum, i) => sum + (i.currentStock * i.costPrice),
  );

  return AccountingSummaryReport(
    totalRevenue: totalRevenue,
    totalCostOfGoodsSold: totalCostOfGoods * 0.3,
    totalOperatingExpenses: totalExpenses,
    netProfit: netProfit,
    cashInHand: cashInHand < 0 ? 5000000 : cashInHand + 5000000,
    bankBalance: bankBalance < 0 ? 12000000 : bankBalance + 12000000,
    customerDebts: customerDebts,
    inventoryValue: inventoryVal,
    supplierDebts: supplierDebts,
    ownerEquity: 50000000,
  );
});

final cafeTabIndexProvider = StateProvider<int>((ref) => 0);

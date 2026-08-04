import '../../../core/db/database_service.dart';
import '../models/cafe_table.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_recipe.dart';
import '../models/cafe_order.dart';
import '../models/cafe_inventory.dart';
import '../models/cafe_customer_supplier.dart';
import '../models/cafe_finance_accounting.dart';
import '../models/cafe_user_role.dart';
import '../models/cafe_sync_model.dart';

class CafeIsarService {
  final DatabaseService _db = DatabaseService.instance;

  // --- AREAS & TABLES ---
  List<CafeArea> getAreas() {
    final list = _db.getCollection('cafe_areas');
    return list.map((e) => CafeArea.fromJson(e)).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  Future<void> saveArea(CafeArea area) async {
    await _db.saveItem('cafe_areas', area.id, area.toJson());
  }

  List<CafeTable> getTables() {
    final list = _db.getCollection('cafe_tables');
    return list.map((e) => CafeTable.fromJson(e)).toList();
  }

  Future<void> saveTable(CafeTable table) async {
    await _db.saveItem('cafe_tables', table.id, table.toJson());
  }

  Future<void> deleteTable(String id) async {
    await _db.deleteItem('cafe_tables', id);
  }

  Future<void> deleteArea(String id) async {
    final tablesToDelete = getTables().where((t) => t.areaId == id).toList();
    for (final table in tablesToDelete) {
      await deleteTable(table.id);
    }
    await _db.deleteItem('cafe_areas', id);
  }

  // --- MENU CATEGORIES & ITEMS ---
  List<CafeCategory> getCategories() {
    final list = _db.getCollection('cafe_categories');
    return list.map((e) => CafeCategory.fromJson(e)).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  Future<void> saveCategory(CafeCategory category) async {
    await _db.saveItem('cafe_categories', category.id, category.toJson());
  }

  List<CafeMenuItem> getMenuItems() {
    final list = _db.getCollection('cafe_menu_items');
    return list.map((e) => CafeMenuItem.fromJson(e)).toList();
  }

  Future<void> saveMenuItem(CafeMenuItem item) async {
    await _db.saveItem('cafe_menu_items', item.id, item.toJson());
  }

  // --- RECIPES ---
  List<CafeRecipe> getRecipes() {
    final list = _db.getCollection('cafe_recipes');
    return list.map((e) => CafeRecipe.fromJson(e)).toList();
  }

  Future<void> saveRecipe(CafeRecipe recipe) async {
    await _db.saveItem('cafe_recipes', recipe.id, recipe.toJson());
  }

  // --- ORDERS ---
  List<CafeOrder> getOrders() {
    final list = _db.getCollection('cafe_orders');
    final orders = list.map((e) => CafeOrder.fromJson(e)).toList();
    orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  CafeOrder? getOrderById(String id) {
    final item = _db.getById('cafe_orders', id);
    if (item != null) {
      return CafeOrder.fromJson(item);
    }
    return null;
  }

  List<CafeOrder> getOrdersByDateRange(DateTime from, DateTime to) {
    final endOfDay = DateTime(to.year, to.month, to.day, 23, 59, 59);
    final list = _db.getCollection('cafe_orders');
    final orders = list
        .map((e) => CafeOrder.fromJson(e))
        .where((o) => o.createdAt.isAfter(from) && o.createdAt.isBefore(endOfDay))
        .toList();
    orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  CafeOrder? getOrderByCode(String orderCode) {
    final list = _db.getCollection('cafe_orders');
    for (final e in list) {
      final order = CafeOrder.fromJson(e);
      if (order.orderCode == orderCode) return order;
    }
    return null;
  }

  Future<void> saveOrder(CafeOrder order) async {
    await _db.saveItem('cafe_orders', order.id, order.toJson());
  }

  // --- INVENTORY & TRANSACTIONS ---
  List<InventoryItem> getInventoryItems() {
    final list = _db.getCollection('cafe_inventory');
    return list.map((e) => InventoryItem.fromJson(e)).toList();
  }

  Future<void> saveInventoryItem(InventoryItem item) async {
    await _db.saveItem('cafe_inventory', item.id, item.toJson());
  }

  List<InventoryTransaction> getInventoryTransactions() {
    final list = _db.getCollection('cafe_inventory_transactions');
    final items = list.map((e) => InventoryTransaction.fromJson(e)).toList();
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return items;
  }

  Future<void> addInventoryTransaction(InventoryTransaction tx) async {
    await _db.saveItem('cafe_inventory_transactions', tx.id, tx.toJson());
  }

  // Deduct inventory automatically based on Order Recipe
  Future<void> deductInventoryForOrder(CafeOrder order) async {
    final recipes = getRecipes();
    final inventory = getInventoryItems();

    for (var item in order.items) {
      final recipe = recipes.firstWhere(
        (r) => r.menuItemId == item.menuItemId,
        orElse: () => CafeRecipe(
          id: '',
          menuItemId: '',
          menuItemName: '',
          ingredients: [],
        ),
      );

      for (var ing in recipe.ingredients) {
        final invIndex = inventory.indexWhere(
          (inv) => inv.id == ing.inventoryItemId,
        );
        if (invIndex != -1) {
          final invItem = inventory[invIndex];
          final totalQuantityNeeded = ing.quantity * item.quantity;
          final newStock = invItem.currentStock - totalQuantityNeeded;

          final updatedItem = invItem.copyWith(
            currentStock: newStock < 0 ? 0 : newStock,
          );
          await saveInventoryItem(updatedItem);

          await addInventoryTransaction(
            InventoryTransaction(
              id: 'TX-${DateTime.now().millisecondsSinceEpoch}-${ing.inventoryItemId}',
              inventoryItemId: invItem.id,
              inventoryItemName: invItem.name,
              type: InventoryTransactionType.tuDongTruBanHang,
              quantityChange: -totalQuantityNeeded,
              oldStock: invItem.currentStock,
              newStock: updatedItem.currentStock,
              unit: invItem.unit,
              note:
                  'Trừ tự động khi bán đơn ${order.orderCode} (${item.menuItemName} x${item.quantity})',
            ),
          );
        }
      }
    }
  }

  // --- CUSTOMERS & SUPPLIERS ---
  List<CafeCustomer> getCustomers() {
    final list = _db.getCollection('cafe_customers');
    return list.map((e) => CafeCustomer.fromJson(e)).toList();
  }

  Future<void> saveCustomer(CafeCustomer customer) async {
    await _db.saveItem('cafe_customers', customer.id, customer.toJson());
  }

  Future<void> deleteCustomer(String id) async {
    await _db.deleteItem('cafe_customers', id);
  }

  List<CafeSupplier> getSuppliers() {
    final list = _db.getCollection('cafe_suppliers');
    return list.map((e) => CafeSupplier.fromJson(e)).toList();
  }

  Future<void> saveSupplier(CafeSupplier supplier) async {
    await _db.saveItem('cafe_suppliers', supplier.id, supplier.toJson());
  }

  Future<void> deleteSupplier(String id) async {
    await _db.deleteItem('cafe_suppliers', id);
  }

  // --- FINANCE & TRANSACTIONS ---
  List<CashTransaction> getCashTransactions() {
    final list = _db.getCollection('cafe_cash_transactions');
    final items = list.map((e) => CashTransaction.fromJson(e)).toList();
    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return items;
  }

  Future<void> saveCashTransaction(CashTransaction tx) async {
    await _db.saveItem('cafe_cash_transactions', tx.id, tx.toJson());
  }

  Future<void> deleteCashTransaction(String id) async {
    await _db.deleteItem('cafe_cash_transactions', id);
  }

  List<ShiftReport> getShiftReports() {
    final list = _db.getCollection('cafe_shift_reports');
    final items = list.map((e) => ShiftReport.fromJson(e)).toList();
    items.sort((a, b) => b.startTime.compareTo(a.startTime));
    return items;
  }

  Future<void> saveShiftReport(ShiftReport report) async {
    await _db.saveItem('cafe_shift_reports', report.id, report.toJson());
  }

  // --- USERS & ROLES ---
  List<CafeUser> getUsers() {
    final list = _db.getCollection('cafe_users');
    return list.map((e) => CafeUser.fromJson(e)).toList();
  }

  Future<void> saveUser(CafeUser user) async {
    await _db.saveItem('cafe_users', user.id, user.toJson());
  }

  // --- SYNC CONFIG & QUEUE ---
  CafeSyncConfig getSyncConfig() {
    final item = _db.getById('cafe_sync_config', 'default');
    if (item != null) {
      var config = CafeSyncConfig.fromJson(item);
      if (config.vercelApiUrl == 'https://kanposvn-cafe-api.vercel.app') {
        config = config.copyWith(vercelApiUrl: 'https://kanposvn-admin.vercel.app');
      }
      if (config.apiKey == 'kanposvn_secret_token_2026') {
        config = config.copyWith(apiKey: 'kanposvn_sync_2026');
      }
      return config;
    }
    return CafeSyncConfig();
  }

  Future<void> saveSyncConfig(CafeSyncConfig config) async {
    await _db.saveItem(
      'cafe_sync_config',
      'default',
      config.toJson(),
      triggerSync: false,
    );
  }
}

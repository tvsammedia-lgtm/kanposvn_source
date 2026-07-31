import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/isar_models.dart';

class DatabaseService extends ChangeNotifier {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  final _uuid = const Uuid();

  // InMemory Mock DB Storage simulating Isar Collection stores
  final List<UserModel> _users = [];
  final List<AreaModel> _areas = [];
  final List<TableModel> _tables = [];
  final List<CategoryModel> _categories = [];
  final List<ProductModel> _products = [];
  final List<RecipeModel> _recipes = [];
  final List<InventoryItemModel> _inventory = [];
  final List<InventoryTransactionModel> _inventoryTransactions = [];
  final List<CustomerModel> _customers = [];
  final List<SupplierModel> _suppliers = [];
  final List<OrderModel> _orders = [];
  final List<ExpenseModel> _expenses = [];
  final List<DebtModel> _debts = [];
  final List<SyncQueueModel> _syncQueue = [];
  AppSettingsModel _settings = AppSettingsModel();

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    await _loadFromStorage();
    if (_tables.isEmpty && _areas.isEmpty) {
      _seedInitialData();
      _saveToStorage();
    }
    _initialized = true;
  }

  void _seedInitialData() {
    // 0. Users (tài khoản đăng nhập - quản lý qua Admin Web)
    _users.addAll([
      UserModel(id: 'usr_1', username: 'admin', password: '123456', fullName: 'Admin Hệ Thống', role: UserRole.admin, isActive: true),
      UserModel(id: 'usr_2', username: 'quanly', password: '123456', fullName: 'Nguyễn Quản Lý', role: UserRole.manager, isActive: true),
      UserModel(id: 'usr_3', username: 'thungan', password: '123456', fullName: 'Trần Thu Ngân', role: UserRole.cashier, isActive: true),
      UserModel(id: 'usr_4', username: 'phucvu', password: '123456', fullName: 'Lê Phục Vụ', role: UserRole.waiter, isActive: true),
      UserModel(id: 'usr_5', username: 'phache', password: '123456', fullName: 'Phạm Pha Chế', role: UserRole.barista, isActive: true),
      UserModel(id: 'usr_6', username: 'ketoan', password: '123456', fullName: 'Hoàng Kế Toán', role: UserRole.accountant, isActive: true),
      UserModel(id: 'usr_7', username: 'chuchu', password: '123456', fullName: 'Đỗ Chủ Quán', role: UserRole.owner, isActive: true),
    ]);

    // 1. Areas
    final area1 = AreaModel(id: 'area_1', name: 'Tầng 1', displayOrder: 1);
    final area2 = AreaModel(id: 'area_2', name: 'Tầng 2', displayOrder: 2);
    final area3 = AreaModel(id: 'area_3', name: 'Sân vườn', displayOrder: 3);
    _areas.addAll([area1, area2, area3]);

    // 2. Tables matching PRD Section 5
    _tables.addAll([
      TableModel(id: 'tbl_1', areaId: area1.id, areaName: area1.name, name: 'Bàn B1', seats: 4, status: TableStatus.empty),
      TableModel(
        id: 'tbl_2',
        areaId: area1.id,
        areaName: area1.name,
        name: 'Bàn B2',
        seats: 4,
        status: TableStatus.occupied,
        currentCustomerName: 'Nguyễn Văn A',
        customerCount: 3,
        occupiedAt: DateTime.now().subtract(const Duration(minutes: 45)),
        currentOrderId: 'ord_sample_1',
      ),
      TableModel(id: 'tbl_3', areaId: area1.id, areaName: area1.name, name: 'Bàn B3', seats: 2, status: TableStatus.ordering),
      TableModel(id: 'tbl_4', areaId: area1.id, areaName: area1.name, name: 'Bàn B4', seats: 6, status: TableStatus.pendingPayment),
      TableModel(id: 'tbl_5', areaId: area2.id, areaName: area2.name, name: 'Bàn B5', seats: 4, status: TableStatus.serving),
      TableModel(id: 'tbl_6', areaId: area2.id, areaName: area2.name, name: 'Bàn B6', seats: 4, status: TableStatus.cleaning),
      TableModel(id: 'tbl_7', areaId: area2.id, areaName: area2.name, name: 'Bàn B7', seats: 8, status: TableStatus.reserved),
      TableModel(id: 'tbl_8', areaId: area3.id, areaName: area3.name, name: 'Bàn B8', seats: 4, status: TableStatus.empty),
      TableModel(id: 'tbl_9', areaId: area3.id, areaName: area3.name, name: 'Bàn B9', seats: 4, status: TableStatus.empty),
      TableModel(id: 'tbl_10', areaId: area3.id, areaName: area3.name, name: 'Bàn B10', seats: 6, status: TableStatus.empty),
    ]);

    // 3. Categories matching PRD Section 10
    final catCafe = CategoryModel(id: 'cat_cafe', name: 'Cafe', iconName: 'local_cafe', displayOrder: 1);
    final catTea = CategoryModel(id: 'cat_tea', name: 'Trà Sữa', iconName: 'emoji_food_beverage', displayOrder: 2);
    final catSmoothie = CategoryModel(id: 'cat_smoothie', name: 'Sinh Tố', iconName: 'local_bar', displayOrder: 3);
    final catJuice = CategoryModel(id: 'cat_juice', name: 'Nước Ép', iconName: 'local_drink', displayOrder: 4);
    final catBakery = CategoryModel(id: 'cat_bakery', name: 'Bánh Ngọt', iconName: 'cake', displayOrder: 5);
    _categories.addAll([catCafe, catTea, catSmoothie, catJuice, catBakery]);

    // Toppings matching PRD Section 12
    final toppingsList = [
      ProductTopping(id: 'top_1', name: 'Trân Châu', price: 5000),
      ProductTopping(id: 'top_2', name: 'Pudding', price: 8000),
      ProductTopping(id: 'top_3', name: 'Kem Cheese', price: 10000),
      ProductTopping(id: 'top_4', name: 'Thạch Trái Cây', price: 5000),
      ProductTopping(id: 'top_5', name: 'Bánh Flan', price: 10000),
      ProductTopping(id: 'top_6', name: 'Foam Milk', price: 8000),
    ];

    final sizesList = [
      ProductSize(name: 'S', extraPrice: 0),
      ProductSize(name: 'M', extraPrice: 5000),
      ProductSize(name: 'L', extraPrice: 10000),
    ];

    // 4. Products matching PRD Section 10 & 11
    _products.addAll([
      ProductModel(
        id: 'prod_1',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        code: 'CF01',
        name: 'Cafe Đen Đá',
        basePrice: 25000,
        description: 'Cafe pha phin đậm đà truyền thống',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_2',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        code: 'CF02',
        name: 'Cafe Sữa Đá',
        basePrice: 29000,
        description: 'Cafe phin kết hợp sữa đặc Ngôi Sao Phương Nam',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_3',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        code: 'CF03',
        name: 'Bạc Xỉu Sài Gòn',
        basePrice: 32000,
        description: 'Nhiều sữa ít cafe thơm béo',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_4',
        categoryId: catCafe.id,
        categoryName: catCafe.name,
        code: 'CF04',
        name: 'Cappuccino',
        basePrice: 45000,
        description: 'Espresso cùng bọt sữa siêu mịn',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_5',
        categoryId: catTea.id,
        categoryName: catTea.name,
        code: 'TS01',
        name: 'Trà Sữa Truyền Thống',
        basePrice: 35000,
        description: 'Trà đen đậm vị hòa quyện sữa béo',
        sizes: sizesList,
        toppings: toppingsList,
      ),
      ProductModel(
        id: 'prod_6',
        categoryId: catTea.id,
        categoryName: catTea.name,
        code: 'TS02',
        name: 'Trà Sữa Matcha Nhật',
        basePrice: 42000,
        description: 'Bột matcha Uji cao cấp nhập khẩu',
        sizes: sizesList,
        toppings: toppingsList,
      ),
      ProductModel(
        id: 'prod_7',
        categoryId: catTea.id,
        categoryName: catTea.name,
        code: 'TS03',
        name: 'Trà Sữa Oolong Kem Cheese',
        basePrice: 45000,
        description: 'Trà Oolong nướng phủ lớp phô mai béo ngậy',
        sizes: sizesList,
        toppings: toppingsList,
      ),
      ProductModel(
        id: 'prod_8',
        categoryId: catSmoothie.id,
        categoryName: catSmoothie.name,
        code: 'ST01',
        name: 'Sinh Tố Bơ Đắk Lắk',
        basePrice: 48000,
        description: 'Bơ sáp dẻo quánh xay nguyên chất',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_9',
        categoryId: catSmoothie.id,
        categoryName: catSmoothie.name,
        code: 'ST02',
        name: 'Sinh Tố Dâu Tây',
        basePrice: 45000,
        description: 'Dâu Đà Lạt tươi xay mứt ngọt thanh',
        sizes: sizesList,
        toppings: [],
      ),
      ProductModel(
        id: 'prod_10',
        categoryId: catBakery.id,
        categoryName: catBakery.name,
        code: 'BN01',
        name: 'Bánh Tiramisu Phô Mai',
        basePrice: 38000,
        description: 'Bánh đắng ngọt hài hòa hương cafe',
        sizes: [],
        toppings: [],
      ),
    ]);

    // 5. Inventory Items (Nguyên liệu kho)
    final inv1 = InventoryItemModel(id: 'inv_1', name: 'Hạt Cafe Robusta', sku: 'NL01', unit: 'kg', currentStock: 15.5, minStock: 3.0, costPrice: 180000, supplierName: 'Kho Cafe Buôn Ma Thuột');
    final inv2 = InventoryItemModel(id: 'inv_2', name: 'Sữa Đặc Phương Nam', sku: 'NL02', unit: 'lon', currentStock: 48.0, minStock: 10.0, costPrice: 22000, supplierName: 'Vinamilk VN');
    final inv3 = InventoryItemModel(id: 'inv_3', name: 'Trân Châu Đen', sku: 'NL03', unit: 'kg', currentStock: 8.0, minStock: 2.0, costPrice: 45000, supplierName: 'Nguyên Liệu Trà Sữa');
    final inv4 = InventoryItemModel(id: 'inv_4', name: 'Bột Matcha Nhật', sku: 'NL04', unit: 'kg', currentStock: 1.2, minStock: 2.0, costPrice: 650000, supplierName: 'Import Japan'); // Low stock
    final inv5 = InventoryItemModel(id: 'inv_5', name: 'Bơ Sáp Tươi', sku: 'NL05', unit: 'kg', currentStock: 4.5, minStock: 5.0, costPrice: 60000, supplierName: 'Nông Sản Đắk Lắk'); // Low stock
    _inventory.addAll([inv1, inv2, inv3, inv4, inv5]);

    // 6. Recipes matching PRD Section 22
    _recipes.addAll([
      RecipeModel(
        id: 'rec_1',
        productId: 'prod_2', // Cafe Sữa
        productName: 'Cafe Sữa Đá',
        ingredients: [
          RecipeIngredient(inventoryItemId: inv1.id, ingredientName: inv1.name, quantityNeeded: 0.025, unit: 'kg'),
          RecipeIngredient(inventoryItemId: inv2.id, ingredientName: inv2.name, quantityNeeded: 0.1, unit: 'lon'),
        ],
      ),
      RecipeModel(
        id: 'rec_2',
        productId: 'prod_5', // Trà Sữa Truyền Thống
        productName: 'Trà Sữa Truyền Thống',
        ingredients: [
          RecipeIngredient(inventoryItemId: inv3.id, ingredientName: inv3.name, quantityNeeded: 0.05, unit: 'kg'),
        ],
      ),
      RecipeModel(
        id: 'rec_3',
        productId: 'prod_8', // Sinh tố Bơ
        productName: 'Sinh Tố Bơ Đắk Lắk',
        ingredients: [
          RecipeIngredient(inventoryItemId: inv5.id, ingredientName: inv5.name, quantityNeeded: 0.2, unit: 'kg'),
          RecipeIngredient(inventoryItemId: inv2.id, ingredientName: inv2.name, quantityNeeded: 0.08, unit: 'lon'),
        ],
      ),
    ]);

    // 7. Customers & Suppliers
    final cust1 = CustomerModel(id: 'cust_1', name: 'Nguyễn Văn A', phone: '0908123456', points: 150, membershipTier: 'Vàng', debt: 0, totalSpent: 1250000);
    final cust2 = CustomerModel(id: 'cust_2', name: 'Trần Thị B', phone: '0912987654', points: 45, membershipTier: 'Đồng', debt: 85000, totalSpent: 340000);
    _customers.addAll([cust1, cust2]);

    _suppliers.addAll([
      SupplierModel(id: 'sup_1', name: 'Kho Cafe Buôn Ma Thuột', phone: '02623555888', company: 'Công ty Cafe Tây Nguyên', debt: 1500000),
      SupplierModel(id: 'sup_2', name: 'Vinamilk Việt Nam', phone: '1900636979', company: 'Tập đoàn Vinamilk', debt: 0),
    ]);

    // 8. Sample Active & Past Orders
    final sampleOrder1 = OrderModel(
      id: 'ord_sample_1',
      orderCode: 'HD001',
      type: OrderType.atTable,
      status: 'SERVED',
      tableId: 'tbl_2',
      tableName: 'Bàn B2',
      areaName: 'Tầng 1',
      customerName: 'Nguyễn Văn A',
      customerPhone: '0908123456',
      items: [
        OrderItemModel(productId: 'prod_2', productName: 'Cafe Sữa Đá', sizeName: 'M', sizeExtraPrice: 5000, unitPrice: 29000, quantity: 2),
        OrderItemModel(
          productId: 'prod_5',
          productName: 'Trà Sữa Truyền Thống',
          sizeName: 'L',
          sizeExtraPrice: 10000,
          selectedToppings: [toppingsList[0]], // Trân Châu
          unitPrice: 35000,
          quantity: 1,
        ),
      ],
      subtotal: 118000,
      discountPercent: 0,
      totalAmount: 118000,
      paymentMethod: 'CASH',
      paymentStatus: 'UNPAID',
    );

    final completedOrder = OrderModel(
      id: 'ord_sample_completed',
      orderCode: 'HD000',
      type: OrderType.atTable,
      status: 'COMPLETED',
      tableId: 'tbl_1',
      tableName: 'Bàn B1',
      areaName: 'Tầng 1',
      items: [
        OrderItemModel(productId: 'prod_7', productName: 'Trà Sữa Oolong Kem Cheese', sizeName: 'M', sizeExtraPrice: 5000, unitPrice: 45000, quantity: 2),
      ],
      subtotal: 100000,
      discountPercent: 10,
      discountAmount: 10000,
      totalAmount: 90000,
      paymentMethod: 'VIETQR',
      paymentStatus: 'PAID',
      paidAt: DateTime.now().subtract(const Duration(hours: 2)),
      isSynced: true,
    );

    _orders.addAll([sampleOrder1, completedOrder]);

    // 9. Initial Expenses
    _expenses.addAll([
      ExpenseModel(id: 'exp_1', title: 'Nhập hạt cafe Robusta', categoryName: 'Nhập hàng', type: 'EXPENSE', amount: 900000, supplierOrCustomerName: 'Kho Cafe Buôn Ma Thuột'),
      ExpenseModel(id: 'exp_2', title: 'Tiền điện tháng này', categoryName: 'Điện nước', type: 'EXPENSE', amount: 2400000),
      ExpenseModel(id: 'exp_3', title: 'Thu nợ khách Trần Thị B', categoryName: 'Thu nợ', type: 'INCOME', amount: 50000, supplierOrCustomerName: 'Trần Thị B'),
    ]);

    // 10. Initial Sync Queue Items
    _syncQueue.add(
      SyncQueueModel(
        id: _uuid.v4(),
        tableName: 'Orders',
        recordId: sampleOrder1.id,
        action: 'CREATE',
        payload: sampleOrder1.toJson(),
        status: 'PENDING',
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    );
  }

  // Getters
  List<AreaModel> get areas => List.unmodifiable(_areas);
  List<TableModel> get tables => List.unmodifiable(_tables);
  List<CategoryModel> get categories => List.unmodifiable(_categories);
  List<ProductModel> get products => List.unmodifiable(_products);
  List<RecipeModel> get recipes => List.unmodifiable(_recipes);
  List<InventoryItemModel> get inventory => List.unmodifiable(_inventory);
  List<CustomerModel> get customers => List.unmodifiable(_customers);
  List<SupplierModel> get suppliers => List.unmodifiable(_suppliers);
  List<OrderModel> get orders => List.unmodifiable(_orders);
  List<ExpenseModel> get expenses => List.unmodifiable(_expenses);
  List<DebtModel> get debts => List.unmodifiable(_debts);
  List<SyncQueueModel> get syncQueue => List.unmodifiable(_syncQueue);
  List<UserModel> get users => List.unmodifiable(_users);
  AppSettingsModel get settings => _settings;

  // CRUD & Operations

  // Area CRUD
  void addArea(AreaModel area) {
    _areas.add(area);
    _enqueueSync('Areas', area.id, 'CREATE', area.toJson());
    _saveToStorage();
    notifyListeners();
  }

  void updateArea(AreaModel area) {
    int idx = _areas.indexWhere((a) => a.id == area.id);
    if (idx != -1) {
      _areas[idx] = area;
      _enqueueSync('Areas', area.id, 'UPDATE', area.toJson());
      _saveToStorage();
    notifyListeners();
    }
  }

  void deleteArea(String areaId) {
    _tables.removeWhere((t) => t.areaId == areaId);
    _areas.removeWhere((a) => a.id == areaId);
    _enqueueSync('Areas', areaId, 'DELETE', {'id': areaId});
    _saveToStorage();
    notifyListeners();
  }

  // Table CRUD
  void addTable(TableModel table) {
    _tables.add(table);
    _enqueueSync('Tables', table.id, 'CREATE', table.toJson());
    _saveToStorage();
    notifyListeners();
  }

  void deleteTable(String tableId) {
    _tables.removeWhere((t) => t.id == tableId);
    _enqueueSync('Tables', tableId, 'DELETE', {'id': tableId});
    _saveToStorage();
    notifyListeners();
  }

  // User Auth
  UserModel? findUserByUsername(String username) {
    try {
      return _users.firstWhere((u) => u.username == username && u.isActive);
    } catch (_) {
      return null;
    }
  }

  // Find Order by Code (for QR scan lookup)
  OrderModel? findOrderByCode(String orderCode) {
    try {
      return _orders.firstWhere((o) => o.orderCode == orderCode);
    } catch (_) {
      return null;
    }
  }

  // Find unpaid order by table ID
  OrderModel? findUnpaidOrderByTable(String tableId) {
    try {
      return _orders.firstWhere((o) => o.tableId == tableId && o.paymentStatus == 'UNPAID');
    } catch (_) {
      return null;
    }
  }

  // Get all orders for a table
  List<OrderModel> getOrdersByTable(String tableId) {
    return _orders.where((o) => o.tableId == tableId).toList();
  }

  void updateUser(UserModel user) {
    int idx = _users.indexWhere((u) => u.id == user.id);
    if (idx != -1) {
      _users[idx] = user;
      _enqueueSync('Users', user.id, 'UPDATE', user.toJson());
    }
    notifyListeners();
  }

  void updateCustomer(CustomerModel customer) {
    int idx = _customers.indexWhere((c) => c.id == customer.id);
    if (idx != -1) {
      _customers[idx] = customer;
    } else {
      _customers.add(customer);
    }
    _enqueueSync('Customers', customer.id, 'CREATE', customer.toJson());
    _saveToStorage();
    notifyListeners();
  }

  // Update Table Status
  void updateTable(TableModel table) {
    int idx = _tables.indexWhere((t) => t.id == table.id);
    if (idx != -1) {
      _tables[idx] = table;
      _enqueueSync('Tables', table.id, 'UPDATE', table.toJson());
      _saveToStorage();
    notifyListeners();
    }
  }

  // Add/Update Order
  void saveOrder(OrderModel order) {
    int idx = _orders.indexWhere((o) => o.id == order.id);
    if (idx != -1) {
      _orders[idx] = order;
      _enqueueSync('Orders', order.id, 'UPDATE', order.toJson());
    } else {
      _orders.add(order);
      _enqueueSync('Orders', order.id, 'CREATE', order.toJson());
    }
    _saveToStorage();
    notifyListeners();
  }

  // Complete Payment & Deduct Inventory automatically
  void completeOrderPayment(OrderModel order, String paymentMethod) {
    final paidOrder = order.copyWith(
      status: 'COMPLETED',
      paymentStatus: 'PAID',
      paymentMethod: paymentMethod,
      paidAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    saveOrder(paidOrder);

    // Free table if attached
    if (order.tableId != null) {
      int tIdx = _tables.indexWhere((t) => t.id == order.tableId);
      if (tIdx != -1) {
        final freeTable = _tables[tIdx].copyWith(
          status: TableStatus.empty,
          currentCustomerName: null,
          customerCount: 0,
          currentOrderId: null,
          occupiedAt: null,
        );
        updateTable(freeTable);
      }
    }

    // Auto-deduct inventory recipes matching PRD Section 22
    for (var item in order.items) {
      final recipe = _recipes.firstWhere(
        (r) => r.productId == item.productId,
        orElse: () => RecipeModel(id: '', productId: '', productName: '', ingredients: []),
      );

      for (var ing in recipe.ingredients) {
        int invIdx = _inventory.indexWhere((i) => i.id == ing.inventoryItemId);
        if (invIdx != -1) {
          double totalQuantityNeeded = ing.quantityNeeded * item.quantity;
          double updatedStock = (_inventory[invIdx].currentStock - totalQuantityNeeded).clamp(0.0, 9999.0);
          final updatedInv = _inventory[invIdx].copyWith(
            currentStock: double.parse(updatedStock.toStringAsFixed(2)),
            updatedAt: DateTime.now(),
          );
          _inventory[invIdx] = updatedInv;

          // Transaction log
          _inventoryTransactions.add(
            InventoryTransactionModel(
              id: _uuid.v4(),
              inventoryItemId: updatedInv.id,
              inventoryItemName: updatedInv.name,
              type: 'SALE',
              quantity: totalQuantityNeeded,
              unit: updatedInv.unit,
              note: 'Trừ tự động khi bán đơn ${order.orderCode}',
            ),
          );

          _enqueueSync('Inventory', updatedInv.id, 'UPDATE', updatedInv.toJson());
        }
      }
    }
  }

  // ===== PRODUCT CRUD =====

  void addOrUpdateProduct(ProductModel product) {
    int idx = _products.indexWhere((p) => p.id == product.id);
    if (idx != -1) {
      _products[idx] = product;
      _enqueueSync('Products', product.id, 'UPDATE', product.toJson());
    } else {
      _products.add(product);
      _enqueueSync('Products', product.id, 'CREATE', product.toJson());
    }
    _saveToStorage();
    notifyListeners();
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    _enqueueSync('Products', id, 'DELETE', {'id': id});
    _saveToStorage();
    notifyListeners();
  }

  // ===== CATEGORY CRUD =====

  void addOrUpdateCategory(CategoryModel category) {
    int idx = _categories.indexWhere((c) => c.id == category.id);
    if (idx != -1) {
      _categories[idx] = category;
      _enqueueSync('Categories', category.id, 'UPDATE', category.toJson());
    } else {
      _categories.add(category);
      _enqueueSync('Categories', category.id, 'CREATE', category.toJson());
    }
    _saveToStorage();
    notifyListeners();
  }

  void deleteCategory(String id) {
    _categories.removeWhere((c) => c.id == id);
    _enqueueSync('Categories', id, 'DELETE', {'id': id});
    _saveToStorage();
    notifyListeners();
  }

  // Inventory CRUD
  void addOrUpdateInventoryItem(InventoryItemModel item) {
    int idx = _inventory.indexWhere((i) => i.id == item.id);
    if (idx != -1) {
      _inventory[idx] = item;
      _enqueueSync('Inventory', item.id, 'UPDATE', item.toJson());
    } else {
      _inventory.add(item);
      _enqueueSync('Inventory', item.id, 'CREATE', item.toJson());
    }
    notifyListeners();
  }

  // Delete Inventory Item
  void deleteInventoryItem(String id) {
    _inventory.removeWhere((i) => i.id == id);
    notifyListeners();
  }

  // Recipe CRUD
  void addOrUpdateRecipe(RecipeModel recipe) {
    int idx = _recipes.indexWhere((r) => r.id == recipe.id);
    if (idx != -1) {
      _recipes[idx] = recipe;
    } else {
      _recipes.add(recipe);
    }
    notifyListeners();
  }

  void deleteRecipe(String id) {
    _recipes.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  // Add Expense/Income
  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    _enqueueSync('Expenses', expense.id, 'CREATE', expense.toJson());
    notifyListeners();
  }

  // Delete Expense
  void deleteExpense(String expenseId) {
    _expenses.removeWhere((e) => e.id == expenseId);
    _enqueueSync('Expenses', expenseId, 'DELETE', {'id': expenseId});
    notifyListeners();
  }

  // Pay Customer Debt
  void payCustomerDebt(String customerId, double amount) {
    int idx = _customers.indexWhere((c) => c.id == customerId);
    if (idx != -1) {
      final old = _customers[idx];
      final newDebt = (old.debt - amount).clamp(0.0, 99999999.0);
      _customers[idx] = CustomerModel(
        id: old.id,
        name: old.name,
        phone: old.phone,
        points: old.points,
        membershipTier: old.membershipTier,
        debt: newDebt,
        totalSpent: old.totalSpent,
        isSynced: false,
      );
      _enqueueSync('Customers', old.id, 'UPDATE', _customers[idx].toJson());

      // Log as income
      _expenses.add(ExpenseModel(
        id: _uuid.v4(),
        title: 'Thu nợ khách ${old.name}',
        categoryName: 'Thu nợ',
        type: 'INCOME',
        amount: amount,
        supplierOrCustomerName: old.name,
      ));
    }
    notifyListeners();
  }

  // Pay Supplier Debt
  void paySupplierDebt(String supplierId, double amount) {
    int idx = _suppliers.indexWhere((s) => s.id == supplierId);
    if (idx != -1) {
      final old = _suppliers[idx];
      final newDebt = (old.debt - amount).clamp(0.0, 99999999.0);
      _suppliers[idx] = SupplierModel(
        id: old.id,
        name: old.name,
        phone: old.phone,
        company: old.company,
        debt: newDebt,
        isSynced: false,
      );
      _enqueueSync('Suppliers', old.id, 'UPDATE', _suppliers[idx].toJson());

      // Log as expense
      _expenses.add(ExpenseModel(
        id: _uuid.v4(),
        title: 'Trả nợ NCC ${old.name}',
        categoryName: 'Trả nợ',
        type: 'EXPENSE',
        amount: amount,
        supplierOrCustomerName: old.name,
      ));
    }
    notifyListeners();
  }

  // Queue helper
  void _enqueueSync(String table, String recordId, String action, Map<String, dynamic> payload) {
    final item = SyncQueueModel(
      id: _uuid.v4(),
      tableName: table,
      recordId: recordId,
      action: action,
      payload: payload,
      status: 'PENDING',
      createdAt: DateTime.now(),
    );
    _syncQueue.add(item);
  }

  void updateSyncItemStatus(String queueId, String status, {String? errorMessage}) {
    int idx = _syncQueue.indexWhere((q) => q.id == queueId);
    if (idx != -1) {
      _syncQueue[idx] = _syncQueue[idx].copyWith(
        status: status,
        errorMessage: errorMessage,
      );
    }
    notifyListeners();
  }

  void updateSettings(AppSettingsModel newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  // ===================== LOCAL PERSISTENCE (dart:io File - sync writes) =====================

  void _saveToStorage() {
    try {
      final data = <String, dynamic>{
        'tables': _tables.map((t) => t.toJson()).toList(),
        'orders': _orders.map((o) => o.toJson()).toList(),
        'areas': _areas.map((a) => a.toJson()).toList(),
        'expenses': _expenses.map((e) => e.toJson()).toList(),
        'inventory': _inventory.map((i) => i.toJson()).toList(),
        'products': _products.map((p) => p.toJson()).toList(),
        'categories': _categories.map((c) => c.toJson()).toList(),
        'recipes': _recipes.map((r) => r.toJson()).toList(),
        'customers': _customers.map((c) => c.toJson()).toList(),
        'suppliers': _suppliers.map((s) => s.toJson()).toList(),
      };
      final file = File('${Directory.current.path}/kan_cafe_data.json');
      file.writeAsStringSync(jsonEncode(data), flush: true);
    } catch (e) {
      debugPrint('[CafeDB] Save error: $e');
    }
  }

  Future<void> _loadFromStorage() async {
    try {
      final file = File('${Directory.current.path}/kan_cafe_data.json');
      if (!file.existsSync()) return;
      final jsonStr = file.readAsStringSync();
      if (jsonStr.isEmpty) return;
      final data = jsonDecode(jsonStr) as Map<String, dynamic>;

      _areas.clear();
      _areas.addAll((data['areas'] as List? ?? []).map((e) => AreaModel.fromJson(e)));

      _tables.clear();
      _tables.addAll((data['tables'] as List? ?? []).map((e) => TableModel.fromJson(e)));

      _categories.clear();
      _categories.addAll((data['categories'] as List? ?? []).map((e) => CategoryModel.fromJson(e)));

      _products.clear();
      _products.addAll((data['products'] as List? ?? []).map((e) => ProductModel.fromJson(e)));

      _recipes.clear();
      _recipes.addAll((data['recipes'] as List? ?? []).map((e) => RecipeModel.fromJson(e)));

      _inventory.clear();
      _inventory.addAll((data['inventory'] as List? ?? []).map((e) => InventoryItemModel.fromJson(e)));

      _customers.clear();
      _customers.addAll((data['customers'] as List? ?? []).map((e) => CustomerModel.fromJson(e)));

      _suppliers.clear();
      _suppliers.addAll((data['suppliers'] as List? ?? []).map((e) => SupplierModel.fromJson(e)));

      _orders.clear();
      _orders.addAll((data['orders'] as List? ?? []).map((e) => OrderModel.fromJson(e)));

      _expenses.clear();
      _expenses.addAll((data['expenses'] as List? ?? []).map((e) => ExpenseModel.fromJson(e)));
    } catch (e) {
      debugPrint('[CafeDB] Load error: $e');
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/isar_models.dart';
import '../services/database_service.dart';
import '../services/vercel_sync_service.dart';
import '../services/receipt_printer_service.dart';

// Services
final dbProvider = ChangeNotifierProvider<DatabaseService>((ref) => DatabaseService());
final syncServiceProvider = Provider<VercelSyncService>((ref) => VercelSyncService());
final receiptPrinterProvider = Provider<ReceiptPrinterService>((ref) => ReceiptPrinterService());

// Auth State
final currentUserProvider = StateProvider<UserModel?>((ref) => null);

// User Role State
final currentRoleProvider = StateProvider<UserRole>((ref) => UserRole.manager);

// Area filter state
final selectedAreaIdProvider = StateProvider<String?>((ref) => null);

// Table Notifier
class TablesNotifier extends StateNotifier<List<TableModel>> {
  final DatabaseService _db;
  TablesNotifier(this._db) : super([]) {
    loadTables();
  }

  void loadTables() {
    state = _db.tables;
  }

  void updateTableStatus(String tableId, TableStatus status) {
    int idx = state.indexWhere((t) => t.id == tableId);
    if (idx != -1) {
      final updated = state[idx].copyWith(
        status: status,
        updatedAt: DateTime.now(),
      );
      _db.updateTable(updated);
      state = _db.tables;
    }
  }

  void transferTable(String fromTableId, String toTableId) {
    int fromIdx = state.indexWhere((t) => t.id == fromTableId);
    int toIdx = state.indexWhere((t) => t.id == toTableId);

    if (fromIdx != -1 && toIdx != -1) {
      final fromTable = state[fromIdx];
      final toTable = state[toIdx];

      final newToTable = toTable.copyWith(
        status: fromTable.status,
        currentCustomerName: fromTable.currentCustomerName,
        customerCount: fromTable.customerCount,
        occupiedAt: fromTable.occupiedAt,
        currentOrderId: fromTable.currentOrderId,
        note: 'Chuyển từ ${fromTable.name}',
      );

      final newFromTable = fromTable.copyWith(
        status: TableStatus.empty,
        currentCustomerName: null,
        customerCount: 0,
        occupiedAt: null,
        currentOrderId: null,
        note: null,
      );

      _db.updateTable(newToTable);
      _db.updateTable(newFromTable);
      state = _db.tables;
    }
  }

  void mergeTables(String primaryTableId, String secondaryTableId) {
    int pIdx = state.indexWhere((t) => t.id == primaryTableId);
    int sIdx = state.indexWhere((t) => t.id == secondaryTableId);

    if (pIdx != -1 && sIdx != -1) {
      final primary = state[pIdx];
      final secondary = state[sIdx];

      final updatedPrimary = primary.copyWith(
        name: '${primary.name}+${secondary.name.replaceAll("Bàn ", "")}',
        customerCount: primary.customerCount + secondary.customerCount,
        note: 'Ghép bàn ${secondary.name}',
      );

      final updatedSecondary = secondary.copyWith(
        status: TableStatus.empty,
        currentCustomerName: null,
        customerCount: 0,
        occupiedAt: null,
        currentOrderId: null,
      );

      _db.updateTable(updatedPrimary);
      _db.updateTable(updatedSecondary);
      state = _db.tables;
    }
  }
}

final tablesProvider = StateNotifierProvider<TablesNotifier, List<TableModel>>((ref) {
  return TablesNotifier(ref.watch(dbProvider));
});

// POS Cart State
class CartState {
  final TableModel? selectedTable;
  final OrderType orderType;
  final CustomerModel? customer;
  final List<OrderItemModel> items;
  final double discountPercent;
  final double discountAmount;
  final double deliveryFee;
  final String? deliveryPartner;
  final String note;
  final OrderModel? existingOrder; // Đơn hàng chưa thanh toán của bàn

  CartState({
    this.selectedTable,
    this.orderType = OrderType.atTable,
    this.customer,
    this.items = const [],
    this.discountPercent = 0.0,
    this.discountAmount = 0.0,
    this.deliveryFee = 0.0,
    this.deliveryPartner,
    this.note = '',
    this.existingOrder,
  });

  double get subtotal => items.fold(0.0, (sum, i) => sum + i.totalPrice);

  double get calculatedDiscount {
    if (discountAmount > 0) return discountAmount;
    if (discountPercent > 0) return subtotal * (discountPercent / 100);
    return 0.0;
  }

  double get totalAmount => (subtotal - calculatedDiscount + deliveryFee).clamp(0.0, 99999999.0);

  CartState copyWith({
    TableModel? selectedTable,
    OrderType? orderType,
    CustomerModel? customer,
    List<OrderItemModel>? items,
    double? discountPercent,
    double? discountAmount,
    double? deliveryFee,
    String? deliveryPartner,
    String? note,
    OrderModel? existingOrder,
    bool clearExistingOrder = false,
    bool clearSelectedTable = false,
  }) {
    return CartState(
      selectedTable: clearSelectedTable ? null : (selectedTable ?? this.selectedTable),
      orderType: orderType ?? this.orderType,
      customer: customer ?? this.customer,
      items: items ?? this.items,
      discountPercent: discountPercent ?? this.discountPercent,
      discountAmount: discountAmount ?? this.discountAmount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryPartner: deliveryPartner ?? this.deliveryPartner,
      note: note ?? this.note,
      existingOrder: clearExistingOrder ? null : (existingOrder ?? this.existingOrder),
    );
  }
}

class CartNotifier extends StateNotifier<CartState> {
  final DatabaseService _db;
  final _uuid = const Uuid();
  static final Map<String, int> _orderCounters = {};

  CartNotifier(this._db) : super(CartState()) {
    // Load counters from existing orders
    if (_orderCounters.isEmpty && _db.orders.isNotEmpty) {
      for (var order in _db.orders) {
        final match = RegExp(r'^(HD|HDMD|HDGH)(\d+)$').firstMatch(order.orderCode);
        if (match != null) {
          final prefix = match.group(1)!;
          final num = int.parse(match.group(2)!);
          if (_orderCounters[prefix] == null || num > _orderCounters[prefix]!) {
            _orderCounters[prefix] = num;
          }
        }
      }
    }
  }

  String _nextOrderCode(OrderType type) {
    String prefix;
    switch (type) {
      case OrderType.takeaway:
        prefix = 'HDMD';
        break;
      case OrderType.delivery:
        prefix = 'HDGH';
        break;
      case OrderType.atTable:
        prefix = 'HD';
        break;
    }
    final current = _orderCounters[prefix] ?? 0;
    _orderCounters[prefix] = current + 1;
    return '$prefix${(current + 1).toString().padLeft(4, '0')}';
  }

  /// Chọn bàn → tự lưu đơn cũ nếu có món, rồi load đơn mới
  void selectTable(TableModel table) {
    // Nếu đang có đơn chưa lưu (cart có items) → tự lưu đơn UNPAID cho bàn cũ
    _autoSaveCurrentCart();

    // Load đơn chưa thanh toán của bàn mới
    final existingOrder = _db.findUnpaidOrderByTable(table.id);

    if (existingOrder != null) {
      state = state.copyWith(
        selectedTable: table,
        orderType: OrderType.atTable,
        items: existingOrder.items,
        discountPercent: existingOrder.discountPercent,
        discountAmount: existingOrder.discountAmount,
        existingOrder: existingOrder,
      );
    } else {
      state = state.copyWith(
        selectedTable: table,
        orderType: OrderType.atTable,
        clearExistingOrder: true,
      );
    }
  }

  /// Tự động lưu đơn UNPAID cho bàn hiện tại (khi chuyển bàn)
  void _autoSaveCurrentCart() {
    if (state.selectedTable == null || state.items.isEmpty) return;

    final tableId = state.selectedTable!.id;

    if (state.existingOrder != null) {
      // Cập nhật đơn cũ
      final updatedOrder = state.existingOrder!.copyWith(
        tableId: tableId,
        tableName: state.selectedTable!.name,
        areaName: state.selectedTable!.areaName,
        items: state.items,
        subtotal: state.subtotal,
        discountPercent: state.discountPercent,
        discountAmount: state.calculatedDiscount,
        deliveryFee: state.deliveryFee,
        totalAmount: state.totalAmount,
        updatedAt: DateTime.now(),
      );
      _db.saveOrder(updatedOrder);
    } else {
      // Tạo đơn mới UNPAID
      final code = _nextOrderCode(state.orderType);
      final isAtTable = state.orderType == OrderType.atTable && state.selectedTable != null;
      final order = OrderModel(
        id: _uuid.v4(),
        orderCode: code,
        type: state.orderType,
        status: 'DRAFT',
        tableId: isAtTable ? tableId : null,
        tableName: isAtTable ? state.selectedTable!.name : null,
        areaName: isAtTable ? state.selectedTable!.areaName : null,
        items: state.items,
        subtotal: state.subtotal,
        discountPercent: state.discountPercent,
        discountAmount: state.calculatedDiscount,
        totalAmount: state.totalAmount,
        paymentStatus: 'UNPAID',
        createdAt: DateTime.now(),
        occupiedAt: isAtTable ? (state.selectedTable!.occupiedAt ?? DateTime.now()) : null,
      );
      _db.saveOrder(order);

      // Gắn orderId vào bàn + set occupiedAt nếu chưa có
      _db.updateTable(state.selectedTable!.copyWith(
        currentOrderId: order.id,
        occupiedAt: state.selectedTable!.occupiedAt ?? DateTime.now(),
      ));
    }
  }

  void setOrderType(OrderType type) {
    if (type == OrderType.atTable) {
      state = state.copyWith(orderType: type);
    } else {
      // Mang đi / Giao hàng → bỏ chọn bàn
      state = state.copyWith(orderType: type, clearSelectedTable: true);
    }
  }

  void selectCustomer(CustomerModel? customer) {
    state = state.copyWith(customer: customer);
  }

  void setDelivery(String partner, double fee) {
    state = state.copyWith(
      deliveryPartner: partner,
      deliveryFee: fee,
      orderType: OrderType.delivery,
    );
  }

  void addItem(ProductModel product, {String sizeName = 'M', double sizeExtraPrice = 5000, List<ProductTopping> toppings = const [], String note = ''}) {
    final newItem = OrderItemModel(
      productId: product.id,
      productName: product.name,
      sizeName: sizeName,
      sizeExtraPrice: sizeExtraPrice,
      selectedToppings: toppings,
      unitPrice: product.basePrice,
      quantity: 1,
      note: note,
    );

    int idx = state.items.indexWhere(
      (i) => i.productId == product.id && i.sizeName == sizeName && _areToppingsEqual(i.selectedToppings, toppings),
    );

    if (idx != -1) {
      final existing = state.items[idx];
      final updatedList = List<OrderItemModel>.from(state.items);
      updatedList[idx] = OrderItemModel(
        productId: existing.productId,
        productName: existing.productName,
        sizeName: existing.sizeName,
        sizeExtraPrice: existing.sizeExtraPrice,
        selectedToppings: existing.selectedToppings,
        unitPrice: existing.unitPrice,
        quantity: existing.quantity + 1,
        note: existing.note,
      );
      state = state.copyWith(items: updatedList);
    } else {
      state = state.copyWith(items: [...state.items, newItem]);
    }
  }

  void updateQuantity(int index, int delta) {
    final updatedList = List<OrderItemModel>.from(state.items);
    int newQty = updatedList[index].quantity + delta;
    if (newQty <= 0) {
      updatedList.removeAt(index);
    } else {
      final item = updatedList[index];
      updatedList[index] = OrderItemModel(
        productId: item.productId,
        productName: item.productName,
        sizeName: item.sizeName,
        sizeExtraPrice: item.sizeExtraPrice,
        selectedToppings: item.selectedToppings,
        unitPrice: item.unitPrice,
        quantity: newQty,
        note: item.note,
      );
    }
    state = state.copyWith(items: updatedList);
  }

  void setDiscountPercent(double percent) {
    state = state.copyWith(discountPercent: percent, discountAmount: 0.0);
  }

  void clearCart() {
    state = CartState();
  }

  bool _areToppingsEqual(List<ProductTopping> a, List<ProductTopping> b) {
    if (a.length != b.length) return false;
    final aIds = a.map((t) => t.id).toSet();
    final bIds = b.map((t) => t.id).toSet();
    return aIds.containsAll(bIds);
  }

  /// Checkout: nếu có existingOrder → cập nhật, nếu mới → tạo mới
  OrderModel checkout({required String paymentMethod, String paymentStatus = 'PAID'}) {
    final isPaid = paymentStatus == 'PAID';
    OrderModel resultOrder;

    if (state.existingOrder != null) {
      // Cập nhật đơn cũ
      final isAtTable = state.orderType == OrderType.atTable && state.selectedTable != null;
      final updatedOrder = state.existingOrder!.copyWith(
        type: state.orderType,
        tableId: isAtTable ? state.selectedTable!.id : null,
        tableName: isAtTable ? state.selectedTable!.name : null,
        areaName: isAtTable ? state.selectedTable!.areaName : null,
        items: state.items,
        subtotal: state.subtotal,
        discountPercent: state.discountPercent,
        discountAmount: state.calculatedDiscount,
        deliveryFee: state.deliveryFee,
        deliveryPartner: state.deliveryPartner,
        totalAmount: state.totalAmount,
        paymentMethod: paymentMethod,
        paymentStatus: paymentStatus,
        status: isPaid ? 'COMPLETED' : state.existingOrder!.status,
        paidAt: isPaid ? DateTime.now() : null,
        updatedAt: DateTime.now(),
      );

      resultOrder = updatedOrder;

      if (isPaid) {
        _db.completeOrderPayment(updatedOrder, paymentMethod);
      } else {
        _db.saveOrder(updatedOrder);
      }
    } else {
      // Tạo đơn mới
      final code = _nextOrderCode(state.orderType);
      final isAtTable = state.orderType == OrderType.atTable && state.selectedTable != null;
      final order = OrderModel(
        id: _uuid.v4(),
        orderCode: code,
        type: state.orderType,
        status: isPaid ? 'COMPLETED' : 'DRAFT',
        tableId: isAtTable ? state.selectedTable!.id : null,
        tableName: isAtTable ? state.selectedTable!.name : null,
        areaName: isAtTable ? state.selectedTable!.areaName : null,
        customerId: state.customer?.id,
        customerName: state.customer?.name,
        customerPhone: state.customer?.phone,
        items: state.items,
        subtotal: state.subtotal,
        discountPercent: state.discountPercent,
        discountAmount: state.calculatedDiscount,
        deliveryFee: state.deliveryFee,
        deliveryPartner: state.deliveryPartner,
        totalAmount: state.totalAmount,
        paymentMethod: paymentMethod,
        paymentStatus: paymentStatus,
        note: state.note,
        createdAt: DateTime.now(),
        occupiedAt: isAtTable ? (state.selectedTable!.occupiedAt ?? DateTime.now()) : null,
        paidAt: isPaid ? DateTime.now() : null,
      );

      resultOrder = order;

      if (isPaid) {
        _db.completeOrderPayment(order, paymentMethod);
      } else {
        _db.saveOrder(order);
        // Đặt bàn thành occupied + gắn orderId
        if (state.selectedTable != null) {
          _db.updateTable(state.selectedTable!.copyWith(
            status: TableStatus.occupied,
            currentCustomerName: state.customer?.name ?? 'Khách',
            currentOrderId: order.id,
          ));
        }
      }
    }

    clearCart();
    return resultOrder;
  }

  /// In bill → chuyển bàn sang pendingPayment
  void markTablePendingPayment() {
    if (state.selectedTable != null) {
      _db.updateTable(state.selectedTable!.copyWith(
        status: TableStatus.pendingPayment,
      ));
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref.watch(dbProvider));
});

// Sync Notifier State
class SyncNotifierState {
  final bool isSyncing;
  final SyncResult? lastResult;
  final int pendingCount;
  final DateTime? lastSyncedAt;

  SyncNotifierState({
    this.isSyncing = false,
    this.lastResult,
    this.pendingCount = 0,
    this.lastSyncedAt,
  });

  SyncNotifierState copyWith({
    bool? isSyncing,
    SyncResult? lastResult,
    int? pendingCount,
    DateTime? lastSyncedAt,
  }) {
    return SyncNotifierState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastResult: lastResult ?? this.lastResult,
      pendingCount: pendingCount ?? this.pendingCount,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}

class SyncNotifier extends StateNotifier<SyncNotifierState> {
  final DatabaseService _db;
  final VercelSyncService _syncService;

  SyncNotifier(this._db, this._syncService)
      : super(SyncNotifierState(
          pendingCount: _db.syncQueue.where((q) => q.status == 'PENDING').length,
          lastSyncedAt: _db.settings.lastSyncedAt,
        ));

  void refreshPendingCount() {
    state = state.copyWith(
      pendingCount: _db.syncQueue.where((q) => q.status == 'PENDING').length,
      lastSyncedAt: _db.settings.lastSyncedAt,
    );
  }

  Future<SyncResult> triggerSync() async {
    state = state.copyWith(isSyncing: true);
    final res = await _syncService.performSync();
    state = state.copyWith(
      isSyncing: false,
      lastResult: res,
      pendingCount: _db.syncQueue.where((q) => q.status == 'PENDING').length,
      lastSyncedAt: _db.settings.lastSyncedAt,
    );
    return res;
  }
}

final syncNotifierProvider = StateNotifierProvider<SyncNotifier, SyncNotifierState>((ref) {
  return SyncNotifier(ref.watch(dbProvider), ref.watch(syncServiceProvider));
});

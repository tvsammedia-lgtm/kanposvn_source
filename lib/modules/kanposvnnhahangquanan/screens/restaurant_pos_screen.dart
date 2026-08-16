import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import 'package:uuid/uuid.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';

class RestaurantPosScreen extends ConsumerStatefulWidget {
  final RestaurantTable table;
  const RestaurantPosScreen({super.key, required this.table});

  @override
  ConsumerState<RestaurantPosScreen> createState() => _RestaurantPosScreenState();
}

class _RestaurantPosScreenState extends ConsumerState<RestaurantPosScreen> {
  String _selectedCategory = 'Tất cả';
  RestaurantOrder? _currentOrder;

  @override
  void initState() {
    super.initState();
    // Schedule a microtask to fetch the active order
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadOrder();
    });
  }

  void _loadOrder() {
    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is AsyncData) {
      final activeOrder = ordersAsync.value!.cast<RestaurantOrder?>().firstWhere(
        (o) => o != null && o.table.value?.id == widget.table.id && o.status == RestaurantOrderStatus.SERVING,
        orElse: () => null,
      );

      setState(() {
        if (activeOrder != null) {
          _currentOrder = activeOrder;
        } else {
          _currentOrder = RestaurantOrder()
            ..orderId = const Uuid().v4()
            ..createdAt = DateTime.now()
            ..status = RestaurantOrderStatus.SERVING;
          _currentOrder!.table.value = widget.table;
        }
      });
    }
  }
  
  void _addItem(RestaurantMenuItem item) {
    setState(() {
      final existingIndex = _currentOrder!.details.indexWhere((d) => d.itemId == item.itemId && d.status == RestaurantOrderItemStatus.PENDING);
      if (existingIndex >= 0) {
        _currentOrder!.details[existingIndex].quantity++;
      } else {
        _currentOrder!.details = List.from(_currentOrder!.details)
          ..add(RestaurantOrderDetail()
            ..detailId = const Uuid().v4()
            ..itemId = item.itemId
            ..itemName = item.name
            ..price = item.price
            ..quantity = 1
            ..status = RestaurantOrderItemStatus.PENDING);
      }
      _recalculateTotal();
    });
  }

  void _updateQuantity(int index, int delta) {
    setState(() {
      final newQty = _currentOrder!.details[index].quantity + delta;
      if (newQty <= 0) {
        _currentOrder!.details = List.from(_currentOrder!.details)..removeAt(index);
      } else {
        _currentOrder!.details[index].quantity = newQty;
      }
      _recalculateTotal();
    });
  }

  void _recalculateTotal() {
    _currentOrder!.totalAmount = _currentOrder!.details.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _printReceipt(ReceiptPrintMode mode) async {
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();
    final order = _currentOrder!;
    await printReceiptByMode(
      context,
      ref,
      ReceiptData(
        shopName: storeName ?? 'NHÀ HÀNG QUÁN ĂN',
        shopOwnerName: ownerName,
        shopPhone: storePhone,
        title: 'HÓA ĐƠN THANH TOÁN',
        orderCode: order.orderId.length > 8
            ? order.orderId.substring(0, 8)
            : order.orderId,
        date: order.closedAt ?? DateTime.now(),
        table: '${widget.table.name} (${widget.table.zone})',
        qrData: order.orderId,
        items: order.details
            .map((d) => ReceiptItem(
                  name: d.itemName,
                  quantity: d.quantity.toDouble(),
                  unitPrice: d.price,
                  total: d.price * d.quantity,
                ))
            .toList(),
        subtotal: order.totalAmount,
        grandTotal: order.totalAmount,
      ),
      mode,
      pdfFilename: 'HoaDon_${order.orderId.substring(0, 8)}.pdf',
    );
  }

  Future<void> _saveOrder(bool checkout,
      {ReceiptPrintMode mode = ReceiptPrintMode.auto}) async {
    if (checkout) {
      _currentOrder!.status = RestaurantOrderStatus.COMPLETED;
      _currentOrder!.closedAt = DateTime.now();
      // In hóa đơn trước khi hoàn tất order
      await _printReceipt(mode);
    }
    await ref.read(restaurantOrdersProvider.notifier).updateOrder(_currentOrder!);
    // Reload orders to update kitchen screen
    ref.read(restaurantOrdersProvider.notifier).loadOrders();
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final menuAsync = ref.watch(restaurantMenuProvider);

    if (_currentOrder == null) {
       return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('POS Gọi Món - ${widget.table.name} (${widget.table.zone})', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        actions: [
          TextButton.icon(
            onPressed: () => _printReceipt(ReceiptPrintMode.auto),
            icon: const Icon(Icons.print, color: Colors.white),
            label: const Text('IN HÓA ĐƠN', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () => _saveOrder(false),
            icon: const Icon(Icons.save, color: Colors.white),
            label: const Text('LƯU ORDER', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          // Left: Menu
          Expanded(
            flex: 3,
            child: menuAsync.when(
              data: (menu) {
                if (menu.isEmpty) return const Center(child: Text('Thực đơn rỗng.'));
                
                final categories = ['Tất cả', ...menu.map((m) => m.category).toSet()];
                final filteredMenu = _selectedCategory == 'Tất cả' ? menu : menu.where((m) => m.category == _selectedCategory).toList();

                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey[200],
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((cat) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(cat, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              selected: _selectedCategory == cat,
                              onSelected: (selected) {
                                if (selected) setState(() => _selectedCategory = cat);
                              },
                              selectedColor: Colors.orange,
                              labelStyle: TextStyle(color: _selectedCategory == cat ? Colors.white : Colors.black),
                            ),
                          )).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: filteredMenu.length,
                        itemBuilder: (context, index) {
                          final item = filteredMenu[index];
                          return InkWell(
                            onTap: () => _addItem(item),
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(item.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    const SizedBox(height: 8),
                                    Text('${item.price.toStringAsFixed(0)} đ/${item.unit}', style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
          
          // Right: Bill
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('HÓA ĐƠN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Mã: ${_currentOrder!.orderId.substring(0, 5)}', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _currentOrder!.details.isEmpty 
                      ? const Center(child: Text('Chưa có món nào', style: TextStyle(color: Colors.grey, fontSize: 18)))
                      : ListView.builder(
                        itemCount: _currentOrder!.details.length,
                        itemBuilder: (context, index) {
                          final detail = _currentOrder!.details[index];
                          return Container(
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(detail.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      Text('${detail.price.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                                      onPressed: () => _updateQuantity(index, -1),
                                    ),
                                    Text('${detail.quantity}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle, color: Colors.green),
                                      onPressed: () => _updateQuantity(index, 1),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                SizedBox(
                                  width: 80,
                                  child: Text('${(detail.price * detail.quantity).toStringAsFixed(0)} đ', textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.orange[50],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TỔNG CỘNG:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('${_currentOrder!.totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                                  onPressed: _currentOrder!.details.isEmpty
                                      ? null
                                      : () => _saveOrder(true,
                                          mode: ReceiptPrintMode.thermal80),
                                  icon: const Icon(Icons.print, size: 18),
                                  label: const Text('IN BILL 80mm',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                  onPressed: _currentOrder!.details.isEmpty
                                      ? null
                                      : () => _saveOrder(true,
                                          mode: ReceiptPrintMode.pdf),
                                  icon: const Icon(Icons.picture_as_pdf, size: 18),
                                  label: const Text('IN PDF',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: _currentOrder!.details.isEmpty ? null : () => _saveOrder(true),
                            child: const Text('THANH TOÁN', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
import '../services/restaurant_business_logic.dart';
import 'restaurant_checkout_dialog.dart';

class RestaurantPosScreen extends ConsumerStatefulWidget {
  final RestaurantTable table;
  const RestaurantPosScreen({super.key, required this.table});

  @override
  ConsumerState<RestaurantPosScreen> createState() => _RestaurantPosScreenState();
}

class _RestaurantPosScreenState extends ConsumerState<RestaurantPosScreen> {
  String _selectedCategory = 'Tất cả';
  String _searchText = '';
  RestaurantOrder? _currentOrder;
  bool _orderInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryInitOrder();
    });
  }

  void _tryInitOrder() {
    if (_orderInitialized) return;
    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is AsyncData) {
      _initOrder(ordersAsync.value!);
    }
  }

  void _initOrder(List<RestaurantOrder> orders) {
    if (_orderInitialized) return;
    _orderInitialized = true;

    final activeOrder = orders.cast<RestaurantOrder?>().firstWhere(
      (o) => o != null && o.table.value?.id == widget.table.id && o.status == RestaurantOrderStatus.SERVING,
      orElse: () => null,
    );

    if (activeOrder != null) {
      _currentOrder = activeOrder;
    } else {
      // FIX: chỉ tạo order trong bộ nhớ, lưu xuống DB khi có món
      // (tránh sinh order rác làm bàn nhảy sang Đang phục vụ).
      _currentOrder = RestaurantOrder()
        ..orderId = const Uuid().v4()
        ..createdAt = DateTime.now()
        ..status = RestaurantOrderStatus.SERVING;
      _currentOrder!.table.value = widget.table;
    }
    setState(() {});
  }

  void _persist() {
    if (_currentOrder!.details.isNotEmpty) {
      ref.read(restaurantOrdersProvider.notifier).updateOrder(_currentOrder!);
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
    _persist();
  }

  void _updateQuantity(int index, int delta) {
    final detail = _currentOrder!.details[index];
    // FIX: món đã vào bếp (COOKING/DONE) không được giảm/xóa vì kho đã trừ.
    if (detail.status != RestaurantOrderItemStatus.PENDING && delta < 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('"${detail.itemName}" đã vào bếp, không thể xóa.'),
        backgroundColor: Colors.red,
      ));
      return;
    }
    setState(() {
      final newQty = detail.quantity + delta;
      if (newQty <= 0) {
        _currentOrder!.details = List.from(_currentOrder!.details)..removeAt(index);
      } else {
        detail.quantity = newQty;
      }
      _recalculateTotal();
    });
    _persist();
  }

  Future<void> _editNote(int index) async {
    final detail = _currentOrder!.details[index];
    final controller = TextEditingController(text: detail.note);
    final quickNotes = ['Ít cay', 'Không hành', 'Thêm đá', 'Không đá', 'Nhanh'];
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ghi chú - ${detail.itemName}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'VD: Ít cay, Không hành, Thêm đá...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: quickNotes
                  .map((n) => ActionChip(
                        label: Text(n),
                        onPressed: () {
                          controller.text =
                              controller.text.isEmpty ? n : '${controller.text}, $n';
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: const Text('Lưu')),
        ],
      ),
    );
    if (result != null) {
      setState(() => detail.note = result.trim());
      _persist();
    }
  }

  void _recalculateTotal() {
    _currentOrder!.totalAmount =
        RestaurantBusinessLogic.recalculateTotal(_currentOrder!.details);
  }

  Future<void> _printReceipt(ReceiptPrintMode mode) async {
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();
    final order = _currentOrder!;
    final payments = order.payments;
    final payLabel = payments.isEmpty
        ? null
        : payments
            .map((p) => '${p.method.label}: ${p.amount.toStringAsFixed(0)}đ')
            .join(' + ');
    await printReceiptByMode(
      context,
      ref,
      ReceiptData(
        shopName: storeName ?? 'NHÀ HÀNG QUÁN ĂN',
        shopOwnerName: ownerName,
        shopPhone: storePhone,
        title: 'HÓA ĐƠN THANH TOÁN',
        orderCode:
            order.orderId.length > 8 ? order.orderId.substring(0, 8) : order.orderId,
        date: order.closedAt ?? DateTime.now(),
        customer: order.customerName,
        table: '${widget.table.name} (${widget.table.zone})',
        qrData: order.orderId,
        items: order.details
            .map((d) => ReceiptItem(
                  name: d.itemName,
                  quantity: d.quantity.toDouble(),
                  unitPrice: d.price,
                  total: d.price * d.quantity,
                  extra: d.note,
                ))
            .toList(),
        subtotal: order.totalAmount,
        discount: order.discountAmount,
        grandTotal: order.totalAmount - order.discountAmount,
        paymentMethod: payLabel,
        cashReceived:
            payments.isEmpty ? null : RestaurantBusinessLogic.totalPaid(payments),
        change: payments.isEmpty
            ? null
            : RestaurantBusinessLogic.changeDue(
                finalAmount: order.totalAmount - order.discountAmount,
                payments: payments),
      ),
      mode,
      pdfFilename: 'HoaDon_${order.orderId.substring(0, 8)}.pdf',
    );
  }

  Future<void> _checkout(ReceiptPrintMode mode) async {
    final result = await showRestaurantCheckoutDialog(
      context,
      ref,
      subtotal: _currentOrder!.totalAmount,
      details: _currentOrder!.details,
      tableName: '${widget.table.name} (${widget.table.zone})',
    );
    if (result == null || !mounted) return;

    await ref.read(restaurantOrdersProvider.notifier).checkout(
          order: _currentOrder!,
          payments: result.payments,
          discountAmount: result.discountAmount,
          promotionName: result.promotionName,
          customer: result.customer,
        );
    if (!mounted) return;
    await _printReceipt(mode);
    if (mounted) Navigator.pop(context);
  }

  Future<void> _saveOrder(bool checkout,
      {ReceiptPrintMode mode = ReceiptPrintMode.auto}) async {
    if (_currentOrder!.details.isEmpty && checkout) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Chưa có món nào để thanh toán.'),
          backgroundColor: Colors.red));
      return;
    }
    if (checkout) {
      await _checkout(mode);
      return;
    }
    if (_currentOrder!.details.isEmpty) {
      // Không lưu order rác — chỉ đóng màn hình.
      if (mounted) Navigator.pop(context);
      return;
    }
    await ref.read(restaurantOrdersProvider.notifier).updateOrder(_currentOrder!);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final menuAsync = ref.watch(restaurantMenuProvider);

    // Khi orders provider chuyển từ loading sang data, khởi tạo order
    final ordersAsync = ref.watch(restaurantOrdersProvider);
    if (!_orderInitialized && ordersAsync is AsyncData) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _initOrder(ordersAsync.value!);
      });
    }

    if (_currentOrder == null) {
       return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        await ref
            .read(restaurantOrdersProvider.notifier)
            .discardIfEmpty(_currentOrder!);
        if (context.mounted) Navigator.pop(context);
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text('POS Gọi Món - ${widget.table.name} (${widget.table.zone})', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        actions: [
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
                final filteredMenu = menu.where((m) {
                  if (_selectedCategory != 'Tất cả' && m.category != _selectedCategory) {
                    return false;
                  }
                  if (_searchText.isEmpty) return true;
                  final q = _searchText.toLowerCase();
                  return m.name.toLowerCase().contains(q) ||
                      m.barcode.contains(q);
                }).toList();

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm món hoặc quét mã vạch...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.qr_code_scanner),
                            tooltip: 'Quét Barcode',
                            onPressed: () {},
                          ),
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: (v) => setState(() => _searchText = v),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              color: item.isCombo ? Colors.deepPurple[50] : Colors.white,
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (item.isCombo)
                                            const Icon(Icons.card_giftcard, size: 16, color: Colors.deepPurple),
                                          Flexible(
                                            child: Text(item.name,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
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
                          final locked = detail.status != RestaurantOrderItemStatus.PENDING;
                          return Container(
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: locked ? null : () => _editNote(index),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(detail.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                        if (detail.note.isNotEmpty)
                                          Text('📝 ${detail.note}', style: const TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.italic, fontSize: 12)),
                                        Text('${detail.price.toStringAsFixed(0)} đ${locked ? " • đã vào bếp" : ""}',
                                            style: TextStyle(color: locked ? Colors.red : Colors.grey, fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle,
                                          color: locked ? Colors.grey : Colors.red),
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
                                  width: 90,
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
                            const Text('TỔNG CỘNG:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('${_currentOrder!.totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                                  onPressed: _currentOrder!.details.isEmpty
                                      ? null
                                      : () => _saveOrder(true, mode: ReceiptPrintMode.thermal80),
                                  icon: const Icon(Icons.receipt_long, size: 18),
                                  label: const Text('TT + IN 80mm',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                                  onPressed: _currentOrder!.details.isEmpty
                                      ? null
                                      : () => _saveOrder(true, mode: ReceiptPrintMode.pdf),
                                  icon: const Icon(Icons.picture_as_pdf, size: 18),
                                  label: const Text('TT + IN PDF',
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
                            child: const Text('THANH TOÁN', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../services/bill_printer.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_order.dart';
import '../providers/cafe_providers.dart';
import '../../../core/api/warehouse_api.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';

class PosOrderScreen extends ConsumerStatefulWidget {
  const PosOrderScreen({super.key});

  @override
  ConsumerState<PosOrderScreen> createState() => _PosOrderScreenState();
}

class _PosOrderScreenState extends ConsumerState<PosOrderScreen> {
  String _selectedCatId = 'ALL';
  String _searchQuery = '';

  final currencyFormatter = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'đ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(cafeCategoriesProvider);
    final menuItems = ref.watch(cafeMenuProvider);
    final cart = ref.watch(cafePosCartProvider);

    final filteredItems = menuItems.where((item) {
      final matchesCat =
          _selectedCatId == 'ALL' || item.categoryId == _selectedCatId;
      final matchesSearch =
          item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.code.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCat && matchesSearch;
    }).toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Row(
          children: [
            // Left Side: Menu Grid & Search
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  // Top Search Bar & Category Filter
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm món (Tên hoặc Mã)...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          onChanged: (val) =>
                              setState(() => _searchQuery = val),
                        ),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FilterChip(
                                label: const Text('Tất cả'),
                                selected: _selectedCatId == 'ALL',
                                onSelected: (_) =>
                                    setState(() => _selectedCatId = 'ALL'),
                              ),
                              const SizedBox(width: 6),
                              ...categories.map(
                                (cat) => Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: FilterChip(
                                    label: Text(cat.name),
                                    selected: _selectedCatId == cat.id,
                                    onSelected: (_) =>
                                        setState(() => _selectedCatId = cat.id),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Menu Items Grid
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 180,
                            childAspectRatio: 0.9,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return _buildMenuItemCard(context, item);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            // Right Side: Cart & Bill Checkout Panel
            Expanded(flex: 4, child: _buildCartPanel(context, cart)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItemCard(BuildContext context, CafeMenuItem item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _showAddToCartDialog(context, item),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.coffee,
                  size: 32,
                  color: Color(0xFFD97706),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item.categoryName,
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currencyFormatter.format(item.basePrice),
                    style: const TextStyle(
                      color: Color(0xFFD97706),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFD97706),
                    child: Icon(Icons.add, size: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddToCartDialog(BuildContext context, CafeMenuItem item) {
    MenuItemSize selectedSize = item.sizes.isNotEmpty
        ? item.sizes.first
        : MenuItemSize(name: 'M', extraPrice: 0);
    List<MenuItemTopping> selectedToppings = [];
    int qty = 1;
    final noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            double currentItemPrice = item.basePrice + selectedSize.extraPrice;
            for (var t in selectedToppings) {
              currentItemPrice += t.price;
            }

            return AlertDialog(
              scrollable: true,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              title: Text('Tùy chỉnh: ${item.name}'),
              content: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Size selection
                      const Text(
                        'Chọn Size:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        children: item.sizes.map((s) {
                          return ChoiceChip(
                            label: Text(
                              'Size ${s.name} (+${currencyFormatter.format(s.extraPrice)})',
                            ),
                            selected: selectedSize.name == s.name,
                            onSelected: (_) =>
                                setModalState(() => selectedSize = s),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      // Topping selection
                      if (item.availableToppings.isNotEmpty) ...[
                        const Text(
                          'Thêm Topping:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: item.availableToppings.map((t) {
                            final isChecked = selectedToppings.any(
                              (selected) => selected.id == t.id,
                            );
                            return CheckboxListTile(
                              dense: true,
                              title: Text(
                                '${t.name} (+${currencyFormatter.format(t.price)})',
                              ),
                              value: isChecked,
                              onChanged: (val) {
                                setModalState(() {
                                  if (val == true) {
                                    selectedToppings.add(t);
                                  } else {
                                    selectedToppings.removeWhere(
                                      (selected) => selected.id == t.id,
                                    );
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                      ],
                      // Note
                      TextField(
                        controller: noteController,
                        decoration: const InputDecoration(
                          labelText: 'Ghi chú món (Ít đường, nhiều đá...)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Quantity selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: qty > 1
                                ? () => setModalState(() => qty--)
                                : null,
                          ),
                          Text(
                            '$qty',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => setModalState(() => qty++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Hủy'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                  ),
                  onPressed: () async {
                    await ref
                        .read(cafePosCartProvider.notifier)
                        .addItem(
                          item,
                          size: selectedSize,
                          toppings: selectedToppings,
                          quantity: qty,
                          note: noteController.text,
                        );
                    Navigator.pop(ctx);
                  },
                  child: Text(
                    'Thêm vào đơn (${currencyFormatter.format(currentItemPrice * qty)})',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildCartPanel(BuildContext context, CafeOrder cart) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12,
                bottom: MediaQuery.of(context).padding.bottom + 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cart Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đơn: ${cart.orderCode}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            cart.tableName != null
                                ? 'Bàn: ${cart.tableName}'
                                : 'Loại: ${cart.orderType.label}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.grey),
                        onPressed: () async => await ref
                            .read(cafePosCartProvider.notifier)
                            .startNewOrder(),
                      ),
                    ],
                  ),
                  const Divider(),
                  // Order Type Selector
                  Row(
                    children: OrderType.values.map((t) {
                      final isSel = cart.orderType == t;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ChoiceChip(
                            labelStyle: TextStyle(
                              fontSize: 10,
                              color: isSel ? Colors.white : Colors.black,
                            ),
                            selectedColor: const Color(0xFFD97706),
                            label: Text(t.label),
                            selected: isSel,
                            onSelected: (_) {
                              ref
                                  .read(cafePosCartProvider.notifier)
                                  .setOrderType(t);
                              if (t == OrderType.mangDi) {
                                _showTakeAwayInfoDialog(context, cart);
                              } else if (t == OrderType.giaoHang) {
                                _showDeliveryInfoDialog(context, cart);
                              }
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  // Dòng thông tin khách / giao hàng hiện tại
                  if (cart.orderType != OrderType.taiBan &&
                      (cart.customerPhone.isNotEmpty ||
                          cart.deliveryPartner != null))
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        cart.orderType == OrderType.mangDi
                            ? 'Mang đi: ${cart.customerName} • ${cart.customerPhone}'
                            : '${cart.deliveryPartner?.label ?? ''} • ${cart.customerName} • ${cart.customerPhone} • Ship ${cart.shippingFee.round()}đ',
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.brown,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // Cart Items List
                  if (cart.items.isEmpty)
                    const SizedBox(
                      height: 80,
                      child: Center(
                        child: Text(
                          'Chưa có món nào trong đơn',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.items.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (ctx, i) {
                        final item = cart.items[i];
                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            '${item.menuItemName} (Size ${item.selectedSize.name})',
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.selectedToppings.isNotEmpty)
                                Text(
                                  '+ Topping: ${item.selectedToppings.map((t) => t.name).join(", ")}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.brown,
                                  ),
                                ),
                              if (item.note.isNotEmpty)
                                Text(
                                  'Ghi chú: ${item.note}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 14),
                                onPressed: () async => await ref
                                    .read(cafePosCartProvider.notifier)
                                    .updateQuantity(i, -1),
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 14),
                                onPressed: () async => await ref
                                    .read(cafePosCartProvider.notifier)
                                    .updateQuantity(i, 1),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                currencyFormatter.format(item.totalPrice),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  const Divider(),
                  // Order Summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tạm tính:'),
                      Text(
                        currencyFormatter.format(cart.subtotal),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Giảm giá / Voucher:'),
                      Text(
                        '-${currencyFormatter.format(cart.totalDiscount)}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TỔNG THANH TOÁN:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        currencyFormatter.format(cart.grandTotal),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFD97706),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Fixed bottom buttons — always visible, never overflow
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.print, size: 18),
                    label: const Text('In Tạm Tính'),
                    onPressed: cart.items.isEmpty
                        ? null
                        : () {
                            _showPrintBillPreview(context, cart);
                          },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.print, size: 18, color: Colors.white),
                    label: const Text(
                      'In 80mm',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: cart.items.isEmpty
                        ? null
                        : () => _completePayment(
                              context,
                              cart,
                              ReceiptPrintMode.thermal80,
                            ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(
                      Icons.picture_as_pdf,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'In PDF',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: cart.items.isEmpty
                        ? null
                        : () => _completePayment(
                              context,
                              cart,
                              ReceiptPrintMode.pdf,
                            ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.payment, color: Colors.white),
                    label: const Text(
                      'Thanh Toán',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: cart.items.isEmpty
                        ? null
                        : () {
                            _showPaymentDialog(context, cart);
                          },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _completePayment(
    BuildContext context,
    CafeOrder cart,
    ReceiptPrintMode mode,
  ) async {
    final completedOrder = await ref
        .read(cafePosCartProvider.notifier)
        .checkout(PaymentMethod.tienMat, ref);
    if (!context.mounted || !mounted) return;
    // Trừ tồn kho Cloud của chi nhánh đang dùng (best-effort, không chặn bán).
    unawaited(_postCloudSaleDeductions(completedOrder));
    try {
      await printReceiptByMode(
        context,
        ref,
        await _buildReceipt(completedOrder),
        mode,
        pdfFilename: 'HoaDon_${completedOrder.orderCode}.pdf',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('In hóa đơn thất bại: $e')),
      );
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Thanh toán hoàn tất! Đã tự động trừ kho nguyên liệu và thêm vào hàng chờ đồng bộ.',
        ),
      ),
    );
  }

  /// Trừ tồn kho Kho đa chi nhánh khi bán hàng: với mỗi mặt hàng khớp chính xác
  /// tên với sản phẩm Cloud thì ghi giao dịch SALE vào kho đang dùng của chi
  /// nhánh. Best-effort: lỗi mạng/không khớp sản phẩm thì bỏ qua, không ảnh
  /// hưởng tới hóa đơn đã thanh toán.
  Future<void> _postCloudSaleDeductions(CafeOrder order) async {
    final auth = AuthService.instance;
    final whId = auth?.warehouseId;
    final code = auth?.currentAppCode ?? auth?.storeAppCode;
    if (auth == null || whId == null || whId.isEmpty || code == null) return;
    try {
      final products = await WarehouseApi.fetchProducts(code);
      final byName = <String, WhProduct>{};
      for (final p in products) {
        final key = p.name.trim().toLowerCase();
        byName.putIfAbsent(key, () => p);
      }
      final matched = <({String productId, double qty})>[];
      for (final item in order.items) {
        final p = byName[item.menuItemName.trim().toLowerCase()];
        if (p != null) {
          matched.add((productId: p.id, qty: item.quantity.toDouble()));
        }
      }
      if (matched.isEmpty) return;
      await WarehouseApi.postSaleDeductions(
        appCode: code,
        warehouseId: whId,
        orderCode: order.orderCode,
        items: matched,
      );
    } catch (e) {
      // Best-effort: không làm hỏng luồng thanh toán.
    }
  }

  /// Thông tin khách Mang đi: tên, SĐT, ghi chú.
  Future<void> _showTakeAwayInfoDialog(
      BuildContext context, CafeOrder cart) async {
    final nameCtrl = TextEditingController(
        text: cart.customerName == 'Khách lẻ' ? '' : cart.customerName);
    final phoneCtrl = TextEditingController(text: cart.customerPhone);
    final noteCtrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (dlgCtx) => AlertDialog(
        title: Text('Khách Mang đi • ${cart.orderCode}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Tên khách'),
            ),
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'SĐT'),
            ),
            TextField(
              controller: noteCtrl,
              decoration: const InputDecoration(labelText: 'Ghi chú'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dlgCtx),
              child: const Text('Đóng')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD97706)),
            child:
                const Text('Lưu', style: TextStyle(color: Colors.white)),
            onPressed: () {
              ref
                  .read(cafePosCartProvider.notifier)
                  .setCustomer(nameCtrl.text.trim(), phoneCtrl.text.trim(),
                      note: noteCtrl.text.trim());
              Navigator.pop(dlgCtx);
            },
          ),
        ],
      ),
    );
  }

  /// Thông tin Giao hàng: đơn vị giao, phí ship, người nhận, địa chỉ.
  Future<void> _showDeliveryInfoDialog(
      BuildContext context, CafeOrder cart) async {
    DeliveryPartner partner = cart.deliveryPartner ?? DeliveryPartner.grab;
    final feeCtrl = TextEditingController(
        text: cart.shippingFee > 0 ? cart.shippingFee.round().toString() : '');
    final nameCtrl = TextEditingController(
        text: cart.customerName == 'Khách lẻ' ? '' : cart.customerName);
    final phoneCtrl = TextEditingController(text: cart.customerPhone);
    final addrCtrl = TextEditingController(text: cart.deliveryAddress);
    await showDialog(
      context: context,
      builder: (dlgCtx) => StatefulBuilder(
        builder: (ctx, setDState) => AlertDialog(
          title: const Text('Đơn Giao hàng'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<DeliveryPartner>(
                  initialValue: partner,
                  decoration:
                      const InputDecoration(labelText: 'Đơn vị giao hàng'),
                  items: DeliveryPartner.values
                      .map((p) =>
                          DropdownMenuItem(value: p, child: Text(p.label)))
                      .toList(),
                  onChanged: (v) => setDState(() => partner = v ?? partner),
                ),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Người nhận'),
                ),
                TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration:
                      const InputDecoration(labelText: 'SĐT người nhận'),
                ),
                TextField(
                  controller: addrCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Địa chỉ giao'),
                ),
                TextField(
                  controller: feeCtrl,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Phí ship (đ)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dlgCtx),
                child: const Text('Đóng')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD97706)),
              child:
                  const Text('Lưu', style: TextStyle(color: Colors.white)),
              onPressed: () {
                final notifier =
                    ref.read(cafePosCartProvider.notifier);
                notifier.setCustomer(
                    nameCtrl.text.trim(), phoneCtrl.text.trim());
                notifier.setDelivery(
                  partner,
                  addrCtrl.text.trim(),
                  double.tryParse(feeCtrl.text.replaceAll(',', '')) ?? 0,
                );
                Navigator.pop(dlgCtx);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Tách hóa đơn: chọn một phần món để thanh toán riêng, phần còn lại
  /// ở lại bàn phục vụ tiếp.
  Future<void> _showSplitBillDialog(
      BuildContext context, CafeOrder cart) async {
    final selected = <int>{};
    PaymentMethod method = PaymentMethod.tienMat;
    await showDialog(
      context: context,
      builder: (dlgCtx) => StatefulBuilder(
        builder: (ctx, setDState) => AlertDialog(
          title: Text('Tách hóa đơn • ${cart.orderCode}'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Chọn món cần tách:')),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.items.length,
                    itemBuilder: (_, i) {
                      final it = cart.items[i];
                      return CheckboxListTile(
                        dense: true,
                        value: selected.contains(i),
                        onChanged: (v) => setDState(() => v == true
                            ? selected.add(i)
                            : selected.remove(i)),
                        title: Text('${it.menuItemName} ×${it.quantity}'),
                        subtitle: Text('Size ${it.selectedSize.name}'
                            '${it.selectedToppings.isNotEmpty ? ' + ${it.selectedToppings.map((t) => t.name).join(", ")}' : ''}'),
                        secondary:
                            Text(currencyFormatter.format(it.totalPrice)),
                      );
                    },
                  ),
                ),
                const Divider(),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Thanh toán phần tách bằng:')),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: PaymentMethod.values
                      .where((m) => m != PaymentMethod.nhieuPhuongThuc)
                      .map((m) => ChoiceChip(
                            label: Text(m.label,
                                style: const TextStyle(fontSize: 11)),
                            selected: method == m,
                            selectedColor: const Color(0xFFD97706),
                            labelStyle: TextStyle(
                                color: method == m
                                    ? Colors.white
                                    : Colors.black),
                            onSelected: (_) => setDState(() => method = m),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dlgCtx),
                child: const Text('Hủy')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD97706)),
              onPressed:
                  (selected.isEmpty || selected.length == cart.items.length)
                      ? null
                      : () async {
                          Navigator.pop(dlgCtx);
                          final paidOrder = await ref
                              .read(cafePosCartProvider.notifier)
                              .splitCheckout(selected.toSet(), method, ref);
                          if (paidOrder == null) return;
                          if (!context.mounted || !mounted) return;
                          try {
                            await printReceiptByMode(
                              context,
                              ref,
                              await _buildReceipt(paidOrder),
                              ReceiptPrintMode.auto,
                              pdfFilename:
                                  'HoaDon_${paidOrder.orderCode}.pdf',
                            );
                          } catch (_) {}
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Đã tách & thu ${currencyFormatter.format(paidOrder.grandTotal)} — phần còn lại vẫn phục vụ tại chỗ.'),
                          ));
                        },
              child: const Text('Tách & Thu tiền',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<ReceiptData> _buildReceipt(CafeOrder cart) async {
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();
    return ReceiptData(
      shopName: storeName ?? 'KANPOSVN',
      shopOwnerName: ownerName,
      shopPhone: storePhone,
      title: 'HÓA ĐƠN THANH TOÁN',
      orderCode: cart.orderCode,
      date: cart.paidAt ?? DateTime.now(),
      table: cart.tableName ?? '',
      customer: cart.customerName,
      paymentMethod: cart.paymentMethod.label,
      qrData: cart.orderCode,
      items: cart.items.map((item) {
        final unitPrice = item.unitPrice + item.selectedSize.extraPrice;
        final toppings = item.selectedToppings
            .map((t) => '${t.name} ${currencyFormatter.format(t.price)}')
            .join(', ');
        return ReceiptItem(
          name: '${item.menuItemName} (${item.selectedSize.name})',
          quantity: item.quantity.toDouble(),
          unitPrice: unitPrice,
          total: item.totalPrice,
          extra: toppings.isNotEmpty
              ? toppings
              : (item.note.isNotEmpty ? item.note : ''),
        );
      }).toList(),
      subtotal: cart.subtotal,
      discount: cart.totalDiscount,
      grandTotal: cart.grandTotal,
    );
  }

  void _showPrintBillPreview(BuildContext context, CafeOrder cart) {
    final screenContext = context;

    showDialog(
      context: screenContext,
      builder: (ctx) {
        return AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          title: const Text('Mẫu In Hóa Đơn Tạm Tính (K80 / K58)'),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '--- KHÁCH HÀNG TẠM TÍNH ---',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Mã đơn: ${cart.orderCode}'),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày: ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now())}',
                  ),
                  const Divider(),
                  ...cart.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.menuItemName} x${item.quantity}',
                            ),
                          ),
                          Text(currencyFormatter.format(item.totalPrice)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tổng tiền:'),
                      Text(
                        currencyFormatter.format(cart.grandTotal),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Cảm ơn quý khách và hẹn gặp lại!',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Đóng'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(ctx);
                if (!screenContext.mounted) return;
                await _printReceiptPdf(
                  screenContext,
                  cart,
                  createPdfFirst: true,
                );
              },
              child: const Text('Gửi tới máy in'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _printReceiptPdf(
    BuildContext context,
    CafeOrder cart, {
    bool createPdfFirst = false,
  }) async {
    await printBillPdf(
      cart,
      context: context,
      createPdfFileFirst: createPdfFirst,
    );
    if (cart.id.isNotEmpty) {
      ref.read(cafeOrdersProvider.notifier).markPrinted(cart);
    }
  }

  void _showPaymentDialog(BuildContext context, CafeOrder cart) {
    final screenContext = context;
    PaymentMethod selectedMethod = PaymentMethod.tienMat;
    final total = cart.grandTotal;
    final splitCtrls = {
      for (final m in [
        PaymentMethod.tienMat,
        PaymentMethod.qr,
        PaymentMethod.the,
        PaymentMethod.viDienTu,
      ])
        m: TextEditingController(),
    };

    showDialog(
      context: screenContext,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogStateContext, setPayState) {
            double splitSum = 0;
            if (selectedMethod == PaymentMethod.nhieuPhuongThuc) {
              splitSum = splitCtrls.values.fold(
                  0,
                  (sum, c) =>
                      sum +
                      (double.tryParse(c.text.replaceAll(',', '')) ?? 0));
            }
            return AlertDialog(
              scrollable: true,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              title: Text('Thanh Toán Đơn: ${cart.orderCode}'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tổng số tiền: ${currencyFormatter.format(total)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('Phương thức thanh toán:'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: PaymentMethod.values.map((m) {
                        final isSelected = selectedMethod == m;
                        return ChoiceChip(
                          label: Text(m.label),
                          selected: isSelected,
                          selectedColor: const Color(0xFFD97706),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          onSelected: (val) {
                            if (val) setPayState(() => selectedMethod = m);
                          },
                        );
                      }).toList(),
                    ),
                    // Thanh toán nhiều phương thức: chia số tiền từng phần
                    if (selectedMethod ==
                        PaymentMethod.nhieuPhuongThuc) ...[
                      const SizedBox(height: 12),
                      const Text('Nhập số tiền từng phương thức:',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      ...splitCtrls.entries.map((e) => TextField(
                            controller: e.value,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: e.key.label,
                              prefixText: 'đ ',
                            ),
                            onChanged: (_) => setPayState(() {}),
                          )),
                      const SizedBox(height: 8),
                      Text(
                        'Đã nhập: ${currencyFormatter.format(splitSum)} — '
                        '${splitSum >= total ? "ĐỦ" : "Còn thiếu ${currencyFormatter.format(total - splitSum)}"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: splitSum >= total ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Hủy'),
                ),
                if (cart.tableId != null)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      _showSplitBillDialog(screenContext, cart);
                    },
                    child: const Text('Tách hóa đơn...'),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                  ),
                  onPressed: () async {
                    // Kiểm tra tổng tiền các phương thức trước khi xác nhận
                    Map<PaymentMethod, double> splits = {};
                    if (selectedMethod == PaymentMethod.nhieuPhuongThuc) {
                      splits = {
                        for (final e in splitCtrls.entries)
                          if ((double.tryParse(
                                    e.value.text.replaceAll(',', ''),
                                  ) ??
                                  0) >
                              0)
                            e.key: double.tryParse(
                                  e.value.text.replaceAll(',', ''),
                                )!,
                      };
                      final sum = splits.values.fold(0.0, (a, b) => a + b);
                      if (splits.isEmpty || (sum - total).abs() > 1) {
                        ScaffoldMessenger.of(screenContext).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Tổng các phương thức phải bằng đúng ${currencyFormatter.format(total)}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                    }
                    Navigator.pop(dialogContext);
                    final completedOrder = await ref
                        .read(cafePosCartProvider.notifier)
                        .checkout(selectedMethod, ref, mixedSplits: splits);
                    if (!screenContext.mounted || !mounted) return;
                    await printReceiptByMode(
                      screenContext,
                      ref,
                      await _buildReceipt(completedOrder),
                      ReceiptPrintMode.auto,
                      pdfFilename:
                          'HoaDon_${completedOrder.orderCode}.pdf',
                    );
                    if (!screenContext.mounted) return;
                    ScaffoldMessenger.of(screenContext).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Thanh toán hoàn tất! Đã tự động trừ kho nguyên liệu và thêm vào hàng chờ đồng bộ.',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Xác nhận & In Bill',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

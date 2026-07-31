import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';
import '../services/pdf_generator_service.dart';

class PosOrderScreen extends ConsumerStatefulWidget {
  const PosOrderScreen({super.key});

  @override
  ConsumerState<PosOrderScreen> createState() => _PosOrderScreenState();
}

class _PosOrderScreenState extends ConsumerState<PosOrderScreen> {
  String? _selectedCategoryId;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    final filteredProducts = db.products.where((p) {
      bool catMatch = _selectedCategoryId == null || p.categoryId == _selectedCategoryId;
      bool searchMatch = _searchQuery.isEmpty || p.name.toLowerCase().contains(_searchQuery.toLowerCase()) || p.code.toLowerCase().contains(_searchQuery.toLowerCase());
      return catMatch && searchMatch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            // Left: Menu & Product Selection Grid
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // Search
                    TextField(
                      onChanged: (val) => setState(() => _searchQuery = val),
                      decoration: InputDecoration(
                        hintText: 'Tìm món...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Category Chips
                    SizedBox(
                      height: 36,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ChoiceChip(
                            label: const Text('Tất cả', style: TextStyle(fontSize: 12)),
                            selected: _selectedCategoryId == null,
                            onSelected: (val) => setState(() => _selectedCategoryId = null),
                            selectedColor: const Color(0xFF4A2C2A),
                            labelStyle: TextStyle(color: _selectedCategoryId == null ? Colors.white : Colors.black),
                            visualDensity: VisualDensity.compact,
                          ),
                          const SizedBox(width: 6),
                          ...db.categories.map((cat) {
                            final isSel = _selectedCategoryId == cat.id;
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: ChoiceChip(
                                label: Text(cat.name, style: const TextStyle(fontSize: 12)),
                                selected: isSel,
                                onSelected: (val) => setState(() => _selectedCategoryId = val ? cat.id : null),
                                selectedColor: const Color(0xFF4A2C2A),
                                labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black),
                                visualDensity: VisualDensity.compact,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Product Grid
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 160,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: MediaQuery.of(context).size.height > 500 ? 0.85 : 0.75,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: InkWell(
                              onTap: () => _showProductCustomizationModal(context, product, cartNotifier),
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 55,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF3E5AB).withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Icon(_getCategoryIcon(product.categoryName), size: 32, color: const Color(0xFF4A2C2A)),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                                    const Spacer(),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      Text(currency.format(product.basePrice), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF2E7D32))),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(color: Color(0xFF4A2C2A), shape: BoxShape.circle),
                                        child: const Icon(Icons.add, color: Colors.white, size: 14),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right: Cart Panel
            Container(
              width: 320,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Header
                  Row(children: [
                    const Icon(Icons.shopping_cart, color: Color(0xFF4A2C2A), size: 18),
                    const SizedBox(width: 6),
                    const Expanded(child: Text('Đơn Hàng', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                    if (cart.items.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.delete_sweep, color: Colors.red, size: 18),
                        onPressed: () => cartNotifier.clearCart(),
                        padding: EdgeInsets.zero, constraints: const BoxConstraints(),
                      ),
                  ]),

                  // Order type
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(color: const Color(0xFFFFF8E1), borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      Icon(cart.orderType == OrderType.atTable ? Icons.table_restaurant : cart.orderType == OrderType.takeaway ? Icons.shopping_bag : Icons.delivery_dining, color: const Color(0xFF6B4226), size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          cart.orderType == OrderType.atTable && cart.selectedTable != null
                              ? '${cart.selectedTable!.name} (${cart.selectedTable!.areaName})'
                              : cart.orderType.label,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                      TextButton(onPressed: () => _showOrderTypeDialog(context, cartNotifier), child: const Text('Đổi', style: TextStyle(fontSize: 10))),
                    ]),
                  ),
                  const SizedBox(height: 6),

                  // Cart items - takes remaining space
                  Expanded(
                    child: cart.items.isEmpty
                        ? const Center(child: Text('Chọn món bên trái', style: TextStyle(color: Colors.grey, fontSize: 12)))
                        : ListView.separated(
                            itemCount: cart.items.length,
                            separatorBuilder: (ctx, i) => const Divider(height: 6),
                            itemBuilder: (ctx, index) {
                              final item = cart.items[index];
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text('${item.productName} (${item.sizeName})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                                      if (item.selectedToppings.isNotEmpty)
                                        Text('+${item.selectedToppings.map((t) => t.name).join(", ")}', style: TextStyle(fontSize: 9, color: Colors.grey[600]), maxLines: 1, overflow: TextOverflow.ellipsis),
                                      Text('${item.quantity} x ${currency.format(item.itemUnitPrice)}', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                                    ]),
                                  ),
                                  Row(mainAxisSize: MainAxisSize.min, children: [
                                    SizedBox(width: 22, height: 22, child: IconButton(icon: const Icon(Icons.remove_circle_outline, size: 14), onPressed: () => cartNotifier.updateQuantity(index, -1), padding: EdgeInsets.zero)),
                                    Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                    SizedBox(width: 22, height: 22, child: IconButton(icon: const Icon(Icons.add_circle_outline, size: 14), onPressed: () => cartNotifier.updateQuantity(index, 1), padding: EdgeInsets.zero)),
                                  ]),
                                  Text(currency.format(item.totalPrice), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                ],
                              );
                            },
                          ),
                  ),

                  // Bottom: Pricing + Button (always visible)
                  const Divider(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('Tạm tính:', style: TextStyle(fontSize: 11)),
                    Text(currency.format(cart.subtotal), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                  ]),
                  if (cart.calculatedDiscount > 0)
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      const Text('Giảm giá:', style: TextStyle(fontSize: 11)),
                      Text('-${currency.format(cart.calculatedDiscount)}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11)),
                    ]),
                  const SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('TỔNG:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
                    Text(currency.format(cart.totalAmount), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
                  ]),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton.icon(
                      onPressed: cart.items.isEmpty ? null : () => _showPaymentDialog(context, ref, cart, currency),
                      icon: const Icon(Icons.payments, size: 16),
                      label: const Text('Thanh Toán', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String catName) {
    if (catName.contains('Cafe')) return Icons.local_cafe;
    if (catName.contains('Trà')) return Icons.emoji_food_beverage;
    if (catName.contains('Sinh')) return Icons.local_bar;
    if (catName.contains('Nước')) return Icons.local_drink;
    return Icons.cake;
  }

  void _showProductCustomizationModal(BuildContext context, ProductModel product, CartNotifier cartNotifier) {
    String selectedSize = 'M';
    double extraSizePrice = 5000;
    List<ProductTopping> selectedToppings = [];
    String note = '';

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return AlertDialog(
              title: Text('Tùy Chọn: ${product.name}'),
              content: SizedBox(
                width: 380,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sizes matching PRD Section 11
                      const Text('Kích thước (Size):', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: product.sizes.map((sz) {
                          final isSel = selectedSize == sz.name;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text('${sz.name} (+${sz.extraPrice.toInt()}đ)'),
                              selected: isSel,
                              onSelected: (val) {
                                setModalState(() {
                                  selectedSize = sz.name;
                                  extraSizePrice = sz.extraPrice;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),

                      // Toppings matching PRD Section 12
                      if (product.toppings.isNotEmpty) ...[
                        const Text('Topping đi kèm:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        ...product.toppings.map((top) {
                          final isChecked = selectedToppings.any((t) => t.id == top.id);
                          return CheckboxListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text('${top.name} (+${top.price.toInt()}đ)'),
                            value: isChecked,
                            onChanged: (val) {
                              setModalState(() {
                                if (val == true) {
                                  selectedToppings.add(top);
                                } else {
                                  selectedToppings.removeWhere((t) => t.id == top.id);
                                }
                              });
                            },
                          );
                        }),
                        const SizedBox(height: 12),
                      ],

                      // Note (Ví dụ: Ít đá, 50% đường)
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Ghi chú pha chế (VD: Ít đá, 50% đường...)',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) => note = val,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
                ElevatedButton(
                  onPressed: () {
                    cartNotifier.addItem(
                      product,
                      sizeName: selectedSize,
                      sizeExtraPrice: extraSizePrice,
                      toppings: selectedToppings,
                      note: note,
                    );
                    Navigator.pop(ctx);
                  },
                  child: const Text('Thêm Vào Giỏ'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showOrderTypeDialog(BuildContext context, CartNotifier cartNotifier) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Chọn Loại Đơn Hàng'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              cartNotifier.setOrderType(OrderType.atTable);
              Navigator.pop(ctx);
            },
            child: const Text('Ăn tại bàn'),
          ),
          SimpleDialogOption(
            onPressed: () {
              cartNotifier.setOrderType(OrderType.takeaway);
              Navigator.pop(ctx);
            },
            child: const Text('Mang đi (Take Away)'),
          ),
          SimpleDialogOption(
            onPressed: () {
              cartNotifier.setOrderType(OrderType.delivery);
              Navigator.pop(ctx);
            },
            child: const Text('Giao hàng (Delivery)'),
          ),
        ],
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, WidgetRef ref, CartState cart, NumberFormat currency) {
    String selectedMethod = 'CASH';

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setPayState) {
            return AlertDialog(
              title: Text('Thanh Toán: ${currency.format(cart.totalAmount)}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Chọn Phương Thức Thanh Toán:'),
                  const SizedBox(height: 12),
                  RadioListTile(
                    title: const Text('Tiền mặt (Cash)'),
                    value: 'CASH',
                    groupValue: selectedMethod,
                    onChanged: (val) => setPayState(() => selectedMethod = val.toString()),
                  ),
                  RadioListTile(
                    title: const Text('Chuyển khoản QR (VietQR)'),
                    value: 'VIETQR',
                    groupValue: selectedMethod,
                    onChanged: (val) => setPayState(() => selectedMethod = val.toString()),
                  ),
                  RadioListTile(
                    title: const Text('Thẻ ngân hàng / POS'),
                    value: 'CARD',
                    groupValue: selectedMethod,
                    onChanged: (val) => setPayState(() => selectedMethod = val.toString()),
                  ),
                  RadioListTile(
                    title: const Text('Ví điện tử (Momo/ZaloPay)'),
                    value: 'E_WALLET',
                    groupValue: selectedMethod,
                    onChanged: (val) => setPayState(() => selectedMethod = val.toString()),
                  ),
                ],
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
                ElevatedButton.icon(
                  onPressed: () {
                    // Lưu đơn chưa thanh toán
                    final order = ref.read(cartProvider.notifier).checkout(
                      paymentMethod: selectedMethod,
                      paymentStatus: 'UNPAID',
                    );
                    // Chuyển bàn sang chờ thanh toán
                    ref.read(cartProvider.notifier).markTablePendingPayment();
                    ref.read(tablesProvider.notifier).loadTables();
                    ref.read(syncNotifierProvider.notifier).refreshPendingCount();
                    Navigator.pop(ctx);
                    _showReceiptPreviewModal(context, ref, order);
                  },
                  icon: const Icon(Icons.print),
                  label: const Text('Lưu & In Bill'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showReceiptPreviewModal(BuildContext context, WidgetRef ref, OrderModel order) {
    final printer = ref.read(receiptPrinterProvider);
    final receiptText = printer.generateThermalReceiptText(order, paperSize: '80mm');

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Xem Trước Hóa Đơn In Nhiệt (80mm)'),
          content: Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFFFFFDE7),
            width: 320,
            child: SingleChildScrollView(
              child: Text(
                receiptText,
                style: const TextStyle(fontFamily: 'Courier', fontSize: 12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Đóng'),
            ),
            // Nút Thanh toán - In PDF + hoàn tất thanh toán + giải phóng bàn
            ElevatedButton.icon(
              onPressed: () {
                final messenger = ScaffoldMessenger.of(ctx);
                Navigator.pop(ctx);

                // Tạo bản copy đã thanh toán để in PDF
                final paidOrder = order.copyWith(
                  paymentStatus: 'PAID',
                  status: 'COMPLETED',
                  paidAt: DateTime.now(),
                );

                // In PDF với trạng thái ĐÃ THANH TOÁN
                PdfGeneratorService.printBill(paidOrder);

                // Complete payment
                final db = ref.read(dbProvider);
                if (order.id.isNotEmpty) {
                  db.completeOrderPayment(paidOrder, order.paymentMethod);

                  // Free table → chuyển sang đang dọn
                  if (order.tableId != null) {
                    final table = db.tables.firstWhere(
                      (t) => t.id == order.tableId,
                      orElse: () => db.tables.first,
                    );
                    db.updateTable(table.copyWith(
                      status: TableStatus.cleaning,
                      currentCustomerName: null,
                      customerCount: 0,
                      currentOrderId: null,
                      occupiedAt: null,
                    ));
                    ref.read(tablesProvider.notifier).loadTables();
                  }

                  ref.read(syncNotifierProvider.notifier).refreshPendingCount();
                }

                messenger.showSnackBar(
                  const SnackBar(content: Text('Đã in PDF & thanh toán thành công! Bàn đang chờ dọn.'), backgroundColor: Colors.green),
                );
              },
              icon: const Icon(Icons.payment),
              label: const Text('Thanh Toán & In PDF'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white),
            ),
          ],
        );
      },
    );
  }
}

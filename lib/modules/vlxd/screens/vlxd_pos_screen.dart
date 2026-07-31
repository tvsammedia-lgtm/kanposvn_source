import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/vlxd_order_model.dart';

final _cartProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);
final _orderTypeProvider = StateProvider<String>((ref) => 'retail');
final _customerNameProvider = StateProvider<String>((ref) => '');

class VlxdPosScreen extends ConsumerWidget {
  const VlxdPosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final products = db.getCollection('products');
    final cart = ref.watch(_cartProvider);
    final orderType = ref.watch(_orderTypeProvider);
    final customerName = ref.watch(_customerNameProvider);

    final totalAmount = cart.fold<double>(0, (sum, item) => sum + ((item['totalPrice'] as num?) ?? 0).toDouble());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  color: AppColors.surface,
                  child: Row(
                    children: [
                      SegmentedButton<String>(
                        segments: [
                          ButtonSegment(value: 'retail', label: Text('retail_label'.tr), icon: const Icon(Icons.storefront_rounded, size: 16)),
                          ButtonSegment(value: 'wholesale', label: Text('wholesale'.tr), icon: const Icon(Icons.local_shipping_rounded, size: 16)),
                        ],
                        selected: {orderType},
                        onSelectionChanged: (s) => ref.read(_orderTypeProvider.notifier).state = s.first,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          onChanged: (v) => ref.read(_customerNameProvider.notifier).state = v,
                          decoration: InputDecoration(
                            hintText: 'customer_name'.tr,
                            isDense: true,
                            prefixIcon: const Icon(Icons.person_outline, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: products.isEmpty
                      ? EmptyState(
                          icon: Icons.inventory_2_outlined,
                          title: 'no_products_add'.tr,
                          subtitle: 'add_products_in_section'.tr,
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final p = products[index];
                            final name = (p['name'] as String?) ?? '';
                            final retailPrice = ((p['retailPrice'] as num?) ?? 0).toDouble();
                            final wholesalePrice = ((p['wholesalePrice'] as num?) ?? 0).toDouble();
                            final stock = (p['stockQuantity'] as int?) ?? 0;
                            final price = orderType == 'wholesale' ? wholesalePrice : retailPrice;

                            return GestureDetector(
                              onTap: stock <= 0
                                  ? null
                                  : () {
                                      final existingIndex = cart.indexWhere(
                                          (c) => c['productId'] == p['id']);
                                      if (existingIndex >= 0) {
                                        final updated = List<Map<String, dynamic>>.from(cart);
                                        final item = Map<String, dynamic>.from(updated[existingIndex]);
                                        final qty = ((item['quantity'] as num?) ?? 0).toInt() + 1;
                                        item['quantity'] = qty;
                                        item['totalPrice'] = qty * price;
                                        updated[existingIndex] = item;
                                        ref.read(_cartProvider.notifier).state = updated;
                                      } else {
                                        ref.read(_cartProvider.notifier).state = [
                                          ...cart,
                                          {
                                            'productId': p['id'],
                                            'productName': name,
                                            'quantity': 1,
                                            'unitPrice': price,
                                            'totalPrice': price,
                                          },
                                        ];
                                      }
                                    },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: stock <= 0
                                      ? AppColors.surfaceAlt
                                      : AppColors.surface,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Icon(
                                          Icons.inventory_2_rounded,
                                          size: 32,
                                          color: stock <= 0 ? AppColors.textMuted : AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: stock <= 0 ? AppColors.textMuted : AppColors.textPrimary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppFormatters.formatCurrency(price),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: stock <= 0 ? AppColors.textMuted : AppColors.primary,
                                          ),
                                        ),
                                          Text(
                                            'stock_label'.trParams({'count': '$stock'}),
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: stock <= 10 ? AppColors.danger : AppColors.textMuted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          Container(
            width: 320,
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border(left: BorderSide(color: AppColors.border)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart_rounded, size: 20, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text('cart_label'.trParams({'count': '${cart.length}'}),
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const Spacer(),
                      if (cart.isNotEmpty)
                        TextButton(
                          onPressed: () => ref.read(_cartProvider.notifier).state = [],
                          child: Text('clear_cart'.tr, style: const TextStyle(fontSize: 12)),
                        ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: cart.isEmpty
                      ? Center(
                          child: Text('select_product_to_add'.tr,
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: cart.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final item = cart[index];
                            final name = (item['productName'] as String?) ?? '';
                            final qty = ((item['quantity'] as num?) ?? 0).toDouble();
                            final unitPrice = ((item['unitPrice'] as num?) ?? 0).toDouble();
                            final totalPrice = ((item['totalPrice'] as num?) ?? 0).toDouble();

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                        Text(
                                          '${qty.toStringAsFixed(0)} x ${AppFormatters.formatCurrency(unitPrice)}',
                                          style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(AppFormatters.formatCurrency(totalPrice),
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                  const SizedBox(width: 4),
                                  IconButton(
                                    icon: const Icon(Icons.close, size: 16, color: AppColors.textMuted),
                                    onPressed: () {
                                      final updated = List<Map<String, dynamic>>.from(cart);
                                      updated.removeAt(index);
                                      ref.read(_cartProvider.notifier).state = updated;
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const Divider(height: 1),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('total'.tr, style: const TextStyle(fontSize: 14)),
                          Text(
                            AppFormatters.formatCurrency(totalAmount),
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: cart.isEmpty
                              ? null
                              : () => _processOrder(context, ref, orderType, customerName, cart, totalAmount),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            disabledBackgroundColor: AppColors.textMuted,
                          ),
                          child: Text('payment'.tr, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _processOrder(
    BuildContext context,
    WidgetRef ref,
    String orderType,
    String customerName,
    List<Map<String, dynamic>> cart,
    double totalAmount,
  ) {
    final db = DatabaseService.instance;
    final orderId = IdGenerator.generateId('ORD');
    final orderNum = IdGenerator.generateOrderCode(orderType == 'retail' ? 'BL' : 'BS');

    final orderItems = cart.map((c) => VlxdOrderItem(
      productId: c['productId'] as String,
      productName: c['productName'] as String,
      quantity: ((c['quantity'] as num?) ?? 0).toDouble(),
      unitPrice: ((c['unitPrice'] as num?) ?? 0).toDouble(),
      totalPrice: ((c['totalPrice'] as num?) ?? 0).toDouble(),
    )).toList();

    final order = VlxdOrderModel(
      id: orderId,
      orderNumber: orderNum,
      type: orderType,
      customerName: customerName.isEmpty ? 'retail_customer'.tr : customerName,
      items: orderItems,
      totalAmount: totalAmount,
      paidAmount: totalAmount,
      status: 'completed',
    );

    db.saveItem('saleOrders', order.id, order.toJson());

    for (final item in cart) {
      final productId = item['productId'] as String;
      final qty = ((item['quantity'] as num?) ?? 0).toInt();
      final product = db.getById('products', productId);
      if (product != null) {
        final currentStock = (product['stockQuantity'] as int?) ?? 0;
        final updated = Map<String, dynamic>.from(product);
        updated['stockQuantity'] = currentStock - qty;
        db.saveItem('products', productId, updated, triggerSync: false);
      }
    }

    ref.read(_cartProvider.notifier).state = [];
    ref.read(_customerNameProvider.notifier).state = '';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('order_created_snackbar'.trParams({'order': orderNum, 'amount': AppFormatters.formatCurrency(totalAmount)})),
        backgroundColor: AppColors.success,
      ),
    );
  }
}

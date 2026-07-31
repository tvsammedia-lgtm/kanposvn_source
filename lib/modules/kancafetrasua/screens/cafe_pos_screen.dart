import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';
import '../models/cafe_product_model.dart';
import '../models/order_model.dart';
import '../models/table_model.dart';

final cartItemsProvider = StateProvider<List<CafeOrderItem>>((ref) => []);
final selectedTableProvider = StateProvider<String?>((ref) => null);
final selectedOrderTypeProvider =
    StateProvider<CafeOrderType>((ref) => CafeOrderType.dineIn);

class CafePosScreen extends ConsumerStatefulWidget {
  const CafePosScreen({super.key});

  @override
  ConsumerState<CafePosScreen> createState() => _CafePosScreenState();
}

class _CafePosScreenState extends ConsumerState<CafePosScreen> {
  String _selectedCategory = '';
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;
    final products = db.getCollection('products');
    final areas = db.getCollection('areas');
    final tables = db.getCollection('tables');
    final cart = ref.watch(cartItemsProvider);

    final filteredProducts = products.where((p) {
      final matchesCategory = _selectedCategory.isEmpty ||
          p['categoryId'] == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          (p['name'] as String? ?? '')
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    final categories = <String, String>{};
    for (final p in products) {
      final catId = p['categoryId'] ?? '';
      if (catId.isNotEmpty) {
        categories[catId] = catId;
      }
    }

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildToolbar(context, cart),
              _buildCategoryBar(categories.keys.toList()),
              Expanded(
                child: filteredProducts.isEmpty
                    ? EmptyState(
                        icon: Icons.coffee_outlined,
                        title: 'no_products'.tr,
                        subtitle: 'add_products_to_start'.tr,
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return _buildProductCard(context, product);
                        },
                      ),
              ),
            ],
          ),
        ),
        Container(
          width: 340,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(left: BorderSide(color: AppColors.border)),
          ),
          child: _buildCartPanel(context, cart, tables, areas),
        ),
      ],
    );
  }

  Widget _buildToolbar(BuildContext context, List<CafeOrderItem> cart) {
    final orderType = ref.watch(selectedOrderTypeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 280,
            child: AppSearchBar(
              hint: 'search_product'.tr,
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          const SizedBox(width: 12),
          _buildOrderTypeChip(CafeOrderType.dineIn, 'order_type_dine_in'.tr,
              Icons.table_restaurant_rounded, orderType),
          const SizedBox(width: 6),
          _buildOrderTypeChip(CafeOrderType.takeaway, 'order_type_takeaway'.tr,
              Icons.takeout_dining_rounded, orderType),
          const SizedBox(width: 6),
          _buildOrderTypeChip(CafeOrderType.delivery, 'order_type_delivery'.tr,
              Icons.delivery_dining_rounded, orderType),
          const Spacer(),
          Text(
            'items'.trParams({'count': cart.length.toString()}),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTypeChip(CafeOrderType type, String label,
      IconData icon, CafeOrderType selected) {
    final isActive = type == selected;
    return GestureDetector(
      onTap: () =>
          ref.read(selectedOrderTypeProvider.notifier).state = type,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 16,
                color: isActive ? AppColors.primary : AppColors.textMuted),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBar(List<String> categoryIds) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryChip('', 'all'.tr),
          ...categoryIds.map((id) => _buildCategoryChip(id, id)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String id, String label) {
    final isActive = _selectedCategory == id;
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      child: GestureDetector(
        onTap: () => setState(() => _selectedCategory = id),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, Map<String, dynamic> product) {
    final name = product['name'] ?? '';
    final basePrice = (product['basePrice'] ?? 0).toDouble();
    final isAvailable = product['isAvailable'] ?? true;

    return GestureDetector(
      onTap: isAvailable ? () => _showProductDialog(context, product) : null,
      child: Container(
        decoration: BoxDecoration(
          color: isAvailable ? AppColors.surface : AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isAvailable ? AppColors.border : AppColors.border.withOpacity(0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Icon(
                  Icons.coffee_rounded,
                  size: 36,
                  color: isAvailable
                      ? AppColors.primary.withOpacity(0.4)
                      : AppColors.textMuted.withOpacity(0.3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: isAvailable
                          ? AppColors.textPrimary
                          : AppColors.textMuted,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppFormatters.formatCurrency(basePrice),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isAvailable
                          ? AppColors.primary
                          : AppColors.textMuted,
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

  void _showProductDialog(BuildContext context, Map<String, dynamic> product) {
    final sizes = (product['sizes'] as List<dynamic>?)
            ?.map((s) => ProductSize.fromJson(s))
            .toList() ??
        [];
    final toppings = (product['toppings'] as List<dynamic>?)
            ?.map((t) => ProductTopping.fromJson(t))
            .toList() ??
        [];
    final basePrice = (product['basePrice'] ?? 0).toDouble();

    String selectedSize = sizes.isNotEmpty ? sizes.first.name : '';
    final Set<String> selectedToppings = {};
    int quantity = 1;
    final notesController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) {
          double unitPrice = basePrice;
          if (selectedSize.isNotEmpty) {
            final sizeObj =
                sizes.firstWhere((s) => s.name == selectedSize);
            unitPrice += sizeObj.extraPrice;
          }
          for (final tName in selectedToppings) {
            final tObj = toppings.firstWhere((t) => t.name == tName);
            unitPrice += tObj.price;
          }

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
              left: 24,
              right: 24,
              top: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product['name'] ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppFormatters.formatCurrency(basePrice),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (sizes.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text('size'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: sizes.map((size) {
                        final isSelected = selectedSize == size.name;
                        return ChoiceChip(
                          label: Text(
                            '${size.name}${size.extraPrice > 0 ? ' (+${AppFormatters.formatCurrency(size.extraPrice)})' : ''}',
                          ),
                          selected: isSelected,
                          onSelected: (_) => setModalState(
                              () => selectedSize = size.name),
                          selectedColor:
                              AppColors.primary.withOpacity(0.15),
                          labelStyle: TextStyle(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  if (toppings.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text('topping_label'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: toppings.map((topping) {
                        final isSelected =
                            selectedToppings.contains(topping.name);
                        return FilterChip(
                          label: Text(
                            '${topping.name} (+${AppFormatters.formatCurrency(topping.price)})',
                          ),
                          selected: isSelected,
                          onSelected: (selected) => setModalState(() {
                            if (selected) {
                              selectedToppings.add(topping.name);
                            } else {
                              selectedToppings.remove(topping.name);
                            }
                          }),
                          selectedColor:
                              AppColors.primary.withOpacity(0.15),
                          labelStyle: TextStyle(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 20),
                  Text('notes'.tr,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      hintText: 'notes_hint'.tr,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18),
                              onPressed: quantity > 1
                                  ? () => setModalState(() => quantity--)
                                  : null,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18),
                              onPressed: () =>
                                  setModalState(() => quantity++),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppFormatters.formatCurrency(unitPrice * quantity),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final item = CafeOrderItem(
                          productId: product['id'] ?? '',
                          productName: product['name'] ?? '',
                          sizeName: selectedSize,
                          selectedToppings:
                              selectedToppings.toList(),
                          quantity: quantity,
                          unitPrice: unitPrice,
                          totalPrice: unitPrice * quantity,
                          notes: notesController.text,
                        );
                        ref.read(cartItemsProvider.notifier).state = [
                          ...ref.read(cartItemsProvider),
                          item,
                        ];
                        Navigator.pop(ctx);
                      },
                      child: Text('add_to_cart'.tr),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartPanel(
    BuildContext context,
    List<CafeOrderItem> cart,
    List<Map<String, dynamic>> tables,
    List<Map<String, dynamic>> areas,
  ) {
    final selectedTable = ref.watch(selectedTableProvider);
    final orderType = ref.watch(selectedOrderTypeProvider);
    final totalAmount =
        cart.fold<double>(0, (sum, item) => sum + item.totalPrice);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'order'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (orderType == CafeOrderType.dineIn) ...[
                const SizedBox(height: 12),
                Text('select_table'.tr,
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tables.map((t) {
                    final isSelected = selectedTable == t['id'];
                    final isOccupied = t['status'] == 'occupied';
                    return GestureDetector(
                      onTap: isOccupied
                          ? null
                          : () {
                              ref.read(selectedTableProvider.notifier).state =
                                  t['id'];
                            },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary.withOpacity(0.15)
                              : isOccupied
                                  ? AppColors.surfaceAlt
                                  : AppColors.surface,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                        ),
                        child: Text(
                          t['name'] ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isOccupied
                                ? AppColors.textMuted
                                : isSelected
                                    ? AppColors.primary
                                    : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: cart.isEmpty
              ? EmptyState(
                  icon: Icons.shopping_cart_outlined,
                  title: 'cart_empty'.tr,
                  subtitle: 'select_product_to_start'.tr,
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return _buildCartItem(context, item, index);
                  },
                ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('subtotal'.tr,
                      style: const TextStyle(color: AppColors.textSecondary)),
                  Text(AppFormatters.formatCurrency(totalAmount),
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    AppFormatters.formatCurrency(totalAmount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cart.isEmpty ? null : () => _checkout(context),
                  child: Text('payment'.tr),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(
      BuildContext context, CafeOrderItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${item.quantity}x',
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                if (item.sizeName.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Size: ${item.sizeName}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
                if (item.selectedToppings.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Topping: ${item.selectedToppings.join(", ")}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppFormatters.formatCurrency(item.totalPrice),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              final current = ref.read(cartItemsProvider);
              final updated = List<CafeOrderItem>.from(current);
              updated.removeAt(index);
              ref.read(cartItemsProvider.notifier).state = updated;
            },
            child: const Icon(
              Icons.close,
              size: 16,
              color: AppColors.danger,
            ),
          ),
        ],
      ),
    );
  }

  void _checkout(BuildContext context) {
    final cart = ref.read(cartItemsProvider);
    final selectedTable = ref.read(selectedTableProvider);
    final orderType = ref.read(selectedOrderTypeProvider);
    final db = DatabaseService.instance;

    final totalAmount =
        cart.fold<double>(0, (sum, item) => sum + item.totalPrice);

    final order = CafeOrderModel(
      id: IdGenerator.generateId('ORD'),
      orderNumber: IdGenerator.generateOrderCode('CF'),
      type: orderType,
      tableId: orderType == CafeOrderType.dineIn ? selectedTable : null,
      items: cart,
      totalAmount: totalAmount,
      paymentStatus: CafePaymentStatus.paid,
      status: CafeOrderStatus.completed,
      createdAt: DateTime.now(),
    );

    db.saveItem('orders', order.id, order.toJson());

    if (orderType == CafeOrderType.dineIn && selectedTable != null) {
      db.saveItem(
        'tables',
        selectedTable,
        {
          ...db.getById('tables', selectedTable) ?? {},
          'status': 'occupied',
          'currentOrderId': order.id,
          'occupiedAt': DateTime.now().toIso8601String(),
        },
        triggerSync: false,
      );
    }

    ref.read(cartItemsProvider.notifier).state = [];
    ref.read(selectedTableProvider.notifier).state = null;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('order_created'.trParams({
          'orderNumber': order.orderNumber,
          'amount': AppFormatters.formatCurrency(totalAmount),
        })),
      ),
    );
  }
}

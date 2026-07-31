import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/db/database_service.dart';
import '../../../core/widgets/common_widgets.dart';

class CafeDashboard extends ConsumerWidget {
  const CafeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(databaseServiceProvider);
    final db = DatabaseService.instance;

    final orders = db.getCollection('orders');
    final products = db.getCollection('products');
    final tables = db.getCollection('tables');

    final todayOrders = orders.where((o) {
      if (o['createdAt'] == null) return false;
      final created = DateTime.tryParse(o['createdAt']);
      if (created == null) return false;
      final now = DateTime.now();
      return created.year == now.year &&
          created.month == now.month &&
          created.day == now.day;
    }).toList();

    final todayRevenue = todayOrders
        .where((o) => o['paymentStatus'] == 'paid')
        .fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble());

    final pendingOrders = orders
        .where((o) => o['status'] == 'pending' || o['status'] == 'preparing')
        .length;

    final occupiedTables = tables
        .where((t) => t['status'] == 'occupied' || t['status'] == 'reserved')
        .length;

    final averageOrderValue = todayOrders.isNotEmpty
        ? todayOrders.fold<double>(0, (sum, o) => sum + (o['totalAmount'] ?? 0).toDouble()) /
            todayOrders.length
        : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'dashboard'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'open'.tr,
                      style: const TextStyle(
                        color: AppColors.success,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.8,
            children: [
              KpiCard(
                title: 'today_revenue'.tr,
                value: AppFormatters.formatCurrencyShort(todayRevenue),
                subtitle: '${todayOrders.where((o) => o['paymentStatus'] == 'paid').length} đơn đã thanh toán',
                icon: Icons.attach_money_rounded,
                color: AppColors.success,
              ),
              KpiCard(
                title: 'today_orders'.tr,
                value: '${todayOrders.length}',
                subtitle: '$pendingOrders đơn đang xử lý',
                icon: Icons.receipt_long_rounded,
                color: AppColors.primary,
              ),
              KpiCard(
                title: 'tables_in_use'.tr,
                value: '$occupiedTables/${tables.length}',
                subtitle: '${tables.length - occupiedTables} bàn trống',
                icon: Icons.table_restaurant_rounded,
                color: AppColors.warning,
              ),
              KpiCard(
                title: 'average_order'.tr,
                value: AppFormatters.formatCurrencyShort(averageOrderValue),
                subtitle: '${products.length} sản phẩm',
                icon: Icons.analytics_rounded,
                color: AppColors.accent,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _buildRecentOrders(context, todayOrders),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: _buildTopProducts(context, todayOrders),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 288;
    if (width > 1200) return 4;
    if (width > 800) return 3;
    if (width > 500) return 2;
    return 1;
  }

  Widget _buildRecentOrders(
      BuildContext context, List<Map<String, dynamic>> todayOrders) {
    final recentOrders = List<Map<String, dynamic>>.from(todayOrders)
      ..sort((a, b) {
        final aDate = DateTime.tryParse(a['createdAt'] ?? '') ?? DateTime.now();
        final bDate = DateTime.tryParse(b['createdAt'] ?? '') ?? DateTime.now();
        return bDate.compareTo(aDate);
      });

    final displayOrders = recentOrders.take(10).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'recent_orders'.tr),
          const SizedBox(height: 16),
          if (displayOrders.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Text(
                  'no_orders_today'.tr,
                  style: const TextStyle(color: AppColors.textMuted),
                ),
              ),
            )
          else
            ...displayOrders.map((order) => _buildOrderRow(context, order)),
        ],
      ),
    );
  }

  Widget _buildOrderRow(
      BuildContext context, Map<String, dynamic> order) {
    Color statusColor;
    String statusText;
    switch (order['status']) {
      case 'pending':
        statusColor = AppColors.warning;
        statusText = 'status_pending'.tr;
        break;
      case 'preparing':
        statusColor = AppColors.info;
        statusText = 'status_preparing'.tr;
        break;
      case 'completed':
        statusColor = AppColors.success;
        statusText = 'status_completed'.tr;
        break;
      case 'cancelled':
        statusColor = AppColors.danger;
        statusText = 'status_cancelled'.tr;
        break;
      default:
        statusColor = AppColors.textMuted;
        statusText = order['status'] ?? '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.coffee_rounded,
                color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order['orderNumber'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order['type'] == 'dineIn'
                      ? 'order_type_dine_in'.tr
                      : order['type'] == 'takeaway'
                          ? 'order_type_takeaway'.tr
                          : 'order_type_delivery'.tr,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppFormatters.formatCurrency(
                (order['totalAmount'] ?? 0).toDouble()),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(width: 12),
          StatusBadge(label: statusText, color: statusColor),
        ],
      ),
    );
  }

  Widget _buildTopProducts(
      BuildContext context, List<Map<String, dynamic>> todayOrders) {
    final Map<String, int> productCounts = {};
    for (final order in todayOrders) {
      final items = order['items'] as List<dynamic>? ?? [];
      for (final item in items) {
        final name = item['productName'] ?? '';
        final qty = item['quantity'] ?? 1;
        productCounts[name] = (productCounts[name] ?? 0) + (qty as int);
      }
    }

    final sortedProducts = productCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topProducts = sortedProducts.take(5).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'top_products'.tr),
          const SizedBox(height: 16),
          if (topProducts.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Text(
                  'no_data_yet'.tr,
                  style: const TextStyle(color: AppColors.textMuted),
                ),
              ),
            )
          else
            ...topProducts.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? AppColors.warning.withOpacity(0.15)
                            : AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: index == 0
                                ? AppColors.warning
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.key,
                        style: const TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${item.value}x',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/widgets/app_shell.dart';

class VlxdDashboard extends ConsumerWidget {
  const VlxdDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final products = db.getCollection('products');
    final orders = db.getCollection('saleOrders');
    final warehouses = db.getCollection('warehouses');

    final totalProducts = products.length;
    final totalStockValue = products.fold<double>(
        0, (sum, p) => sum + (((p['retailPrice'] as num?) ?? 0).toDouble() * ((p['stockQuantity'] as num?) ?? 0).toInt()));

    final now = DateTime.now();
    final todayOrders = orders.where((o) {
      final created = o['createdAt'] as String?;
      if (created == null) return false;
      final d = DateTime.tryParse(created);
      return d != null && d.year == now.year && d.month == now.month && d.day == now.day;
    }).toList();
    final monthOrders = orders.where((o) {
      final created = o['createdAt'] as String?;
      if (created == null) return false;
      final d = DateTime.tryParse(created);
      return d != null && d.year == now.year && d.month == now.month;
    }).toList();

    final todayRevenue = todayOrders.fold<double>(
        0, (sum, o) => sum + ((o['paidAmount'] as num?) ?? 0).toDouble());
    final monthRevenue = monthOrders.fold<double>(
        0, (sum, o) => sum + ((o['paidAmount'] as num?) ?? 0).toDouble());
    final monthDebt = monthOrders.fold<double>(
        0, (sum, o) {
      final total = ((o['totalAmount'] as num?) ?? 0).toDouble();
      final paid = ((o['paidAmount'] as num?) ?? 0).toDouble();
      return sum + (total - paid);
    });

    final lowStockProducts = products.where((p) =>
        ((p['stockQuantity'] as num?) ?? 0).toInt() <= 10).length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'vlxd_overview'.tr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              AppFormatters.formatDate(now),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                KpiCard(
                  title: 'products_label'.tr,
                  value: '$totalProducts',
                  subtitle: lowStockProducts > 0 ? 'low_stock_warning'.trParams({'count': '$lowStockProducts'}) : 'sufficient_stock'.tr,
                  icon: Icons.inventory_2_rounded,
                  color: AppColors.primary,
                  onTap: () => ref.read(currentScreenIndexProvider.notifier).state = 1,
                ),
                KpiCard(
                  title: 'today_revenue'.tr,
                  value: AppFormatters.formatCurrencyShort(todayRevenue),
                  subtitle: 'orders_today'.trParams({'count': '${todayOrders.length}'}),
                  icon: Icons.trending_up_rounded,
                  color: AppColors.success,
                  onTap: () => ref.read(currentScreenIndexProvider.notifier).state = 2,
                ),
                KpiCard(
                  title: 'monthly_revenue'.tr,
                  value: AppFormatters.formatCurrencyShort(monthRevenue),
                  subtitle: 'orders_today'.trParams({'count': '${monthOrders.length}'}),
                  icon: Icons.receipt_long_rounded,
                  color: AppColors.info,
                  onTap: () => ref.read(currentScreenIndexProvider.notifier).state = 4,
                ),
                KpiCard(
                  title: 'monthly_debt'.tr,
                  value: AppFormatters.formatCurrencyShort(monthDebt),
                  subtitle: 'inventory_value'.trParams({'value': AppFormatters.formatCurrencyShort(totalStockValue)}),
                  icon: Icons.account_balance_wallet_rounded,
                  color: monthDebt > 0 ? AppColors.warning : AppColors.success,
                  onTap: () => ref.read(currentScreenIndexProvider.notifier).state = 4,
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (lowStockProducts > 0)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.warning.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: AppColors.warning, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('stock_warning'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                          Text('low_stock_products'.trParams({'count': '$lowStockProducts'}),
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref.read(currentScreenIndexProvider.notifier).state = 3,
                      child: Text('view_stock'.tr),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'recent_orders'.tr),
                  const SizedBox(height: 12),
                  if (orders.isEmpty)
                    EmptyState(
                      icon: Icons.receipt_outlined,
                      title: 'no_orders'.tr,
                      subtitle: 'click_sales'.tr,
                    )
                  else
                    ...orders.take(5).map((order) {
                      final orderNum = (order['orderNumber'] as String?) ?? '';
                      final custName = (order['customerName'] as String?) ?? 'retail_customer'.tr;
                      final total = ((order['totalAmount'] as num?) ?? 0).toDouble();
                      final status = (order['status'] as String?) ?? 'pending';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: (status == 'completed' ? AppColors.success : AppColors.primary).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                status == 'completed' ? Icons.check_circle_rounded : Icons.receipt_rounded,
                                size: 18,
                                color: status == 'completed' ? AppColors.success : AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(orderNum, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                  Text(custName, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                                ],
                              ),
                            ),
                            Text(AppFormatters.formatCurrency(total),
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

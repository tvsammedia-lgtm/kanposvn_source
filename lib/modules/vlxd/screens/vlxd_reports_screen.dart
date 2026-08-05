import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);

class VlxdReportsScreen extends ConsumerWidget {
  const VlxdReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final year = ref.watch(_selectedYearProvider);
    final products = db.getCollection('products');
    final orders = db.getCollection('saleOrders');

    final yearOrders = orders.where((o) {
      final created = o['createdAt'] as String?;
      if (created == null) return false;
      final d = DateTime.tryParse(created);
      return d != null && d.year == year;
    }).toList();

    final totalRevenue = yearOrders.fold<double>(
        0, (sum, o) => sum + ((o['paidAmount'] as num?) ?? 0).toDouble());
    final totalOrders = yearOrders.length;
    final totalDebt = yearOrders.fold<double>(0, (sum, o) {
      final total = ((o['totalAmount'] as num?) ?? 0).toDouble();
      final paid = ((o['paidAmount'] as num?) ?? 0).toDouble();
      return sum + (total - paid);
    });

    final retailOrders = yearOrders.where((o) => o['type'] == 'retail').toList();
    final wholesaleOrders = yearOrders.where((o) => o['type'] == 'wholesale').toList();
    final retailRevenue = retailOrders.fold<double>(
        0, (sum, o) => sum + ((o['paidAmount'] as num?) ?? 0).toDouble());
    final wholesaleRevenue = wholesaleOrders.fold<double>(
        0, (sum, o) => sum + ((o['paidAmount'] as num?) ?? 0).toDouble());

    final Map<int, double> monthlyRevenue = {};
    for (var o in yearOrders) {
      final created = o['createdAt'] as String?;
      if (created == null) continue;
      final d = DateTime.tryParse(created);
      if (d == null) continue;
      final paid = ((o['paidAmount'] as num?) ?? 0).toDouble();
      monthlyRevenue[d.month] = (monthlyRevenue[d.month] ?? 0) + paid;
    }

    final Map<String, double> categoryRevenue = {};
    for (var o in yearOrders) {
      final items = o['items'] as List<dynamic>?;
      if (items == null) continue;
      for (var item in items) {
        final total = ((item['totalPrice'] as num?) ?? 0).toDouble();
        final product = products.firstWhere(
          (p) => p['id'] == item['productId'],
          orElse: () => {},
        );
        final cat = (product['category'] as String?) ?? 'Khác';
        categoryRevenue[cat] = (categoryRevenue[cat] ?? 0) + total;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'vlxd_reports'.tr,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                ),
                const Spacer(),
                _YearSelector(
                  year: year,
                  onChanged: (v) => ref.read(_selectedYearProvider.notifier).state = v,
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 2.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _ReportCard(
                  title: 'total_revenue'.tr,
                  value: AppFormatters.formatCurrencyShort(totalRevenue),
                  icon: Icons.trending_up_rounded,
                  color: AppColors.success,
                ),
                _ReportCard(
                  title: 'total_orders'.tr,
                  value: '$totalOrders',
                  icon: Icons.receipt_long_rounded,
                  color: AppColors.primary,
                ),
                _ReportCard(
                  title: 'debt_label'.tr,
                  value: AppFormatters.formatCurrencyShort(totalDebt),
                  icon: Icons.account_balance_wallet_rounded,
                  color: totalDebt > 0 ? AppColors.warning : AppColors.success,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(title: 'revenue_by_month'),
                  const SizedBox(height: 16),
                  ...List.generate(12, (i) {
                    final m = i + 1;
                    final total = monthlyRevenue[m] ?? 0;
                    final maxVal = monthlyRevenue.values.isNotEmpty
                        ? monthlyRevenue.values.reduce((a, b) => a > b ? a : b)
                        : 1.0;
                    final ratio = maxVal > 0 ? total / maxVal : 0.0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text('T$m', style: const TextStyle(fontSize: 12)),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: ratio,
                                minHeight: 16,
                                backgroundColor: AppColors.surfaceAlt,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  total > 0 ? AppColors.success : AppColors.border,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 100,
                            child: Text(
                              total > 0 ? AppFormatters.formatCurrencyShort(total) : '-',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'revenue_distribution'.tr),
                  const SizedBox(height: 16),
                  _ReportRow(
                    label: 'retail_sales'.tr,
                    value: AppFormatters.formatCurrency(retailRevenue),
                    subtitle: 'orders_suffix'.trParams({'count': '${retailOrders.length}'}),
                    color: AppColors.info,
                  ),
                  _ReportRow(
                    label: 'wholesale_sales'.tr,
                    value: AppFormatters.formatCurrency(wholesaleRevenue),
                    subtitle: 'orders_suffix'.trParams({'count': '${wholesaleOrders.length}'}),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            if (categoryRevenue.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: 'revenue_by_category'),
                    const SizedBox(height: 16),
                    ...categoryRevenue.entries.map((entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 8, color: AppColors.primary),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(entry.key, style: const TextStyle(fontSize: 13)),
                              ),
                              Text(
                                AppFormatters.formatCurrency(entry.value),
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _YearSelector extends StatelessWidget {
  final int year;
  final ValueChanged<int> onChanged;

  const _YearSelector({required this.year, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 20),
          onPressed: () => onChanged(year - 1),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('$year', style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary)),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded, size: 20),
          onPressed: () => onChanged(year + 1),
        ),
      ],
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _ReportCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: color)),
                const SizedBox(height: 2),
                Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportRow extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;
  final Color color;

  const _ReportRow({required this.label, required this.value, this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 13)),
                if (subtitle != null)
                  Text(subtitle!, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}

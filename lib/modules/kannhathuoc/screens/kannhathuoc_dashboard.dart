import 'package:flutter/material.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';

class NhaThuocDashboard extends StatelessWidget {
  const NhaThuocDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'overview'.tr,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '${'hello'.tr}! ${'How much did you sell today?'}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 900
                      ? 4
                      : constraints.maxWidth > 600
                          ? 2
                          : 2;
                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.6,
                    children: [
                      KpiCard(
                        title: 'today_revenue'.tr,
                        value: AppFormatters.formatCurrencyShort(2850000),
                        subtitle: '+12% vs yesterday',
                        icon: Icons.trending_up_rounded,
                        color: AppColors.success,
                        onTap: () {},
                      ),
                      KpiCard(
                        title: 'stock_medicines'.tr,
                        value: '1.247',
                        subtitle: 'low_stock_medicines'.trParams({'count': '8'}),
                        icon: Icons.inventory_2_rounded,
                        color: AppColors.info,
                        onTap: () {},
                      ),
                      KpiCard(
                        title: 'customers'.tr,
                        value: '36',
                        subtitle: 'new_customers'.trParams({'count': '4'}),
                        icon: Icons.people_rounded,
                        color: AppColors.warning,
                        onTap: () {},
                      ),
                      KpiCard(
                        title: 'debt'.tr,
                        value: AppFormatters.formatCurrencyShort(15200000),
                        subtitle: 'suppliers_count'.trParams({'count': '3'}),
                        icon: Icons.account_balance_wallet_rounded,
                        color: AppColors.danger,
                        onTap: () {},
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: _buildRecentOrders(context),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTopMedicines(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentOrders(BuildContext context) {
    final orders = [
      {'code': 'HD-2707-001', 'customer': 'Nguyễn Văn A', 'amount': 450000, 'time': '14:32'},
      {'code': 'HD-2707-002', 'customer': 'Trần Thị B', 'amount': 1280000, 'time': '13:15'},
      {'code': 'HD-2707-003', 'customer': 'Lê Văn C', 'amount': 320000, 'time': '11:48'},
      {'code': 'HD-2707-004', 'customer': 'Phạm Thị D', 'amount': 890000, 'time': '10:05'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long_rounded, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('recent_orders'.tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 14),
          ...orders.map((o) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(o['code'] as String,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          Text(o['customer'] as String,
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(AppFormatters.formatCurrency((o['amount'] as num).toDouble()),
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                        Text(o['time'] as String,
                            style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTopMedicines(BuildContext context) {
    final medicines = [
      {'name': 'Paracetamol 500mg', 'sold': 45, 'revenue': 225000},
      {'name': 'Amoxicillin 500mg', 'sold': 32, 'revenue': 640000},
      {'name': 'Omeprazol 20mg', 'sold': 28, 'revenue': 420000},
      {'name': 'Cetirizin 10mg', 'sold': 24, 'revenue': 192000},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 18, color: AppColors.warning),
              const SizedBox(width: 8),
              Text('top_medicines'.tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 14),
          ...medicines.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m['name'] as String,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          Text('sold'.trParams({'count': '${m['sold']}'}),
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                        ],
                      ),
                    ),
                    Text(AppFormatters.formatCurrency((m['revenue'] as num).toDouble()),
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

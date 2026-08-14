import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/auth/employee_role_policy.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/taphoa_providers.dart';
import '../services/taphoa_isar_service.dart';
import '../services/taphoa_seed_data.dart';
import '../services/taphoa_neon_sync_service.dart';
import 'taphoa_pos_screen.dart';
import 'product_management_screen.dart';
import 'inventory_screen.dart';
import 'inventory_import_screen.dart';
import 'partner_screen.dart';
import 'finance_screen.dart';
import 'debt_screen.dart';
import 'report_screen.dart';
import 'taphoa_settings_screen.dart';

class TapHoaDashboardScreen extends ConsumerStatefulWidget {
  const TapHoaDashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaDashboardScreen> createState() => _TapHoaDashboardScreenState();
}

class _TapHoaDashboardScreenState extends ConsumerState<TapHoaDashboardScreen> {
  bool _isInit = false;

  static final Map<String, Set<String>> _roleTabs = {
    EmployeeRoles.cashier: const {'pos', 'finance', 'debt', 'report'},
    EmployeeRoles.sale: const {'pos'},
    EmployeeRoles.warehouse: const {'products', 'import', 'inventory'},
    EmployeeRoles.accountant: const {'finance', 'debt', 'report', 'settings'},
  };

  /// Các chức năng (action card) của module — dùng chung cho dashboard,
  /// màn hình "Quản lý nhân viên" (check/uncheck) và lọc theo role.
  static final Map<String, ({String label, IconData icon, Color color, Widget Function() screen})>
      _actionDefs = {
    'pos': (
      label: 'Bán hàng (POS)',
      icon: Icons.point_of_sale,
      color: Colors.blueAccent,
      screen: () => const TapHoaPosScreen(),
    ),
    'products': (
      label: 'Quản lý hàng hóa',
      icon: Icons.category,
      color: Colors.greenAccent,
      screen: () => const TapHoaProductManagementScreen(),
    ),
    'import': (
      label: 'Nhập hàng',
      icon: Icons.add_shopping_cart,
      color: Colors.orangeAccent,
      screen: () => const TapHoaInventoryImportScreen(),
    ),
    'inventory': (
      label: 'Tồn kho & Kiểm kê',
      icon: Icons.fact_check,
      color: Colors.purpleAccent,
      screen: () => const TapHoaInventoryScreen(),
    ),
    'partners': (
      label: 'Khách hàng & NCC',
      icon: Icons.people,
      color: Colors.teal,
      screen: () => const TapHoaPartnerScreen(),
    ),
    'employees': (
      label: 'Quản lý nhân viên',
      icon: Icons.badge,
      color: Colors.brown,
      screen: () => EmployeeManagementScreen(
        availableTabs: [
          for (final e in _actionDefs.entries)
            EmployeeTabOption(id: e.key, label: e.value.label),
        ],
        roleTabs: _roleTabs,
      ),
    ),
    'finance': (
      label: 'Thu chi & Tài chính',
      icon: Icons.account_balance_wallet,
      color: Colors.indigo,
      screen: () => const TapHoaFinanceScreen(),
    ),
    'debt': (
      label: 'Công nợ',
      icon: Icons.credit_score,
      color: Colors.redAccent,
      screen: () => const TapHoaDebtScreen(),
    ),
    'report': (
      label: 'Báo cáo',
      icon: Icons.bar_chart,
      color: Colors.cyan,
      screen: () => const TapHoaReportScreen(),
    ),
    'settings': (
      label: 'Cài Đặt',
      icon: Icons.settings,
      color: Colors.blueGrey,
      screen: () => const TapHoaSettingsScreen(),
    ),
  };

  /// Các action card được phép hiển thị theo role/tùy chỉnh của nhân viên.
  List<MapEntry<String, ({String label, IconData icon, Color color, Widget Function() screen})>>
      _visibleActions() {
    final auth = ref.watch(authServiceProvider);
    final customTabs = auth.employeeAllowedTabs;
    return _actionDefs.entries.where((e) {
      if (auth.isManager) return true;
      // Tùy chỉnh tab riêng cho nhân viên (Owner check/uncheck trong "Quản lý nhân viên").
      if (customTabs != null) return customTabs.contains(e.key);
      return EmployeeRolePolicy.isAllowed(
        isManager: false,
        role: auth.employeeRole,
        tabId: e.key,
        roleTabs: _roleTabs,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      TapHoaIsarService.currentStoreId =
          ref.read(authServiceProvider).storeId ?? '';
      final isar = TapHoaIsarService();
      await TapHoaSeedData.seedIfEmpty(isar);
      ref.read(tapHoaInvoicesProvider.notifier).loadInvoices();
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
      ref.read(tapHoaInventoryProvider.notifier).loadInventory();
      if (mounted) setState(() => _isInit = true);
    });
  }

  Future<void> _sync() async {
    TapHoaIsarService.currentStoreId =
        ref.read(authServiceProvider).storeId ?? '';
    final isar = TapHoaIsarService();
    final service = TapHoaNeonSyncService(isar);
    await service.triggerSync();
    ref.read(tapHoaInvoicesProvider.notifier).loadInvoices();
    ref.read(tapHoaProductsProvider.notifier).loadProducts();
    ref.read(tapHoaInventoryProvider.notifier).loadInventory();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã đồng bộ dữ liệu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final invoices = ref.watch(tapHoaInvoicesProvider);
    final products = ref.watch(tapHoaProductsProvider);
    final inventory = ref.watch(tapHoaInventoryProvider);

    double todayRevenue = 0;
    int todayOrders = 0;
    final now = DateTime.now();
    for (var invoice in invoices) {
      if (invoice.createdAt.year == now.year &&
          invoice.createdAt.month == now.month &&
          invoice.createdAt.day == now.day) {
        todayRevenue += invoice.finalAmount;
        todayOrders++;
      }
    }

    final lowStock = inventory.where((i) => i.currentStock <= i.minStock).toList();
    final expiringSoon = products
        .where((p) =>
            p.expiryDate != null &&
            p.expiryDate!.isAfter(now) &&
            p.expiryDate!.difference(now).inDays <= 30)
        .toList();
    final inventoryValue =
        inventory.fold<double>(0, (s, i) => s + (i.currentStock * i.costPrice));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF14B8A6),
        foregroundColor: Colors.white,
        title: const Text('Tạp Hóa Mini - MiniMart Pro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ dữ liệu',
            onPressed: _sync,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Đổi tài khoản',
            onPressed: () async {
              final auth = ref.read(authServiceProvider);
              ref.read(selectedModuleProvider.notifier).state = null;
              await auth.signOut();
            },
          ),
        ],
      ),
      body: _isInit
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow(context, todayRevenue, todayOrders, products.length, inventoryValue),
                  const SizedBox(height: 16),
                  if (lowStock.isNotEmpty || expiringSoon.isNotEmpty) ...[
                    _buildWarnings(context, lowStock, expiringSoon),
                    const SizedBox(height: 16),
                  ],
                  const Text(
                    'Chức năng chính',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildActionGrid(context),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildStatsRow(BuildContext context, double revenue, int orders, int products, double inventoryValue) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: 'Doanh thu hôm nay',
            value: '${revenue.toStringAsFixed(0)} đ',
            icon: Icons.attach_money,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            title: 'Đơn hôm nay',
            value: '$orders',
            icon: Icons.receipt_long,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            title: 'Sản phẩm',
            value: '$products',
            icon: Icons.inventory_2,
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            title: 'Tổng giá trị kho',
            value: '${inventoryValue.toStringAsFixed(0)} đ',
            icon: Icons.warehouse,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }

  Widget _buildWarnings(BuildContext context, List lowStock, List expiring) {
    return Column(
      children: [
        if (lowStock.isNotEmpty)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.red.shade700),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Cảnh báo: ${lowStock.length} mặt hàng sắp hết (tồn ≤ mức tối thiểu)',
                    style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        if (expiring.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.event_busy, color: Colors.orange.shade700),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Cảnh báo: ${expiring.length} mặt hàng sắp hết hạn sử dụng (≤ 30 ngày)',
                    style: TextStyle(color: Colors.orange.shade700, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    final actions = _visibleActions();
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: [
        for (final entry in actions)
          _buildActionCard(
            context,
            title: entry.value.label,
            icon: entry.value.icon,
            color: entry.value.color,
            onTap: () => _push(context, entry.value.screen()),
          ),
      ],
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Widget _buildStatCard(BuildContext context, {required String title, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: color.withOpacity(0.8), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

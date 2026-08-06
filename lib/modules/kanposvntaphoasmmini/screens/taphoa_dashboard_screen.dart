import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/taphoa_providers.dart';

class TapHoaDashboardScreen extends ConsumerStatefulWidget {
  const TapHoaDashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaDashboardScreen> createState() => _TapHoaDashboardScreenState();
}

class _TapHoaDashboardScreenState extends ConsumerState<TapHoaDashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(tapHoaInvoicesProvider.notifier).loadInvoices();
      ref.read(tapHoaProductsProvider.notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final invoices = ref.watch(tapHoaInvoicesProvider);
    final products = ref.watch(tapHoaProductsProvider);
    
    double todayRevenue = 0;
    final now = DateTime.now();
    for (var invoice in invoices) {
      if (invoice.createdAt.year == now.year &&
          invoice.createdAt.month == now.month &&
          invoice.createdAt.day == now.day) {
        todayRevenue += invoice.finalAmount;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng quan Tạp Hóa Mini'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đang đồng bộ dữ liệu...')),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatCard(
              context, 
              title: 'Doanh thu hôm nay', 
              value: '${todayRevenue.toStringAsFixed(0)} đ',
              icon: Icons.attach_money,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context, 
                    title: 'Đơn hàng hôm nay', 
                    value: '${invoices.where((i) => i.createdAt.day == now.day).length}',
                    icon: Icons.receipt_long,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    context, 
                    title: 'Tổng sản phẩm', 
                    value: '${products.length}',
                    icon: Icons.inventory_2,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Chức năng chính',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildActionCard(
                  context,
                  title: 'Bán hàng (POS)',
                  icon: Icons.point_of_sale,
                  color: Colors.blueAccent,
                  onTap: () {
                    // Navigate to POS
                  },
                ),
                _buildActionCard(
                  context,
                  title: 'Quản lý hàng hóa',
                  icon: Icons.category,
                  color: Colors.greenAccent,
                  onTap: () {
                    // Navigate to Products
                  },
                ),
                _buildActionCard(
                  context,
                  title: 'Nhập hàng',
                  icon: Icons.add_shopping_cart,
                  color: Colors.orangeAccent,
                  onTap: () {},
                ),
                _buildActionCard(
                  context,
                  title: 'Kiểm kê',
                  icon: Icons.fact_check,
                  color: Colors.purpleAccent,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {required String title, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
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
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: color.withOpacity(0.8), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

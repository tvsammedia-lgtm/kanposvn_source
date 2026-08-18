import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_order.dart';

class NhathuocDashboardScreen extends ConsumerWidget {
  const NhathuocDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financeAsync = ref.watch(nhathuocFinanceProvider);
    final medicinesAsync = ref.watch(nhathuocMedicinesProvider);
    final ordersAsync = ref.watch(nhathuocOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Nhà Thuốc'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(nhathuocFinanceProvider.notifier).calculateMetrics(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: financeAsync.when(
        data: (metrics) {
          final todayRevenue = metrics['todayRevenue'] ?? 0;
          final monthRevenue = metrics['monthRevenue'] ?? 0;
          final revenue = metrics['revenue'] ?? 0;
          final cogs = metrics['cogs'] ?? 0;
          final netProfit = metrics['netProfit'] ?? 0;
          final expenses = metrics['expenses'] ?? 0;
          final inventory = metrics['inventory'] ?? 0;
          final customerDebt = metrics['customerDebt'] ?? 0;
          final supplierDebt = metrics['supplierDebt'] ?? 0;

          // Calculate alerts from medicines
          int lowStockCount = 0;
          int expiredCount = 0;
          int expiringSoonCount = 0;
          final now = DateTime.now();
          final threeMonthsLater = now.add(const Duration(days: 90));

          medicinesAsync.whenData((medicines) {
            for (var m in medicines) {
              if (m.currentStock < 10) { lowStockCount++; }
              if (m.expiryDate != null) {
                if (m.expiryDate!.isBefore(now)) {
                  expiredCount++;
                } else if (m.expiryDate!.isBefore(threeMonthsLater)) {
                  expiringSoonCount++;
                }
              }
            }
          });

          // Calculate top sellers
          final Map<String, double> sellerMap = {};
          ordersAsync.whenData((orders) {
            for (var order in orders) {
              if (order.status == NhathuocOrderStatus.CANCELLED) continue;
              order.details.loadSync();
              for (var d in order.details) {
                d.medicine.loadSync();
                final med = d.medicine.value;
                if (med != null) {
                  sellerMap[med.name] = (sellerMap[med.name] ?? 0) + d.quantity;
                }
              }
            }
          });
          final topSellers = sellerMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Revenue cards
              const Text('Doanh Thu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _metricCard('Hôm nay', todayRevenue, Colors.green)),
                  const SizedBox(width: 8),
                  Expanded(child: _metricCard('Tháng này', monthRevenue, Colors.blue)),
                  const SizedBox(width: 8),
                  Expanded(child: _metricCard('Tổng cộng', revenue, Colors.purple)),
                ],
              ),
              const SizedBox(height: 16),
              // P&L
              const Text('Lãi Lỗ (P&L)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _metricCard('Doanh thu', revenue, Colors.green)),
                  const SizedBox(width: 8),
                  Expanded(child: _metricCard('Giá vốn (COGS)', cogs, Colors.orange)),
                  const SizedBox(width: 8),
                  Expanded(child: _metricCard('Chi phí', expenses, Colors.red)),
                  const SizedBox(width: 8),
                  Expanded(child: _metricCard('Lợi nhuận NET', netProfit, netProfit >= 0 ? Colors.blue : Colors.red)),
                ],
              ),
              const SizedBox(height: 16),
              // Debts & Inventory
              Row(
                children: [
                  Expanded(child: _alertCard('Nợ khách hàng', customerDebt, 'đ', Colors.purple, Icons.people)),
                  const SizedBox(width: 8),
                  Expanded(child: _alertCard('Nợ NCC', supplierDebt, 'đ', Colors.teal, Icons.business)),
                  const SizedBox(width: 8),
                  Expanded(child: _alertCard('Giá trị tồn kho', inventory, 'đ', Colors.indigo, Icons.inventory)),
                ],
              ),
              const SizedBox(height: 16),
              // Alerts
              const Text('Cảnh Báo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _alertCount('Thuốc sắp hết', lowStockCount, Colors.orange)),
                  const SizedBox(width: 8),
                  Expanded(child: _alertCount('Hết hạn', expiredCount, Colors.red)),
                  const SizedBox(width: 8),
                  Expanded(child: _alertCount('Sắp hết hạn (3T)', expiringSoonCount, Colors.amber)),
                ],
              ),
              if (topSellers.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text('Top Thuốc Bán Chạy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: topSellers.take(5).map((e) => ListTile(
                      title: Text(e.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text('${e.value.toStringAsFixed(0)} đã bán', style: const TextStyle(color: Colors.teal)),
                    )).toList(),
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _metricCard(String title, double value, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${value.toStringAsFixed(0)} đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _alertCard(String title, double value, String unit, Color color, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
            Text('${value.toStringAsFixed(0)} $unit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _alertCount(String title, int count, Color color) {
    return Card(
      color: count > 0 ? color.withOpacity(0.1) : null,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text('$count', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: count > 0 ? color : Colors.green)),
          ],
        ),
      ),
    );
  }
}

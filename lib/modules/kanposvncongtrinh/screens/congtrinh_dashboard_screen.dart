import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/congtrinh_providers.dart';
import '../utils/congtrinh_format.dart';

/// Dashboard Công Trình & Dự Toán: chỉ số nhanh từ các phiên bản dự toán mới
/// nhất + menu điều hướng tới các tab chức năng.
class CongTrinhDashboardScreen extends ConsumerStatefulWidget {
  final ValueChanged<String>? onNavigate;
  const CongTrinhDashboardScreen({super.key, this.onNavigate});

  @override
  ConsumerState<CongTrinhDashboardScreen> createState() =>
      _CongTrinhDashboardScreenState();
}

class _CongTrinhDashboardScreenState
    extends ConsumerState<CongTrinhDashboardScreen> {
  Future<Map<String, Object?>> _loadStats() async {
    final service = ref.read(congTrinhIsarServiceProvider);
    final projects = await service.getProjects();

    var projectCount = projects.length;
    var estimateCount = 0;
    var sumGrand = 0.0;
    var sumMaterial = 0.0;
    var sumLabor = 0.0;
    var sumArea = 0.0;

    for (final p in projects) {
      final estimates = await service.getEstimates(p.projectId);
      if (estimates.isEmpty) continue;
      estimateCount += estimates.length;
      final latest = estimates.first;
      sumGrand += latest.grandTotal;
      sumMaterial += latest.totalMaterial;
      sumLabor += latest.totalLabor;
      sumArea += latest.area;
    }

    final categories = await service.getCategories();
    final materials = await service.getMaterials();
    final suppliers = await service.getSuppliers();

    return {
      'projectCount': projectCount,
      'estimateCount': estimateCount,
      'sumGrand': sumGrand,
      'sumMaterial': sumMaterial,
      'sumLabor': sumLabor,
      'perM2': sumArea > 0 ? sumGrand / sumArea : 0.0,
      'categories': categories.length,
      'materials': materials.length,
      'suppliers': suppliers.length,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Công Trình & Dự Toán')),
      body: FutureBuilder<Map<String, Object?>>(
        future: _loadStats(),
        builder: (context, snap) {
          final stats = snap.data;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (stats != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Tổng dự toán',
                          ctMoneyCompact(stats['sumGrand'] as double),
                          Icons.request_quote, const Color(0xFF4F46E5)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Chi phí / m²',
                          ctMoneyCompact(stats['perM2'] as double),
                          Icons.square_foot, Colors.teal),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Vật tư',
                          ctMoneyCompact(stats['sumMaterial'] as double),
                          Icons.inventory, Colors.orange),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Nhân công',
                          ctMoneyCompact(stats['sumLabor'] as double),
                          Icons.engineering, Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Công trình',
                          '${stats['projectCount']}', Icons.home_work,
                          Colors.indigo),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Dự toán',
                          '${stats['estimateCount']}', Icons.description,
                          Colors.brown),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _kpi('Vật tư mẫu',
                          '${stats['materials']}', Icons.category,
                          Colors.purple),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _kpi('Nhà cung cấp',
                          '${stats['suppliers']}', Icons.storefront,
                          Colors.cyan),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: (MediaQuery.of(context).size.width > 700)
                    ? 4
                    : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.15,
                children: [
                  _menu(context, 'Công Trình', Icons.home_work,
                      const Color(0xFF4F46E5), 'project'),
                  _menu(context, 'Dự Toán', Icons.request_quote,
                      Colors.teal, 'project'),
                  _menu(context, 'Vật Tư & Đơn Giá', Icons.inventory,
                      Colors.orange, 'catalog'),
                  _menu(context, 'Báo Cáo', Icons.bar_chart,
                      Colors.brown, 'report'),
                  _menu(context, 'Nhân Công', Icons.engineering,
                      Colors.green, 'catalog'),
                  _menu(context, 'Nạp Lại Dữ Liệu Mẫu', Icons.restore,
                      Colors.deepOrange, 'seed'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _kpi(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
            Text(label,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _menu(
      BuildContext context, String title, IconData icon, Color color, String id) {
    return Card(
      color: color.withValues(alpha: 0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (id == 'seed') {
            _confirmReseed(context);
            return;
          }
          widget.onNavigate?.call(id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmReseed(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nạp lại dữ liệu mẫu?'),
        content: const Text(
            'Xóa toàn bộ dữ liệu hiện tại và tạo lại dữ liệu mẫu ban đầu.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Đồng ý')),
        ],
      ),
    );
    if (confirmed == true) {
      await ref
          .read(congTrinhBootstrapProvider.notifier)
          .seedAndRefresh(force: true);
      if (mounted) setState(() {});
    }
  }
}
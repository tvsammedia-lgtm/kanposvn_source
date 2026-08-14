import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ride_report_provider.dart';

class DriverDashboardScreen extends ConsumerStatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  ConsumerState<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends ConsumerState<DriverDashboardScreen> {
  
  @override
  void initState() {
    super.initState();
    // Sinh mock data mỗi khi mở màn hình để dễ xem
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(generateMockDataReportProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Truyền cứng ID tài xế để test
    final reportState = ref.watch(rideReportProvider('DRIVER-001'));

    return Scaffold(
      appBar: AppBar(title: const Text('Báo cáo thống kê (Tài xế)')),
      backgroundColor: Colors.grey.shade100,
      body: reportState.when(
        data: (stats) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tổng quan doanh thu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                
                // Grid hiển thị KPI
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: [
                      _buildStatCard('Tổng doanh thu', '${stats.totalRevenue.toStringAsFixed(0)}đ', Icons.monetization_on, Colors.green),
                      _buildStatCard('Hoàn thành', '${stats.completedTrips} chuyến', Icons.check_circle, Colors.blue),
                      _buildStatCard('Tỉ lệ hủy', '${stats.cancellationRate.toStringAsFixed(1)}%', Icons.cancel, stats.cancellationRate > 15 ? Colors.red : Colors.orange),
                      _buildStatCard('Tổng số cuốc', '${stats.totalTrips}', Icons.directions_car, Colors.purple),
                    ],
                  ),
                ),
                
                // Cảnh báo nếu tỉ lệ hủy cao
                if (stats.cancellationRate > 20)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.red.shade200)),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(child: Text('Tỉ lệ hủy của bạn đang quá cao (${stats.cancellationRate.toStringAsFixed(1)}%). Bạn có nguy cơ bị khóa tài khoản tạm thời.', style: const TextStyle(color: Colors.red))),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const Spacer(),
            Text(title, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

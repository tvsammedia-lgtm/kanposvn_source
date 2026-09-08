import 'package:flutter/material.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';

/// Trang chủ AirBook — lưới chức năng bấm chọn, chuyển qua các tab của shell.
class AirbookHomeScreen extends StatelessWidget {
  final void Function(int tabIndex) onNavigate;
  const AirbookHomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final items = <({String label, IconData icon, int tab, Color color})>[
      (label: 'Đặt Vé',
          icon: Icons.flight_takeoff,
          tab: 1,
          color: AppTheme.primaryBlue),
      (label: 'Vé Của Tôi',
          icon: Icons.confirmation_num,
          tab: 2,
          color: const Color(0xFF10B981)),
      (label: 'Hoa Hồng',
          icon: Icons.bar_chart,
          tab: 3,
          color: const Color(0xFFF59E0B)),
      (label: 'Bản Đồ Tracking',
          icon: Icons.map,
          tab: 4,
          color: const Color(0xFFDB2777)),
    ];

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'KanPosVN AirBook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Tìm chuyến bay, quản lý vé & hoa hồng',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: MediaQuery.sizeOf(context).width > 700 ? 4 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.25,
              children: [
                for (final it in items)
                  Card(
                    color: AppTheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => onNavigate(it.tab),
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(it.icon, size: 40, color: it.color),
                          const SizedBox(height: 12),
                          Text(
                            it.label,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
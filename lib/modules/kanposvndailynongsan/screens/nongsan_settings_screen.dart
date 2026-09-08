import 'package:flutter/material.dart';

import '../../../core/widgets/generic_backup_restore_screen.dart';

/// Tab "Cài Đặt" của KanPosVN Kinh doanh Nông sản
/// (port tiện ích sao lưu / phục hồi từ kanposvnhrpayroll thể loại cài đặt,
/// tương tự kanposvntramxang_settings_screen).
class NongSanSettingsScreen extends StatelessWidget {
  const NongSanSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('SAO LƯU / PHỤC HỒI DỮ LIỆU',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup, color: Colors.orange),
              title: const Text('Sao lưu & Phục hồi dữ liệu'),
              subtitle: const Text(
                  'Xuất file JSON để sao lưu, nhập file để phục hồi'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const GenericBackupRestoreScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Text('DỮ LIỆU MẪU',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 18, color: Color(0xFF16A34A)),
                      SizedBox(width: 8),
                      Text('Khi mở module lần đầu',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hệ thống tự động tạo dữ liệu mẫu nếu cơ sở dữ liệu trống:\n'
                    '- 8 mặt hàng: gạo ST25, cá ba sa, tôm sú, mực ống, cà phê, '
                    'sầu riêng, gỗ tràm, rau củ.\n'
                    '- 3 nhà cung cấp, 3 khách hàng, 3 kho (nguyên liệu / đông '
                    'lạnh / kho khô).\n'
                    '- Quy trình mua: phiếu cân → kiểm phẩm → nhập kho (gạo '
                    '5.000 kg, cá 1.200 kg).\n'
                    '- 2 đơn bán (tiền mặt gạo, ghi nợ cá), thu/chi tiền, 2 '
                    'khoản chi phí và sổ kế toán TT133.',
                    style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text('THÔNG TIN MODULE',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('KanPosVN Kinh doanh Nông sản',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    '- Nhóm hàng: Nông / Lâm / Thủy / Hải sản.\n'
                    '- Quy trình thu mua: phiếu cân → kiểm phẩm → nhập kho.\n'
                    '- Bán hàng: tiền mặt & ghi nợ; theo dõi công nợ.\n'
                    '- Kế toán theo Chế độ kế toán doanh nghiệp (TT133):\n'
                    '  156 · 1331 / 331; 111/131 / 511 · 333; song song 632 / 156.',
                    style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
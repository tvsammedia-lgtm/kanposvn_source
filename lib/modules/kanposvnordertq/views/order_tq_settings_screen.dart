import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_management_screen.dart';
import '../../../core/widgets/generic_backup_restore_screen.dart';
import '../providers/order_provider.dart';
import 'order_tq_role_config.dart';

/// Danh sách tab hiển thị khi cấu hình quyền nhân viên.
const List<(String, String)> _ordertqTabOptions = [
  ('dashboard', 'Dashboard'),
  ('orders', 'Đơn Hàng'),
  ('admin', 'Admin'),
  ('map', 'Tracker'),
  ('employees', 'Quản Lý NV'),
  ('settings', 'Cài Đặt'),
];

/// Tab "Cài Đặt" của KanPosVN Order Trung Quốc.
///
/// Cấu hình cài đặt hiển thị xe trên bản đồ (SHOW_VEHICLE_LOCATION), threshold
/// GPS, đồng bộ dữ liệu, quản lý nhân viên và sao lưu/phục hồi.
class OrderTqSettingsScreen extends ConsumerStatefulWidget {
  const OrderTqSettingsScreen({super.key});

  @override
  ConsumerState<OrderTqSettingsScreen> createState() => _OrderTqSettingsScreenState();
}

class _OrderTqSettingsScreenState extends ConsumerState<OrderTqSettingsScreen> {
  bool _showVehicleLocation = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final service = ref.read(orderBucketServiceProvider);
    final v = await service.getSetting('SHOW_VEHICLE_LOCATION');
    if (!mounted) return;
    setState(() => _showVehicleLocation = v != 'false');
  }

  Future<void> _toggleShowVehicleLocation(bool value) async {
    setState(() {
      _showVehicleLocation = value;
      _loading = true;
    });
    final service = ref.read(orderBucketServiceProvider);
    await service.setSetting('SHOW_VEHICLE_LOCATION', value.toString());
    if (!mounted) return;
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Đã bật hiển thị vị trí xe' : 'Đã tắt hiển thị vị trí xe')),
    );
  }

  Future<void> _sync() async {
    final service = ref.read(orderBucketServiceProvider);
    setState(() => _loading = true);
    try {
      await service.pushSyncTasks();
      await service.pullUpdates();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đồng bộ thành công!')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đồng bộ lỗi: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('CÀI ĐẶT THEO DÕI',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.location_on, color: Colors.blue),
              title: const Text('Hiển thị vị trí xe cho khách hàng'),
              subtitle: const Text('Cho phép khách hàng xem vị trí xe trên bản đồ'),
              value: _showVehicleLocation,
              onChanged: _loading ? null : _toggleShowVehicleLocation,
            ),
          ),

          const SizedBox(height: 20),

          Text('ĐỒNG BỘ DỮ LIỆU',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.cloud_sync, color: Colors.deepOrange),
              title: const Text('Đồng bộ với Backend (Neon/Vercel)'),
              subtitle: const Text('Đẩy SyncQueue lên server và kéo dữ liệu mới về'),
              trailing: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.sync),
              onTap: _loading ? null : _sync,
            ),
          ),

          const SizedBox(height: 20),

          Text('QUẢN LÝ NHÂN VIÊN',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.people, color: Colors.blue),
              title: const Text('Quản lý tài khoản nhân viên'),
              subtitle: const Text('Thêm, sửa, xóa tài khoản nhân viên & phân quyền'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EmployeeManagementScreen(
                      availableTabs: [
                        for (final (id, label) in _ordertqTabOptions)
                          EmployeeTabOption(id: id, label: label),
                      ],
                      roleTabs: ordertqRoleTabs,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

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
              subtitle: const Text('Xuất file JSON để sao lưu, nhập file để phục hồi'),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/providers.dart';

/// Bản sao phân quyền tab mặc định của module Vận Tải & Vé
/// (đồng bộ với `_roleTabs` trong `kanposvnbanvevantai_shell.dart`).
final Map<String, Set<String>> _vantaiRoleTabs = {
  EmployeeRoles.cashier: const {'ticketing', 'dispatch'},
  EmployeeRoles.sale: const {'ticketing', 'dispatch'},
  EmployeeRoles.warehouse: const {'shipment'},
  EmployeeRoles.accountant: const {'dashboard', 'accounting', 'settings'},
};

/// Danh sách tab hiển thị khi cấu hình quyền nhân viên
/// (đồng bộ với `_allTabs` trong `kanposvnbanvevantai_shell.dart`).
const List<(String, String)> _vantaiTabOptions = [
  ('dashboard', 'Dashboard'),
  ('ticketing', 'Bán Vé'),
  ('dispatch', 'Điều Xe'),
  ('shipment', 'Nhận Hàng'),
  ('accounting', 'Kế Toán'),
  ('employees', 'Quản Lý NV'),
  ('settings', 'Cài Đặt'),
];

class VantaiSettingsScreen extends ConsumerWidget {
  const VantaiSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thông tin tài khoản',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Tên đăng nhập'),
              subtitle: Text(auth.user?.toString() ?? ''),
            ),
            const SizedBox(height: 16),
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
                subtitle: const Text(
                    'Thêm, sửa, xóa tài khoản nhân viên & phân quyền'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EmployeeManagementScreen(
                        availableTabs: [
                          for (final (id, label) in _vantaiTabOptions)
                            EmployeeTabOption(id: id, label: label),
                        ],
                        roleTabs: _vantaiRoleTabs,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text('Đăng xuất'),
              onTap: () {
                ref.read(authServiceProvider.notifier).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

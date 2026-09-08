import '../../../core/auth/employee_auth.dart';

/// Phân quyền tab mặc định của module Order Trung Quốc — dùng chung cho
/// `kanposvnordertq_shell.dart` (lọc tab theo quyền nhân viên) và
/// `order_tq_settings_screen.dart` (màn hình Quản Lý NV).
///
/// Đồng bộ với `_tabDefs` trong `kanposvnordertq_shell.dart`.
final Map<String, Set<String>> ordertqRoleTabs = {
  EmployeeRoles.manager: const {
    'dashboard', 'orders', 'admin', 'map', 'settings',
  },
  EmployeeRoles.sale: const {'dashboard', 'orders', 'map'},
  EmployeeRoles.warehouse: const {'orders', 'map', 'admin'},
  EmployeeRoles.accountant: const {'dashboard', 'orders', 'admin', 'settings'},
};
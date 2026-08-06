/// Chính sách hiển thị tab theo role tài khoản nội bộ (Cấp 2).
///
/// - Owner/Manager (`isManager == true`) luôn được xem tất cả các tab.
/// - Nhân viên chỉ được xem các tab thuộc nghiệp vụ được cấp trong [roleTabs].
class EmployeeRolePolicy {
  const EmployeeRolePolicy._();

  static bool isAllowed({
    required bool isManager,
    required String? role,
    required String tabId,
    required Map<String, Set<String>> roleTabs,
  }) {
    if (isManager) return true;
    final allowed = roleTabs[role];
    if (allowed == null) return false;
    return allowed.contains(tabId);
  }
}

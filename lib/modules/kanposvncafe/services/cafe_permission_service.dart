import '../../../core/auth/employee_auth.dart';
import '../../../core/db/database_service.dart';
import '../cafe_tab_defs.dart';

/// Cấu hình phân quyền tab theo role tài khoản nội bộ (Cấp 2) cho shell
/// kanposvncafe.
///
/// Owner (đăng nhập Cloud) và Manager luôn thấy TOÀN BỘ tab.
/// Các role khác (Bán hàng, Thu ngân, Kho, Kế toán) xem theo cấu hình.
///
/// Lưu trong Isar của cửa hàng (collection `cafe_tab_permissions`),
/// KHÔNG đưa vào SyncQueue — cấu hình cục bộ trên máy.
class CafePermissionService {
  static const String collectionName = 'cafe_tab_permissions';
  static const String configId = 'role_tab_permissions';

  static Set<String> get allTabIds =>
      cafeTabDefs.map((t) => t.id).toSet();

  /// Cấu hình mặc định theo role:
  /// - Manager: toàn bộ tab.
  /// - Bán hàng: chỉ Sơ đồ Bàn.
  /// - Thu ngân / Kho / Kế toán: giữ đúng quyền nghiệp vụ hiện tại.
  static Map<String, Set<String>> defaultPermissions() => {
        EmployeeRoles.manager: allTabIds,
        EmployeeRoles.sale: const {'tables'},
        EmployeeRoles.cashier: const {
          'tables',
          'pos',
          'voucher',
          'order_history',
        },
        EmployeeRoles.warehouse: const {'inventory', 'warehouse', 'purchase'},
        EmployeeRoles.accountant: const {
          'dashboard',
          'finance',
          'voucher',
          'sales_report',
          'report_common',
          'settings',
        },
      };

  /// Load cấu hình đã lưu, merge với mặc định — role chưa được cấu hình
  /// trong DB sẽ dùng quyền mặc định (tránh mất quyền khi thêm role mới).
  static Map<String, Set<String>> load(DatabaseService db) {
    final result = defaultPermissions();
    for (final item in db.getCollection(collectionName)) {
      if (item['id'] != configId) continue;
      final raw = item['roles'];
      if (raw is Map) {
        for (final entry in raw.entries) {
          final ids = entry.value;
          if (ids is List) {
            result[entry.key.toString()] = ids
                .whereType<String>()
                .toSet();
          }
        }
      }
      break;
    }
    return result;
  }

  static Future<void> save(
    DatabaseService db,
    Map<String, Set<String>> permissions,
  ) async {
    final roles = <String, List<String>>{};
    permissions.forEach((role, ids) => roles[role] = ids.toList());
    await db.saveItem(
      collectionName,
      configId,
      {'roles': roles},
      triggerSync: false,
    );
  }
}

/// Tab id được phép xem của tài khoản hiện tại.
///
/// Dùng chung cho shell (lọc tab) và các màn hình điều hướng (gọi món →
/// POS): đảm bảo cùng một quy tắc ở mọi nơi.
Set<String> allowedTabIdsForRole(
  bool isManager,
  String? role,
  Map<String, Set<String>> permissions,
) {
  if (isManager) return CafePermissionService.allTabIds;
  return permissions[role] ?? const {'tables'};
}

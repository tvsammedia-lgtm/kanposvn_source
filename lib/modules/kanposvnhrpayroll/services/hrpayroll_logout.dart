import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../../../../core/router/branch_selector_screen.dart';
import '../../../../core/router/login_screen.dart';
import '../../../../core/router/module_selector_screen.dart';
import 'auth_service.dart';

/// Đăng xuất của module HR Payroll.
///
/// Vì module host `MaterialApp.router` riêng (go_router), việc chỉ gọi
/// `authServiceProvider.notifier.signOut()` và trông chờ chuỗi
/// notifyListeners -> main.dart rebuild có thể bị đứt nếu một listener khác
/// của AuthService ném exception trước đó → màn hình đứng yên, không về login.
///
/// Helper này đảm bảo LUÔN quay về màn hình Login chính:
/// 1. signOut() phiên chính KanPosVN (bất kỳ lỗi nào cũng không chặn bước sau).
/// 2. Chỉ xóa phiên IN-MEMORY của module — TUYỆT ĐỐI không xóa SharedPreferences
///    vì key ('auth_token', 'auth_store_id'...) được CHIA SẺ với core; xóa sẽ
///    phá dữ liệu cửa hàng khiến lần đăng nhập sau bị lỗi (bug đã xảy ra).
/// 3. Reset module/chi nhánh đang chọn (tránh tự động vào lại module cũ).
/// 4. Điều hướng thẳng LoginScreen qua ROOT navigator nếu widget vẫn còn
///    mounted (tức là outer app chưa tự swap) — chốt hạ chắc chắn.
Future<void> performHrPayrollLogout(
  BuildContext context,
  WidgetRef ref,
) async {
  // 1) Đăng xuất phiên chính (xóa prefs an toàn theo logic của core).
  try {
    await ref.read(authServiceProvider.notifier).signOut();
  } catch (_) {}

  // 2) Xóa phiên module trong RAM (giữ nguyên prefs dùng chung với core).
  try {
    AuthService.instance.clearSessionMemory();
  } catch (_) {}

  // 3) Reset lựa chọn module & chi nhánh.
  try {
    ref.read(selectedModuleProvider.notifier).state = null;
    ref.read(branchSelectorModuleProvider.notifier).state = null;
  } catch (_) {}

  // 4) Chốt hạ: chờ frame hiện tại xử lý xong (outer app kịp swap home sang
  // LoginScreen nhờ notifyListeners). Nếu sau đó widget VẪN mounted và vẫn CHƯA
  // đăng nhập → outer đã đứt chuỗi rebuild → điều hướng trực tiếp qua root
  // navigator để chắc chắn về được màn Login chính. Kiểm tra !isAuthenticated
  // tránh đẩy LoginScreen thừa lên trên phiên mới khi user đăng nhập lại nhanh.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    bool stillLoggedOut = true;
    try {
      stillLoggedOut = !ref.read(authServiceProvider).isAuthenticated;
    } catch (_) {}
    if (!stillLoggedOut) return;
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  });
}

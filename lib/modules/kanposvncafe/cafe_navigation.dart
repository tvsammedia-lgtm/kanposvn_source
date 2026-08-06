import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import 'providers/cafe_providers.dart';
import 'services/cafe_permission_service.dart';
import 'screens/pos_order_screen.dart';

/// Điều hướng sang màn hình POS để chọn món bán hàng (gọi món / thanh toán).
///
/// - Nếu role có tab POS trong phân quyền: chuyển tab theo id (`pos`).
/// - Nếu không có tab POS (vd: Bán hàng chỉ thấy Sơ đồ Bàn): mở POS như
///   màn hình toàn màn hình (có nút quay lại) để vẫn bán hàng được.
Future<void> openPosForOrder(BuildContext context, WidgetRef ref) async {
  final auth = ref.read(authServiceProvider);
  final permissions = ref.read(cafeTabPermissionsProvider);
  final allowed = allowedTabIdsForRole(
    auth.isManager,
    auth.employeeRole,
    permissions,
  );
  if (allowed.contains('pos')) {
    ref.read(cafeActiveTabIdProvider.notifier).state = 'pos';
    return;
  }
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFD97706),
          foregroundColor: Colors.white,
          title: const Text('Bán hàng'),
        ),
        body: const PosOrderScreen(),
      ),
    ),
  );
}

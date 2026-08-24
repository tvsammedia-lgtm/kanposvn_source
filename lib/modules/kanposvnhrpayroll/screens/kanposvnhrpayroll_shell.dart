import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_theme.dart';
import '../core/router.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/sync_service.dart';

/// Shell cho module KanPosVN HR Payroll (Vận Tải).
///
/// Khởi tạo Isar riêng (`hrpayroll_db`) + config sync, sau đó host
/// `MaterialApp.router` nội bộ (go_router) với login riêng của module.
class KanPosVnHrPayrollShell extends ConsumerStatefulWidget {
  const KanPosVnHrPayrollShell({super.key});

  @override
  ConsumerState<KanPosVnHrPayrollShell> createState() =>
      _KanPosVnHrPayrollShellState();
}

class _KanPosVnHrPayrollShellState extends ConsumerState<KanPosVnHrPayrollShell> {
  bool _ready = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    try {
      await DatabaseService.instance.initialize();
      // Nạp dữ liệu mẫu nếu DB trống (nhân viên/tài xế/xe/chuyến/chấm công).
      await DatabaseService.instance.seedIfEmpty();
      await SyncService.instance.loadConfig();
      // Module chia sẻ key phiên với AuthService chính: nếu Owner đã đăng
      // nhập trên màn hình chính thì module có sẵn token hợp lệ — không
      // bắt đăng nhập lần thứ hai trên login riêng của module.
      await AuthService.instance.ensureSessionLoaded();
      // appRouter là singleton: giữ location cũ từ phiên trước (vd /settings)
      // khiến lần vào này rơi nhầm màn cũ thay vì Dashboard → reset về đầu.
      if (AuthService.instance.isLoggedIn) {
        appRouter.go('/dashboard');
      }
      if (mounted) {
        setState(() => _ready = true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _initError = e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Scaffold(
        body: Center(
          child: Text('Lỗi khởi tạo HR Payroll: $_initError',
              style: const TextStyle(color: Colors.red)),
        ),
      );
    }
    if (!_ready) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return MaterialApp.router(
      title: 'HR Payroll – Vận tải',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/db/database_service.dart';
import 'core/module_enum.dart';
import 'core/providers.dart';
import 'core/router/login_screen.dart';
import 'core/router/module_selector_screen.dart';
import 'core/router/branch_selector_screen.dart';
import 'core/update/update_checker.dart';
import 'core/ai/ai_assistant_widget.dart';
import 'modules/kanposvncafe/screens/kanposvncafe_shell.dart';
import 'modules/kanposvnkhachsan/screens/kanposvnkhachsan_shell.dart';
import 'modules/nhansu/screens/nhansu_shell.dart';

import 'modules/kanposvnvlxd/screens/kanposvnvlxd_shell.dart';
import 'modules/kanposvngara/screens/kanposvngara_shell.dart';
import 'modules/kanposvnnhathuoc/screens/kanposvnnhathuoc_shell.dart';
import 'modules/kanposvnbanvevantai/screens/kanposvnbanvevantai_shell.dart';
import 'modules/kanposvnbida/screens/kanposvnbida_shell.dart';
import 'modules/kanposvnpawn/screens/kanposvnpawn_shell.dart';
import 'modules/kanposvnbarber/screens/kanposvnbarber_shell.dart';
import 'modules/kanposvnspa/screens/kanposvnspa_shell.dart';
import 'modules/kanposvnnhahangquanan/screens/kanposvnnhahang_shell.dart';
import 'modules/kanposvnqlcd/kanposvnqlcd_shell.dart';
import 'modules/kanposvnnbatdongsan/views/batdongsan_dashboard.dart';
import 'modules/kanposvnnhatro200/views/nhatro_dashboard.dart';
import 'modules/kanposvntaphoasmmini/screens/taphoa_dashboard_screen.dart';
import 'modules/kanposvncrm/screens/crm_dashboard_screen.dart';
import 'modules/kanposvngym/screens/gym_dashboard_screen.dart';
import 'modules/kanposvnparking/screens/parking_dashboard_screen.dart';
import 'modules/kanposvnviec/screens/viec_dashboard_screen.dart';
import 'modules/kanposvnride/screens/ride_dashboard_screen.dart';
import 'modules/kanposvneshop/screens/eshop_dashboard_screen.dart';
import 'modules/kanposvnhrpayroll/screens/kanposvnhrpayroll_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = DatabaseService.instance;
  await DatabaseService.openIsar();

  runApp(
    ProviderScope(
      overrides: [
        databaseServiceProvider.overrideWith((ref) => db),
      ],
      child: const KanPosVNApp(),
    ),
  );
}

final currentScreenIndexProvider = StateProvider<int>((ref) => 0);

class KanPosVNApp extends ConsumerStatefulWidget {
  const KanPosVNApp({super.key});

  @override
  ConsumerState<KanPosVNApp> createState() => _KanPosVNAppState();
}

class _KanPosVNAppState extends ConsumerState<KanPosVNApp> {
  bool _sessionLoaded = false;

  @override
  void initState() {
    super.initState();
    ref.read(authServiceProvider).warmUp();
    _loadAuthSession();
  }

  Future<void> _loadAuthSession() async {
    final auth = ref.read(authServiceProvider);
    try {
      // Nạp dữ liệu phiên cũ (tên/SĐT Owner, cờ "đã đăng nhập máy này"...) để
      // màn hình đăng nhập & luồng nhân viên Cấp 2 vẫn hoạt động đúng.
      await auth.loadSavedSession().timeout(const Duration(seconds: 10));
    } catch (_) {
      // Không để màn hình khởi động treo mãi nếu nạp phiên chậm/lỗi.
    }
    // LUÔN bắt đầu bằng màn hình đăng nhập: không tự khôi phục phiên cũ.
    if (auth.isAuthenticated) {
      await auth.signOut();
    }
    if (mounted) {
      setState(() {
        _sessionLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedModule = ref.watch(selectedModuleProvider);
    final auth = ref.watch(authServiceProvider);

    // Show loading indicator while checking session
    if (!_sessionLoaded) {
      return MaterialApp(
        title: 'KanPosVN',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    // Always show login screen if not authenticated
    if (!auth.isAuthenticated) {
      return MaterialApp(
        title: 'KanPosVN',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        locale: const Locale('vi'),
        supportedLocales: const [Locale('vi'), Locale('en')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const LoginScreen(),
      );
    }

    Widget home;
    final branchModule = ref.watch(branchSelectorModuleProvider);
    if (const bool.fromEnvironment('TEST_QLCD')) {
      home = UpdateAndLicenseChecker(
        appCode: AppModule.kanposvnqlcd.appCode,
        child: const _MainShell(module: AppModule.kanposvnqlcd),
      );
    } else if (selectedModule != null) {
      home = UpdateAndLicenseChecker(
        appCode: selectedModule.appCode,
        child: _MainShell(module: selectedModule),
      );
    } else if (branchModule != null) {
      // Mô hình 1 module = nhiều chi nhánh: module này có chi nhánh → chọn chi
      // nhánh trước khi vào shell (module selector hoặc auto-resume đã đặt provider).
      home = BranchSelectorScreen(module: branchModule);
    } else {
      home = const _AutoSelectWrapper();
    }

    return MaterialApp(
      title: 'KanPosVN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: const Locale('vi'),
      supportedLocales: const [Locale('vi'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: home,
    );
  }
}

class _AutoSelectWrapper extends ConsumerStatefulWidget {
  const _AutoSelectWrapper();

  @override
  ConsumerState<_AutoSelectWrapper> createState() => _AutoSelectWrapperState();
}

class _AutoSelectWrapperState extends ConsumerState<_AutoSelectWrapper> {
  // Thời gian chờ tối đa cho bước tự chọn module/branch sau login. Nếu vẫn chưa
  // có provider nào được đặt (ví dụ: _selectModule bị lỗi/hang) thì rời spinner
  // "Đang tải dữ liệu..." sang ModuleSelector để người dùng chọn thủ công — tránh
  // treo vĩnh viễn ở màn hình loading.
  static const _fallbackDuration = Duration(seconds: 3);
  Timer? _fallbackTimer;
  bool _showFallback = false;

  @override
  void initState() {
    super.initState();
    _fallbackTimer = Timer(_fallbackDuration, () {
      if (mounted &&
          ref.read(selectedModuleProvider) == null &&
          ref.read(branchSelectorModuleProvider) == null) {
        setState(() => _showFallback = true);
      }
    });
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    if (auth.findMatchingModule() == null) {
      return const ModuleSelectorScreen();
    }
    if (_showFallback) {
      return const ModuleSelectorScreen();
    }
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Đang tải dữ liệu...'),
          ],
        ),
      ),
    );
  }
}

class _MainShell extends ConsumerWidget {
  final AppModule module;
  const _MainShell({required this.module});

  Widget _buildShell() {
    switch (module.moduleType) {
      case AppModuleType.kanposvncafe:
        return const KanPosVNCafeShell();
      case AppModuleType.kanposvnkhachsan:
        return const KanPosVNKhachSanShell();
      case AppModuleType.nhanSu:
        return const NhanSuShell();
      case AppModuleType.kanposvnvlxd:
        return const KanPosVNVlxdShell();
      case AppModuleType.kanposvngara:
        return const KanPosVNGaraShell();
      case AppModuleType.kanposvnnhathuoc:
        return const KanPosVNNhathuocShell();
      case AppModuleType.kanposvnbanvevantai:
        return const KanPosVNBanvevantaiShell();
      case AppModuleType.kanposvnbida:
        return const KanPosVNBidaShell();
      case AppModuleType.kanposvnpawn:
        return const KanPosVnPawnShell();
      case AppModuleType.kanposvnspa:
        return const KanPosVNSpaShell();
      case AppModuleType.kanposvnbarber:
        return const KanPosVnBarberShell();
      case AppModuleType.kanposvnnhahangquanan:
        return const KanPosVNRestaurantShell();
      case AppModuleType.kanposvnqlcd:
        return const KanPosVNQlcdShell();
      case AppModuleType.kanposvnnbatdongsan:
        return const BatDongSanDashboard();
      case AppModuleType.kanposvnnhatro200:
        return const NhaTroDashboard();
      case AppModuleType.kanposvntaphoasmmini:
        return const TapHoaDashboardScreen();
      case AppModuleType.kanposvncrm:
        return const CrmDashboardScreen();
      case AppModuleType.kanposvngym:
        return const GymDashboardScreen();
      case AppModuleType.kanposvnparking:
        return const ParkingDashboardScreen();
      case AppModuleType.kanposvnviec:
        return const ViecDashboardScreen();
      case AppModuleType.kanposvnride:
        return const RideDashboardScreen();
      case AppModuleType.kanposvneshop:
        return const EshopDashboardScreen();
      case AppModuleType.kanposvnhrpayroll:
        return const KanPosVnHrPayrollShell();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(child: _buildShell()),
        Positioned(
          right: 16,
          bottom: 16,
          child: AiAssistantFab(module: module),
        ),
      ],
    );
  }
}

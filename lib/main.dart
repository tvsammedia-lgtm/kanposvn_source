import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/db/database_service.dart';
import 'core/module_enum.dart';
import 'core/providers.dart';
import 'core/router/login_screen.dart';
import 'core/router/module_selector_screen.dart';
import 'core/update/update_checker.dart';
import 'modules/kanposvncafe/screens/kanposvncafe_shell.dart';
import 'modules/kanposvnkhachsan/screens/kanposvnkhachsan_shell.dart';
import 'modules/nhansu/screens/nhansu_shell.dart';

import 'modules/kanposvnvlxd/screens/kanposvnvlxd_shell.dart';
import 'modules/kanposvngara/screens/kanposvngara_shell.dart';
import 'modules/kanposvnnhathuoc/screens/kanposvnnhathuoc_shell.dart';
import 'modules/kanposvnbanvevantai/screens/kanposvnbanvevantai_shell.dart';
import 'modules/kanposvnbida/screens/kanposvnbida_shell.dart';
import 'modules/kanposvnspa/screens/kanposvnspa_shell.dart';
import 'modules/kanposvnnhahangquanan/screens/kanposvnnhahang_shell.dart';
import 'modules/kanposvnqlcd/kanposvnqlcd_shell.dart';
import 'modules/kanposvnnbatdongsan/views/batdongsan_dashboard.dart';
import 'modules/kanposvnnhatro200/views/nhatro_dashboard.dart';

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
    await auth.loadSavedSession();
    if (mounted) {
      setState(() {
        _sessionLoaded = true;
      });
    }
    _tryAutoSelectModule();
  }

  void _tryAutoSelectModule() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final auth = ref.read(authServiceProvider);
      final db = ref.read(databaseServiceProvider);
      final selectedModule = ref.read(selectedModuleProvider);

      if (auth.isAuthenticated && selectedModule == null) {
        if (auth.currentModule != null) {
          await db.init(module: auth.currentModule!);
          if (!mounted) return;
          ref.read(selectedModuleProvider.notifier).state = auth.currentModule;
          return;
        }

        final match = auth.findMatchingModule();
        if (match != null) {
          await db.init(module: match);
          if (!mounted) return;
          ref.read(selectedModuleProvider.notifier).state = match;
        }
      }
    });
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authServiceProvider);
    if (auth.findMatchingModule() == null) {
      return const ModuleSelectorScreen();
    }
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Đang xác thực...'),
          ],
        ),
      ),
    );
  }
}

class _MainShell extends ConsumerWidget {
  final AppModule module;
  const _MainShell({required this.module});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      case AppModuleType.kanposvnspa:
        return const KanPosVNSpaShell();
      case AppModuleType.kanposvnnhahangquanan:
        return const KanPosVNRestaurantShell();
      case AppModuleType.kanposvnqlcd:
        return const KanPosVNQlcdShell();
      case AppModuleType.kanposvnnbatdongsan:
        return const BatDongSanDashboard();
      case AppModuleType.kanposvnnhatro200:
        return const NhaTroDashboard();
    }
  }
}

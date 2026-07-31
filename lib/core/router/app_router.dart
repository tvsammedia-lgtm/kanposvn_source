import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../module_enum.dart';
import 'module_selector_screen.dart';
import '../../modules/nhansu/screens/nhansu_shell.dart';
import '../../modules/kanposvnqlcd/kanposvnqlcd_shell.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/settings/settings_screen.dart';

final appRouterProvider = Provider((ref) {
  return AppRouter(ref);
});

class AppRouter {
  final Ref ref;
  AppRouter(this.ref);

  Route<dynamic> generateRoute(RouteSettings settings) {
    final module = ref.read(selectedModuleProvider);

    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return _buildModuleRoute(settings, module);
    }
  }

  Route<dynamic> _buildModuleRoute(RouteSettings settings, AppModule? module) {
    switch (module) {
      case AppModule.nhanSu:
        return MaterialPageRoute(
          builder: (_) => const NhanSuShell(),
        );
      case AppModule.kanposvnqlcd:
        return MaterialPageRoute(
          builder: (_) => const KanPosVNQlcdShell(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Chọn module'))),
        );
    }
  }
}

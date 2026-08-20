import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'services/settings_service.dart';
import '../../../core/router/module_selector_screen.dart';
import '../../../core/providers.dart';

class KanPosVNNemdaShell extends ConsumerStatefulWidget {
  const KanPosVNNemdaShell({super.key});
  @override
  ConsumerState<KanPosVNNemdaShell> createState() => _KanPosVNNemdaShellState();
}

class _KanPosVNNemdaShellState extends ConsumerState<KanPosVNNemdaShell> {
  bool _isDbInit = false;

  @override
  void initState() {
    super.initState();
    GameSettings.load().then((_) {
      if (mounted) setState(() { _isDbInit = true; });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDbInit) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHƠI NHAU'),
        backgroundColor: const Color(0xff24134a),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Thoát',
            onPressed: () {
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () {
              ref.read(authServiceProvider).signOut();
            },
          ),
        ],
      ),
      body: const NemdaHomeScreen(),
    );
  }
}

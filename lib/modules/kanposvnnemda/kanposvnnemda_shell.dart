import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'services/settings_service.dart';
import '../../../core/router/module_selector_screen.dart';
import '../../../core/widgets/account_switcher_button.dart';

class KanPosVNNemdaShell extends ConsumerStatefulWidget {
  const KanPosVNNemdaShell({super.key});
  @override
  ConsumerState<KanPosVNNemdaShell> createState() => _KanPosVNNemdaShellState();
}

class _KanPosVNNemdaShellState extends ConsumerState<KanPosVNNemdaShell> {
  GameSettings? _settings;

  @override
  void initState() {
    super.initState();
    GameSettings.load().then((s) {
      if (mounted) setState(() { _settings = s; });
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = _settings;
    if (settings == null) {
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
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: HomeScreen(settings: settings),
    );
  }
}

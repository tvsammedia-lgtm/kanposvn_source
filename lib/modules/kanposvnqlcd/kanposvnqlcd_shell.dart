import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'app/router.dart';
import 'data/isar_service.dart';
import 'data/models/user.dart';
import 'features/auth/controller/auth_controller.dart';

class KanPosVNQlcdShell extends ConsumerStatefulWidget {
  const KanPosVNQlcdShell({super.key});

  @override
  ConsumerState<KanPosVNQlcdShell> createState() => _KanPosVNQlcdShellState();
}

class _KanPosVNQlcdShellState extends ConsumerState<KanPosVNQlcdShell> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    try {
      final isar = await IsarService.init();
      final admin =
          await isar.users.filter().roleEqualTo('admin').findFirst();
      final user = admin ?? await isar.users.where().findFirst();
      if (user != null) {
        ref.read(authProvider.notifier).setUser(user);
      }
      if (mounted) setState(() => _ready = true);
      // module ready
    } catch (e) {
      // ignore isar init errors
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return const _QlcdApp();
  }
}

class _QlcdApp extends ConsumerWidget {
  const _QlcdApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'QLCD - Cắt Ghép & Vé',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

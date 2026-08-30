import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../providers/videocall_isar_provider.dart';
import '../services/videocall_seed_data.dart';
import 'conversation_list_screen.dart';
import 'contact_list_screen.dart';
import 'call_history_screen.dart';

class KanPosVnVideoCallShell extends ConsumerStatefulWidget {
  const KanPosVnVideoCallShell({super.key});

  @override
  ConsumerState<KanPosVnVideoCallShell> createState() =>
      _KanPosVnVideoCallShellState();
}

class _KanPosVnVideoCallShellState extends ConsumerState<KanPosVnVideoCallShell> {
  bool _ready = false;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initDb());
  }

  Future<void> _initDb() async {
    try {
      final db = await VideoCallDatabaseSetup.init();
      await VideoCallSeedData.seedIfEmpty(db);
      if (mounted) setState(() => _ready = true);
    } catch (_) {
      if (mounted) setState(() => _ready = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        backgroundColor: AppTheme.bg900,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: IndexedStack(
        index: _tabIndex,
        children: const [
          ConversationListScreen(),
          ContactListScreen(),
          CallHistoryScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        backgroundColor: AppTheme.surface,
        indicatorColor: AppTheme.primaryBlue.withValues(alpha: 0.15),
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Tin nhắn'),
          NavigationDestination(icon: Icon(Icons.contacts_outlined), selectedIcon: Icon(Icons.contacts), label: 'Danh bạ'),
          NavigationDestination(icon: Icon(Icons.history_outlined), selectedIcon: Icon(Icons.history), label: 'Cuộc gọi'),
        ],
      ),
    );
  }
}
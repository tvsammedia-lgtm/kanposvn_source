import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../core/widgets/account_switcher_button.dart';
import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../providers/doichieu_providers.dart';
import 'dc_history_screen.dart';
import 'dc_home_screen.dart';
import 'dc_result_screen.dart';

class KanPosVnDoiChieuKeToanShell extends ConsumerStatefulWidget {
  const KanPosVnDoiChieuKeToanShell({super.key});

  @override
  ConsumerState<KanPosVnDoiChieuKeToanShell> createState() =>
      _KanPosVnDoiChieuKeToanShellState();
}

class _KanPosVnDoiChieuKeToanShellState
    extends ConsumerState<KanPosVnDoiChieuKeToanShell> {
  @override
  Widget build(BuildContext context) {
    final tab = ref.watch(doichieuTabIndexProvider);
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: auth.currentModule?.color ?? const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        title: const Text(
          'KanPosVN - Đối Chiếu Kế Toán',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: const [
          AccountSwitcherButton(foregroundColor: Colors.white),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: const [
          DcHomeScreen(),
          DcResultScreen(),
          DcHistoryScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        backgroundColor: AppTheme.surface,
        indicatorColor: const Color(0xFF8B5CF6).withValues(alpha: 0.18),
        onDestinationSelected: (i) =>
            ref.read(doichieuTabIndexProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.compare_arrows_outlined),
            selectedIcon: Icon(Icons.compare_arrows),
            label: 'Đối chiếu',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Kết quả',
          ),
          NavigationDestination(
            icon: Icon(Icons.archive_outlined),
            selectedIcon: Icon(Icons.archive),
            label: 'Lưu trữ',
          ),
        ],
      ),
    );
  }
}
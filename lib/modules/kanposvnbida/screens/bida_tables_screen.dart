import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../core/router/module_selector_screen.dart';
import '../providers/bida_providers.dart';
import '../models/bida_table.dart';
import 'bida_pos_screen.dart';
import 'bida_sales_report_screen.dart';
import 'bida_sync_screen.dart';

class BidaTablesScreen extends ConsumerWidget {
  const BidaTablesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesAsync = ref.watch(bidaTablesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sơ Đồ Bàn Bida'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BidaSyncScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Báo cáo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BidaSalesReportScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Thoát',
            onPressed: () async {
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: tablesAsync.when(
        data: (tables) {
          if (tables.isEmpty) return const Center(child: Text('Chưa có bàn nào.'));
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: tables.length,
            itemBuilder: (context, index) {
              final table = tables[index];
              final isPlaying = table.status == BidaTableStatus.PLAYING;
              
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BidaPosScreen(table: table),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isPlaying ? Colors.red[400] : Colors.green[400],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sports, size: 40, color: Colors.white),
                      const SizedBox(height: 8),
                      Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 4),
                      Text(table.type.label, style: const TextStyle(color: Colors.white70)),
                      Text(table.status.label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

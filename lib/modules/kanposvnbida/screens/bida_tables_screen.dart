import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bida_providers.dart';
import '../models/bida_table.dart';
import 'bida_pos_screen.dart';

class BidaTablesScreen extends ConsumerWidget {
  const BidaTablesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesAsync = ref.watch(bidaTablesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Bàn Bida')),
      body: tablesAsync.when(
        data: (tables) {
          if (tables.isEmpty) return const Center(child: Text('Chưa có bàn nào.'));
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
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
                      Icon(Icons.sports_baseball, size: 40, color: Colors.white),
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

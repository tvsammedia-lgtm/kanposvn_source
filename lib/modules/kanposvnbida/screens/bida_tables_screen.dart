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

    return tablesAsync.when(
        data: (tables) {
          if (tables.isEmpty) return const Center(child: Text('Chưa có bàn nào.'));
          final w = MediaQuery.of(context).size.width;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: w > 900 ? 6 : w > 600 ? 4 : 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: tables.length,
            itemBuilder: (context, index) {
              final table = tables[index];
              final Color color = switch (table.status) {
                BidaTableStatus.PLAYING => Colors.red[400]!,
                BidaTableStatus.RESERVED => Colors.purple[400]!,
                BidaTableStatus.MAINTENANCE => Colors.blueGrey[400]!,
                BidaTableStatus.CLEANING => Colors.orange[400]!,
                _ => Colors.green[400]!,
              };

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
                    color: color,
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
      );
  }
}

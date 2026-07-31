import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/spa_providers.dart';
import '../models/spa_bed.dart';
import 'spa_pos_screen.dart';

class SpaBedsScreen extends ConsumerWidget {
  const SpaBedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bedsAsync = ref.watch(spaBedsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Giường Trị Liệu')),
      body: bedsAsync.when(
        data: (beds) {
          if (beds.isEmpty) return const Center(child: Text('Chưa có giường nào.'));
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: beds.length,
            itemBuilder: (context, index) {
              final bed = beds[index];
              final isPlaying = bed.status == SpaBedStatus.PLAYING;
              
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SpaPosScreen(bed: bed),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isPlaying ? Colors.purple[400] : Colors.green[400],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bed, size: 40, color: Colors.white),
                      const SizedBox(height: 8),
                      Text(bed.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 4),
                      Text(bed.room, style: const TextStyle(color: Colors.white70)),
                      Text(bed.status.label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
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

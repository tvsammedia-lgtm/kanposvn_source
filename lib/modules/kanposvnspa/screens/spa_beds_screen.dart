import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/spa_providers.dart';
import '../models/spa_bed.dart';
import 'spa_pos_screen.dart';

/// Sơ đồ giường (spec §5-§6): nhóm theo phòng, 4 trạng thái.
class SpaBedsScreen extends ConsumerWidget {
  const SpaBedsScreen({super.key});

  Color _statusColor(SpaBedStatus s) => switch (s) {
        SpaBedStatus.EMPTY => Colors.green,
        SpaBedStatus.PLAYING => Colors.purple,
        SpaBedStatus.CLEANING => Colors.orange,
        SpaBedStatus.MAINTENANCE => Colors.red,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bedsAsync = ref.watch(spaBedsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Giường Trị Liệu')),
      body: bedsAsync.when(
        data: (beds) {
          if (beds.isEmpty) return const Center(child: Text('Chưa có giường nào.'));

          // Nhóm theo phòng (spec §6)
          final rooms = <String, List<SpaBed>>{};
          for (final b in beds) {
            rooms.putIfAbsent(b.room.isEmpty ? 'Chưa phân phòng' : b.room,
                () => []).add(b);
          }

          // Legend
          final legend = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: SpaBedStatus.values
                .map((s) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(children: [
                        CircleAvatar(radius: 6, backgroundColor: _statusColor(s)),
                        const SizedBox(width: 4),
                        Text(s.label, style: const TextStyle(fontSize: 12)),
                      ]),
                    ))
                .toList(),
          );

          return Column(
            children: [
              const SizedBox(height: 10),
              legend,
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: rooms.entries.map((room) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(room.key,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: room.value.length,
                          itemBuilder: (context, i) {
                            final bed = room.value[i];
                            final color = _statusColor(bed.status);
                            final canOpenPos =
                                bed.status == SpaBedStatus.EMPTY || bed.status == SpaBedStatus.PLAYING;

                            return InkWell(
                              onTap: canOpenPos
                                  ? () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              SpaPosScreen(bed: bed)))
                                  : null,
                              onLongPress: () =>
                                  _showStatusMenu(context, ref, bed),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color.withOpacity(.85),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(2, 2))
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      switch (bed.status) {
                                        SpaBedStatus.MAINTENANCE =>
                                          Icons.build,
                                        SpaBedStatus.CLEANING =>
                                          Icons.cleaning_services,
                                        _ => Icons.bed,
                                      },
                                      size: 36,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(bed.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16)),
                                    Text(bed.status.label,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellowAccent,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  void _showStatusMenu(BuildContext context, WidgetRef ref, SpaBed bed) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('${bed.name} — ${bed.room}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            if (bed.status == SpaBedStatus.CLEANING)
              ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: const Text('Vệ sinh xong → Trống'),
                onTap: () {
                  ref.read(spaBedsProvider.notifier).updateBedStatus(
                      bed, SpaBedStatus.EMPTY);
                  Navigator.pop(ctx);
                },
              ),
            ListTile(
              leading: Icon(
                  bed.status == SpaBedStatus.MAINTENANCE
                      ? Icons.play_arrow
                      : Icons.build,
                  color: bed.status == SpaBedStatus.MAINTENANCE
                      ? Colors.green
                      : Colors.red),
              title: Text(bed.status == SpaBedStatus.MAINTENANCE
                  ? 'Kết thúc bảo trì'
                  : 'Đưa vào bảo trì'),
              onTap: () {
                ref.read(spaBedsProvider.notifier).updateBedStatus(
                    bed,
                    bed.status == SpaBedStatus.MAINTENANCE
                        ? SpaBedStatus.EMPTY
                        : SpaBedStatus.MAINTENANCE);
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}

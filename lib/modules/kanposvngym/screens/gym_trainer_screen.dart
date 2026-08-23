import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/gym_providers.dart';

/// Huấn luyện viên & lịch lớp học (PRD §13-14).
class GymTrainerScreen extends ConsumerWidget {
  const GymTrainerScreen({super.key});

  String _specialtyLabel(String s) => switch (s) {
        'personal_trainer' => 'PT cá nhân',
        'yoga' => 'Yoga',
        'boxing' => 'Boxing',
        'dance' => 'Dance',
        _ => s,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainers = ref.watch(gymTrainersProvider);
    final classes = ref.watch(gymClassesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('PT & Lịch Lớp Học')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('HUẤN LUYỆN VIÊN (${trainers.length})',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...trainers.map((t) => Card(
                child: ListTile(
                  leading:
                      const Icon(Icons.sports_gymnastics, color: Colors.blue),
                  title: Text(t.fullName,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                      '${_specialtyLabel(t.specialty)} • Lương ${NumberFormat.decimalPattern().format(t.salary)}đ • Hoa hồng ${(t.commissionRate * 100).toStringAsFixed(0)}%'),
                ),
              )),
          const SizedBox(height: 24),
          Text('LỊCH LỚP HỌC (${classes.length})',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...classes.map((c) {
            final trainer = trainers
                .where((t) => t.trainerId == c.trainerId)
                .firstOrNull;
            final full = c.registeredCount >= c.maxCapacity;
            return Card(
              child: ListTile(
                leading: Icon(Icons.schedule,
                    color: full ? Colors.red : Colors.green),
                title: Text('${c.className} — PT ${trainer?.fullName ?? '?'}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                    '${DateFormat('dd/MM HH:mm').format(c.startTime)} • '
                    '${c.registeredCount}/${c.maxCapacity} chỗ'),
                trailing: FilledButton(
                  onPressed: full ? null : () async {
                    await ref.read(gymClassesProvider.notifier).register(c.classId);
                  },
                  child: Text(full ? 'HẾT CHỖ' : 'ĐĂNG KÝ'),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

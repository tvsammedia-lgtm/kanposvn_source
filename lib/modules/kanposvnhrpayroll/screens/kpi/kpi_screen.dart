import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/kpi.dart';
import '../../services/database_service.dart';

class KpiScreen extends ConsumerWidget {
  const KpiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final kpiAsync = ref.watch(kpiByMonthProvider(selectedMonth));

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddKpiDialog(context, ref, selectedMonth),
        icon: const Icon(Icons.add),
        label: const Text('Nhập KPI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('KPI Tài xế',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text('Đánh giá hiệu suất tháng ${selectedMonth.month}/${selectedMonth.year}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const Spacer(),
                MonthPicker(
                  year: selectedMonth.year,
                  month: selectedMonth.month,
                  onPrev: () =>
                      ref.read(selectedMonthProvider.notifier).previousMonth(),
                  onNext: () =>
                      ref.read(selectedMonthProvider.notifier).nextMonth(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: kpiAsync.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(24), child: LoadingList()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (kpiList) {
                if (kpiList.isEmpty) {
                  return const EmptyState(
                    icon: Icons.trending_up_outlined,
                    title: 'Chưa có dữ liệu KPI',
                    subtitle: 'Nhập KPI cho tài xế để đánh giá hiệu suất',
                  );
                }

                // Sort by KPI score desc
                final sorted = [...kpiList]
                  ..sort((a, b) => b.kpiScore.compareTo(a.kpiScore));

                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  child: Column(
                    children: [
                      // Top 3 podium
                      if (sorted.length >= 3) ...[
                        _buildPodium(context, sorted),
                        const SizedBox(height: 24),
                      ],

                      // KPI list
                      ...sorted.asMap().entries.map((e) {
                        final idx = e.key;
                        final kpi = e.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _KpiCard(
                            rank: idx + 1,
                            kpi: kpi,
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodium(BuildContext context, List<KpiRecord> top3) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryBlue.withOpacity(0.2),
            AppTheme.accent.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text('🏆 TOP 3 THÁNG NÀY',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.warning,
                    letterSpacing: 1.5,
                  )),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 2nd
              _PodiumItem(
                  rank: 2,
                  name: top3[1].driverName,
                  score: top3[1].kpiScore,
                  height: 80,
                  color: const Color(0xFFC0C0C0)),
              // 1st
              _PodiumItem(
                  rank: 1,
                  name: top3[0].driverName,
                  score: top3[0].kpiScore,
                  height: 110,
                  color: AppTheme.warning),
              // 3rd
              _PodiumItem(
                  rank: 3,
                  name: top3[2].driverName,
                  score: top3[2].kpiScore,
                  height: 60,
                  color: const Color(0xFFCD7F32)),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddKpiDialog(
      BuildContext context, WidgetRef ref, SelectedMonth month) {
    final nameCtrl = TextEditingController();
    final tripsCtrl = TextEditingController(text: '0');
    final kmCtrl = TextEditingController(text: '0');
    final onTimeCtrl = TextEditingController(text: '95');
    final fuelCtrl = TextEditingController(text: '35');
    final fuelTargetCtrl = TextEditingController(text: '35');
    final ratingCtrl = TextEditingController(text: '8');
    final violationsCtrl = TextEditingController(text: '0');
    final accidentsCtrl = TextEditingController(text: '0');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nhập KPI tài xế'),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Tên tài xế *'),
                ),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: tripsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Số chuyến'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: kmCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Số km'),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: onTimeCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Đúng giờ (%)'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: ratingCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Điểm KH (0-10)'),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: fuelCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Tiêu hao (l/100km)'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: fuelTargetCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Định mức'),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: violationsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Vi phạm'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: accidentsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Tai nạn'),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty) return;
              final onTime = double.tryParse(onTimeCtrl.text) ?? 95;
              final fuel = double.tryParse(fuelCtrl.text) ?? 35;
              final target = double.tryParse(fuelTargetCtrl.text) ?? 35;
              final rating = double.tryParse(ratingCtrl.text) ?? 8;
              final violations = int.tryParse(violationsCtrl.text) ?? 0;
              final accidents = int.tryParse(accidentsCtrl.text) ?? 0;

              // Calculate KPI score
              double score = 0;
              score += onTime * 0.3; // 30%
              score += (fuel <= target ? 100 : 100 - (fuel - target) * 10) * 0.2; // 20%
              score += rating * 10 * 0.2; // 20%
              score += (violations == 0 ? 100 : 100 - violations * 20) * 0.15; // 15%
              score += (accidents == 0 ? 100 : 0) * 0.15; // 15%
              score = score.clamp(0, 100);

              // KPI bonus
              double bonus = 0;
              if (score >= 95) bonus = 3000000;
              else if (score >= 85) bonus = 2000000;
              else if (score >= 75) bonus = 1000000;

              final kpi = KpiRecord()
                ..driverId = 0
                ..driverName = nameCtrl.text.trim()
                ..year = month.year
                ..month = month.month
                ..totalTrips = int.tryParse(tripsCtrl.text) ?? 0
                ..totalKm = double.tryParse(kmCtrl.text) ?? 0
                ..onTimeScore = onTime
                ..fuelConsumption = fuel
                ..fuelTarget = target
                ..customerRating = rating
                ..violations = violations
                ..accidents = accidents
                ..kpiScore = score
                ..kpiBonus = bonus;

              await DatabaseService.instance.saveKpi(kpi);
              if (ctx.mounted) {
                Navigator.pop(ctx);
                ref.invalidate(kpiByMonthProvider);
              }
            },
            child: const Text('Lưu KPI'),
          ),
        ],
      ),
    );
  }
}

class _PodiumItem extends StatelessWidget {
  final int rank;
  final String name;
  final double score;
  final double height;
  final Color color;

  const _PodiumItem({
    required this.rank,
    required this.name,
    required this.score,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          rank == 1 ? '🥇' : rank == 2 ? '🥈' : '🥉',
          style: const TextStyle(fontSize: 28),
        ),
        const SizedBox(height: 4),
        Text(name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center),
        const SizedBox(height: 4),
        Text('${score.toStringAsFixed(1)} điểm',
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Container(
          width: 70,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8)),
            border: Border.all(color: color.withOpacity(0.6)),
          ),
          alignment: Alignment.center,
          child: Text('#$rank',
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final int rank;
  final KpiRecord kpi;

  const _KpiCard({required this.rank, required this.kpi});

  @override
  Widget build(BuildContext context) {
    final score = kpi.kpiScore;
    final scoreColor = score >= 90
        ? AppTheme.success
        : score >= 75
            ? AppTheme.warning
            : AppTheme.danger;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          // Rank badge
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: rank <= 3
                  ? AppTheme.warning.withOpacity(0.15)
                  : AppTheme.bg800,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: rank <= 3
                    ? AppTheme.warning.withOpacity(0.4)
                    : AppTheme.borderColor,
              ),
            ),
            alignment: Alignment.center,
            child: Text('#$rank',
                style: TextStyle(
                    color: rank <= 3 ? AppTheme.warning : AppTheme.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(kpi.driverName,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _MetricChip(
                        label: '${kpi.totalTrips} chuyến',
                        icon: Icons.route,
                        color: AppTheme.primaryLight),
                    const SizedBox(width: 8),
                    _MetricChip(
                        label: '${kpi.totalKm.toStringAsFixed(0)} km',
                        icon: Icons.speed,
                        color: AppTheme.accent),
                    const SizedBox(width: 8),
                    _MetricChip(
                        label: '${kpi.onTimeScore.toStringAsFixed(0)}% đúng giờ',
                        icon: Icons.timer,
                        color: AppTheme.success),
                    if (kpi.violations > 0) ...[
                      const SizedBox(width: 8),
                      _MetricChip(
                          label: '${kpi.violations} vi phạm',
                          icon: Icons.warning_amber,
                          color: AppTheme.danger),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // KPI Score
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${score.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: scoreColor,
                        fontWeight: FontWeight.w800,
                      )),
              Text('điểm', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
              if (kpi.kpiBonus > 0)
                Text('+${kpi.kpiBonus.toVndShort()}',
                    style: const TextStyle(
                        color: AppTheme.success,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _MetricChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 11, color: color),
        const SizedBox(width: 3),
        Text(label,
            style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }
}

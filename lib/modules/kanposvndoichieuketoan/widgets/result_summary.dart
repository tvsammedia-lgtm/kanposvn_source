import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/compare_report.dart';
import '../models/compare_status.dart';
import '../providers/doichieu_providers.dart';
import '../utils/formatters.dart';
import 'status_badge.dart';

class ResultSummary extends ConsumerWidget {
  final CompareReport report;

  const ResultSummary({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = report.results.length;
    final matched = report.statusCounts[CompareStatus.matched] ?? 0;
    final missing = report.statusCounts[CompareStatus.missing] ?? 0;
    final extra = report.statusCounts[CompareStatus.extra] ?? 0;
    final diffTotal = Math.countDifferences(report);
    final diffMax = report.hasFileC ? 3 : 2;
    final dupCount = report.results.where((r) => r.duplicate).length;

    final cards = <Widget>[
      _SummaryCard(
        label: 'Tổng',
        value: total,
        color: const Color(0xFF3B82F6),
        icon: Icons.list_alt,
        onTap: () => ref.read(doichieuResultFilterProvider.notifier).state = null,
      ),
      _SummaryCard(
        label: CompareStatus.matched.label,
        value: matched,
        color: statusColor(CompareStatus.matched),
        icon: Icons.check_circle_outline,
        onTap: () => ref.read(doichieuResultFilterProvider.notifier).state = CompareStatus.matched,
      ),
      _SummaryCard(
        label: CompareStatus.missing.label,
        value: missing,
        color: statusColor(CompareStatus.missing),
        icon: Icons.south_west,
        onTap: () => ref.read(doichieuResultFilterProvider.notifier).state = CompareStatus.missing,
      ),
      _SummaryCard(
        label: CompareStatus.extra.label,
        value: extra,
        color: statusColor(CompareStatus.extra),
        icon: Icons.north_east,
        onTap: () => ref.read(doichieuResultFilterProvider.notifier).state = CompareStatus.extra,
      ),
      _SummaryCard(
        label: 'Khác biệt',
        value: diffTotal,
        color: statusColor(CompareStatus.numberDifferent),
        icon: Icons.compare_arrows,
        onTap: () => ref.read(doichieuShowDuplicateProvider.notifier).state = false,
      ),
      _SummaryCard(
        label: 'Lặp',
        value: dupCount,
        color: const Color(0xFFDB2777),
        icon: Icons.filter_none,
        onTap: () => ref.read(doichieuShowDuplicateProvider.notifier).state = true,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: cards,
        ),
        if (report.amountColumn != null) ...[
          const SizedBox(height: 14),
          _FileTotals(report: report, diffMax: diffMax),
        ],
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 172,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF243447),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$value',
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    label,
                    style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileTotals extends StatelessWidget {
  final CompareReport report;
  final int diffMax;

  const _FileTotals({required this.report, required this.diffMax});

  @override
  Widget build(BuildContext context) {
    final amount = report.amountColumn;
    final dAB = report.amountDiffAB;
    final dAC = report.amountDiffAC;
    final dBC = report.amountDiffBC;
    Widget row(String name, num? value, Color color) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          Text(
            value == null ? '—' : valueText(value),
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Text(
            'Tổng cột «$amount»',
            style: const TextStyle(color: Color(0xFFF1F5F9), fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          row('File A', report.fileTotals[0], statusColor(CompareStatus.extra)),
          row('File B', report.fileTotals[1], statusColor(CompareStatus.extra)),
          if (report.hasFileC) row('File C', report.fileTotals[2], statusColor(CompareStatus.extra)),
          const Divider(height: 10, color: Color(0xFF334155)),
          if (diffMax >= 2)
            row('Chênh lệch A–B', dAB?.abs(), statusColor(CompareStatus.numberDifferent)),
          if (diffMax >= 3 && dAC != null)
            row('Chênh lệch A–C', dAC.abs(), statusColor(CompareStatus.numberDifferent)),
          if (diffMax >= 3 && dBC != null)
            row('Chênh lệch B–C', dBC.abs(),
                statusColor(CompareStatus.numberDifferent)),
        ],
      ),
    );
  }
}

class Math {
  static int countDifferences(CompareReport report) {
    var n = 0;
    for (final r in report.results) {
      n += r.differences.length;
    }
    return n;
  }
}
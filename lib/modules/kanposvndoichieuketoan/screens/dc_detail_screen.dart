import 'package:flutter/material.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../models/compare_report.dart';
import '../models/compare_result.dart';
import '../models/compare_status.dart';
import '../models/difference_item.dart';
import '../utils/formatters.dart';
import '../widgets/status_badge.dart';

class DcDetailScreen extends StatelessWidget {
  final CompareReport report;
  final CompareResult result;

  const DcDetailScreen({super.key, required this.report, required this.result});

  @override
  Widget build(BuildContext context) {
    final cols = report.canonicalColumns;
    final fileLabels = ['File A', 'File B'];
    if (report.hasFileC) fileLabels.add('File C');
    final diffByColumn = <String, DifferenceItem>{};
    for (final d in result.differences) {
      diffByColumn[d.column] = d;
    }

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        title: const Text('Chi tiết đối chiếu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  result.key,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              StatusBadge(status: result.status),
              const SizedBox(width: 8),
              if (result.duplicate)
                const StatusBadge(
                  status: CompareStatus.multipleDifferent,
                  compact: true,
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Trạng thái: ${result.status.label} — key xuất hiện tại: '
            '${_presentText(result.present, report.hasFileC)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (result.differences.isEmpty && result.status != CompareStatus.matched)
            _InfoBox(
              icon: Icons.info_outline,
              text: result.status == CompareStatus.missing
                  ? 'Key này không xuất hiện trong tất cả các file. Xem các cột để so sánh chi tiết.'
                  : 'Key này không có trong lần chạy nào ở phía file còn lại.',
            ),
          if (result.status == CompareStatus.matched)
            const _InfoBox(icon: Icons.check_circle_outline, text: 'Khớp hoàn toàn.'),

          const SizedBox(height: 20),
          Text('Dữ liệu các cột',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          // Header
          Row(
            children: [
              const SizedBox(width: 180, child: _CellText('Cột', header: true)),
              for (var i = 0; i < report.activeSlots; i++)
                Expanded(
                  child: _CellText(fileLabels[i], header: true),
                ),
            ],
          ),
          const Divider(height: 1, color: AppTheme.borderColor),

          for (var c = 0; c < cols.length; c++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    child: Text(
                      cols[c],
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                for (var s = 0; s < report.activeSlots; s++)
                  Expanded(
                    child: _ValueCell(
                      slot: s,
                      result: result,
                      column: cols[c],
                      diff: diffByColumn[cols[c]],
                    ),
                  ),
              ],
            ),
            if (c < cols.length - 1)
              const Divider(height: 1, color: AppTheme.borderColor),
          ],

          const SizedBox(height: 24),
          Text('Về bản ghi', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          _MetaRow('Key', result.key),
          _MetaRow('Trạng thái', result.status.label),
          _MetaRow('Lặp key', result.duplicate ? 'Có' : 'Không'),
          if (report.amountColumn != null)
            _MetaRow('Số cột tổng tiền', '«${report.amountColumn}»'),
        ],
      ),
    );
  }

  String _presentText(List<bool> present, bool hasFileC) {
    final names = hasFileC ? const ['A', 'B', 'C'] : const ['A', 'B'];
    final out = <String>[];
    for (var i = 0; i < present.length && i < names.length; i++) {
      out.add('${names[i]}${present[i] ? "✓" : "✗"}');
    }
    return out.join(' · ');
  }
}

class _ValueCell extends StatelessWidget {
  final int slot;
  final CompareResult result;
  final String column;
  final DifferenceItem? diff;

  const _ValueCell({
    required this.slot,
    required this.result,
    required this.column,
    required this.diff,
  });

  @override
  Widget build(BuildContext context) {
    final present = result.present[slot];
    if (!present || (result.status == CompareStatus.missing && slot == 1)) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Text('—',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
      );
    }
    final value = result.valueOf(slot, column);
    final text = valueText(value);

    if (diff != null && slot < 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFF87171),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Text(
        text,
        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _CellText extends StatelessWidget {
  final String text;
  final bool header;

  const _CellText(this.text, {this.header = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          color: header ? AppTheme.textSecondary : AppTheme.textPrimary,
          fontSize: header ? 11 : 13,
          fontWeight: header ? FontWeight.w600 : FontWeight.w500,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetaRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(label,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 13)),
          ),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(color: AppTheme.textPrimary, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryLight, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../models/compare_status.dart';

Color statusColor(CompareStatus status) {
  switch (status) {
    case CompareStatus.matched:
      return const Color(0xFF16A34A);
    case CompareStatus.numberDifferent:
      return const Color(0xFFDC2626);
    case CompareStatus.textDifferent:
      return const Color(0xFFF59E0B);
    case CompareStatus.dateDifferent:
      return const Color(0xFF9333EA);
    case CompareStatus.missing:
      return const Color(0xFFF97316);
    case CompareStatus.extra:
      return const Color(0xFF2563EB);
    case CompareStatus.emptyDifferent:
      return const Color(0xFF78716C);
    case CompareStatus.multipleDifferent:
      return const Color(0xFFDB2777);
  }
}

String statusShort(CompareStatus status) {
  switch (status) {
    case CompareStatus.matched:
      return 'Trùng';
    case CompareStatus.numberDifferent:
      return 'Khác số';
    case CompareStatus.textDifferent:
      return 'Khác ký tự';
    case CompareStatus.dateDifferent:
      return 'Khác ngày';
    case CompareStatus.missing:
      return 'Thiếu';
    case CompareStatus.extra:
      return 'Dư';
    case CompareStatus.emptyDifferent:
      return 'Khác rỗng';
    case CompareStatus.multipleDifferent:
      return 'Khác nhiều';
  }
}

class StatusBadge extends StatelessWidget {
  final CompareStatus status;
  final bool compact;

  const StatusBadge({super.key, required this.status, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final color = statusColor(status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: compact ? 6 : 8,
            height: compact ? 6 : 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            status.label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: compact ? 11 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class _DiffSeg {
  final String text;
  final bool isDiff;
  const _DiffSeg(this.text, this.isDiff);
}

/// So sánh 2 chuỗi và trả về các đoạn khác nhau (để highlight như spec §5).
List<_DiffSeg> _segments(String a, String b) {
  var start = 0;
  while (start < a.length && start < b.length && a[start] == b[start]) {
    start++;
  }
  var ea = a.length;
  var eb = b.length;
  while (ea > start && eb > start && a[ea - 1] == b[eb - 1]) {
    ea--;
    eb--;
  }
  final segs = <_DiffSeg>[];
  if (start > 0) {
    segs.add(_DiffSeg(a.substring(0, start), false));
  }
  final da = a.substring(start, ea);
  final db = b.substring(start, eb);
  if (da.isNotEmpty) {
    segs.add(_DiffSeg(da, true));
  }
  if (db.isNotEmpty && db != da) {
    segs.add(_DiffSeg(db, true));
  }
  final ta = a.substring(ea);
  if (ta.isNotEmpty) {
    segs.add(_DiffSeg(ta, false));
  }
  return segs;
}

/// Hiển thị giá trị cũ/mới với phần khác nhau được highlight giống spec §5.
class DifferenceText extends StatelessWidget {
  final String valueA;
  final String valueB;
  final Color highlightColor;
  final int maxChars;

  const DifferenceText({
    super.key,
    required this.valueA,
    required this.valueB,
    this.highlightColor = const Color(0xFFF87171),
    this.maxChars = 120,
  });

  @override
  Widget build(BuildContext context) {
    final a = valueA.length > maxChars ? '${valueA.substring(0, maxChars)}…' : valueA;
    final b = valueB.length > maxChars ? '${valueB.substring(0, maxChars)}…' : valueB;
    final segs = _segments(a, b);
    final segsB = valueA == valueB ? segs : _segments(b, a);
    final styleA = TextStyle(
      color: const Color(0xFFF1F5F9),
      fontSize: 13,
      fontWeight: FontWeight.w500,
      backgroundColor: Colors.transparent,
    );
    final styleB = TextStyle(
      color: const Color(0xFF94A3B8),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    TextSpan buildSpan(TextStyle base, List<_DiffSeg> list) {
      return TextSpan(
        style: base,
        children: list.map((s) {
          if (s.isDiff) {
            return TextSpan(
              text: s.text,
              style: TextStyle(
                color: highlightColor,
                backgroundColor: highlightColor.withValues(alpha: 0.15),
                fontWeight: FontWeight.w700,
              ),
            );
          }
          return TextSpan(text: s.text);
        }).toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(buildSpan(styleA, segs)),
        const SizedBox(height: 2),
        if (valueA != valueB && b.isNotEmpty)
          Text.rich(buildSpan(styleB, segsB)),
      ],
    );
  }
}
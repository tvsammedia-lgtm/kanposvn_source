import 'package:flutter/material.dart';

import '../models/compare_report.dart';
import '../models/compare_result.dart';
import '../models/compare_status.dart';
import '../utils/formatters.dart';
import 'status_badge.dart';

class ResultTable extends StatelessWidget {
  final CompareReport report;
  final List<CompareResult> results;
  final void Function(CompareResult result)? onTapRow;

  const ResultTable({super.key, required this.report, required this.results, this.onTapRow});

  static const double _wStt = 56;
  static const double _wKey = 200;
  static const double _wCol = 170;
  static const double _wVal = 190;
  static const double _wStatus = 140;
  static const double _wDiff = 150;

  @override
  Widget build(BuildContext context) {
    final rows = _flattenRows();
    if (rows.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Text(
            'Không có dòng nào (xem lại bộ lọc)',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
          ),
        ),
      );
    }

    final hasC = report.hasFileC;
    final totalWidth = _wStt + _wKey + _wCol + _wVal * (hasC ? 3 : 2) + _wStatus + _wDiff;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: totalWidth,
        child: Column(
          children: [
            _Row(
              bg: const Color(0xFF1E293B),
              children: [
                _Cell('STT', kind: _CellKind.header, width: _wStt),
                _Cell('Key', kind: _CellKind.header, width: _wKey),
                _Cell('Cột', kind: _CellKind.header, width: _wCol),
                _Cell('File A', kind: _CellKind.header, width: _wVal),
                _Cell('File B', kind: _CellKind.header, width: _wVal),
                if (hasC) _Cell('File C', kind: _CellKind.header, width: _wVal),
                _Cell('Trạng thái', kind: _CellKind.header, width: _wStatus),
                _Cell('Chênh lệch', kind: _CellKind.header, width: _wDiff),
              ],
            ),
            Container(width: totalWidth, height: 1, color: const Color(0xFF334155)),
            Flexible(
              child: ListView.builder(
                itemCount: rows.length,
                itemBuilder: (context, i) {
                  final r = rows[i];
                  final cellColor = r.status == CompareStatus.numberDifferent
                      ? const Color(0xFFF87171)
                      : r.status == CompareStatus.missing || r.status == CompareStatus.extra
                          ? const Color(0xFFCBD5E1)
                          : null;
                  return InkWell(
                    onTap: () => onTapRow?.call(r.result),
                    child: _Row(
                      zebra: i.isOdd,
                      duplicate: r.duplicate,
                      children: [
                        _Cell('${i + 1}', width: _wStt),
                        _Cell(r.key, width: _wKey, underline: r.duplicate),
                        _Cell(r.column, width: _wCol),
                        _Cell(r.a, width: _wVal, color: cellColor),
                        _Cell(r.b, width: _wVal, color: cellColor),
                        if (hasC) _Cell(r.c, width: _wVal, color: cellColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: StatusBadge(status: r.status, compact: true),
                        ),
                        _Cell(
                          r.diff,
                          width: _wDiff,
                          color: r.status == CompareStatus.numberDifferent
                              ? const Color(0xFFF87171)
                              : r.status == CompareStatus.matched
                                  ? const Color(0xFF6EE7B7)
                                  : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_FlatRow> _flattenRows() {
    final out = <_FlatRow>[];
    for (final r in results) {
      if (r.differences.isEmpty) {
        final isMatch = r.status == CompareStatus.matched;
        out.add(_FlatRow(
          key: r.key,
          column: isMatch ? '—' : (r.duplicate ? 'Lặp key trong file' : '—'),
          a: '',
          b: '',
          c: '',
          status: r.status,
          diff: isMatch ? 'OK' : '',
          result: r,
          duplicate: r.duplicate,
        ));
        continue;
      }
      for (final d in r.differences) {
        final diff = d.status == CompareStatus.numberDifferent &&
                d.numericDifference != null
            ? valueText(d.numericDifference!.abs())
            : 'Khác';
        out.add(_FlatRow(
          key: r.key,
          column: d.column,
          a: valueText(d.valueA),
          b: valueText(d.valueB),
          c: d.valueC == null ? '' : valueText(d.valueC),
          status: d.status,
          diff: diff,
          result: r,
          duplicate: r.duplicate,
        ));
      }
    }
    return out;
  }
}

class _FlatRow {
  final String key;
  final String column;
  final String a;
  final String b;
  final String c;
  final CompareStatus status;
  final String diff;
  final CompareResult result;
  final bool duplicate;

  _FlatRow({
    required this.key,
    required this.column,
    required this.a,
    required this.b,
    required this.c,
    required this.status,
    required this.diff,
    required this.result,
    required this.duplicate,
  });
}

enum _CellKind { header, text }

class _Cell extends StatelessWidget {
  final String text;
  final double width;
  final _CellKind kind;
  final Color? color;
  final bool underline;

  const _Cell(
    this.text, {
    required this.width,
    this.kind = _CellKind.text,
    this.color,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    final header = kind == _CellKind.header;
    final fg = header ? const Color(0xFF94A3B8) : color ?? const Color(0xFFF1F5F9);
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: fg,
          fontSize: header ? 11 : 12.5,
          fontWeight: header
              ? FontWeight.w600
              : (color != null ? FontWeight.w600 : FontWeight.w500),
          letterSpacing: header ? 0.3 : 0,
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: const Color(0xFFDB2777),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final List<Widget> children;
  final bool zebra;
  final bool duplicate;
  final Color? bg;

  const _Row({required this.children, this.zebra = false, this.duplicate = false, this.bg});

  @override
  Widget build(BuildContext context) {
    final color = bg ??
        (duplicate
            ? const Color(0xFF3B0E22)
            : zebra
                ? const Color(0xFF1E293B)
                : const Color(0xFF16202F));
    return Container(color: color, child: Row(children: children));
  }
}
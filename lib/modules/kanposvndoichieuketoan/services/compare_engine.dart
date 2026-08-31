import 'dart:isolate';

import '../models/compare_config.dart';
import '../models/compare_report.dart';
import 'normalize_service.dart';

/// Matching + Compare + Difference + Duplicate — spec §15, §16, §19, §36, §37, §44.
///
/// Toàn bộ engine chạy trên isolate riêng để không treo UI với file lớn (§38).
class CompareEngine {
  static Future<CompareReport> runIsolated({
    required List<String> fileNames,
    required List<List<String>> fileColumns,
    required List<Map<String, String>> columnMappings,
    required List<List<Map<String, dynamic>>> fileRows,
    required CompareConfig config,
  }) async {
    final raw = await Isolate.run(
      () => _runEngineRaw(
        fileNames,
        fileColumns,
        columnMappings,
        fileRows,
        config.toMap(),
      ),
    );
    return CompareReport.fromEngine(raw);
  }
}

Map<String, dynamic> _runEngineRaw(
  List<String> fileNames,
  List<List<String>> fileColumns,
  List<Map<String, String>> columnMappings,
  List<List<Map<String, dynamic>>> fileRows,
  Map<String, dynamic> configMap,
) {
  final cfg = CompareConfig.fromMap(configMap);
  final eff = _effectiveConfig(cfg);

  final canonicalColumns = (fileColumns.isNotEmpty ? fileColumns[0] : const <String>[]).toList();

  // Slot 'hoạt động' = file được cung cấp (tên file không rỗng), kể cả khi 0 dòng.
  final activeSlots = <int>[];
  for (var i = 0; i < fileNames.length; i++) {
    if (fileNames[i].isNotEmpty) activeSlots.add(i);
  }
  final activeCount = activeSlots.length;

  // 1. Index theo key.
  final index = List<Map<String, List<Map<String, dynamic>>>>.generate(3, (i) => {});
  final duplicates = <String, List<String>>{};
  final fileTotals = List<double?>.filled(fileNames.length, null);
  final unkeyable = List<int>.filled(3, 0);

  for (final slot in activeSlots) {
    final map = index[slot];
    for (final row in fileRows[slot]) {
      final key = _buildKey(row, slot, columnMappings, eff);
      if (key == null) {
        unkeyable[slot]++;
        continue;
      }
      map.putIfAbsent(key, () => []).add(row);
    }

    final amountColumn = cfg.amountColumn;
    if (amountColumn != null && amountColumn.isNotEmpty) {
      final actual = columnMappings[slot][amountColumn];
      var total = 0.0;
      var found = false;
      if (actual != null && actual.isNotEmpty) {
        for (final row in fileRows[slot]) {
          final raw = row[actual];
          if (raw == null) continue;
          final n = parseNumber(raw.toString(), accountingNegative: cfg.accountingNegative);
          if (n != null) {
            total += n;
            found = true;
          }
        }
      }
      if (found) fileTotals[slot] = total;
    }
  }

  // 2. Phát hiện duplicate (§16).
  for (final slot in activeSlots) {
    for (final entry in index[slot].entries) {
      if (entry.value.length > 1) {
        duplicates.putIfAbsent(entry.key, () => []);
        duplicates[entry.key]!.add('${_slotLabel(slot, fileNames)}: ${entry.value.length} dòng');
      }
    }
  }

  // 3. Aggregate theo key (§44) nếu cần.
  final aggregated = List<Map<String, Map<String, dynamic>>>.generate(3, (i) => {});
  final useAggregate = cfg.duplicateMode == 'aggregate';
  if (useAggregate) {
    for (final slot in activeSlots) {
      for (final entry in index[slot].entries) {
        if (entry.value.length > 1) {
          aggregated[slot][entry.key] = _aggregateRows(entry.value, slot, columnMappings, cfg, canonicalColumns);
        } else {
          aggregated[slot][entry.key] = entry.value.first;
        }
      }
    }
  }

  // 4. So sánh.
  final results = <Map<String, dynamic>>[];
  final warnings = <String>[];
  final allKeys = <String>{};
  for (final slot in activeSlots) {
    allKeys.addAll(index[slot].keys);
  }

  final effectiveCompareColumns = cfg.compareColumns.isNotEmpty
      ? cfg.compareColumns
      : canonicalColumns.where((c) => c.isNotEmpty).toList();

  for (final key in allKeys) {
    final present = List<bool>.generate(3, (i) => index[i].containsKey(key) && activeSlots.contains(i));
    final presentCount = activeSlots.where((s) => present[s]).length;
    final isDuplicate = duplicates.containsKey(key);

    if (useAggregate && isDuplicate) {
      // duplicate đã được gộp
    } else if (cfg.duplicateMode == 'ignore' && isDuplicate) {
      continue;
    }

    if (presentCount < activeCount) {
      final status = presentCount == 1 ? 5 : 4; // extra | missing
      results.add({
        'key': key,
        'status': status,
        'present': present,
        'duplicate': isDuplicate,
        'rows': [
          present[0] ? _canonicalRow(index[0][key]!.first, 0, columnMappings, canonicalColumns) : null,
          present[1] ? _canonicalRow(index[1][key]!.first, 1, columnMappings, canonicalColumns) : null,
          present[2] ? _canonicalRow(index[2][key]!.first, 2, columnMappings, canonicalColumns) : null,
        ],
        'differences': const [],
      });
      continue;
    }

    // Tất cả file đều có key.
    final rows = List<Map<String, dynamic>?>.generate(3, (i) {
      if (!present[i]) return null;
      final row = index[i][key]!.first;
      return useAggregate && aggregated[i].isNotEmpty ? aggregated[i][key]! : row;
    });

    final diffs = <Map<String, dynamic>>[];
    final statusKinds = <int>{};
    for (final column in effectiveCompareColumns) {
      final item = _compareColumn(column, rows, present, columnMappings, eff, cfg);
      if (item != null) {
        diffs.add(item);
        statusKinds.add(item['status'] as int);
      }
    }

    final int status;
    if (diffs.isEmpty) {
      status = 0; // matched
    } else if (statusKinds.length == 1) {
      status = statusKinds.first;
    } else {
      status = 7; // multipleDifferent
    }

    results.add({
      'key': key,
      'status': status,
      'present': present,
      'duplicate': isDuplicate,
      'rows': [
        if (rows[0] != null) _canonicalRow(rows[0]!, 0, columnMappings, canonicalColumns) else null,
        if (rows[1] != null) _canonicalRow(rows[1]!, 1, columnMappings, canonicalColumns) else null,
        if (rows[2] != null) _canonicalRow(rows[2]!, 2, columnMappings, canonicalColumns) else null,
      ],
      'differences': diffs,
    });
  }

  for (var i = 0; i < unkeyable.length; i++) {
    if (unkeyable[i] > 0) {
      warnings.add('${_slotLabel(i, fileNames)}: $unkeyable[i] dòng thiếu giá trị key (đã bỏ qua)');
    }
  }
  if (duplicates.isNotEmpty) {
    warnings.add('Phát hiện ${duplicates.length} key trùng. Xem tab Duplicate để kiểm tra.');
  }

  return {
    'createdAtMs': DateTime.now().millisecondsSinceEpoch,
    'fileNames': fileNames,
    'fileColumns': fileColumns,
    'columnMappings': columnMappings,
    'canonicalColumns': canonicalColumns,
    'config': cfg.toMap(),
    'results': results,
    'duplicates': duplicates,
    'warnings': warnings,
    'fileTotals': fileTotals,
  };
}

CompareConfig _effectiveConfig(CompareConfig cfg) {
  if (cfg.matchMode == 0) {
    return cfg.copyWith(
      trimSpaces: false,
      normalizeUnicode: false,
      ignoreCase: false,
      normalizeNumbers: false,
      normalizeDates: false,
      treatDashAsEmpty: false,
      treatNaAsEmpty: false,
      accountingNegative: false,
    );
  }
  // matchMode 1 (normalized) và 2 (accounting) dùng config gốc.
  return cfg;
}

String? _buildKey(
  Map<String, dynamic> row,
  int slot,
  List<Map<String, String>> mappings,
  CompareConfig eff,
) {
  if (eff.keyColumns.isEmpty) return null;
  final parts = <String>[];
  for (final c in eff.keyColumns) {
    final actual = mappings[slot][c];
    if (actual == null || actual.isEmpty) return null;
    final cell = normalizeCell(row[actual], eff);
    if (cell.isEmpty) return null;
    parts.add(cell.keyText);
  }
  return parts.join('|');
}

Map<String, dynamic> _canonicalRow(
  Map<String, dynamic> row,
  int slot,
  List<Map<String, String>> mappings,
  List<String> canonicalColumns,
) {
  final result = <String, dynamic>{};
  for (final c in canonicalColumns) {
    final actual = mappings[slot][c];
    if (actual == null || actual.isEmpty) continue;
    result[c] = row[actual];
  }
  return result;
}

Map<String, dynamic> _aggregateRows(
  List<Map<String, dynamic>> rows,
  int slot,
  List<Map<String, String>> mappings,
  CompareConfig cfg,
  List<String> canonicalColumns,
) {
  final result = <String, dynamic>{};
  final target = <String>{...cfg.keyColumns, ...cfg.compareColumns};
  if (cfg.amountColumn != null && cfg.amountColumn!.isNotEmpty) target.add(cfg.amountColumn!);
  for (final c in canonicalColumns) {
    if (!target.contains(c)) continue;
    final actual = mappings[slot][c];
    if (actual == null || actual.isEmpty) continue;
    final values = rows.map((r) => r[actual]).where((v) => v != null);
    if (values.isEmpty) continue;
    final nums = values.map((v) => parseNumber(v.toString(), accountingNegative: cfg.accountingNegative)).toList();
    final allNumeric = nums.every((n) => n != null);
    if (allNumeric) {
      result[c] = nums.fold<double>(0, (a, b) => a + b!);
    } else {
      result[c] = values.first;
    }
  }
  return result;
}

/// So sánh một cột chuẩn trên các file hiện diện.
Map<String, dynamic>? _compareColumn(
  String column,
  List<Map<String, dynamic>?> rows,
  List<bool> present,
  List<Map<String, String>> mappings,
  CompareConfig eff,
  CompareConfig cfg,
) {
  if (cfg.matchMode == 0) {
    return _compareColumnExact(column, rows, present, mappings);
  }
  return _compareColumnNormalized(column, rows, present, mappings, eff);
}

Map<String, dynamic>? _compareColumnExact(
  String column,
  List<Map<String, dynamic>?> rows,
  List<bool> present,
  List<Map<String, String>> mappings,
) {
  final values = <int, String>{};
  for (var i = 0; i < 3; i++) {
    if (!present[i]) continue;
    final actual = mappings[i][column];
    final raw = rows[i] == null || actual == null ? null : rows[i]![actual];
    values[i] = raw == null ? '\u0000' : raw.toString();
  }
  if (values.length < 2) return null;
  var different = false;
  String? first;
  for (final v in values.values) {
    if (first == null) {
      first = v;
    } else if (first != v) {
      different = true;
      break;
    }
  }
  if (!different) return null;
  return {
    'column': column,
    'valueA': present[0] ? values[0] : null,
    'valueB': present[1] ? values[1] : null,
    'valueC': present[2] ? values[2] : null,
    'status': 2, // textDifferent
    'numericDifference': null,
  };
}

Map<String, dynamic>? _compareColumnNormalized(
  String column,
  List<Map<String, dynamic>?> rows,
  List<bool> present,
  List<Map<String, String>> mappings,
  CompareConfig eff,
) {
  final cells = <int, NormCell>{};
  final rawValues = <int, dynamic>{};
  for (var i = 0; i < 3; i++) {
    if (!present[i]) continue;
    final actual = mappings[i][column];
    final raw = rows[i] == null || actual == null ? null : rows[i]![actual];
    rawValues[i] = raw;
    cells[i] = normalizeCell(raw, eff);
  }
  if (cells.length < 2) return null;

  var status = 0; // 0=equal
  for (var i = 0; i < 3; i++) {
    if (!cells.containsKey(i)) continue;
    for (var j = i + 1; j < 3; j++) {
      if (!cells.containsKey(j)) continue;
      final s = _cellsCompare(cells[i]!, cells[j]!, eff);
      if (s != null) {
        status = s;
      }
    }
  }
  if (status == 0) return null;

  return {
    'column': column,
    'valueA': present[0] ? rawValues[0] : null,
    'valueB': present[1] ? rawValues[1] : null,
    'valueC': present[2] ? rawValues[2] : null,
    'status': status,
    'numericDifference': _numericDiff(cells, present),
  };
}

int? _cellsCompare(NormCell a, NormCell b, CompareConfig eff) {
  if (a.variant == 'number' && b.variant == 'number') {
    double valueA = a.number!;
    double valueB = b.number!;
    if (eff.decimalPlaces >= 0) {
      valueA = roundToPlaces(valueA, eff.decimalPlaces);
      valueB = roundToPlaces(valueB, eff.decimalPlaces);
    }
    if ((valueA - valueB).abs() <= eff.numberTolerance) {
      return null;
    }
    return 1; // numberDifferent
  }
  if (a.variant == 'date' && b.variant == 'date') {
    if (a.date == b.date) return null;
    return 3; // dateDifferent
  }
  if (a.isEmpty || b.isEmpty) {
    if (a.isEmpty && b.isEmpty) return null;
    return 6; // emptyDifferent
  }
  if (a.text == b.text) return null;
  return 2; // textDifferent
}

double? _numericDiff(Map<int, NormCell> cells, List<bool> present) {
  final numbers = cells.values.where((c) => c.variant == 'number').map((c) => c.number!).toList();
  if (numbers.length < 2) return null;
  final min = numbers.reduce((a, b) => a < b ? a : b);
  final max = numbers.reduce((a, b) => a > b ? a : b);
  return max - min;
}

String _slotLabel(int slot, List<String> fileNames) {
  const names = ['File A', 'File B', 'File C'];
  if (slot < fileNames.length && fileNames[slot].isNotEmpty) {
    return '${names[slot]} (${fileNames[slot]})';
  }
  return names[slot];
}
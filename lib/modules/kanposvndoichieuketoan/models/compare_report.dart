import 'compare_config.dart';
import 'compare_result.dart';
import 'compare_status.dart';
import 'difference_item.dart';

/// Báo cáo đối chiếu hoàn chỉnh (dashboard + danh sách kết quả + tổng tiền).
class CompareReport {
  final int createdAtMs;

  /// Tên hiển thị của từng slot [A, B, C] (rỗng nếu slot không dùng).
  final List<String> fileNames;

  /// Các cột thực tế (header đã chọn) của từng slot.
  final List<List<String>> fileColumns;

  /// Ánh xạ cột chuẩn → cột thực tế cho từng slot.
  final List<Map<String, String>> columnMappings;

  final List<String> canonicalColumns;

  final CompareConfig config;

  final List<CompareResult> results;

  /// key → danh sách nhãn file có duplicate (§16).
  final Map<String, List<String>> duplicates;

  final List<String> warnings;

  /// Tổng tiền (cột amountColumn) của từng file (§45).
  final List<double?> fileTotals;

  const CompareReport({
    required this.createdAtMs,
    required this.fileNames,
    required this.fileColumns,
    required this.columnMappings,
    required this.canonicalColumns,
    required this.config,
    required this.results,
    required this.duplicates,
    required this.warnings,
    required this.fileTotals,
  });

  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(createdAtMs);

  String? get amountColumn => config.amountColumn;

  bool get hasFileC => fileNames.length > 2 && fileNames[2].isNotEmpty;

  int get activeSlots => hasFileC ? 3 : 2;

  int get totalKeys => results.length;

  int get totalDuplicateKeys => duplicates.length;

  bool get hasError => warnings.isNotEmpty;

  double? get amountDiffAB {
    if (fileTotals.length < 2) return null;
    final a = fileTotals[0];
    final b = fileTotals[1];
    if (a == null || b == null) return null;
    return a - b;
  }

  double? get amountDiffAC {
    if (fileTotals.length < 3) return null;
    final a = fileTotals[0];
    final c = fileTotals[2];
    if (a == null || c == null) return null;
    return a - c;
  }

  double? get amountDiffBC {
    if (fileTotals.length < 3) return null;
    final b = fileTotals[1];
    final c = fileTotals[2];
    if (b == null || c == null) return null;
    return b - c;
  }

  Map<CompareStatus, int> get statusCounts {
    final map = <CompareStatus, int>{};
    for (final r in results) {
      map[r.status] = (map[r.status] ?? 0) + 1;
    }
    return map;
  }

  int countOf(CompareStatus status) => statusCounts[status] ?? 0;

  Map<String, dynamic> toStorageMap() {
    return {
      'createdAtMs': createdAtMs,
      'fileNames': fileNames,
      'fileColumns': fileColumns,
      'columnMappings': columnMappings,
      'canonicalColumns': canonicalColumns,
      'config': config.toMap(),
      'results': results.map((r) => r.toStorageMap()).toList(),
      'duplicates': duplicates,
      'warnings': warnings,
      'fileTotals': fileTotals,
    };
  }

  factory CompareReport.fromStorageMap(Map<String, dynamic> map) {
    return CompareReport(
      createdAtMs: map['createdAtMs'] as int,
      fileNames: List<String>.from(map['fileNames'] ?? const []),
      fileColumns: (map['fileColumns'] as List?)?.map((e) => List<String>.from(e as List)).toList() ?? const [],
      columnMappings: (map['columnMappings'] as List?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
          const [],
      canonicalColumns: List<String>.from(map['canonicalColumns'] ?? const []),
      config: CompareConfig.fromMap(Map<String, dynamic>.from(map['config'] as Map)),
      results: (map['results'] as List?)
          ?.map((e) => CompareResult.fromStorageMap(Map<String, dynamic>.from(e as Map)))
          .toList() ??
          const [],
      duplicates: (map['duplicates'] as Map?)?.map((k, v) => MapEntry(k.toString(), List<String>.from(v as List))) ?? const {},
      warnings: List<String>.from(map['warnings'] ?? const []),
      fileTotals: (map['fileTotals'] as List?)?.map((e) => (e as num?)?.toDouble()).toList() ?? const [],
    );
  }

  /// Parse báo cáo từ Map thuần gửi từ isolate (mọi giá trị đều là primitive).
  factory CompareReport.fromEngine(Map<String, dynamic> map) {
    final config = CompareConfig.fromMap(Map<String, dynamic>.from(map['config'] as Map));
    final results = <CompareResult>[];
    for (final e in map['results'] as List) {
      final m = Map<String, dynamic>.from(e as Map);
      final row = <int, Map<String, dynamic>?>{};
      for (var i = 0; i < 3; i++) {
        final v = m['rows'] is List ? (m['rows'] as List)[i] : null;
        row[i] = v == null ? null : Map<String, dynamic>.from(v as Map);
      }
      final diffs = <DifferenceItem>[];
      for (final d in m['differences'] as List? ?? const []) {
        final dm = Map<String, dynamic>.from(d as Map);
        diffs.add(DifferenceItem(
          column: dm['column'] as String,
          valueA: dm['valueA'],
          valueB: dm['valueB'],
          valueC: dm['valueC'],
          status: CompareStatus.fromCode(dm['status'] as int? ?? 0),
          numericDifference: (dm['numericDifference'] as num?)?.toDouble(),
        ));
      }
      results.add(CompareResult(
        key: m['key'] as String,
        status: CompareStatus.fromCode(m['status'] as int? ?? 0),
        fileA: row[0],
        fileB: row[1],
        fileC: row[2],
        present: List<bool>.from(m['present'] ?? const []),
        differences: diffs,
        duplicate: m['duplicate'] ?? false,
      ));
    }
    return CompareReport(
      createdAtMs: map['createdAtMs'] as int? ?? DateTime.now().millisecondsSinceEpoch,
      fileNames: List<String>.from(map['fileNames'] ?? const []),
      fileColumns: (map['fileColumns'] as List?)?.map((e) => List<String>.from(e as List)).toList() ?? const [],
      columnMappings: (map['columnMappings'] as List?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
          const [],
      canonicalColumns: List<String>.from(map['canonicalColumns'] ?? const []),
      config: config,
      results: results,
      duplicates: (map['duplicates'] as Map?)?.map((k, v) => MapEntry(k.toString(), List<String>.from(v as List))) ?? const {},
      warnings: List<String>.from(map['warnings'] ?? const []),
      fileTotals: (map['fileTotals'] as List?)?.map((e) => (e as num?)?.toDouble()).toList() ?? const [],
    );
  }
}
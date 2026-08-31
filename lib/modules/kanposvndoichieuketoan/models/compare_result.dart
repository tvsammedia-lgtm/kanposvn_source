import 'compare_status.dart';
import 'difference_item.dart';

/// Kết quả đối chiếu của một key — spec §33.
///
/// Các map giá trị được key theo tên cột chuẩn, NULL khi file đó thiếu key.
class CompareResult {
  final String key;
  final CompareStatus status;

  /// Dữ liệu dòng của từng file (3 slot) — null nếu file đó không có key này.
  final Map<String, dynamic>? fileA;
  final Map<String, dynamic>? fileB;
  final Map<String, dynamic>? fileC;

  /// Cờ hiện diện tại từng slot [A, B, C].
  final List<bool> present;

  final List<DifferenceItem> differences;

  /// Key bị trùng tại ít nhất một file (§16).
  final bool duplicate;

  const CompareResult({
    required this.key,
    required this.status,
    this.fileA,
    this.fileB,
    this.fileC,
    required this.present,
    required this.differences,
    this.duplicate = false,
  });

  CompareResult copyWith({
    CompareStatus? status,
    Map<String, dynamic>? fileA,
    Map<String, dynamic>? fileB,
    Map<String, dynamic>? fileC,
    List<bool>? present,
    List<DifferenceItem>? differences,
    bool? duplicate,
  }) {
    return CompareResult(
      key: key,
      status: status ?? this.status,
      fileA: fileA ?? this.fileA,
      fileB: fileB ?? this.fileB,
      fileC: fileC ?? this.fileC,
      present: present ?? this.present,
      differences: differences ?? this.differences,
      duplicate: duplicate ?? this.duplicate,
    );
  }

  /// Giá trị của một cột chuẩn tại file slot idx (null nếu không có khác biệt/thiếu).
  dynamic valueOf(int slotIndex, String canonicalColumn) {
    if (!present[slotIndex]) return null;
    final row = _rowAt(slotIndex);
    return row == null ? null : row[canonicalColumn];
  }

  Map<String, dynamic>? _rowAt(int slotIndex) {
    switch (slotIndex) {
      case 0:
        return fileA;
      case 1:
        return fileB;
      case 2:
        return fileC;
    }
    return null;
  }

  Map<String, dynamic> toStorageMap() {
    return {
      'key': key,
      'status': status.code,
      'fileA': fileA,
      'fileB': fileB,
      'fileC': fileC,
      'present': present,
      'duplicate': duplicate,
      'differences': differences.map((d) => d.toMap()).toList(),
    };
  }

  factory CompareResult.fromStorageMap(Map<String, dynamic> map) {
    return CompareResult(
      key: map['key'] as String,
      status: CompareStatus.fromCode(map['status'] as int? ?? 0),
      fileA: _toRow(map['fileA']),
      fileB: _toRow(map['fileB']),
      fileC: _toRow(map['fileC']),
      present: List<bool>.from(map['present'] ?? const [true, true, false]),
      duplicate: map['duplicate'] ?? false,
      differences: (map['differences'] as List?)
          ?.map((e) => DifferenceItem.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList() ??
          const [],
    );
  }

  static Map<String, dynamic>? _toRow(dynamic v) {
    if (v == null) return null;
    return Map<String, dynamic>.from(v as Map);
  }
}
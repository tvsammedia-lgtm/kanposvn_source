import 'compare_status.dart';

/// Một khác biệt của một cột — spec §34.
class DifferenceItem {
  final String column;
  final dynamic valueA;
  final dynamic valueB;
  final dynamic valueC;
  final CompareStatus status;
  final double? numericDifference;

  const DifferenceItem({
    required this.column,
    required this.valueA,
    required this.valueB,
    required this.valueC,
    required this.status,
    this.numericDifference,
  });

  Map<String, dynamic> toMap() {
    return {
      'column': column,
      'valueA': valueA,
      'valueB': valueB,
      'valueC': valueC,
      'status': status.code,
      'numericDifference': numericDifference,
    };
  }

  factory DifferenceItem.fromMap(Map<String, dynamic> map) {
    return DifferenceItem(
      column: map['column'] as String,
      valueA: map['valueA'],
      valueB: map['valueB'],
      valueC: map['valueC'],
      status: CompareStatus.fromCode(map['status'] as int? ?? 2),
      numericDifference: (map['numericDifference'] as num?)?.toDouble(),
    );
  }
}
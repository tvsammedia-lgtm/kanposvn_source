/// Dữ liệu một file đã được đọc và gắn header — spec §8.
class ExcelFileData {
  final String fileName;
  final List<String> columns;
  final List<Map<String, dynamic>> rows;

  const ExcelFileData({
    required this.fileName,
    required this.columns,
    required this.rows,
  });

  int get rowCount => rows.length;

  ExcelFileData copyWith({List<String>? columns, List<Map<String, dynamic>>? rows}) {
    return ExcelFileData(
      fileName: fileName,
      columns: columns ?? this.columns,
      rows: rows ?? this.rows,
    );
  }
}
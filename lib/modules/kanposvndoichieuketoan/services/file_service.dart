import 'dart:convert';
import 'dart:isolate';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as xl;

/// Đọc + decode file Excel/CSV — spec §7, §8.
class FileService {
  static const Set<String> supportedExtensions = {'xlsx', 'csv'};

  static bool isSupported(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    return supportedExtensions.contains(ext);
  }

  static String? unsupportedReason(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    if (supportedExtensions.contains(ext)) return null;
    return 'Không hỗ trợ ".$ext". Chỉ hỗ trợ .xlsx và .csv';
  }

  /// Decode nội dung file thành lưới dữ liệu (List dòng, mỗi dòng List cell).
  /// Cell là primitive: String / int / double / bool / null.
  static Future<List<List<dynamic>>> decodeFile(List<int> bytes, String fileName) async {
    final ext = fileName.split('.').last.toLowerCase();
    if (ext == 'csv') {
      final content = utf8.decode(bytes, allowMalformed: true);
      final rows = const CsvToListConverter(shouldParseNumbers: false).convert(content);
      return rows
          .map((r) => r.map((c) => c?.toString()).toList())
          .toList();
    }
    if (ext == 'xlsx') {
      return Isolate.run(() => _decodeXlsx(bytes));
    }
    throw UnsupportedError('Không hỗ trợ định dạng ".$ext"');
  }
}

List<List<dynamic>> _decodeXlsx(List<int> bytes) {
  final excel = xl.Excel.decodeBytes(bytes);
  xl.Sheet? sheet;
  for (final s in excel.tables.values) {
    if (s.rows.isNotEmpty) {
      sheet = s;
      break;
    }
  }
  if (sheet == null) return const [];
  return sheet.rows
      .map((row) => row.map((d) => cellValueToPrimitive(d?.value)).toList())
      .toList();
}

/// Chuyển CellValue của excel package thành primitive (String/num/bool/null).
dynamic cellValueToPrimitive(xl.CellValue? value) {
  if (value == null) return null;
  switch (value) {
    case xl.TextCellValue():
      return _spanText(value.value);
    case xl.IntCellValue():
      return value.value;
    case xl.DoubleCellValue():
      return value.value;
    case xl.BoolCellValue():
      return value.value;
    case xl.DateCellValue():
      return value.toString();
    case xl.DateTimeCellValue():
      return value.toString();
    case xl.TimeCellValue():
      return value.toString();
    case xl.FormulaCellValue():
      return value.formula;
  }
}

/// Ghép nội dung TextSpan của excel package (text + children) thành chuỗi.
String _spanText(xl.TextSpan span) {
  final buffer = StringBuffer();
  if (span.text != null) buffer.write(span.text);
  for (final child in span.children ?? const <xl.TextSpan>[]) {
    buffer.write(_spanText(child));
  }
  return buffer.toString();
}
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as xl;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/compare_report.dart';
import '../models/compare_result.dart';
import '../models/compare_status.dart';
import '../utils/formatters.dart';

/// Xuất báo cáo ra Excel / PDF / CSV — spec §25, §26, §27.
class ExportService {
  /// Mở hộp thoại chọn thư mục lưu. Trả về null nếu hủy.
  static Future<String?> pickDirectory() {
    return FilePicker.getDirectoryPath(dialogTitle: 'Chọn thư mục lưu báo cáo');
  }

  static Future<String> exportExcel(CompareReport report, String directory) async {
    final excel = xl.Excel.createExcel();
    if (excel.tables.containsKey('Sheet1')) {
      excel.delete('Sheet1');
    }

    _writeSheet(excel, 'Tổng hợp', _summaryRows(report));

    final diffSheets = {
      'Trùng khớp': CompareStatus.matched,
      'Khác số': CompareStatus.numberDifferent,
      'Khác ký tự': CompareStatus.textDifferent,
      'Khác ngày': CompareStatus.dateDifferent,
      'Khác rỗng': CompareStatus.emptyDifferent,
      'Khác nhiều trường': CompareStatus.multipleDifferent,
      'Thiếu': CompareStatus.missing,
      'Dư': CompareStatus.extra,
    };
    for (final entry in diffSheets.entries) {
      final results = report.results.where((r) => r.status == entry.value).toList();
      _writeSheet(excel, entry.key, _detailRows(report, results));
    }

    var dupRows = <List<dynamic>>[['Key', 'Chi tiết']];
    var i = 1;
    for (final entry in report.duplicates.entries) {
      dupRows.add([i++, entry.key, entry.value.join('; ')]);
    }
    _writeSheet(excel, 'Duplicate', dupRows);

    final bytes = excel.encode();
    if (bytes == null) throw Exception('Lỗi khi tạo file Excel');
    return _saveBytes(directory, 'DOI_CHIEU_KET_QUA.xlsx', bytes);
  }

  static Future<String> exportPdf(CompareReport report, String directory) async {
    final regular = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    final bold = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Bold.ttf'));

    final theme = pw.ThemeData.withFont(
      base: regular,
      bold: bold,
      italic: regular,
      boldItalic: bold,
    );

    final doc = pw.Document(theme: theme);

    final summaryHeader = <String>['Chỉ tiêu', 'Giá trị'];
    final summary = [
      ['File A', report.fileNames.isEmpty ? '' : report.fileNames[0]],
      ['File B', report.fileNames.length > 1 ? report.fileNames[1] : ''],
      if (report.hasFileC) ['File C', report.fileNames[2]],
      ['Ngày thực hiện', dateTimeText(report.createdAt)],
      ..._summaryRows(report).skip(1),
    ].map((r) => r.map((e) => e.toString()).toList()).toList();

    final diffRows = <List<String>>[
      ['STT', 'Key', 'Cột', 'File A', 'File B', 'File C', 'Trạng thái'],
    ];
    var index = 0;
    for (final r in report.results) {
      if (r.status == CompareStatus.matched) continue;
      if (diffRows.length > 401) break;
      if (r.differences.isEmpty) {
        diffRows.add([
          (++index).toString(),
          r.key,
          '—',
          _fileValue(r, 0, report, r.key),
          _fileValue(r, 1, report, r.key),
          _fileValue(r, 2, report, r.key),
          r.status.label,
        ]);
      } else {
        for (final d in r.differences) {
          if (diffRows.length > 401) break;
          diffRows.add([
            (++index).toString(),
            r.key,
            d.column,
            valueText(d.valueA),
            valueText(d.valueB),
            valueText(d.valueC),
            d.status.label,
          ]);
        }
      }
    }
    if (diffRows.length == 1) {
      diffRows.add(['—', 'Không có sai lệch', '—', '', '', '', '']);
    }

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('BÁO CÁO ĐỐI CHIẾU SỔ SÁCH KẾ TOÁN')),
          pw.SizedBox(height: 4),
          pw.Text('Ngày thực hiện: ${dateTimeText(report.createdAt)}'),
          pw.SizedBox(height: 8),
          pw.TableHelper.fromTextArray(
            headers: summaryHeader,
            data: summary,
            headerStyle: pw.TextStyle(font: bold, fontSize: 9),
            cellStyle: pw.TextStyle(font: regular, fontSize: 8.5),
            cellPadding: pw.EdgeInsets.all(4),
            headerDecoration: pw.BoxDecoration(color: PdfColor.fromHex('EEEEEE')),
          ),
          pw.SizedBox(height: 12),
          pw.Header(level: 1, child: pw.Text('Chi tiết sai lệch (${diffRows.length - 1} dòng đầu)')),
          pw.TableHelper.fromTextArray(
            headers: diffRows.first,
            data: diffRows.sublist(1),
            headerStyle: pw.TextStyle(font: bold, fontSize: 8),
            cellStyle: pw.TextStyle(font: regular, fontSize: 7.5),
            cellPadding: pw.EdgeInsets.all(3),
            headerDecoration: pw.BoxDecoration(color: PdfColor.fromHex('EEEEEE')),
          ),
        ],
      ),
    );

    final bytes = await doc.save();
    return _saveBytes(directory, 'DOI_CHIEU_KET_QUA.pdf', bytes);
  }

  static Future<List<String>> exportCsv(CompareReport report, String directory) async {
    final base = _detailRows(report, report.results.where((r) => r.status != CompareStatus.matched).toList());
    final missing = _detailRows(report, report.results.where((r) => r.status == CompareStatus.missing).toList());
    final matched = _kitRows(report, report.results.where((r) => r.status == CompareStatus.matched).toList());

    final paths = <String>[
      await _saveCsv(directory, 'difference.csv', base),
      await _saveCsv(directory, 'missing.csv', missing),
      await _saveCsv(directory, 'matched.csv', matched),
    ];
    return paths;
  }

  static Future<String> _saveCsv(String directory, String name, List<List<dynamic>> rows) async {
    final data = rows.map((r) => r.map((e) => e == null ? '' : e.toString()).toList()).toList();
    final csv = const ListToCsvConverter().convert(data);
    return _saveBytes(directory, name, Uint8List.fromList(utf8.encode('\uFEFF$csv')));
  }

  static Future<String> _saveBytes(String directory, String name, List<int> bytes) async {
    final file = File('$directory\\$name');
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  static void _writeSheet(xl.Excel excel, String name, List<List<dynamic>> rows) {
    final sheet = excel[name];
    for (final r in rows) {
      sheet.appendRow(r.map(_cellValue).toList());
    }
  }

  static xl.CellValue? _cellValue(dynamic v) {
    if (v == null) return null;
    if (v is int) return xl.IntCellValue(v);
    if (v is double) return xl.DoubleCellValue(v);
    if (v is bool) return xl.BoolCellValue(v);
    return xl.TextCellValue(v.toString());
  }

  static List<List<dynamic>> _summaryRows(CompareReport report) {
    final counts = report.statusCounts;
    final fmt = NumberFormat.decimalPattern('vi');
    return [
      ['Chỉ tiêu', 'Giá trị'],
      ['Tên báo cáo', 'ĐỐI CHIẾU SỔ SÁCH KẾ TOÁN'],
      ['Tổng dòng', fmt.format(report.totalKeys)],
      ['Trùng khớp', fmt.format(counts[CompareStatus.matched] ?? 0)],
      ['Khác số', fmt.format(counts[CompareStatus.numberDifferent] ?? 0)],
      ['Khác ký tự', fmt.format(counts[CompareStatus.textDifferent] ?? 0)],
      ['Khác ngày', fmt.format(counts[CompareStatus.dateDifferent] ?? 0)],
      ['Khác dữ liệu rỗng', fmt.format(counts[CompareStatus.emptyDifferent] ?? 0)],
      ['Khác nhiều trường', fmt.format(counts[CompareStatus.multipleDifferent] ?? 0)],
      ['Thiếu', fmt.format(counts[CompareStatus.missing] ?? 0)],
      ['Dư', fmt.format(counts[CompareStatus.extra] ?? 0)],
      ['Duplicate key', fmt.format(report.totalDuplicateKeys)],
      if (report.config.amountColumn != null) ...[
        ['Tổng tiền File A', valueText(report.fileTotals.isNotEmpty ? report.fileTotals[0] : null)],
        ['Tổng tiền File B', valueText(report.fileTotals.length > 1 ? report.fileTotals[1] : null)],
        if (report.hasFileC) ['Tổng tiền File C', valueText(report.fileTotals.length > 2 ? report.fileTotals[2] : null)],
      ],
    ];
  }

  static List<dynamic> _rowHeader() => ['STT', 'Key', 'Cột', 'File A', 'File B', 'File C', 'Trạng thái', 'Chênh lệch'];

  static List<List<dynamic>> _detailRows(CompareReport report, List<CompareResult> results) {
    final rows = <List<dynamic>>[
      _rowHeader(),
    ];
    var i = 1;
    for (final r in results) {
      if (r.differences.isEmpty) {
        rows.add([
          i++,
          r.key,
          '—',
          _fileValue(r, 0, report, r.key),
          _fileValue(r, 1, report, r.key),
          _fileValue(r, 2, report, r.key),
          r.status.label,
          r.status == CompareStatus.extra || r.status == CompareStatus.missing ? 'Thiếu key ở file kia' : '',
        ]);
      } else {
        for (final d in r.differences) {
          rows.add([
            i++,
            r.key,
            d.column,
            valueText(d.valueA),
            valueText(d.valueB),
            valueText(d.valueC),
            d.status.label,
            d.numericDifference == null ? '' : valueText(d.numericDifference),
          ]);
        }
      }
    }
    return rows;
  }

  static List<List<dynamic>> _kitRows(CompareReport report, List<CompareResult> results) {
    final cols = report.canonicalColumns;
    final header = <dynamic>['STT', 'Key'];
    for (final c in cols) {
      header.add('A: $c');
      header.add('B: $c');
      if (report.hasFileC) header.add('C: $c');
    }
    final rows = <List<dynamic>>[header];
    var i = 1;
    for (final r in results) {
      final row = <dynamic>[i++, r.key];
      for (final c in cols) {
        row.add(valueText(r.valueOf(0, c)));
        row.add(valueText(r.valueOf(1, c)));
        if (report.hasFileC) row.add(valueText(r.valueOf(2, c)));
      }
      rows.add(row);
    }
    return rows;
  }

  static String _fileValue(CompareResult r, int slot, CompareReport report, String key) {
    if (!r.present[slot] || r.valueOf(slot, key) == null) return '';
    return valueText(r.valueOf(slot, key));
  }
}
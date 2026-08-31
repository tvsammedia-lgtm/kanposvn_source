import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/compare_config.dart';
import '../models/compare_report.dart';

class HistoryEntry {
  final String path;
  final String name;
  final int createdAtMs;
  final List<String> fileNames;
  final int totalRows;
  final int errorCount;
  final Map<String, dynamic> config;

  const HistoryEntry({
    required this.path,
    required this.name,
    required this.createdAtMs,
    required this.fileNames,
    required this.totalRows,
    required this.errorCount,
    required this.config,
  });

  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(createdAtMs);
}

/// Lưu lịch sử đối chiếu cục bộ dạng JSON + mẫu đối chiếu — spec §28, §47.
/// Không cần database, mọi thứ nằm trong thư mục ứng dụng.
class HistoryService {
  static const _dirName = 'kanposvn_doichieu_history';
  static const _templateKey = 'dc_templates_v1';

  static Future<Directory> _historyDir() async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory('${docs.path}\\$_dirName');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    return dir;
  }

  static Future<String> saveReport(CompareReport report, {String? name}) async {
    final dir = await _historyDir();
    final stamp = DateFormat('yyyyMMdd_HHmmss').format(report.createdAt);
    var fileName = '${stamp}_001.json';
    var counter = 1;
    while (File('${dir.path}\\$fileName').existsSync()) {
      counter++;
      fileName = '${stamp}_${counter.toString().padLeft(3, '0')}.json';
    }
    final file = File('${dir.path}\\$fileName');
    final map = report.toStorageMap();
    if (name != null && name.isNotEmpty) {
      map['name'] = name;
    }
    await file.writeAsString(jsonEncode(map), flush: true);
    return file.path;
  }

  static Future<List<HistoryEntry>> listHistory() async {
    final dir = await _historyDir();
    final entries = <HistoryEntry>[];
    await for (final entity in dir.list()) {
      if (entity is! File || !entity.path.toLowerCase().endsWith('.json')) continue;
      try {
        final map = jsonDecode(await entity.readAsString()) as Map<String, dynamic>;
        final results = map['results'] as List? ?? const [];
        final fileNames = List<String>.from(map['fileNames'] ?? const []);
        entries.add(HistoryEntry(
          path: entity.path,
          name: (map['name'] as String?)?.trim().isNotEmpty == true
              ? map['name'] as String
              : fileNames.isEmpty
                  ? 'Đối chiếu'
                  : fileNames.join(' ↔ '),
          createdAtMs: map['createdAtMs'] as int? ?? 0,
          fileNames: fileNames,
          totalRows: results.length,
          errorCount: results.where((e) => (e as Map)['status'] != 0).length,
          config: Map<String, dynamic>.from(map['config'] as Map? ?? const {}),
        ));
      } catch (_) {
        // bỏ qua file lỗi/hỏng
      }
    }
    entries.sort((a, b) => b.createdAtMs.compareTo(a.createdAtMs));
    return entries;
  }

  static Future<CompareReport?> loadReport(String path) async {
    try {
      final map = jsonDecode(await File(path).readAsString()) as Map<String, dynamic>;
      return CompareReport.fromStorageMap(map);
    } catch (_) {
      return null;
    }
  }

  static Future<void> deleteReport(String path) async {
    final f = File(path);
    if (f.existsSync()) f.deleteSync();
  }

  // ---- Mẫu đối chiếu (template) ----

  static Future<List<Map<String, dynamic>>> listTemplates() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_templateKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveTemplate(String name, CompareConfig config) async {
    final templates = await listTemplates();
    templates.removeWhere((t) => t['name'] == name);
    templates.insert(0, {'name': name, 'config': config.toMap()});
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_templateKey, jsonEncode(templates));
  }

  static Future<void> deleteTemplate(String name) async {
    final templates = await listTemplates();
    templates.removeWhere((t) => t['name'] == name);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_templateKey, jsonEncode(templates));
  }
}
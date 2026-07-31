import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../core/db/database_service.dart';
import 'cafe_isar_service.dart';

class BackupLogEntry {
  final DateTime timestamp;
  final String action;
  final bool success;
  final String message;

  BackupLogEntry({
    DateTime? timestamp,
    required this.action,
    required this.success,
    required this.message,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'timestamp': timestamp.toIso8601String(),
    'action': action,
    'success': success,
    'message': message,
  };

  factory BackupLogEntry.fromJson(Map<String, dynamic> json) => BackupLogEntry(
    timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
    action: json['action'] ?? '',
    success: json['success'] ?? false,
    message: json['message'] ?? '',
  );
}

class CafeBackupRestoreService extends ChangeNotifier {
  final CafeIsarService _isarService = CafeIsarService();
  final DatabaseService _db = DatabaseService.instance;

  List<BackupLogEntry> _logs = [];
  List<BackupLogEntry> get logs => List.unmodifiable(_logs);

  double? _progress;
  double? get progress => _progress;

  String _status = '';
  String get status => _status;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  CafeBackupRestoreService() {
    _loadLogs();
  }

  void _loadLogs() {
    try {
      final raw = _db.getCollection('cafe_backup_logs');
      final list = raw.map((e) => BackupLogEntry.fromJson(e)).toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
      _logs = list;
    } catch (_) {}
  }

  Future<void> addLog(String action, bool success, String message) async {
    final entry = BackupLogEntry(
      action: action,
      success: success,
      message: message,
    );
    _logs.insert(0, entry);
    if (_logs.length > 200) _logs.removeLast();
    try {
      await _db.saveItem(
        'cafe_backup_logs',
        'LOG-${entry.timestamp.millisecondsSinceEpoch}-${entry.timestamp.microsecond}',
        entry.toJson(),
        triggerSync: false,
      );
    } catch (e) {
      debugPrint('Backup log save error: $e');
    }
    notifyListeners();
  }

  void _report(double? progress, String status) {
    _progress = progress;
    _status = status;
    notifyListeners();
  }

  void _begin(String status) {
    _isBusy = true;
    _report(0, status);
  }

  void _end() {
    _isBusy = false;
    notifyListeners();
  }

  // ===================== ISAR BACKUP =====================

  Map<String, dynamic> buildIsarBackup() {
    final collections = <String, dynamic>{};
    for (final name in _db.collectionNames) {
      collections[name] = _db.getCollection(name);
    }
    return {
      'app': 'kanposvncafe',
      'exportDate': DateTime.now().toIso8601String(),
      'version': 1,
      'collections': collections,
    };
  }

  Future<int> restoreIsar(
    Map<String, dynamic> data, {
    bool clearFirst = true,
  }) async {
    _begin('Đang khôi phục Isar...');
    try {
      final collections =
          (data['collections'] as Map<String, dynamic>?) ?? const {};
      final names = collections.keys.toList();
      int total = 0;

      for (var i = 0; i < names.length; i++) {
        final name = names[i];
        final items = (collections[name] as List?) ?? [];
        _report(
          names.isEmpty ? 0 : (i + 0.0) / names.length,
          'Đang khôi phục Isar: $name (${items.length} bản ghi)...',
        );
        if (clearFirst) {
          await _db.clearCollection(name);
        }
        for (var j = 0; j < items.length; j++) {
          final item = Map<String, dynamic>.from(items[j] as Map);
          final id = (item['id'] ?? item['itemId'] ?? '').toString();
          if (id.isEmpty) continue;
          await _db.saveItem(name, id, item, triggerSync: false);
          total++;
          if (items.length > 50 && j % 50 == 0) {
            _report(
              names.isEmpty ? 0 : (i + (j / items.length)) / names.length,
              'Đang khôi phục Isar: $name ($j/${items.length})...',
            );
          }
        }
      }

      _report(1.0, 'Hoàn tất khôi phục Isar');
      return total;
    } finally {
      _end();
    }
  }

  // ===================== ZIP UTILITIES =====================

  Uint8List buildZip(Map<String, dynamic> data, String baseName) {
    final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
    final archive = Archive();
    archive.addFile(
      ArchiveFile('$baseName.json', jsonStr.length, utf8.encode(jsonStr)),
    );
    final bytes = ZipEncoder().encode(archive);
    return Uint8List.fromList(bytes);
  }

  Map<String, dynamic> parseBackupBytes(List<int> bytes) {
    try {
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        if (!file.name.endsWith('.json')) continue;
        final decoded = jsonDecode(utf8.decode(file.content));
        if (decoded is Map<String, dynamic>) return decoded;
      }
    } catch (_) {
      // Not a zip, try plain JSON below
    }
    final decoded = jsonDecode(utf8.decode(bytes));
    return Map<String, dynamic>.from(decoded as Map);
  }

  // ===================== NEON BACKUP =====================

  Future<Map<String, dynamic>> exportNeon() async {
    _begin('Đang tải dữ liệu từ Neon DB...');
    try {
      final config = _isarService.getSyncConfig();
      final uri = Uri.parse('${config.vercelApiUrl}/api/sync/export');
      final res = await http
          .post(
            uri,
            headers: {
              'Authorization': 'Bearer ${config.apiKey}',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'appCode': 'kanposvncafe', 'apiKey': config.apiKey}),
          )
          .timeout(const Duration(seconds: 30));

      final body = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      if (res.statusCode == 200 && body['success'] == true) {
        final count = (body['count'] ?? 0) as num;
        _report(1.0, 'Đã tải ${count.toInt()} bản ghi từ Neon DB');
        return body;
      }
      throw Exception(
        body['error'] ?? body['message'] ?? 'Export Neon thất bại (HTTP ${res.statusCode})',
      );
    } finally {
      _end();
    }
  }

  Future<int> importNeon(Map<String, dynamic> data) async {
    _begin('Đang đẩy dữ liệu lên Neon DB...');
    try {
      final config = _isarService.getSyncConfig();
      final collections = (data['collections'] as Map<String, dynamic>?) ?? {};
      final uri = Uri.parse('${config.vercelApiUrl}/api/sync/import');
      final res = await http
          .post(
            uri,
            headers: {
              'Authorization': 'Bearer ${config.apiKey}',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'appCode': 'kanposvncafe',
              'apiKey': config.apiKey,
              'collections': collections,
            }),
          )
          .timeout(const Duration(seconds: 30));

      final body = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      if (res.statusCode == 200 && body['success'] == true) {
        final count = (body['count'] ?? 0) as num;
        _report(1.0, 'Đã import ${count.toInt()} bản ghi vào Neon DB');
        return count.toInt();
      }
      throw Exception(
        body['error'] ?? body['message'] ?? 'Import Neon thất bại (HTTP ${res.statusCode})',
      );
    } finally {
      _end();
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import '../db/database_service.dart';

/// Màn hình Sao lưu / Phục hồi dữ liệu chung cho mọi module.
/// Dùng DatabaseService (singleton) — hoạt động với mọi module.
class GenericBackupRestoreScreen extends StatefulWidget {
  const GenericBackupRestoreScreen({super.key});

  @override
  State<GenericBackupRestoreScreen> createState() => _GenericBackupRestoreScreenState();
}

class _GenericBackupRestoreScreenState extends State<GenericBackupRestoreScreen> {
  bool _busy = false;
  String _status = '';

  DatabaseService get _db => DatabaseService.instance;

  String _fileName(String prefix, String ext) =>
      'kanposvn_${prefix}_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.$ext';

  int _countRecords(Map<String, dynamic> data) {
    final collections = (data['collections'] as Map<String, dynamic>?) ?? {};
    return collections.values.fold<int>(
      0,
      (sum, items) => sum + ((items as List?)?.length ?? 0),
    );
  }

  Map<String, dynamic> _buildBackup() {
    final collections = <String, dynamic>{};
    for (final name in _db.collectionNames) {
      collections[name] = _db.getCollection(name);
    }
    return {
      'app': _db.currentAppCode,
      'exportDate': DateTime.now().toIso8601String(),
      'version': 1,
      'collections': collections,
    };
  }

  // ===================== LOCAL EXPORT =====================
  Future<void> _exportLocal() async {
    setState(() {
      _busy = true;
      _status = 'Đang sao lưu...';
    });
    try {
      final data = _buildBackup();
      final count = _countRecords(data);
      final path = await FilePicker.saveFile(
        dialogTitle: 'Lưu file sao lưu',
        fileName: _fileName('backup', 'json'),
        type: FileType.custom,
        allowedExtensions: ['json'],
      );
      if (path == null) {
        setState(() { _busy = false; _status = ''; });
        return;
      }
      await File(path).writeAsString(
        const JsonEncoder.withIndent('  ').convert(data),
      );
      setState(() {
        _status = 'Sao lưu thành công: $count bản ghi';
      });
    } catch (e) {
      setState(() { _status = 'Lỗi sao lưu: $e'; });
    } finally {
      setState(() { _busy = false; });
    }
  }

  // ===================== LOCAL IMPORT =====================
  Future<void> _importLocal() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận phục hồi'),
        content: const Text(
          'Dữ liệu hiện tại sẽ bị xóa và thay thế bằng file sao lưu. Tiếp tục?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('PHỤC HỒI')),
        ],
      ),
    );
    if (confirm != true) return;

    setState(() {
      _busy = true;
      _status = 'Đang chọn file...';
    });
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );
      if (result == null || result.files.isEmpty) {
        setState(() { _busy = false; _status = ''; });
        return;
      }
      final file = File(result.files.first.path!);
      final content = await file.readAsString();
      final data = jsonDecode(content) as Map<String, dynamic>;

      setState(() { _status = 'Đang phục hồi dữ liệu...'; });

      final collections = (data['collections'] as Map<String, dynamic>?) ?? {};
      final names = collections.keys.toList();
      int total = 0;

      for (var i = 0; i < names.length; i++) {
        final name = names[i];
        final items = (collections[name] as List?) ?? [];
        await _db.clearCollection(name);
        for (var j = 0; j < items.length; j++) {
          final item = Map<String, dynamic>.from(items[j] as Map);
          final id = (item['id'] ?? item['itemId'] ?? '').toString();
          if (id.isEmpty) continue;
          await _db.saveItem(name, id, item, triggerSync: false);
          total++;
        }
        if (mounted) {
          setState(() { _status = 'Đang khôi phục: $name (${items.length} bản ghi)...'; });
        }
      }

      setState(() {
        _status = 'Phục hồi thành công: $total bản ghi từ ${result.files.first.name}';
      });
    } catch (e) {
      setState(() { _status = 'Lỗi phục hồi: $e'; });
    } finally {
      setState(() { _busy = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sao lưu / Phục hồi dữ liệu')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Sao lưu cục bộ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    const Text('Xuất toàn bộ dữ liệu ra file JSON.', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _busy ? null : _exportLocal,
                      icon: const Icon(Icons.backup),
                      label: const Text('Sao lưu ra file'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Phục hồi từ file', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    const Text('Nhập dữ liệu từ file sao lưu. Dữ liệu hiện tại sẽ bị xóa.', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _busy ? null : _importLocal,
                      icon: const Icon(Icons.restore),
                      label: const Text('Phục hồi từ file'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_busy) const LinearProgressIndicator(),
            if (_status.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_status, style: TextStyle(fontSize: 13, color: _status.startsWith('Lỗi') ? Colors.red : Colors.green.shade700)),
              ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../services/module_backup_service.dart';

/// Quản lý backup / restore dữ liệu của TỪNG module KanPosVN.
///
/// 1) Module có DB riêng (.isar): backup file nguyên vẹn + restore.
/// 2) Module dùng chung POS: file kanposvn_data.isar chứa nhiều module,
///    backup JSON TÁCH RIÊNG theo appCode từng module.
/// 3) Cửa hàng Cloud: mỗi cửa hàng 1 file isar_store_[id].isar.
class CrmBackupScreen extends ConsumerStatefulWidget {
  const CrmBackupScreen({super.key});

  @override
  ConsumerState<CrmBackupScreen> createState() => _CrmBackupScreenState();
}

class _CrmBackupScreenState extends ConsumerState<CrmBackupScreen> {
  String? _busyKey;
  String? _expandedKey;
  final Map<String, int> _dbSizes = {};
  bool _initialized = false;

  // Dữ liệu động.
  List<({String appCode, String label, int records})> _sharedModules = [];
  List<BackupFileInfo> _storeDbs = [];
  final Set<String> _expandedShared = {};
  final Set<String> _expandedStores = {};

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await ModuleBackupService.initDocsCache();
    for (final m in ModuleBackupService.modules) {
      _dbSizes['db_${m.id}'] = await ModuleBackupService.dbSize(m);
    }
    _sharedModules = await ModuleBackupService.listSharedModules();
    _storeDbs = ModuleBackupService.listStoreDbs();
    if (mounted) setState(() => _initialized = true);
  }

  void _snack(String msg, {bool error = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: error ? Colors.red : null,
      duration: const Duration(seconds: 3),
    ));
  }

  Future<void> _run(String key, Future<String?> Function() action) async {
    setState(() => _busyKey = key);
    try {
      final msg = await action();
      if (msg != null && msg.isNotEmpty) _snack(msg);
      await _init();
      if (mounted) setState(() {});
    } catch (e) {
      _snack('Lỗi: $e', error: true);
    } finally {
      if (mounted) setState(() => _busyKey = null);
    }
  }

  // ══════════════════════ XÂY DỰNG GIAO DIỆN ══════════════════════

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Backup / Restore'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
      ),
      body: !_initialized
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _init,
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _backupPathCard(),
                  const SizedBox(height: 8),
                  _sectionHeader('Module có DB riêng',
                      'Backup nguyên file .isar — phục hồi toàn bộ'),
                  for (final m in ModuleBackupService.modules)
                    _dedicatedCard(m),
                  const SizedBox(height: 16),
                  _sectionHeader('Module dùng chung POS (tách riêng từng module)',
                      'Dữ liệu nằm chung 1 file — backup JSON riêng theo module '
                      '(chỉ hiện module đang có dữ liệu trên máy này)'),
                  if (_sharedModules.isEmpty)
                    _emptyHint('Chưa phát hiện dữ liệu của module nào'),
                  for (final s in _sharedModules) _sharedCard(s),
                  const SizedBox(height: 16),
                  _sectionHeader('Cửa hàng Cloud',
                      'Mỗi cửa hàng có DB riêng isar_store_<id>.isar'),
                  if (_storeDbs.isEmpty)
                    _emptyHint('Máy này chưa có DB cửa hàng Cloud nào'),
                  for (final s in _storeDbs) _storeDbCard(s),
                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }

  Widget _sectionHeader(String title, String subtitle) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ]),
      );

  Widget _emptyHint(String text) => Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(text,
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ),
      );

  /// Đường dẫn thư mục backup trên máy hiện tại
  /// (Windows: Documents\kanposvn_backups · Android: bộ nhớ ngoài app).
  Widget _backupPathCard() => Card(
        color: Colors.blueGrey[50],
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            const Icon(Icons.folder, size: 22, color: Color(0xFFE11D48)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Thư mục backup',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    SelectableText(ModuleBackupService.backupRootPath,
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[700])),
                  ]),
            ),
          ]),
        ),
      );

  bool get _busy => _busyKey != null;

  // ══════════ 1. MODULE DB RIÊNG ══════════

  Widget _dedicatedCard(ModuleBackupEntry m) {
    final key = 'db_${m.id}';
    final isBusy = _busyKey == key;
    final expanded = _expandedKey == key;
    final backups =
        expanded ? ModuleBackupService.listBackups(m) : <BackupFileInfo>[];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(_iconFor(m.id), size: 22, color: const Color(0xFFE11D48)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.name,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text('${m.isarName}.isar · ${_fmtSize(_dbSizes[key] ?? 0)}',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ]),
            ),
            if (isBusy)
              _miniSpinner()
            else ...[
              IconButton(
                tooltip: 'Tạo bản sao lưu ngay',
                icon: const Icon(Icons.backup, color: Colors.green),
                onPressed: () => _run(key, () async {
                  final f = await ModuleBackupService.createBackup(m);
                  return 'Đã sao lưu: '
                      '${f.path.split(Platform.pathSeparator).last}';
                }),
              ),
              IconButton(
                tooltip: 'Danh sách bản sao lưu',
                icon: Icon(expanded ? Icons.expand_less : Icons.history,
                    color: Colors.blueGrey),
                onPressed: () =>
                    setState(() => _expandedKey = expanded ? null : key),
              ),
              IconButton(
                tooltip: m.resetToSeed != null
                    ? 'Reset về dữ liệu mẫu'
                    : 'Xóa sạch dữ liệu',
                icon: const Icon(Icons.restart_alt, color: Colors.orange),
                onPressed: () => _confirmReset(m),
              ),
            ],
          ]),
          if (expanded)
            _backupList(
              backups: backups,
              emptyText: 'Chưa có bản sao lưu nào',
              onRestore: (b) => _confirmRestoreFile(
                title: 'Phục hồi "${m.name}"?',
                message: 'Dữ liệu hiện tại sẽ được THAY THẾ bằng bản sao lưu '
                    '${DateFormat('dd/MM/yyyy HH:mm:ss').format(b.modified)} '
                    '(${b.sizeLabel}).',
                doRestore: () async {
                  await ModuleBackupService.restoreFromBackup(m, b.file);
                  return 'Đã phục hồi từ bản sao lưu';
                },
              ),
              onDelete: (b) {
                ModuleBackupService.deleteBackup(b.file);
                setState(() {});
              },
            ),
        ]),
      ),
    );
  }

  void _confirmReset(ModuleBackupEntry m) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Reset "${m.name}"?'),
        content: const Text(
            'Toàn bộ dữ liệu hiện tại sẽ bị XÓA và thay bằng bộ dữ liệu mẫu. '
            'Nên tạo bản sao lưu trước.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Xóa & Seed lại')),
        ],
      ),
    );
    if (ok == true && mounted) {
      await _run('db_${m.id}', () async {
        await ModuleBackupService.resetToSeed(m);
        return 'Đã reset về dữ liệu mẫu: ${m.name}';
      });
    }
  }

  // ══════════ 2. MODULE DÙNG CHUNG POS (tách theo appCode) ══════════

  Widget _sharedCard(({String appCode, String label, int records}) s) {
    final key = 'shared_${s.appCode}';
    final isBusy = _busyKey == key;
    final expanded = _expandedShared.contains(s.appCode);
    final List<BackupFileInfo> backups = expanded
        ? ModuleBackupService.listSharedBackups(s.appCode)
        : <BackupFileInfo>[];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.widgets, size: 22, color: Color(0xFF2563EB)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.label,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text('${s.appCode} · ${s.records} bản ghi',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ]),
            ),
            if (isBusy)
              _miniSpinner()
            else ...[
              IconButton(
                tooltip: 'Sao lưu riêng module này (JSON)',
                icon: const Icon(Icons.backup, color: Colors.green),
                onPressed: () => _run(key, () async {
                  final f =
                      await ModuleBackupService.createSharedBackup(s.appCode);
                  return 'Đã sao lưu riêng "${s.label}": '
                      '${f.path.split(Platform.pathSeparator).last}';
                }),
              ),
              IconButton(
                tooltip: 'Bản sao lưu của module này',
                icon: Icon(expanded ? Icons.expand_less : Icons.history,
                    color: Colors.blueGrey),
                onPressed: () => setState(() {
                  expanded
                      ? _expandedShared.remove(s.appCode)
                      : _expandedShared.add(s.appCode);
                }),
              ),
              IconButton(
                tooltip: 'Xóa dữ liệu RIÊNG module này',
                icon: const Icon(Icons.delete_sweep, color: Colors.orange),
                onPressed: () => _confirmDeleteShared(s),
              ),
            ],
          ]),
          if (expanded)
            _backupList(
              backups: backups,
              emptyText: 'Chưa có bản sao lưu riêng cho module này',
              onRestore: (b) => _confirmRestoreFile(
                title: 'Phục hồi "${s.label}"?',
                message:
                    'Chỉ dữ liệu của module này (appCode ${s.appCode}) sẽ bị '
                    'thay thế bởi bản sao lưu '
                    '${DateFormat('dd/MM/yyyy HH:mm:ss').format(b.modified)}. '
                    'Các module khác KHÔNG bị ảnh hưởng.',
                doRestore: () async {
                  final n = await ModuleBackupService.restoreSharedBackup(
                      s.appCode, b.file);
                  return 'Đã phục hồi $n bản ghi cho ${s.label}';
                },
              ),
              onDelete: (b) {
                ModuleBackupService.deleteBackup(b.file);
                setState(() {});
              },
            ),
        ]),
      ),
    );
  }

  void _confirmDeleteShared(
      ({String appCode, String label, int records}) s) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Xóa dữ liệu "${s.label}"?'),
        content: Text(
            'Xóa ${s.records} bản ghi thuộc riêng module này khỏi DB dùng chung. '
            'Các module khác KHÔNG bị ảnh hưởng.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Xóa')),
        ],
      ),
    );
    if (ok == true && mounted) {
      await _run('shared_${s.appCode}', () async {
        final n = await ModuleBackupService.resetSharedModule(s.appCode);
        return 'Đã xóa $n bản ghi của ${s.label}';
      });
    }
  }

  // ══════════ 3. CỬA HÀNG CLOUD ══════════

  Widget _storeDbCard(BackupFileInfo storeDb) {
    final storeId = ModuleBackupService.storeIdOf(storeDb);
    final key = 'store_$storeId';
    final isBusy = _busyKey == key;
    final expanded = _expandedStores.contains(storeId);
    final List<BackupFileInfo> backups = expanded
        ? ModuleBackupService.listStoreDbBackups(storeId)
        : <BackupFileInfo>[];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.storefront, size: 22, color: Color(0xFF059669)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cửa hàng: $storeId',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(
                        'isar_store_$storeId.isar · '
                        '${_fmtSize(storeDb.sizeBytes)}',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ]),
            ),
            if (isBusy)
              _miniSpinner()
            else ...[
              IconButton(
                tooltip: 'Sao lưu DB cửa hàng',
                icon: const Icon(Icons.backup, color: Colors.green),
                onPressed: () => _run(key, () async {
                  await ModuleBackupService.createStoreDbBackup(storeDb);
                  return 'Đã sao lưu DB cửa hàng $storeId';
                }),
              ),
              IconButton(
                tooltip: 'Bản sao lưu cửa hàng',
                icon: Icon(expanded ? Icons.expand_less : Icons.history,
                    color: Colors.blueGrey),
                onPressed: () => setState(() {
                  expanded
                      ? _expandedStores.remove(storeId)
                      : _expandedStores.add(storeId);
                }),
              ),
            ],
          ]),
          if (expanded)
            _backupList(
              backups: backups,
              emptyText: 'Chưa có bản sao lưu cho cửa hàng này',
              onRestore: (b) => _confirmRestoreFile(
                title: 'Phục hồi cửa hàng $storeId?',
                message: 'DB hiện tại của cửa hàng sẽ bị THAY THẾ bằng bản '
                    'sao lưu '
                    '${DateFormat('dd/MM/yyyy HH:mm:ss').format(b.modified)} '
                    '(${b.sizeLabel}).',
                doRestore: () async {
                  await ModuleBackupService.restoreStoreDb(storeDb, b.file);
                  return 'Đã phục hồi DB cửa hàng $storeId';
                },
              ),
              onDelete: (b) {
                ModuleBackupService.deleteBackup(b.file);
                setState(() {});
              },
            ),
        ]),
      ),
    );
  }

  // ══════════ DÙNG CHUNG ══════════

  Future<void> _confirmRestoreFile({
    required String title,
    required String message,
    required Future<String?> Function() doRestore,
  }) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Phục hồi')),
        ],
      ),
    );
    if (ok == true && mounted) {
      await _run(_busyKey ?? 'restore', doRestore);
    }
  }

  Widget _backupList({
    required List<BackupFileInfo> backups,
    required String emptyText,
    required Future<void> Function(BackupFileInfo) onRestore,
    required void Function(BackupFileInfo) onDelete,
  }) {
    return Column(children: [
      const Divider(),
      if (backups.isEmpty)
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(emptyText,
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        )
      else
        ...backups.map((b) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.save_alt, color: Colors.green),
              title:
                  Text(DateFormat('dd/MM/yyyy — HH:mm:ss').format(b.modified)),
              subtitle: Text(b.sizeLabel),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                TextButton.icon(
                  onPressed: _busy ? null : () => onRestore(b),
                  icon: const Icon(Icons.restore, size: 18),
                  label: const Text('Phục hồi'),
                ),
                IconButton(
                  tooltip: 'Xóa bản sao lưu',
                  icon: const Icon(Icons.delete_outline,
                      color: Colors.redAccent),
                  onPressed: () => onDelete(b),
                ),
              ]),
            )),
    ]);
  }

  Widget _miniSpinner() => const SizedBox(
      width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2));

  IconData _iconFor(String id) {
    switch (id) {
      case 'core':
        return Icons.storefront;
      case 'crm':
        return Icons.support_agent;
      case 'restaurant':
        return Icons.restaurant;
      case 'vantai':
        return Icons.directions_bus;
      case 'batdongsan':
        return Icons.home_work;
      case 'hrpayroll':
        return Icons.badge;
      default:
        return Icons.storage;
    }
  }

  static String _fmtSize(int bytes) {
    final kb = bytes / 1024;
    if (kb >= 1024) return '${(kb / 1024).toStringAsFixed(1)} MB';
    return '${kb.toStringAsFixed(0)} KB';
  }
}

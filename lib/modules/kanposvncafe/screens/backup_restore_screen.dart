import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import '../providers/cafe_providers.dart';
import '../services/cafe_backup_restore_service.dart';

class BackupRestoreScreen extends ConsumerStatefulWidget {
  const BackupRestoreScreen({super.key});

  @override
  ConsumerState<BackupRestoreScreen> createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends ConsumerState<BackupRestoreScreen> {
  CafeBackupRestoreService get _service =>
      ref.read(cafeBackupRestoreServiceProvider);

  String _fileName(String prefix, String ext) =>
      'kanposvn_${prefix}_${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.$ext';

  int _countRecords(Map<String, dynamic> data) {
    final collections = (data['collections'] as Map<String, dynamic>?) ?? {};
    return collections.values.fold<int>(
      0,
      (sum, items) => sum + ((items as List?)?.length ?? 0),
    );
  }

  Future<String?> _saveFile(String fileName, List<String> extensions) async {
    return FilePicker.saveFile(
      dialogTitle: 'Lưu file backup',
      fileName: fileName,
      type: FileType.custom,
      allowedExtensions: extensions,
    );
  }

  // ===================== LOCAL EXPORT =====================

  Future<void> _exportIsar({required bool asZip}) async {
    try {
      final data = _service.buildIsarBackup();
      final count = _countRecords(data);
      final ext = asZip ? 'zip' : 'json';
      final path = await _saveFile(_fileName('local_backup', ext), [ext]);
      if (path == null) return;

      if (asZip) {
        final bytes = _service.buildZip(data, 'local_backup');
        await File(path).writeAsBytes(bytes);
      } else {
        await File(path).writeAsString(
          const JsonEncoder.withIndent('  ').convert(data),
        );
      }

      await _service.addLog(
        'Backup cục bộ',
        true,
        'Đã export ${asZip ? 'ZIP' : 'JSON'} $count bản ghi',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã export dữ liệu cục bộ ($ext): $count bản ghi'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      await _service.addLog('Backup cục bộ', false, 'Lỗi: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi export dữ liệu cục bộ: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ===================== CLOUD EXPORT =====================

  Future<void> _exportNeon({required bool asZip}) async {
    try {
      final data = await _service.exportNeon();
      final count = _countRecords(data);
      final ext = asZip ? 'zip' : 'json';
      final path = await _saveFile(_fileName('cloud_backup', ext), [ext]);
      if (path == null) return;

      if (asZip) {
        final bytes = _service.buildZip(data, 'cloud_backup');
        await File(path).writeAsBytes(bytes);
      } else {
        await File(path).writeAsString(
          const JsonEncoder.withIndent('  ').convert(data),
        );
      }

      await _service.addLog(
        'Backup Cloud',
        true,
        'Đã export ${asZip ? 'ZIP' : 'JSON'} $count bản ghi',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã export dữ liệu Cloud ($ext): $count bản ghi'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      await _service.addLog('Backup Cloud', false, 'Lỗi: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi export dữ liệu Cloud: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ===================== RESTORE =====================

  Future<void> _restore({required bool isNeon}) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json', 'zip'],
      );
      if (result == null || result.files.isEmpty) return;
      final path = result.files.first.path;
      if (path == null) return;

      final bytes = await File(path).readAsBytes();
      final data = _service.parseBackupBytes(bytes);
      if (!mounted) return;

      final count = _countRecords(data);
      final confirm = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(isNeon ? 'Xác nhận Restore Cloud' : 'Xác nhận Restore cục bộ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('File: ${result.files.first.name}'),
              Text('Ngày export: ${data['exportDate'] ?? 'Không rõ'}'),
              Text('Số bản ghi: $count'),
              const SizedBox(height: 12),
              const Text(
                'Dữ liệu hiện tại sẽ bị GHI ĐÈ. Tiếp tục?',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Restore'),
            ),
          ],
        ),
      );
      if (confirm != true || !mounted) return;

      if (isNeon) {
        final n = await _service.importNeon(data);
        await _service.addLog('Restore Cloud', true, 'Đã restore $n bản ghi vào Cloud');
      } else {
        final n = await _service.restoreIsar(data);
        await _service.addLog('Restore cục bộ', true, 'Đã restore $n bản ghi vào dữ liệu cục bộ');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isNeon
                  ? 'Đã restore $count bản ghi vào Cloud!'
                  : 'Đã restore $count bản ghi vào dữ liệu cục bộ!',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      await _service.addLog(
        isNeon ? 'Restore Cloud' : 'Restore cục bộ',
        false,
        'Lỗi: $e',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Lỗi restore ${isNeon ? 'Cloud' : 'dữ liệu cục bộ'}: $e',
              maxLines: 3,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ===================== UI =====================

  @override
  Widget build(BuildContext context) {
    final service = ref.watch(cafeBackupRestoreServiceProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (service.isBusy || service.progress != null) ...[
              _buildProgressCard(service),
              const SizedBox(height: 16),
            ],
            _buildSection(
              title: 'Dữ liệu cục bộ (Offline)',
              icon: Icons.storage,
              color: const Color(0xFF0EA5E9),
              children: [
                _buildActionCard(
                  title: 'Export JSON',
                  subtitle: 'Sao lưu toàn bộ dữ liệu cục bộ ra file JSON',
                  icon: Icons.upload_file,
                  color: Colors.green,
                  onTap: () => _exportIsar(asZip: false),
                ),
                _buildActionCard(
                  title: 'Export ZIP',
                  subtitle: 'Sao lưu dữ liệu cục bộ ra file ZIP nén',
                  icon: Icons.archive,
                  color: Colors.brown,
                  onTap: () => _exportIsar(asZip: true),
                ),
                _buildActionCard(
                  title: 'Restore cục bộ',
                  subtitle: 'Khôi phục dữ liệu cục bộ từ file JSON/ZIP',
                  icon: Icons.download,
                  color: Colors.blue,
                  onTap: () => _restore(isNeon: false),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: 'Dữ liệu Cloud',
              icon: Icons.cloud,
              color: const Color(0xFFD97706),
              children: [
                _buildActionCard(
                  title: 'Export JSON',
                  subtitle: 'Tải toàn bộ dữ liệu Cloud ra file JSON',
                  icon: Icons.upload_file,
                  color: Colors.green,
                  onTap: () => _exportNeon(asZip: false),
                ),
                _buildActionCard(
                  title: 'Export ZIP',
                  subtitle: 'Tải dữ liệu Cloud ra file ZIP nén',
                  icon: Icons.archive,
                  color: Colors.brown,
                  onTap: () => _exportNeon(asZip: true),
                ),
                _buildActionCard(
                  title: 'Restore Cloud',
                  subtitle: 'Khôi phục dữ liệu Cloud từ file JSON/ZIP',
                  icon: Icons.download,
                  color: Colors.red,
                  onTap: () => _restore(isNeon: true),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildLogsSection(service),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(CafeBackupRestoreService service) {
    return Card(
      color: const Color(0xFFFFF7ED),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.sync, color: Color(0xFFD97706)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    service.status.isEmpty ? 'Đang xử lý...' : service.status,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: service.progress,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFD97706)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        trailing: Icon(Icons.chevron_right, color: color),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogsSection(CafeBackupRestoreService service) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.receipt_long, color: Colors.indigo, size: 24),
                const SizedBox(width: 10),
                const Text(
                  'Nhật ký Backup/Restore',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            const Divider(),
            if (service.logs.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Chưa có hoạt động backup/restore nào.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: service.logs.length,
                itemBuilder: (ctx, i) {
                  final log = service.logs[i];
                  return ListTile(
                    dense: true,
                    leading: Icon(
                      log.success ? Icons.check_circle : Icons.error,
                      color: log.success ? Colors.green : Colors.red,
                    ),
                    title: Text(
                      '${log.action} (${DateFormat('dd/MM/yyyy HH:mm:ss').format(log.timestamp)})',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(log.message, style: const TextStyle(fontSize: 12)),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

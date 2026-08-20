import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/error_log_providers.dart';
import '../models/error_log.dart';

class CrmErrorLogScreen extends ConsumerStatefulWidget {
  const CrmErrorLogScreen({super.key});

  @override
  ConsumerState<CrmErrorLogScreen> createState() => _CrmErrorLogScreenState();
}

class _CrmErrorLogScreenState extends ConsumerState<CrmErrorLogScreen> {
  String _selectedModule = '';
  String _selectedLevel = '';

  static const _modules = [
    '', 'kanposvncafe', 'kanposvngara', 'kanposvncrm', 'nhansu',
    'kanposvnkhachsan', 'kanposvnvlxd', 'kanposvnnhathuoc', 'kanposvnbida',
    'kanposvnpawn', 'kanposvnspa', 'kanposvnbarber',
  ];

  static const _levels = ['', 'info', 'warning', 'error', 'critical'];

  Color _levelColor(String level) {
    switch (level) {
      case 'critical': return Colors.red[700]!;
      case 'error': return Colors.red;
      case 'warning': return Colors.orange;
      case 'info': return Colors.blue;
      default: return Colors.grey;
    }
  }

  IconData _levelIcon(String level) {
    switch (level) {
      case 'critical': return Icons.dangerous;
      case 'error': return Icons.error;
      case 'warning': return Icons.warning;
      case 'info': return Icons.info;
      default: return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(errorLogsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Báo Lỗi'),
        backgroundColor: const Color(0xFFE11D48),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Đồng bộ lên server',
            onPressed: () async {
              await ref.read(errorLogsProvider.notifier).syncAll();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã đồng bộ lên server')),
                );
              }
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (value) {
              final parts = value.split('|');
              setState(() {
                _selectedModule = parts[0];
                _selectedLevel = parts.length > 1 ? parts[1] : '';
              });
              ref.read(errorLogsProvider.notifier).setFilter(
                module: _selectedModule.isEmpty ? null : _selectedModule,
                level: _selectedLevel.isEmpty ? null : _selectedLevel,
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: '|', child: Text('Tất cả')),
              ..._modules.where((m) => m.isNotEmpty).map(
                (m) => PopupMenuItem(value: '$m|', child: Text(m)),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Xóa đã sync',
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Xóa log đã đồng bộ?'),
                  content: const Text('Chỉ xóa các log đã sync lên server.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa')),
                  ],
                ),
              );
              if (confirmed == true) {
                await ref.read(errorLogsProvider.notifier).clearSynced();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Text('Mức: ', style: TextStyle(fontSize: 13)),
                Wrap(
                  spacing: 4,
                  children: _levels.map((level) {
                    final isSelected = _selectedLevel == level;
                    return FilterChip(
                      label: Text(level.isEmpty ? 'Tất cả' : level, style: const TextStyle(fontSize: 12)),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedLevel = selected ? level : '';
                        });
                        ref.read(errorLogsProvider.notifier).setFilter(
                          module: _selectedModule.isEmpty ? null : _selectedModule,
                          level: _selectedLevel.isEmpty ? null : _selectedLevel,
                        );
                      },
                      selectedColor: _levelColor(level).withValues(alpha: 0.2),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Log list
          Expanded(
            child: logs.isEmpty
                ? const Center(child: Text('Không có log lỗi nào.'))
                : ListView.builder(
                    itemCount: logs.length,
                    itemBuilder: (context, index) {
                      final log = logs[index];
                      return _buildLogTile(log);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogTile(CrmErrorLog log) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ExpansionTile(
        leading: Icon(_levelIcon(log.level), color: _levelColor(log.level)),
        title: Text(
          log.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Row(
          children: [
            Chip(
              label: Text(log.level, style: const TextStyle(fontSize: 10)),
              backgroundColor: _levelColor(log.level).withValues(alpha: 0.15),
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            if (log.errorCode.isNotEmpty) ...[
              const SizedBox(width: 6),
              Chip(
                label: Text(log.errorCode, style: const TextStyle(fontSize: 10)),
                backgroundColor: Colors.grey[200],
                padding: EdgeInsets.zero,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
            const SizedBox(width: 6),
            Text(log.module, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(width: 6),
            Text(_formatDate(log.createdAt), style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        trailing: Icon(
          log.isSynced ? Icons.cloud_done : Icons.cloud_upload,
          color: log.isSynced ? Colors.green : Colors.orange,
          size: 18,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('Mã lỗi', log.errorCode),
                _infoRow('Màn hình', log.screen),
                _infoRow('Action', log.action),
                _infoRow('Module', log.module),
                _infoRow('User', log.userName.isNotEmpty ? log.userName : log.userId),
                _infoRow('Số ĐT', log.phone),
                _infoRow('Thiết bị', log.deviceInfo),
                _infoRow('Thời gian', log.createdAt.toString()),
                _infoRow('Đã sync', log.isSynced ? 'Có' : 'Chưa'),
                if (log.stackTrace.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  const Text('Stack Trace:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SelectableText(
                      log.stackTrace,
                      style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.delete, size: 16),
                      label: const Text('Xóa'),
                      onPressed: () async {
                        await ref.read(errorLogsProvider.notifier).deleteLog(log.isarId);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project.dart';
import '../providers/congtrinh_providers.dart';
import '../utils/congtrinh_format.dart';
import 'congtrinh_estimate_screen.dart';
import 'congtrinh_project_edit_screen.dart';

class CongTrinhProjectScreen extends ConsumerStatefulWidget {
  final ValueChanged<String>? onNavigate;
  const CongTrinhProjectScreen({super.key, this.onNavigate});

  @override
  ConsumerState<CongTrinhProjectScreen> createState() =>
      _CongTrinhProjectScreenState();
}

class _CongTrinhProjectScreenState
    extends ConsumerState<CongTrinhProjectScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(congTrinhProjectsProvider);
    final filtered = projects
        .where((p) => _query.isEmpty ||
            p.projectName.toLowerCase().contains(_query.toLowerCase()) ||
            p.projectCode.toLowerCase().contains(_query.toLowerCase()) ||
            p.customerName.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Danh Sách Công Trình')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Tìm tên / mã / chủ nhà...',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Chưa có công trình nào.'))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 80),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final p = filtered[index];
                      return _ProjectCard(
                        project: p,
                        onOpen: () => _openDetail(context, p),
                        onDelete: () => _confirmDelete(context, p),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openEdit(context),
        icon: const Icon(Icons.add),
        label: const Text('Công trình mới'),
      ),
    );
  }

  Future<void> _openDetail(BuildContext context, CongTrinhProject p) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CongTrinhEstimateScreen(project: p),
    ));
    ref.invalidate(congTrinhProjectsProvider);
  }

  Future<void> _openEdit(BuildContext context, [CongTrinhProject? p]) async {
    final saved = await Navigator.of(context).push<bool>(MaterialPageRoute(
      builder: (_) => CongTrinhProjectEditScreen(project: p),
    ));
    if (saved == true) {
      ref.invalidate(congTrinhProjectsProvider);
    }
  }

  Future<void> _confirmDelete(BuildContext context, CongTrinhProject p) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa công trình?'),
        content: Text(
            'Xóa mềm "${p.projectName}"? Có thể khôi phục sau khi đồng bộ.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Xóa')),
        ],
      ),
    );
    if (ok == true) {
      await ref.read(congTrinhProjectsProvider.notifier).deleteProject(p);
    }
  }
}

class _ProjectCard extends StatelessWidget {
  final CongTrinhProject project;
  final VoidCallback onOpen;
  final VoidCallback onDelete;

  const _ProjectCard({
    required this.project,
    required this.onOpen,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onOpen,
        leading: const CircleAvatar(
          child: Icon(Icons.home_work),
        ),
        title: Text(
          '${project.projectCode} · ${project.projectName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.customerName.isNotEmpty
                ? '${project.customerName} — ${project.address}'
                : project.address),
            const SizedBox(height: 2),
            Text(
              '${project.constructionArea.toStringAsFixed(0)} m² · ${project.numberOfFloors} tầng · '
              '${gradeLabel(project.buildingGrade)} · ${finishLabel(project.finishLevel)}',
            ),
            _LatestEstimateLine(projectId: project.projectId),
          ],
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Xóa',
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

/// Hiển thị phiên bản dự toán mới nhất của công trình.
class _LatestEstimateLine extends ConsumerStatefulWidget {
  final String projectId;
  const _LatestEstimateLine({required this.projectId});

  @override
  ConsumerState<_LatestEstimateLine> createState() =>
      _LatestEstimateLineState();
}

class _LatestEstimateLineState extends ConsumerState<_LatestEstimateLine> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<String> _load() async {
    final service = ref.read(congTrinhIsarServiceProvider);
    final estimates = await service.getEstimates(widget.projectId);
    if (estimates.isEmpty) return 'Chưa lập dự toán';
    final latest = estimates.first;
    return '${latest.estimateCode}: ${ctMoneyCompact(latest.grandTotal)}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _future,
      builder: (context, snap) => Text(
        snap.data ?? '...',
        style: const TextStyle(fontSize: 12, color: Color(0xFF4F46E5)),
      ),
    );
  }
}
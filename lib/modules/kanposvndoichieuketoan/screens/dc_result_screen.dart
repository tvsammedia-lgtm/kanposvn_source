import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../kanposvnhrpayroll/core/app_theme.dart';
import '../models/compare_report.dart';
import '../models/compare_status.dart';
import '../providers/doichieu_providers.dart';
import '../services/export_service.dart';
import '../widgets/result_summary.dart';
import '../widgets/result_table.dart';
import '../widgets/status_badge.dart';
import 'dc_detail_screen.dart';

class DcResultScreen extends ConsumerWidget {
  const DcResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doichieuFlowProvider);
    final report = state.report;
    if (report == null) {
      return const _EmptyResult();
    }

    final visible = ref.watch(doichieuVisibleResultsProvider);
    final filter = ref.watch(doichieuResultFilterProvider);
    final showDup = ref.watch(doichieuShowDuplicateProvider);
    final search = ref.watch(doichieuSearchProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kết quả đối chiếu',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '${report.results.length} dòng tổng · thực hiện ${_short(report.createdAt)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                _ExportButton(
                  icon: Icons.bookmark_add_outlined,
                  label: 'Lưu kết quả',
                  onPressed: () => _saveResult(context, ref, report),
                ),
                const SizedBox(width: 8),
                _ExportButton(
                  icon: Icons.grid_on,
                  label: 'Excel',
                  onPressed: () => _export(context, report, 'excel'),
                ),
                const SizedBox(width: 8),
                _ExportButton(
                  icon: Icons.picture_as_pdf,
                  label: 'PDF',
                  onPressed: () => _export(context, report, 'pdf'),
                ),
                const SizedBox(width: 8),
                _ExportButton(
                  icon: Icons.file_download_outlined,
                  label: 'CSV',
                  onPressed: () => _export(context, report, 'csv'),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.borderColor),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width > 1400 ? 1700 : 1100,
                        child: ResultSummary(report: report),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: const Text('Tất cả', style: TextStyle(fontSize: 12)),
                        selected: filter == null && !showDup,
                        onSelected: (_) {
                          ref.read(doichieuResultFilterProvider.notifier).state = null;
                          ref.read(doichieuShowDuplicateProvider.notifier).state = false;
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final s in CompareStatus.values)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    avatar: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: statusColor(s),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
label: Text(s.label,
                                        style: const TextStyle(fontSize: 12)),
                                    selected: filter == s,
                                    onSelected: (_) {
                                      ref
                                          .read(doichieuResultFilterProvider.notifier)
                                          .state = s;
                                      ref
                                          .read(doichieuShowDuplicateProvider.notifier)
                                          .state = false;
                                    },
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ChoiceChip(
                                  avatar: const Icon(Icons.filter_none,
                                      size: 14, color: Color(0xFFDB2777)),
                                  label: const Text('Chỉ lặp',
                                      style: TextStyle(fontSize: 12)),
                                  selected: showDup,
                                  onSelected: (on) {
                                    ref
                                        .read(doichieuShowDuplicateProvider.notifier)
                                        .state = on;
                                  },
),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 220,
                        child: TextField(
                          controller: TextEditingController(text: search),
                          decoration: const InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.search, size: 20),
                            hintText: 'Tìm theo Key...',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          onChanged: (v) =>
                              ref.read(doichieuSearchProvider.notifier).state = v,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: AppTheme.borderColor),
                Expanded(
                  child: ResultTable(
                    report: report,
                    results: visible,
                    onTapRow: (result) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DcDetailScreen(report: report, result: result),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveResult(
      BuildContext context, WidgetRef ref, CompareReport report) async {
    final t = report.createdAt;
    final defaultName =
        'Đối chiếu ${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')} '
        '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
    final controller = TextEditingController(text: defaultName);
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Lưu kết quả'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Tên kết quả',
            hintText: 'VD: Đối chiếu sổ cái T8',
          ),
          onSubmitted: (v) => Navigator.pop(ctx, v.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name == null || name.isEmpty) return;
    final messenger = ScaffoldMessenger.of(context);
    final saved = await ref
        .read(doichieuFlowProvider.notifier)
        .saveCurrentReport(name: name);
    if (saved == null) {
      messenger.showSnackBar(const SnackBar(content: Text('Không lưu được kết quả')));
      return;
    }
    ref.invalidate(doichieuHistoryProvider);
    messenger.showSnackBar(
      SnackBar(
        content: const Text('Đã lưu vào tab Lưu trữ'),
        backgroundColor: AppTheme.success,
      ),
    );
  }

  Future<void> _export(BuildContext context, CompareReport report, String kind) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final dir = await ExportService.pickDirectory();
      if (dir == null) return;
      messenger.showSnackBar(const SnackBar(content: Text('Đang xuất...')));
      String message;
      if (kind == 'excel') {
        final path = await ExportService.exportExcel(report, dir);
        message = 'Đã lưu: $path';
      } else if (kind == 'pdf') {
        final path = await ExportService.exportPdf(report, dir);
        message = 'Đã lưu: $path';
      } else {
        final paths = await ExportService.exportCsv(report, dir);
        message = 'Đã lưu ${paths.length} file CSV';
      }
      messenger.showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Lỗi xuất: $e')));
    }
  }

  String _short(DateTime dt) {
    final now = dt;
    return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }
}

class _EmptyResult extends StatelessWidget {
  const _EmptyResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.receipt_long_outlined, size: 64, color: AppTheme.textMuted),
            SizedBox(height: 16),
            Text('Chưa có kết quả',
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 16)),
            SizedBox(height: 4),
            Text('Hãy chạy đối chiếu ở tab «Đối chiếu»',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _ExportButton({required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontSize: 13)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}
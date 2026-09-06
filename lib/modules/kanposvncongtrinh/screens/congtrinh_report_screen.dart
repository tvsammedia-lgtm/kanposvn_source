import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/congtrinh_providers.dart';
import '../utils/congtrinh_format.dart';

/// Báo cáo tổng hợp theo công trình + phân tích nhóm chi phí
/// của phiên bản dự toán mới nhất.
class CongTrinhReportScreen extends ConsumerStatefulWidget {
  const CongTrinhReportScreen({super.key});

  @override
  ConsumerState<CongTrinhReportScreen> createState() =>
      _CongTrinhReportScreenState();
}

class _CongTrinhReportScreenState extends ConsumerState<CongTrinhReportScreen> {
  String? _focusProjectId;

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(congTrinhProjectsProvider);
    final projectSummaries = ref.watch(congTrinhReportSummariesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Báo Cáo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Tổng hợp theo công trình',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          projectSummaries.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, s) => Center(child: Text('Lỗi: $e')),
            data: (rows) {
              if (rows.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Chưa có dự toán nào để tổng hợp.'),
                  ),
                );
              }
              var grand = 0.0;
              var area = 0.0;
              var material = 0.0;
              var labor = 0.0;
              for (final r in rows) {
                grand += r.grandTotal;
                area += r.area;
                material += r.material;
                labor += r.labor;
              }
              return Column(
                children: [
                  Card(
                    color: const Color(0xFFEEF2FF),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _agg('Tổng dự toán (phiên bản mới nhất)',
                              ctMoney(grand)),
                          _agg('Vật tư / Nhân công',
                              '${ctMoney(material)} / ${ctMoney(labor)}'),
                          _agg('Chi phí trung bình / m²',
                              ctMoney(area > 0 ? grand / area : 0)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final r in rows)
                    _ProjectReportCard(
                      projectName: r.projectName,
                      projectCode: r.projectCode,
                      estimateCode: r.estimateCode,
                      area: r.area,
                      material: r.material,
                      labor: r.labor,
                      vat: r.vat,
                      contingency: r.contingency,
                      grandTotal: r.grandTotal,
                      focused: r.projectId == _focusProjectId,
                      onTap: () => setState(() {
                        _focusProjectId =
                            r.projectId == _focusProjectId ? null : r.projectId;
                      }),
                    ),
                ],
              );
            },
          ),
          if (_focusProjectId != null) ...[
            const SizedBox(height: 12),
            _FocusBreakdown(projectId: _focusProjectId!),
          ],
          const SizedBox(height: 20),
          _detailNote(projects.length),
        ],
      ),
    );
  }

  Widget _agg(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          Text(value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _detailNote(int projectCount) {
    return Text(
      projectCount == 0
          ? 'Chưa có công trình. Hãy tạo công trình và lập dự toán.'
          : 'Nhấn vào từng công trình để xem phân tích nhóm chi phí của '
              'phiên bản mới nhất.',
      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
    );
  }
}

/// Phân tích nhóm chi phí của phiên bản mới nhất theo công trình đang chọn.
class _FocusBreakdown extends ConsumerWidget {
  final String projectId;
  const _FocusBreakdown({required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estimates = ref.watch(congTrinhEstimatesProvider(projectId));
    return estimates.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Text('Lỗi: $e'),
      data: (list) {
        if (list.isEmpty) return const SizedBox.shrink();
        final latest = list.first;
        return ref
            .watch(congTrinhEstimateItemsProvider(latest.estimateId))
            .when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text('Lỗi: $e'),
              data: (items) {
                final groups = <String, double>{};
                for (final it in items) {
                  groups[it.category] =
                      (groups[it.category] ?? 0) + it.amount;
                }
                final keys = groups.keys.toList()..sort();
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Phân tích nhóm chi phí',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(latest.estimateCode,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        for (final k in keys)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(k,
                                    style:
                                        const TextStyle(fontSize: 13)),
                                Text(ctMoney(groups[k]!),
                                    style:
                                        const TextStyle(fontSize: 13)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
      },
    );
  }
}

class _ProjectReportCard extends StatelessWidget {
  final String projectName;
  final String projectCode;
  final String estimateCode;
  final double area;
  final double material;
  final double labor;
  final double vat;
  final double contingency;
  final double grandTotal;
  final bool focused;
  final VoidCallback onTap;

  const _ProjectReportCard({
    required this.projectName,
    required this.projectCode,
    required this.estimateCode,
    required this.area,
    required this.material,
    required this.labor,
    required this.vat,
    required this.contingency,
    required this.grandTotal,
    required this.focused,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: focused ? const Color(0xFFFFF8E1) : null,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('$projectCode · $projectName',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  Text(estimateCode,
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
              const Divider(),
              _r('Diện tích quy đổi', '${area.toStringAsFixed(1)} m²'),
              _r('Vật tư', ctMoney(material)),
              _r('Nhân công', ctMoney(labor)),
              _r('VAT + Dự phòng', ctMoney(vat + contingency)),
              const Divider(),
              _r('TỔNG', ctMoney(grandTotal), bold: true),
              _r('CHI PHÍ / M²',
                  ctMoney(area > 0 ? grandTotal / area : 0),
                  bold: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _r(String label, String value, {bool bold = false}) {
    final style = TextStyle(
        fontSize: 13,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }
}

class _ReportRow {
  final String projectId;
  final String projectName;
  final String projectCode;
  final String estimateCode;
  final double area;
  final double material;
  final double labor;
  final double vat;
  final double contingency;
  final double grandTotal;
  const _ReportRow({
    required this.projectId,
    required this.projectName,
    required this.projectCode,
    required this.estimateCode,
    required this.area,
    required this.material,
    required this.labor,
    required this.vat,
    required this.contingency,
    required this.grandTotal,
  });
}

final congTrinhReportSummariesProvider =
    FutureProvider<List<_ReportRow>>((ref) async {
  final service = ref.watch(congTrinhIsarServiceProvider);
  final projects = await service.getProjects();
  final rows = <_ReportRow>[];
  for (final p in projects) {
    final estimates = await service.getEstimates(p.projectId);
    if (estimates.isEmpty) continue;
    final e = estimates.first;
    rows.add(_ReportRow(
      projectId: p.projectId,
      projectName: p.projectName,
      projectCode: p.projectCode,
      estimateCode: e.estimateCode,
      area: e.area,
      material: e.totalMaterial,
      labor: e.totalLabor,
      vat: e.vat,
      contingency: e.contingency,
      grandTotal: e.grandTotal,
    ));
  }
  return rows;
});
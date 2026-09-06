import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/project.dart';
import '../providers/congtrinh_providers.dart';
import '../utils/congtrinh_format.dart';

/// Màn hình chi tiết dự toán của 1 công trình:
/// tạo/so sánh phiên bản, sửa trực tiếp item (AUTO→MANUAL) và
/// "Reset về định mức" theo đặc tả §28-31.
class CongTrinhEstimateScreen extends ConsumerStatefulWidget {
  final CongTrinhProject project;
  const CongTrinhEstimateScreen({super.key, required this.project});

  @override
  ConsumerState<CongTrinhEstimateScreen> createState() =>
      _CongTrinhEstimateScreenState();
}

class _CongTrinhEstimateScreenState
    extends ConsumerState<CongTrinhEstimateScreen> {
  String? _selectedEstimateId;
  bool _generating = false;

  Future<void> _generate() async {
    if (_generating) return;
    setState(() => _generating = true);
    try {
      await ref.read(congTrinhEngineProvider).generateEstimate(widget.project);
      ref.invalidate(
          congTrinhEstimatesProvider(widget.project.projectId));
      setState(() => _selectedEstimateId = null);
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  Future<void> _editItem(
    CongTrinhEstimate estimate,
    List<CongTrinhEstimateItem> items,
    CongTrinhEstimateItem item,
  ) async {
    final result = await showDialog<_ItemEditResult>(
      context: context,
      builder: (_) => _ItemEditDialog(item: item),
    );
    if (result == null) return;

    final service = ref.read(congTrinhIsarServiceProvider);
    final engine = ref.read(congTrinhEngineProvider);
    if (result.resetToNorm) {
      await engine.resetItemToNorm(
          item: item, project: widget.project, area: estimate.area);
    } else {
      item
        ..quantity = result.quantity
        ..unitPrice = result.unitPrice
        ..wastePercent = result.wastePercent
        ..calculationMode = 'MANUAL';
    }
    engine.recompute(estimate, items);
    await service.saveEstimateItem(item);
    await service.recomputeEstimate(estimate, items);

    ref.invalidate(congTrinhEstimateItemsProvider(estimate.estimateId));
    ref.invalidate(congTrinhEstimatesProvider(widget.project.projectId));
  }

  @override
  Widget build(BuildContext context) {
    final estimatesAsync = ref
        .watch(congTrinhEstimatesProvider(widget.project.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Dự Toán · ${widget.project.projectName}'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generate,
        icon: _generating
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.add),
        label: const Text('Phiên Bản Mới'),
      ),
      body: estimatesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e')),
        data: (estimates) {
          if (estimates.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.request_quote, size: 56, color: Colors.grey),
                    SizedBox(height: 12),
                    Text('Chưa có dự toán nào. Nhấn "Phiên Bản Mới" để tính.'),
                  ],
                ),
              ),
            );
          }
          final selected = _selectedEstimateId == null
              ? estimates.first
              : estimates
                  .firstWhere((e) => e.estimateId == _selectedEstimateId,
                      orElse: () => estimates.first);
          return _buildContent(estimates, selected);
        },
      ),
    );
  }

  Widget _buildContent(List<CongTrinhEstimate> estimates,
      CongTrinhEstimate selected) {
    final itemsAsync = ref
        .watch(congTrinhEstimateItemsProvider(selected.estimateId));

    return Column(
      children: [
        _headerCard(),
        _versionChips(estimates, selected),
        Expanded(
          child: itemsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text('Lỗi: $e')),
            data: (items) => _body(selected, items),
          ),
        ),
      ],
    );
  }

  Widget _headerCard() {
    final p = widget.project;
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${p.projectCode} · ${p.projectName}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 4),
            Text(
              '${p.customerName.isNotEmpty ? '${p.customerName} — ' : ''}${p.address}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                _headerChip(Icons.square_foot, '${p.constructionArea.toStringAsFixed(0)} m²'),
                _headerChip(Icons.layers, '${p.numberOfFloors} tầng'),
                _headerChip(Icons.business, gradeLabel(p.buildingGrade)),
                _headerChip(Icons.build, finishLabel(p.finishLevel)),
                _headerChip(Icons.roofing, 'Mái ${p.roofArea.toStringAsFixed(0)} m²'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerChip(IconData icon, String label) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 14, color: const Color(0xFF4F46E5)),
      const SizedBox(width: 4),
      Text(label, style: const TextStyle(fontSize: 12)),
    ]);
  }

  Widget _versionChips(List<CongTrinhEstimate> estimates,
      CongTrinhEstimate selected) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final e in estimates)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(
                    '${e.estimateCode}\n${ctMoneyCompact(e.grandTotal)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11),
                  ),
                  selected: e.estimateId == selected.estimateId,
                  onSelected: (_) =>
                      setState(() => _selectedEstimateId = e.estimateId),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _body(CongTrinhEstimate estimate, List<CongTrinhEstimateItem> items) {
    final perM2 = estimate.area > 0 ? estimate.grandTotal / estimate.area : 0.0;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
      children: [
        _totalsCard(estimate, perM2),
        const SizedBox(height: 12),
        if (items.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Dự toán chưa có khoản mục nào.'),
            ),
          )
        else ...[
          _groupedItems(estimate, items),
          const SizedBox(height: 12),
          _versionCompare(),
        ],
      ],
    );
  }

  Widget _totalsCard(CongTrinhEstimate e, double perM2) {
    return Card(
      color: const Color(0xFFEEF2FF),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${e.estimateCode} · Diện tích quy đổi ${e.area.toStringAsFixed(1)} m²',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _row('Vật tư', ctMoney(e.totalMaterial)),
            _row('Nhân công', ctMoney(e.totalLabor)),
            _row('Chi phí khác', ctMoney(e.totalOther)),
            const Divider(),
            _row('Tạm tính', ctMoney(e.subtotal), bold: true),
            _row('VAT (8%)', ctMoney(e.vat)),
            _row('Dự phòng (5%)', ctMoney(e.contingency)),
            const Divider(),
            _row('TỔNG DỰ TOÁN', ctMoney(e.grandTotal), bold: true,
                color: const Color(0xFF4F46E5)),
            _row('CHI PHÍ / M²', ctMoney(perM2), bold: true,
                color: Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value,
      {bool bold = false, Color? color}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      color: color,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  Widget _groupedItems(
      CongTrinhEstimate estimate, List<CongTrinhEstimateItem> items) {
    final groups = <String, List<CongTrinhEstimateItem>>{};
    for (final it in items) {
      groups.putIfAbsent(it.category, () => []).add(it);
    }
    final keys = groups.keys.toList()..sort();

    return Column(
      children: [
        for (final key in keys) ...[
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(key,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F46E5))),
            ),
          ),
          Card(
            child: Column(
              children: [
                for (final it in groups[key]!)
                  _itemRow(estimate, items, it),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _itemRow(CongTrinhEstimate estimate,
      List<CongTrinhEstimateItem> items, CongTrinhEstimateItem it) {
    final manual = it.calculationMode == 'MANUAL';
    final title = manual ? '${it.description} (T⚙)' : it.description;
    return ListTile(
      dense: true,
      leading: Icon(
        manual ? Icons.edit : Icons.auto_awesome,
        size: 18,
        color: manual ? Colors.orange : Colors.blueGrey,
      ),
      title: Text(title, style: const TextStyle(fontSize: 13)),
      subtitle: Text(
        '${ctNumber(it.quantity)} ${it.unit} × ${ctMoney(it.unitPrice)}'
        '${it.wastePercent > 0 ? ' (+${it.wastePercent.toStringAsFixed(0)}%)' : ''}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(ctMoney(it.amount),
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold)),
      onTap: () => _editItem(estimate, items, it),
    );
  }

  Widget _versionCompare() {
    final estimates = ref.watch(
        congTrinhEstimatesProvider(widget.project.projectId));
    return estimates.when(
      loading: () => const SizedBox.shrink(),
      error: (e, s) => const SizedBox.shrink(),
      data: (list) {
        if (list.length < 2) return const SizedBox.shrink();
        final base = list.last;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('So sánh phiên bản',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                for (final e in list)
                  Row(
                    children: [
                      Expanded(
                          child: Text(e.estimateCode,
                              style: const TextStyle(fontSize: 12))),
                      Text(ctMoney(e.grandTotal),
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      if (base.grandTotal > 0)
                        Text(
                          '${((e.grandTotal - base.grandTotal) / base.grandTotal * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 12,
                            color: e.grandTotal >= base.grandTotal
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ItemEditResult {
  final double quantity;
  final double unitPrice;
  final double wastePercent;
  final bool resetToNorm;
  const _ItemEditResult(this.quantity, this.unitPrice, this.wastePercent,
      this.resetToNorm);
}

class _ItemEditDialog extends StatefulWidget {
  final CongTrinhEstimateItem item;
  const _ItemEditDialog({required this.item});

  @override
  State<_ItemEditDialog> createState() => _ItemEditDialogState();
}

class _ItemEditDialogState extends State<_ItemEditDialog> {
  late final TextEditingController _qty;
  late final TextEditingController _price;
  late final TextEditingController _waste;

  @override
  void initState() {
    super.initState();
    _qty = TextEditingController(text: widget.item.quantity.toString());
    _price = TextEditingController(
        text: widget.item.unitPrice.toStringAsFixed(0));
    _waste = TextEditingController(
        text: widget.item.wastePercent.toString());
  }

  @override
  void dispose() {
    _qty.dispose();
    _price.dispose();
    _waste.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sửa: ${widget.item.description}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _qty,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Khối lượng', isDense: true),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Đơn giá (đ)', isDense: true),
          ),
          if (widget.item.materialId != null) ...[
            const SizedBox(height: 8),
            TextFormField(
              controller: _waste,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Hao hụt (%)', isDense: true),
            ),
          ],
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sau khi sửa, khoản mục chuyển sang chế độ thủ công (T⚙).',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
      actions: [
        if (widget.item.calculationMode == 'MANUAL')
          TextButton.icon(
            onPressed: () => Navigator.pop(context,
                _ItemEditResult(0, 0, 0, /*resetToNorm*/ true)),
            icon: const Icon(Icons.restore),
            label: const Text('Reset về định mức'),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Hủy'),
        ),
        FilledButton(
          onPressed: () {
            final qty = double.tryParse(_qty.text) ?? 0;
            final price = double.tryParse(_price.text) ?? 0;
            final waste = double.tryParse(_waste.text) ?? 0;
            Navigator.pop(
                context,
                _ItemEditResult(qty, price, waste, /*resetToNorm*/ false));
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
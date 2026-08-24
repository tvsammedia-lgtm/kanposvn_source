import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/floor_fee.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Quản lý Phí sàn theo PRD kanbatdongsan.md mục 14:
/// phí giao dịch, quảng cáo, dịch vụ, hồ sơ (thu) + chi phí khác (chi).
class BatDongSanFinanceScreen extends ConsumerStatefulWidget {
  const BatDongSanFinanceScreen({super.key});

  @override
  ConsumerState<BatDongSanFinanceScreen> createState() =>
      _BatDongSanFinanceScreenState();
}

class _BatDongSanFinanceScreenState extends ConsumerState<BatDongSanFinanceScreen> {
  FloorFeeType? _filterType;

  Future<void> _openForm([FloorFee? fee]) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) => _FeeDialog(existing: fee),
    );
    if (saved == true && mounted) {
      ref.invalidate(floorFeesProvider);
      ref.invalidate(dashboardMetricsProvider);
    }
  }

  Future<void> _delete(FloorFee f) async {
    await ref.read(floorFeeRepositoryProvider).deleteFee(f.id);
    ref.invalidate(floorFeesProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã xóa khoản phí')));
  }

  @override
  Widget build(BuildContext context) {
    final feesAsync = ref.watch(floorFeesProvider);
    final df = DateFormat('dd/MM/yyyy');

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(),
        icon: const Icon(Icons.add),
        label: const Text('Thêm phí'),
      ),
      body: Column(
        children: [
          // Lọc loại phí.
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ChoiceChip(
                    label: const Text('Tất cả'),
                    selected: _filterType == null,
                    onSelected: (_) => setState(() => _filterType = null),
                  ),
                ),
                for (final t in FloorFeeType.values)
                  Container(
                    margin: const EdgeInsets.only(left: 6, top: 8, bottom: 8),
                    child: ChoiceChip(
                      label: Text(t.label),
                      selected: _filterType == t,
                      onSelected: (_) => setState(() => _filterType = t),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: feesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (all) {
                final list = all
                    .where((f) =>
                        _filterType == null || f.feeType == _filterType)
                    .toList();

                // Tổng thu / chi.
                var income = 0.0;
                var expense = 0.0;
                for (final f in all) {
                  if (f.feeType.isExpense) {
                    expense += f.amount ?? 0;
                  } else {
                    income += f.amount ?? 0;
                  }
                }

                return Column(children: [
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _summary('Tổng thu', BdsBusinessLogic.formatMoney(income),
                              Colors.green),
                          _summary('Chi phí khác',
                              BdsBusinessLogic.formatMoney(expense), Colors.red),
                          _summary('Chênh lệch',
                              BdsBusinessLogic.formatMoney(income - expense),
                              const Color(0xFF0284C7)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: list.isEmpty
                        ? const Center(child: Text('Chưa có khoản phí nào'))
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 88),
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              final f = list[i];
                              final isExpense = f.feeType.isExpense;
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: ListTile(
                                  onTap: () => _openForm(f),
                                  leading: Icon(
                                    isExpense
                                        ? Icons.arrow_outward
                                        : Icons.call_received,
                                    color: isExpense ? Colors.red : Colors.green,
                                  ),
                                  title: Text(
                                      '${f.feeCode ?? '-'} · ${f.feeType.label} · '
                                      '${BdsBusinessLogic.formatMoney(f.amount)}đ'),
                                  subtitle: Text(
                                    '${f.feeDate != null ? df.format(f.feeDate!) : "-"}'
                                    '${f.transactionCode != null ? " · GD ${f.transactionCode}" : ""}'
                                    '${f.notes != null ? "\n${f.notes}" : ""}',
                                  ),
                                  isThreeLine: f.notes != null,
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete_outline,
                                        color: Colors.redAccent),
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text('Xác nhận xóa'),
                                        content: Text(
                                            'Xóa ${f.feeCode ?? "khoản phí"} ?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx),
                                              child: const Text('Hủy')),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(ctx);
                                              _delete(f);
                                            },
                                            child: const Text('Xóa',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _summary(String label, String value, Color color) {
    return Column(children: [
      Text(value,
          style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
    ]);
  }
}

class _FeeDialog extends ConsumerStatefulWidget {
  final FloorFee? existing;
  const _FeeDialog({this.existing});

  @override
  ConsumerState<_FeeDialog> createState() => _FeeDialogState();
}

class _FeeDialogState extends ConsumerState<_FeeDialog> {
  late final TextEditingController _amount;
  late final TextEditingController _notes;
  late final TextEditingController _txCode;
  late FloorFeeType _type;
  DateTime _date = DateTime.now();

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    _type = widget.existing?.feeType ?? FloorFeeType.transaction;
    _date = widget.existing?.feeDate ?? DateTime.now();
    _amount =
        TextEditingController(text: widget.existing?.amount?.toString() ?? '');
    _notes = TextEditingController(text: widget.existing?.notes ?? '');
    _txCode =
        TextEditingController(text: widget.existing?.transactionCode ?? '');
  }

  @override
  void dispose() {
    _amount.dispose();
    _notes.dispose();
    _txCode.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final amount = double.tryParse(_amount.text);
    if (amount == null || amount <= 0) return;

    final fee = widget.existing ?? FloorFee();
    if (!_isEdit) {
      fee.remoteId ??= const Uuid().v4();
      final all = await ref.read(floorFeesProvider.future);
      fee.feeCode = BdsBusinessLogic.nextFeeCode(all);
    }
    fee.feeType = _type;
    fee.amount = amount;
    fee.feeDate = _date;
    fee.notes = _notes.text.trim().isEmpty ? null : _notes.text.trim();
    fee.transactionCode =
        _txCode.text.trim().isEmpty ? null : _txCode.text.trim();

    await ref.read(floorFeeRepositoryProvider).saveFee(fee);
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEdit ? 'Sửa khoản phí' : 'Thêm khoản phí sàn'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<FloorFeeType>(
              value: _type,
              decoration: const InputDecoration(labelText: 'Loại phí'),
              items: FloorFeeType.values
                  .map((t) => DropdownMenuItem(
                      value: t,
                      child: Row(children: [
                        Icon(
                          t.isExpense
                              ? Icons.remove_circle_outline
                              : Icons.add_circle_outline,
                          size: 16,
                          color: t.isExpense ? Colors.red : Colors.green,
                        ),
                        const SizedBox(width: 6),
                        Text(t.label),
                      ])))
                  .toList(),
              onChanged: (v) => setState(() => _type = v ?? _type),
            ),
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Số tiền (tỷ VNĐ)'),
            ),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) setState(() => _date = picked);
                  },
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(labelText: 'Ngày'),
                    child: Text(DateFormat('dd/MM/yyyy').format(_date)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _txCode,
                  decoration: const InputDecoration(
                      labelText: 'Mã GD (tuỳ chọn)'),
                ),
              ),
            ]),
            TextField(
              controller: _notes,
              decoration: const InputDecoration(labelText: 'Ghi chú'),
            ),
          ].map((w) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: w,
              )).toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy')),
        FilledButton(onPressed: _save, child: const Text('Lưu')),
      ],
    );
  }
}

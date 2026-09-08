import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/nongsan_accounting.dart';
import '../../providers/nongsan_providers.dart';

/// Màn hình ghi bút toán thủ công cho KanPosVN Kinh doanh Nông sản
/// (port từ kanposvnhrpayroll JournalEntryInputScreen, thích nghi dữ liệu
/// nông sản). Yêu cầu bắt buộc: bút toán phải cân bằng (§18.1).
class NongSanJournalEntryScreen extends ConsumerStatefulWidget {
  const NongSanJournalEntryScreen({super.key});

  @override
  ConsumerState<NongSanJournalEntryScreen> createState() =>
      _NongSanJournalEntryScreenState();
}

class _JournalLineDraft {
  String accountCode;
  bool isDebit;
  TextEditingController amount;

  _JournalLineDraft({this.accountCode = '111', this.isDebit = true})
      : amount = TextEditingController();

  void dispose() => amount.dispose();
}

class _NongSanJournalEntryScreenState
    extends ConsumerState<NongSanJournalEntryScreen> {
  final List<_JournalLineDraft> _lines = [
    _JournalLineDraft(accountCode: '111', isDebit: true),
    _JournalLineDraft(accountCode: '911', isDebit: false),
  ];
  final TextEditingController _narration =
      TextEditingController(text: 'Bút toán điều chỉnh');
  DateTime _date = DateTime.now();
  bool _saving = false;

  @override
  void dispose() {
    for (final l in _lines) {
      l.dispose();
    }
    _narration.dispose();
    super.dispose();
  }

  double get _totalDebit =>
      _lines.fold(0.0, (s, l) => s + (l.isDebit ? _amount(l) : 0));
  double get _totalCredit =>
      _lines.fold(0.0, (s, l) => s + (!l.isDebit ? _amount(l) : 0));
  bool get _isBalanced => (_totalDebit - _totalCredit).abs() < 0.001;

  double _amount(_JournalLineDraft l) =>
      double.tryParse(l.amount.text.replaceAll(',', '').trim()) ?? 0;

  void _addLine() {
    setState(() {
      _lines.add(_JournalLineDraft(
        accountCode: '156',
        isDebit: true,
      ));
    });
  }

  void _removeLine(int index) {
    if (_lines.length <= 1) return;
    setState(() {
      _lines.removeAt(index).dispose();
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final lines = <NongSanJournalLine>[
        for (final l in _lines)
          if (_amount(l) > 0)
            NongSanJournalLine(
              accountCode: l.accountCode,
              accountName: NongSanJournalEntry.accountNameOf(l.accountCode),
              debit: l.isDebit ? _amount(l) : 0,
              credit: l.isDebit ? 0 : _amount(l),
            ),
      ];
      await ref
          .read(nongsanBusinessLogicProvider)
          .postJournalEntry(
            narration: _narration.text.trim().isEmpty
                ? 'Bút toán thủ công'
                : _narration.text.trim(),
            date: _date,
            lines: lines,
          );
      ref.invalidate(nongsanJournalsProvider);
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBalanced = _isBalanced;
    final hasAmount = _lines.any((l) => _amount(l) > 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Nhập bút toán',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _narration,
            decoration: const InputDecoration(
              labelText: 'Diễn giải',
              hintText: 'VD: Mua 5.000 kg gạo ST25',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: _pickDate,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Ngày hạch toán',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              child: Text(DateFormat('dd/MM/yyyy').format(_date)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Chi tiết bút toán',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              const Spacer(),
              TextButton.icon(
                onPressed: _addLine,
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Thêm dòng'),
              ),
            ],
          ),
          for (var i = 0; i < _lines.length; i++)
            _buildLineRow(context, i),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isBalanced
                  ? const Color(0xFF16A34A).withValues(alpha: 0.08)
                  : const Color(0xFFEF4444).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  isBalanced ? Icons.check_circle : Icons.error,
                  color: isBalanced
                      ? const Color(0xFF16A34A)
                      : const Color(0xFFEF4444),
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  isBalanced
                      ? 'Bút toán cân bằng: Nợ ${_fmt(_totalDebit)} = '
                          'Có ${_fmt(_totalCredit)}'
                      : 'Chưa cân bằng: Nợ ${_fmt(_totalDebit)} ≠ '
                          'Có ${_fmt(_totalCredit)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: (_saving || !isBalanced || !hasAmount) ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF16A34A),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: _saving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_outlined),
            label: Text(_saving ? 'Đang ghi sổ...' : 'Ghi sổ'),
          ),
        ],
      ),
    );
  }

  Widget _buildLineRow(BuildContext context, int index) {
    final line = _lines[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: true, label: Text('Nợ')),
                    ButtonSegment(value: false, label: Text('Có')),
                  ],
                  selected: {line.isDebit},
                  onSelectionChanged: (s) =>
                      setState(() => line.isDebit = s.first),
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  onPressed: () => _removeLine(index),
                  tooltip: 'Xóa dòng',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: line.accountCode,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Tài khoản',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: [
                      for (final code in NongSanJournalEntry.defaultAccounts)
                        DropdownMenuItem(
                          value: code,
                          child: Text(
                            '$code - ${NongSanJournalEntry.accountNameOf(code)}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                    onChanged: (v) => setState(() {
                      if (v != null) line.accountCode = v;
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 140,
                  child: TextField(
                    controller: line.amount,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(
                      labelText: 'Số tiền',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(double amount) {
    if (amount.abs() >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)} tỷ';
    }
    if (amount.abs() >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)} tr';
    }
    return amount.toStringAsFixed(0);
  }
}
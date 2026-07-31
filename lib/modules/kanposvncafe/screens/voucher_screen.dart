import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/cafe_finance_accounting.dart';
import '../providers/cafe_providers.dart';
import '../services/expense_voucher_printer.dart';

enum _FilterRange {
  homNay('Hôm nay'),
  homQua('Hôm qua'),
  tuanNay('7 ngày qua'),
  thangNay('Tháng này'),
  thangTruoc('Tháng trước'),
  tatCa('Tất cả');

  final String label;
  const _FilterRange(this.label);
}

class VoucherScreen extends ConsumerStatefulWidget {
  const VoucherScreen({super.key});

  @override
  ConsumerState<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends ConsumerState<VoucherScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txs = ref.watch(cafeCashTransactionsProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD97706),
          labelColor: const Color(0xFFD97706),
          tabs: const [
            Tab(icon: Icon(Icons.call_received), text: 'Phiếu thu'),
            Tab(icon: Icon(Icons.call_made), text: 'Phiếu chi'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _VoucherList(
            txs: txs.where((t) => t.type == 'INCOME').toList(),
            type: 'INCOME',
          ),
          _ExpenseVoucherTab(
            txs: txs.where((t) => t.type == 'EXPENSE').toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD97706),
        child: const Icon(Icons.add),
        onPressed: () => _showVoucherDialog(
          context,
          ref,
          type: _tabController.index == 0 ? 'INCOME' : 'EXPENSE',
        ),
      ),
    );
  }
}

class _ExpenseVoucherTab extends ConsumerStatefulWidget {
  final List<CashTransaction> txs;
  const _ExpenseVoucherTab({required this.txs});

  @override
  ConsumerState<_ExpenseVoucherTab> createState() => _ExpenseVoucherTabState();
}

class _ExpenseVoucherTabState extends ConsumerState<_ExpenseVoucherTab> {
  _FilterRange _range = _FilterRange.thangNay;
  DateTime? _customFrom;
  DateTime? _customTo;

  (DateTime, DateTime)? get _period {
    final now = DateTime.now();
    switch (_range) {
      case _FilterRange.homNay:
        final d = DateTime(now.year, now.month, now.day);
        return (d, d);
      case _FilterRange.homQua:
        final d = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
        return (d, d);
      case _FilterRange.tuanNay:
        return (
          DateTime(now.year, now.month, now.day).subtract(const Duration(days: 6)),
          DateTime(now.year, now.month, now.day),
        );
      case _FilterRange.thangNay:
        return (
          DateTime(now.year, now.month, 1),
          DateTime(now.year, now.month, now.day),
        );
      case _FilterRange.thangTruoc:
        final first = DateTime(now.year, now.month - 1, 1);
        final last = DateTime(now.year, now.month, 0);
        return (first, last);
      case _FilterRange.tatCa:
        return null;
    }
  }

  List<CashTransaction> get _filtered {
    final period = _period;
    if (period == null) return widget.txs;
    final (from, to) = period;
    final endOfDay = DateTime(to.year, to.month, to.day, 23, 59, 59);
    return widget.txs
        .where(
          (t) =>
              !t.timestamp.isBefore(from) &&
              !t.timestamp.isAfter(endOfDay),
        )
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> _pickCustomRange() async {
    final now = DateTime.now();
    final from = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, 1),
      firstDate: DateTime(2020),
      lastDate: now,
      helpText: 'Chọn ngày bắt đầu',
    );
    if (from == null || !context.mounted) return;
    final to = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: from,
      lastDate: now,
      helpText: 'Chọn ngày kết thúc',
    );
    if (to == null) return;
    setState(() {
      _customFrom = from;
      _customTo = to;
      _range = _FilterRange.tatCa;
    });
  }

  (DateTime, DateTime) _effectivePeriod() {
    if (_customFrom != null && _customTo != null) {
      return (_customFrom!, _customTo!);
    }
    return _period ?? (
      DateTime(2020),
      DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    final filtered = _filtered;
    final total = filtered.fold(0.0, (sum, t) => sum + t.amount);
    final (from, to) = _effectivePeriod();

    return Column(
      children: [
        // Filter bar
        Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          color: Colors.grey.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _FilterRange.values.map((r) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: ChoiceChip(
                        label: Text(r.label),
                        selected: _range == r,
                        selectedColor: const Color(0xFFD97706),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: _range == r ? Colors.white : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            _range = r;
                            if (r != _FilterRange.tatCa) {
                              _customFrom = null;
                              _customTo = null;
                            }
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (_customFrom != null && _customTo != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Khoảng: ${DateFormat('dd/MM/yyyy').format(_customFrom!)} → ${DateFormat('dd/MM/yyyy').format(_customTo!)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tổng chi: ${currency.format(total)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf, size: 16, color: Colors.red),
                    label: const Text(
                      'In tổng hợp',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    onPressed: filtered.isEmpty
                        ? null
                        : () => _showSummaryDialog(context, filtered, from, to),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    icon: const Icon(Icons.date_range, size: 20),
                    tooltip: 'Chọn khoảng ngày',
                    onPressed: _pickCustomRange,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        // Voucher list
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 48,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      const Text('Không có phiếu chi nào trong kỳ'),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  itemBuilder: (ctx, i) {
                    final tx = filtered[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red.shade100,
                          child: const Icon(
                            Icons.call_made,
                            color: Colors.red,
                          ),
                        ),
                        title: Text(
                          tx.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${tx.category} • ${DateFormat('dd/MM/yyyy HH:mm').format(tx.timestamp)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '-${currency.format(tx.amount)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.print, size: 18),
                              tooltip: 'In phiếu',
                              onPressed: () => printExpenseVoucher(tx),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                              onPressed: () => _confirmDelete(ctx, tx),
                            ),
                          ],
                        ),
                        onTap: () => _showExpenseDetailDialog(context, tx),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext ctx, CashTransaction tx) {
    showDialog(
      context: ctx,
      builder: (dCtx) => AlertDialog(
        title: const Text('Xác nhận xoá'),
        content: Text('Xoá phiếu chi "${tx.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dCtx),
            child: const Text('Huỷ'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dCtx);
              ref.read(cafeCashTransactionsProvider.notifier).delete(tx.id);
            },
            child: const Text('Xoá', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showSummaryDialog(
    BuildContext context,
    List<CashTransaction> filtered,
    DateTime from,
    DateTime to,
  ) {
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    final byCategory = <String, double>{};
    final byDay = <String, double>{};
    for (final t in filtered) {
      byCategory[t.category] = (byCategory[t.category] ?? 0) + t.amount;
      final day = DateFormat('dd/MM/yyyy').format(t.timestamp);
      byDay[day] = (byDay[day] ?? 0) + t.amount;
    }
    final total = filtered.fold(0.0, (sum, t) => sum + t.amount);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tổng hợp phiếu chi'),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Từ ${DateFormat('dd/MM/yyyy').format(from)} đến ${DateFormat('dd/MM/yyyy').format(to)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Theo danh mục:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...byCategory.entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.key, style: const TextStyle(fontSize: 13)),
                        Text(
                          currency.format(e.value),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const Text(
                  'Theo ngày:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...byDay.entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.key, style: const TextStyle(fontSize: 13)),
                        Text(
                          currency.format(e.value),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TỔNG CỘNG:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      currency.format(total),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Đóng'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD97706),
            ),
            icon: const Icon(Icons.picture_as_pdf, size: 16, color: Colors.white),
            label: const Text(
              'In PDF',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              printExpenseSummary(txs: filtered, from: from, to: to);
            },
          ),
        ],
      ),
    );
  }

  void _showExpenseDetailDialog(BuildContext context, CashTransaction tx) {
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chi tiết phiếu chi'),
        content: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  tx.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _detailRow('Số phiếu', _shortVoucherCode(tx)),
              _detailRow('Ngày giờ', DateFormat('dd/MM/yyyy HH:mm').format(tx.timestamp)),
              _detailRow('Danh mục', tx.category),
              _detailRow('Phương thức', tx.paymentMethod),
              _detailRow('Người chi', tx.performerName),
              _detailRow('Ghi chú', tx.note.isEmpty ? '—' : tx.note),
              const Divider(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text('SỐ TIỀN', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 2),
                    Text(
                      currency.format(tx.amount),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Đóng'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD97706),
            ),
            icon: const Icon(Icons.print, size: 16, color: Colors.white),
            label: const Text(
              'In phiếu',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              printExpenseVoucher(tx);
            },
          ),
        ],
      ),
    );
  }

  String _shortVoucherCode(CashTransaction tx) {
    final digits = tx.id.replaceAll(RegExp('[^0-9]'), '');
    if (digits.length > 5) {
      return 'PC-${digits.substring(digits.length - 6)}';
    }
    return tx.id;
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _VoucherList extends ConsumerWidget {
  final List<CashTransaction> txs;
  final String type;
  const _VoucherList({required this.txs, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIncome = type == 'INCOME';
    final currency = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );

    if (txs.isEmpty) {
      return Center(
        child: Text(
          isIncome ? 'Chưa có phiếu thu nào' : 'Chưa có phiếu chi nào',
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: txs.length,
      itemBuilder: (ctx, i) {
        final tx = txs[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isIncome
                  ? Colors.green.shade100
                  : Colors.red.shade100,
              child: Icon(
                isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: isIncome ? Colors.green : Colors.red,
              ),
            ),
            title: Text(
              tx.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${tx.category} • ${tx.paymentMethod} • ${tx.performerName}\n${tx.note.isNotEmpty ? tx.note : ""}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${isIncome ? "+" : "-"}${currency.format(tx.amount)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isIncome ? Colors.green : Colors.red,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (dCtx) => AlertDialog(
                        title: const Text('Xác nhận xoá'),
                        content: Text('Xoá phiếu "${tx.title}"?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dCtx),
                            child: const Text('Huỷ'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dCtx);
                              ref
                                  .read(cafeCashTransactionsProvider.notifier)
                                  .delete(tx.id);
                            },
                            child: const Text(
                              'Xoá',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> _showVoucherDialog(
  BuildContext context,
  WidgetRef ref, {
  required String type,
  CashTransaction? tx,
}) async {
  final isIncome = type == 'INCOME';
  final titleCtl = TextEditingController(text: tx?.title ?? '');
  final amountCtl = TextEditingController(text: tx?.amount.toString() ?? '');
  final performerCtl = TextEditingController(
    text: tx?.performerName ?? 'Thu ngân',
  );
  final noteCtl = TextEditingController(text: tx?.note ?? '');

  String paymentMethod = tx?.paymentMethod ?? 'Tiền mặt';
  String category =
      tx?.category ??
      (isIncome
          ? RevenueCategory.banHang.label
          : ExpenseCategory.chiKhac.label);

  List<String> categories;
  if (isIncome) {
    categories = RevenueCategory.values.map((e) => e.label).toList();
  } else {
    categories = ExpenseCategory.values.map((e) => e.label).toList();
  }

  await showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(
          tx != null ? 'Sửa phiếu' : 'Thêm phiếu ${isIncome ? "thu" : "chi"}',
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtl,
                decoration: const InputDecoration(
                  labelText: 'Tiêu đề *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(
                  labelText: 'Danh mục',
                  border: OutlineInputBorder(),
                ),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => category = v!),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: amountCtl,
                decoration: const InputDecoration(
                  labelText: 'Số tiền (đ) *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                decoration: const InputDecoration(
                  labelText: 'Phương thức',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Tiền mặt', child: Text('Tiền mặt')),
                  DropdownMenuItem(
                    value: 'Chuyển khoản',
                    child: Text('Chuyển khoản'),
                  ),
                  DropdownMenuItem(value: 'QR Code', child: Text('QR Code')),
                ],
                onChanged: (v) => setState(() => paymentMethod = v!),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: performerCtl,
                decoration: const InputDecoration(
                  labelText: 'Người thực hiện',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: noteCtl,
                decoration: const InputDecoration(
                  labelText: 'Ghi chú',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleCtl.text.trim().isEmpty) return;
              if (amountCtl.text.trim().isEmpty) return;
              ref
                  .read(cafeCashTransactionsProvider.notifier)
                  .save(
                    CashTransaction(
                      id:
                          tx?.id ??
                          'VTX-${DateTime.now().millisecondsSinceEpoch}',
                      title: titleCtl.text.trim(),
                      type: type,
                      category: category,
                      amount: double.tryParse(amountCtl.text) ?? 0,
                      paymentMethod: paymentMethod,
                      performerName: performerCtl.text.trim().isNotEmpty
                          ? performerCtl.text.trim()
                          : 'Thu ngân',
                      note: noteCtl.text.trim(),
                    ),
                  );
              Navigator.pop(ctx);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    ),
  );
}

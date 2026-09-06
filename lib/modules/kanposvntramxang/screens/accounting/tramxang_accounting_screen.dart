import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/account.dart';
import '../../models/accounting_entry.dart';
import '../../models/product.dart';
import '../../providers/tramxang_providers.dart';

final _selectedTabProvider = StateProvider<int>((ref) => 0);

const _amber = Color(0xFFF59E0B);

/// Màn hình Kế toán (TT133) của Trạm Xăng.
///
/// Gồm 3 tab: Sổ cái GL / Nhập bút toán / Hệ thống TK.
/// Mẫu bút toán mua-bán xăng dầu dùng `createFuelPurchaseEntry`,
/// `createFuelSaleEntry`, `createFuelCostEntry`.
class TramXangAccountingScreen extends ConsumerStatefulWidget {
  const TramXangAccountingScreen({super.key});

  @override
  ConsumerState<TramXangAccountingScreen> createState() =>
      _TramXangAccountingScreenState();
}

class _TramXangAccountingScreenState
    extends ConsumerState<TramXangAccountingScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(_selectedTabProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _TopBar(),
          _TabBar(),
          Expanded(
            child: [
              const _GlLedgerTab(),
              const _EntryInputTab(),
              const _ChartOfAccountsTab(),
            ][selectedTab],
          ),
        ],
      ),
    );
  }
}

class _TopBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(tramXangSelectedMonthProvider);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded, size: 20),
            onPressed: () =>
                ref.read(tramXangSelectedMonthProvider.notifier).previousMonth(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _amber.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'T${selected.month.toString().padLeft(2, '0')}/${selected.year}',
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: _amber),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded, size: 20),
            onPressed: () =>
                ref.read(tramXangSelectedMonthProvider.notifier).nextMonth(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _TabBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(_selectedTabProvider);
    final tabs = [
      ('Sổ cái GL', Icons.book_rounded),
      ('Nhập bút toán', Icons.edit_note_rounded),
      ('Hệ thống TK', Icons.account_tree_rounded),
    ];

    return Container(
      height: 44,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final i = entry.key;
          final (label, icon) = entry.value;
          final isSelected = selectedTab == i;
          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  ref.read(_selectedTabProvider.notifier).state = i,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? _amber.withValues(alpha: 0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon,
                        size: 14,
                        color: isSelected ? _amber : Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? _amber : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _GlLedgerTab extends ConsumerWidget {
  const _GlLedgerTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(tramXangSelectedMonthProvider);
    final summaryAsync = ref.watch(tramXangAccountingSummaryProvider(selected));
    final entriesAsync = ref.watch(tramXangEntriesByMonthProvider(selected));

    return Column(
      children: [
        summaryAsync.when(
          data: (s) => _SummaryCard(
              entries: (s['totalEntries'] as num?)?.toInt() ?? 0,
              posted: (s['postedEntries'] as num?)?.toInt() ?? 0,
              drafts: (s['draftEntries'] as num?)?.toInt() ?? 0,
              totalDebit: (s['totalDebit'] as num?)?.toDouble() ?? 0,
              totalCredit: (s['totalCredit'] as num?)?.toDouble() ?? 0),
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
        Expanded(
          child: entriesAsync.when(
            data: (entries) {
              if (entries.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book_outlined, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Chưa có bút toán trong tháng này',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey)),
                    ],
                  ),
                );
              }
              final grouped = <String, TramXangAccountingEntry>{};
              for (final e in entries) {
                grouped[e.journalID] = e;
              }
              final sorted = grouped.values.toList()
                ..sort((a, b) => b.postingDate.compareTo(a.postingDate));
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: sorted.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    _GlEntryCard(entry: sorted[index]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi: $e')),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final int entries;
  final int posted;
  final int drafts;
  final double totalDebit;
  final double totalCredit;

  const _SummaryCard({
    required this.entries,
    required this.posted,
    required this.drafts,
    required this.totalDebit,
    required this.totalCredit,
  });

  String _fmt(double v) {
    if (v >= 1000000000) return '${(v / 1000000000).toStringAsFixed(1)} tỷ';
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)} tr';
    return v.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Metric('Số bút toán', '$entries',
                sub: '$posted ghi sổ · $drafts nháp'),
          ),
          const VerticalDivider(width: 24),
          Expanded(
            child: _Metric('Nợ (DR)', _fmt(totalDebit), color: Colors.green),
          ),
          const VerticalDivider(width: 24),
          Expanded(
            child:
                _Metric('Có (CR)', _fmt(totalCredit), color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  final String? sub;
  final Color? color;

  const _Metric(this.label, this.value, {this.sub, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color ?? Colors.black87)),
        if (sub != null)
          Text(sub!, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

class _GlEntryCard extends ConsumerStatefulWidget {
  final TramXangAccountingEntry entry;
  const _GlEntryCard({required this.entry});

  @override
  ConsumerState<_GlEntryCard> createState() => _GlEntryCardState();
}

class _GlEntryCardState extends ConsumerState<_GlEntryCard> {
  bool _expanded = false;

  String _fmt(double v) {
    if (v >= 1000000000) return '${(v / 1000000000).toStringAsFixed(1)} tỷ';
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)} tr';
    return v.toStringAsFixed(0);
  }

  String _entryLabel(TramXangEntryType type) {
    switch (type) {
      case TramXangEntryType.fuelPurchase:
        return 'MUA XĂNG';
      case TramXangEntryType.fuelSale:
        return 'BÁN XĂNG';
      case TramXangEntryType.fuelCost:
        return 'GIÁ VỐN';
      case TramXangEntryType.saleReceipt:
        return 'THU TIỀN';
      case TramXangEntryType.purchasePayment:
        return 'CHI MUA';
      case TramXangEntryType.customerReceipt:
        return 'THU NỢ';
      case TramXangEntryType.supplierPayment:
        return 'TRẢ NỢ';
      case TramXangEntryType.openingBalance:
        return 'SỐ DƯ ĐK';
      case TramXangEntryType.adjustment:
        return 'ĐIỀU CHỈNH';
      case TramXangEntryType.other:
        return 'KHÁC';
    }
  }

  Color _entryColor(TramXangEntryType type) {
    switch (type) {
      case TramXangEntryType.fuelPurchase:
        return Colors.indigo;
      case TramXangEntryType.fuelSale:
        return Colors.green;
      case TramXangEntryType.fuelCost:
        return Colors.orange;
      case TramXangEntryType.openingBalance:
        return Colors.blueGrey;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final linesAsync = ref.watch(tramXangEntryLinesProvider(entry.journalID));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _entryColor(entry.entryType)
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_entryLabel(entry.entryType),
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: _entryColor(entry.entryType))),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(entry.description ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      if (entry.status == TramXangEntryStatus.reversed)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('ĐÃ ĐẢO',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700)),
                        ),
                      Icon(_expanded ? Icons.expand_less : Icons.expand_more,
                          size: 18, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(entry.voucherNumber,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.grey)),
                      const Spacer(),
                      Text('DR: ${_fmt(entry.totalDebit)}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 12),
                      Text('CR: ${_fmt(entry.totalCredit)}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(12),
              child: linesAsync.when(
                data: (lines) {
                  return Column(
                    children: lines.map((line) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: line.debitAccountNumber.isNotEmpty
                                      ? Colors.green
                                      : Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  line.debitAccountNumber.isNotEmpty
                                      ? 'Nợ ${line.debitAccountNumber}'
                                      : 'Có ${line.creditAccountNumber}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                              Text(line.description ?? '',
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                              const SizedBox(width: 8),
                              if (line.debitAccountNumber.isNotEmpty)
                                Text(_fmt(line.amount),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600)),
                              if (line.creditAccountNumber.isNotEmpty)
                                Text(_fmt(line.amount),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )).toList(),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
                ),
                error: (e, _) => Text('Lỗi: $e',
                    style: const TextStyle(fontSize: 12, color: Colors.red)),
              ),
            ),
        ],
      ),
    );
  }
}

class _EntryInputTab extends ConsumerWidget {
  const _EntryInputTab();

  Future<void> _createPurchase(WidgetRef ref, BuildContext context) async {
    final isar = ref.read(tramXangIsarServiceProvider);
    final products = ref.read(tramXangProductsProvider);
    if (products.isEmpty) {
      _msg(context, 'Chưa có mặt hàng. Hãy nạp dữ liệu mẫu trước.');
      return;
    }
    final result = await showDialog<_PurchaseData>(
      context: context,
      builder: (_) => const _PurchaseDialog(),
    );
    if (result == null) return;
    try {
      await isar.createFuelPurchaseEntry(
        product: result.product,
        quantity: result.quantity,
        unitCost: result.unitCost,
        taxRate: result.taxRate,
        method: result.method,
      );
      _msg(context, 'Đã tạo bút toán mua xăng dầu');
    } catch (e) {
      _msg(context, 'Lỗi: $e', error: true);
    }
  }

  Future<void> _createSale(WidgetRef ref, BuildContext context) async {
    final isar = ref.read(tramXangIsarServiceProvider);
    final products = ref.read(tramXangProductsProvider);
    if (products.isEmpty) {
      _msg(context, 'Chưa có mặt hàng. Hãy nạp dữ liệu mẫu trước.');
      return;
    }
    final result = await showDialog<_SaleData>(
      context: context,
      builder: (_) => const _SaleDialog(),
    );
    if (result == null) return;
    try {
      await isar.createFuelSaleEntry(
        product: result.product,
        quantity: result.quantity,
        unitPrice: result.unitPrice,
        taxRate: result.taxRate,
        method: result.method,
      );
      _msg(context, 'Đã tạo bút toán bán xăng dầu');
    } catch (e) {
      _msg(context, 'Lỗi: $e', error: true);
    }
  }

  Future<void> _createCost(WidgetRef ref, BuildContext context) async {
    final isar = ref.read(tramXangIsarServiceProvider);
    final products = ref.read(tramXangProductsProvider);
    if (products.isEmpty) {
      _msg(context, 'Chưa có mặt hàng. Hãy nạp dữ liệu mẫu trước.');
      return;
    }
    final result = await showDialog<_CostData>(
      context: context,
      builder: (_) => const _CostDialog(),
    );
    if (result == null) return;
    try {
      await isar.createFuelCostEntry(
        product: result.product,
        quantity: result.quantity,
        unitCost: result.unitCost,
      );
      _msg(context, 'Đã tạo bút toán kết chuyển giá vốn');
    } catch (e) {
      _msg(context, 'Lỗi: $e', error: true);
    }
  }

  void _msg(BuildContext context, String text, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: error ? Colors.red : const Color(0xFFF59E0B),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _QuickActionCard(
          icon: Icons.local_gas_station_rounded,
          title: 'Bút toán MUA xăng dầu',
          subtitle: 'Nợ 1561 + 1331 / Có 331 | 1111 | 1121 (TT133)',
          color: Colors.indigo,
          onTap: () => _createPurchase(ref, context),
        ),
        const SizedBox(height: 12),
        _QuickActionCard(
          icon: Icons.point_of_sale_rounded,
          title: 'Bút toán BÁN xăng dầu',
          subtitle: 'Nợ 1111 | 1121 | 131 / Có 5111 + 3331',
          color: Colors.green,
          onTap: () => _createSale(ref, context),
        ),
        const SizedBox(height: 12),
        _QuickActionCard(
          icon: Icons.receipt_long_rounded,
          title: 'Kết chuyển GIÁ VỐN',
          subtitle: 'Nợ 632 / Có 1561',
          color: Colors.orange,
          onTap: () => _createCost(ref, context),
        ),
        const SizedBox(height: 12),
        _QuickActionCard(
          icon: Icons.undo_rounded,
          title: 'Đảo bút toán đã ghi sổ',
          subtitle: 'Hoàn nhập (reverse) bút toán trong Sổ cái GL',
          color: Colors.redAccent,
          onTap: () {},
        ),
      ],
    );
  }
}

class _PurchaseData {
  final TramXangProduct product;
  final double quantity;
  final double unitCost;
  final double taxRate;
  final String method;
  const _PurchaseData(this.product, this.quantity, this.unitCost, this.taxRate, this.method);
}

class _PurchaseDialog extends ConsumerStatefulWidget {
  const _PurchaseDialog();

  @override
  ConsumerState<_PurchaseDialog> createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends ConsumerState<_PurchaseDialog> {
  TramXangProduct? _product;
  final _qty = TextEditingController(text: '5000');
  final _cost = TextEditingController(text: '22000');
  final _tax = TextEditingController(text: '10');
  String _method = '331';

  @override
  void dispose() {
    _qty.dispose();
    _cost.dispose();
    _tax.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref
        .read(tramXangProductsProvider)
        .where((p) => p.productType == 'FUEL')
        .toList();
    if (_product == null && products.isNotEmpty) _product = products.first;
    return AlertDialog(
      title: const Text('Bút toán MUA xăng dầu'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<TramXangProduct>(
              initialValue: _product,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Mặt hàng'),
              items: [
                for (final p in products)
                  DropdownMenuItem(value: p, child: Text(p.name)),
              ],
              onChanged: (v) => setState(() => _product = v),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _qty,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Số lượng (lít)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _cost,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Đơn giá chưa thuế (đ/lít)',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tax,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Thuế suất GTGT (%)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _method,
              decoration: const InputDecoration(labelText: 'Phương thức thanh toán'),
              items: const [
                DropdownMenuItem(value: '331', child: Text('331 - Phải trả người bán')),
                DropdownMenuItem(value: '1111', child: Text('1111 - Tiền mặt')),
                DropdownMenuItem(value: '1121', child: Text('1121 - Ngân hàng')),
              ],
              onChanged: (v) => setState(() => _method = v ?? '331'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFF59E0B)),
          onPressed: () {
            final product = _product;
            if (product == null) return;
            Navigator.pop(
              context,
              _PurchaseData(
                product,
                double.tryParse(_qty.text) ?? 0,
                double.tryParse(_cost.text) ?? 0,
                double.tryParse(_tax.text) ?? 10,
                _method,
              ),
            );
          },
          child: const Text('Tạo bút toán'),
        ),
      ],
    );
  }
}

class _SaleData {
  final TramXangProduct product;
  final double quantity;
  final double unitPrice;
  final double taxRate;
  final String method;
  const _SaleData(this.product, this.quantity, this.unitPrice, this.taxRate, this.method);
}

class _SaleDialog extends ConsumerStatefulWidget {
  const _SaleDialog();

  @override
  ConsumerState<_SaleDialog> createState() => _SaleDialogState();
}

class _SaleDialogState extends ConsumerState<_SaleDialog> {
  TramXangProduct? _product;
  final _qty = TextEditingController(text: '3000');
  final _price = TextEditingController(text: '23500');
  final _tax = TextEditingController(text: '10');
  String _method = '1111';

  @override
  void dispose() {
    _qty.dispose();
    _price.dispose();
    _tax.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref
        .read(tramXangProductsProvider)
        .where((p) => p.productType == 'FUEL')
        .toList();
    if (_product == null && products.isNotEmpty) _product = products.first;
    return AlertDialog(
      title: const Text('Bút toán BÁN xăng dầu'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<TramXangProduct>(
              initialValue: _product,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Mặt hàng'),
              items: [
                for (final p in products)
                  DropdownMenuItem(value: p, child: Text(p.name)),
              ],
              onChanged: (v) => setState(() => _product = v),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _qty,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Số lượng (lít)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _price,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Đơn giá chưa thuế (đ/lít)',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tax,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Thuế suất GTGT (%)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _method,
              decoration: const InputDecoration(labelText: 'Thu tiền qua'),
              items: const [
                DropdownMenuItem(value: '1111', child: Text('1111 - Tiền mặt')),
                DropdownMenuItem(value: '1121', child: Text('1121 - Ngân hàng')),
                DropdownMenuItem(value: '131', child: Text('131 - Phải thu khách')),
              ],
              onChanged: (v) => setState(() => _method = v ?? '1111'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFF59E0B)),
          onPressed: () {
            final product = _product;
            if (product == null) return;
            Navigator.pop(
              context,
              _SaleData(
                product,
                double.tryParse(_qty.text) ?? 0,
                double.tryParse(_price.text) ?? 0,
                double.tryParse(_tax.text) ?? 10,
                _method,
              ),
            );
          },
          child: const Text('Tạo bút toán'),
        ),
      ],
    );
  }
}

class _CostData {
  final TramXangProduct product;
  final double quantity;
  final double unitCost;
  const _CostData(this.product, this.quantity, this.unitCost);
}

class _CostDialog extends ConsumerStatefulWidget {
  const _CostDialog();

  @override
  ConsumerState<_CostDialog> createState() => _CostDialogState();
}

class _CostDialogState extends ConsumerState<_CostDialog> {
  TramXangProduct? _product;
  final _qty = TextEditingController(text: '3000');
  final _cost = TextEditingController(text: '22000');

  @override
  void dispose() {
    _qty.dispose();
    _cost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref
        .read(tramXangProductsProvider)
        .where((p) => p.productType == 'FUEL')
        .toList();
    if (_product == null && products.isNotEmpty) _product = products.first;
    return AlertDialog(
      title: const Text('Kết chuyển giá vốn'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<TramXangProduct>(
              initialValue: _product,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Mặt hàng'),
              items: [
                for (final p in products)
                  DropdownMenuItem(value: p, child: Text(p.name)),
              ],
              onChanged: (v) => setState(() => _product = v),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _qty,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Số lượng (lít)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _cost,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Giá vốn (đ/lít)', border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFF59E0B)),
          onPressed: () {
            final product = _product;
            if (product == null) return;
            Navigator.pop(
              context,
              _CostData(
                  product, double.tryParse(_qty.text) ?? 0,
                  double.tryParse(_cost.text) ?? 0),
            );
          },
          child: const Text('Tạo bút toán'),
        ),
      ],
    );
  }
}

class _ChartOfAccountsTab extends ConsumerWidget {
  const _ChartOfAccountsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(tramXangAllAccountsProvider);

    return accountsAsync.when(
      data: (accounts) {
        if (accounts.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_tree_outlined, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text('Chưa có tài khoản',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey)),
                Text('Hệ thống tài khoản sẽ tự tạo khi nạp dữ liệu mẫu',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          );
        }

        final ordered = [...accounts]
          ..sort((a, b) => a.accountNumber.compareTo(b.accountNumber));
        final grouped = <String, List<TramXangAccount>>{};
        for (final a in ordered) {
          final g = a.accountNumber.substring(0, 1);
          grouped.putIfAbsent(g, () => []).add(a);
        }

        final groupLabels = {
          '1': 'Tài sản (1xxx)',
          '2': 'Nợ phải thu (2xxx)',
          '3': 'Nợ phải trả (3xxx)',
          '4': 'Doanh thu (4xxx)',
          '5': 'Vốn (5xxx)',
          '6': 'Chi phí (6xxx)',
          '9': 'Xác định kết quả (9xxx)',
        };

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: grouped.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final group = grouped.keys.elementAt(index);
            final items = grouped[group]!;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      groupLabels[group] ?? 'Nhóm $group',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: _amber),
                    ),
                  ),
                  const Divider(height: 1),
                  ...items.map((a) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: (a.isDebitNormal
                                        ? Colors.green
                                        : Colors.redAccent)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                    a.accountNumber.substring(0, 1),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: a.isDebitNormal
                                            ? Colors.green
                                            : Colors.redAccent)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(a.accountNumber,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12)),
                                  Text(a.accountName,
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                            Icon(
                              a.isParent
                                  ? Icons.account_tree
                                  : Icons.circle,
                              size: a.isParent ? 16 : 8,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
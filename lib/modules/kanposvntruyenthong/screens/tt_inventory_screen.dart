import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_product.dart';
import '../models/tt_stock.dart';
import '../providers/tt_providers.dart';

String ttFmt2(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return '${value < 0 ? '-' : ''}${buf.toString()}đ';
}

String ttQty(double value) {
  if (value == value.roundToDouble()) return value.round().toString();
  return value.toString();
}

class TtInventoryScreen extends ConsumerStatefulWidget {
  const TtInventoryScreen({super.key});

  @override
  ConsumerState<TtInventoryScreen> createState() => _TtInventoryScreenState();
}

class _TtInventoryScreenState extends ConsumerState<TtInventoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;
  DateTime? _from;
  DateTime? _to;
  final _issueNoteCtrl = TextEditingController();
  final _issueQtyCtrl = TextEditingController();
  TtIssueType _issueType = TtIssueType.WASTE;
  TtProduct? _issueProduct;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 3, vsync: this);
    final now = DateTime.now();
    _from = DateTime(now.year, now.month, 1);
    _to = now;
  }

  @override
  void dispose() {
    _tab.dispose();
    _issueNoteCtrl.dispose();
    _issueQtyCtrl.dispose();
    super.dispose();
  }

  bool _inRange(DateTime d) =>
      !d.isBefore(_from!) && !d.isAfter(_to!);

  Color _statusColor(double qty, double minStock) {
    if (qty <= 0) return Colors.red;
    if (minStock > 0 && qty < minStock) return Colors.orange;
    return Colors.green;
  }

  String _statusLabel(double qty, double minStock) {
    if (qty <= 0) return 'Hết hàng';
    if (minStock > 0 && qty < minStock) return 'Sắp hết';
    return 'Đủ hàng';
  }

  Future<void> _createIssue() async {
    final product = _issueProduct;
    if (product == null) return;
    final qty = double.tryParse(_issueQtyCtrl.text.replaceAll(',', '.')) ?? 0;
    if (qty <= 0) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    final no = (await db.ttStockIssues.count()) + 1;
    final issueNumber = 'XK${no.toString().padLeft(4, '0')}';
    final totalCost = qty * product.defaultPurchasePrice;
    final issue = TtStockIssue()
      ..issueId = const Uuid().v4()
      ..issueNumber = issueNumber
      ..issueType = _issueType
      ..date = DateTime.now()
      ..note = _issueNoteCtrl.text.trim()
      ..totalCost = totalCost
      ..createdBy = 'inventory';
    await db.writeTxn(() async {
      await db.ttStockIssues.put(issue);
      // Trừ lô theo FIFO
      final lots = await db.ttStockLots.filter().product((p) => p.idEqualTo(product.id)).findAll()
        ..sort((a, b) => a.purchaseDate.compareTo(b.purchaseDate));
      double remaining = qty;
      for (final lot in lots) {
        if (remaining <= 0) break;
        if (lot.quantityRemaining <= 0) continue;
        final take = lot.quantityRemaining < remaining ? lot.quantityRemaining : remaining;
        lot.quantityOut += take;
        lot.quantityRemaining -= take;
        remaining -= take;
        await db.ttStockLots.put(lot);
      }
      await db.ttStockMovements.put(TtStockMovement()
        ..movementId = const Uuid().v4()
        ..product.value = product
        ..movementType = _issueType == TtIssueType.WASTE
            ? TtMovementType.WASTE
            : _issueType == TtIssueType.DAMAGE
                ? TtMovementType.DAMAGE
                : TtMovementType.INTERNAL_USE
        ..referenceId = issueNumber
        ..quantity = -qty
        ..unitCost = product.defaultPurchasePrice
        ..totalCost = -totalCost);
    });
    _issueNoteCtrl.clear();
    _issueQtyCtrl.clear();
    setState(() => _issueProduct = null);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã tạo phiếu $issueNumber')));
  }

  Future<void> _pickIssueProduct() async {
    final products = await ttLoadProductsForUi(ref);
    final picked = await showModalBottomSheet<TtProduct>(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Chọn sản phẩm xuất', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          for (final p in products)
            ListTile(
              leading: const Icon(Icons.eco),
              title: Text(p.name),
              subtitle: Text(p.saleUnit),
              onTap: () => Navigator.pop(context, p),
            ),
        ],
      ),
    );
    if (picked != null) setState(() => _issueProduct = picked);
  }

  @override
  Widget build(BuildContext context) {
    final lotsAsync = ref.watch(ttStockLotsProvider);
    final movementsAsync = ref.watch(ttStockMovementsProvider);
    final productsAsync = ref.watch(ttProductsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Kho Hàng', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tab,
          tabs: const [
            Tab(text: 'Tồn Kho'),
            Tab(text: 'Xuất Kho'),
            Tab(text: 'Lịch Sử'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          // ---- Tồn kho + hạn sử dụng ----
          productsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Lỗi: $e')),
data: (products) {
              return lotsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Lỗi: $e')),
                data: (lots) {
                  final stockMap = <int, ({double qty, double value, DateTime? expiry})>{};
                  for (final lot in lots) {
                    final pid = lot.product.value?.id ?? -1;
                    final cur = stockMap[pid];
                    stockMap[pid] = (
                      qty: (cur?.qty ?? 0) + lot.quantityRemaining,
                      value: (cur?.value ?? 0) + lot.quantityRemaining * lot.unitCost,
                      expiry: cur?.expiry,
                    );
                  }
                  final rows = <Widget>[];
                  for (final p in products) {
                    final d = stockMap[p.id];
                    final qty = d?.qty ?? 0;
                    rows.add(ListTile(
                      leading: Icon(_categoryIcon(p.category.value?.name), color: _statusColor(qty, p.minStock)),
                      title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'Tồn: ${ttQty(qty)} ${p.baseUnit} • Min: ${ttQty(p.minStock)} • Giá trị: ${ttFmt2(d?.value ?? 0)}',
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(_statusLabel(qty, p.minStock),
                              style: TextStyle(color: _statusColor(qty, p.minStock), fontWeight: FontWeight.bold)),
                          if (p.isPerishable)
                            Text('HSD: ${p.shelfLifeDays} ngày', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                        ],
                      ),
                    ));
                  }
                  return ListView(children: rows);
                },
              );
            },
          ),
          // ---- Xuất kho / hao hụt ----
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('PHIẾU XUẤT KHO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      TextButton.icon(
                        onPressed: _pickIssueProduct,
                        icon: const Icon(Icons.eco),
                        label: Text(_issueProduct?.name ?? 'Chọn sản phẩm'),
                      ),
                      if (_issueProduct != null) ...[
                        const SizedBox(height: 8),
                        TextField(
                          controller: _issueQtyCtrl,
                          decoration: InputDecoration(labelText: 'Số lượng (${_issueProduct!.saleUnit})', isDense: true),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<TtIssueType>(
                          value: _issueType,
                          decoration: const InputDecoration(labelText: 'Loại xuất', isDense: true),
                          items: [
                            for (final t in TtIssueType.values)
                              DropdownMenuItem(value: t, child: Text(t.label)),
                          ],
                          onChanged: (v) => setState(() => _issueType = v ?? TtIssueType.WASTE),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _issueNoteCtrl,
                          decoration: const InputDecoration(labelText: 'Lý do', isDense: true),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFEA580C)),
                            onPressed: _issueProduct == null ? null : _createIssue,
                            icon: const Icon(Icons.outbond),
                            label: const Text('TẠO PHIẾU XUẤT'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('CẢNH BÁO HẠN SỬ DỤNG', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              lotsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Lỗi: $e')),
                data: (lots) {
                  final now = DateTime.now();
                  final expiring = lots.where((l) {
                    final e = l.expiryDate;
                    if (e == null || l.quantityRemaining <= 0) return false;
                    return !e.isAfter(now.add(const Duration(days: 7)));
                  }).toList()..sort((a, b) => (a.expiryDate ?? now).compareTo(b.expiryDate ?? now));
                  if (expiring.isEmpty) {
                    return const Card(
                      child: ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text('Không có lô nào sắp hết hạn trong 7 ngày'),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      for (final l in expiring)
                        Card(
                          child: ListTile(
                            leading: Icon(
                              (l.expiryDate?.isBefore(now) ?? false) ? Icons.dangerous : Icons.hourglass_bottom,
                              color: (l.expiryDate?.isBefore(now) ?? false) ? Colors.red : Colors.orange,
                            ),
                            title: Text(l.product.value?.name ?? ''),
                            subtitle: Text('Lô ${l.lotNumber} • Tồn: ${ttQty(l.quantityRemaining)} ${l.product.value?.baseUnit ?? 'kg'}'),
                            trailing: Text(
                              (l.expiryDate?.isBefore(now) ?? false)
                                  ? 'Hết hạn ${ttDay(l.expiryDate!)}'
                                  : 'Còn ${l.expiryDate!.difference(now).inDays + 1} ngày',
                              style: TextStyle(
                                color: (l.expiryDate?.isBefore(now) ?? false) ? Colors.red : Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
          // ---- Lịch sử nhập xuất ----
          movementsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Lỗi: $e')),
            data: (movements) {
              final filtered = movements.where((m) => _inRange(m.createdAt)).toList();
              if (filtered.isEmpty) return const Center(child: Text('Chưa có biến động trong kỳ'));
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final d = await showDatePicker(
                              context: context,
                              initialDate: _from!,
                              firstDate: DateTime(2020),
                              lastDate: now,
                            );
                            if (d != null) setState(() => _from = DateTime(d.year, d.month, d.day));
                          },
                          child: Text('Từ: ${ttDay(_from!)}'),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final d = await showDatePicker(
                              context: context,
                              initialDate: _to!,
                              firstDate: DateTime(2020),
                              lastDate: now,
                            );
                            if (d != null) setState(() => _to = DateTime(d.year, d.month, d.day, 23, 59));
                          },
                          child: Text('Đến: ${ttDay(_to!)}'),
                        ),
                      ],
                    ),
                  ),
                  for (final m in filtered)
                    ListTile(
                      leading: Icon(
                        m.quantity >= 0 ? Icons.trending_up : Icons.trending_down,
                        color: m.quantity >= 0 ? Colors.green : Colors.red,
                      ),
                      title: Text('${m.product.value?.name ?? ''}  •  ${m.movementType.label}'),
                      subtitle: Text(
                        '${ttDay(m.createdAt)} ${m.createdAt.hour}:${m.createdAt.minute.toString().padLeft(2, '0')} • Chứng từ ${m.referenceId}',
                      ),
                      trailing: Text(
                        '${m.quantity >= 0 ? '+' : ''}${ttQty(m.quantity)}',
                        style: TextStyle(color: m.quantity >= 0 ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _categoryIcon(String? category) {
    switch (category ?? '') {
      case 'Rau lá':
        return Icons.eco;
      case 'Củ':
        return Icons.agriculture;
      case 'Quả':
        return Icons.apple;
      case 'Nấm':
        return Icons.umbrella;
      default:
        return Icons.inventory_2;
    }
  }
}

String ttDay(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

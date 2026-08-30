import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/tt_loyalty.dart';
import '../models/tt_partner.dart';
import '../providers/tt_providers.dart';

/// Tab "Điểm Thưởng": quy tắc tích điểm + lịch sử + điều chỉnh điểm khách.
class TtLoyaltyScreen extends ConsumerStatefulWidget {
  const TtLoyaltyScreen({super.key});

  @override
  ConsumerState<TtLoyaltyScreen> createState() => _TtLoyaltyScreenState();
}

class _TtLoyaltyScreenState extends ConsumerState<TtLoyaltyScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  Future<void> _adjustReward() async {
    final customers = await ttLoadCustomersForUi(ref);
    TtCustomer? customer;
    final amountCtrl = TextEditingController();
    final descCtrl = TextEditingController(text: 'Điều chỉnh tay');
    TtLoyaltyType type = TtLoyaltyType.EARN;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Điều chỉnh điểm'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<TtCustomer>(
                  value: customer,
                  decoration: const InputDecoration(labelText: 'Khách hàng'),
                  items: [for (final c in customers) DropdownMenuItem(value: c, child: Text('${c.name} (${c.loyaltyPoint.round()} đ)'))],
                  onChanged: (v) => setState(() => customer = v),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<TtLoyaltyType>(
                  value: type,
                  decoration: const InputDecoration(labelText: 'Loại'),
                  items: [for (final t in TtLoyaltyType.values) DropdownMenuItem(value: t, child: Text(t.label))],
                  onChanged: (v) => setState(() => type = v ?? TtLoyaltyType.EARN),
                ),
                const SizedBox(height: 8),
                TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số điểm (±)'), keyboardType: TextInputType.number),
                const SizedBox(height: 8),
                TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Mô tả')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true || customer == null) return;
    final points = double.tryParse(amountCtrl.text.replaceAll(',', '.')) ?? 0;
    if (points == 0) return;

    final db = await ref.read(ttIsarServiceProvider).db;
    final c = customer!;
    await db.writeTxn(() async {
      c.loyaltyPoint += points;
      if (c.loyaltyPoint < 0) c.loyaltyPoint = 0;
      await db.ttCustomers.put(c);
      await db.ttLoyaltyTransactions.put(TtLoyaltyTransaction()
        ..loyaltyTxId = const Uuid().v4()
        ..customer.value = c
        ..type = type
        ..points = points
        ..balanceAfter = c.loyaltyPoint
        ..description = descCtrl.text.trim());
    });
    await ref.read(ttCustomersProvider.notifier).loadCustomers();
    ref.invalidate(ttLoyaltyTxProvider);
  }

  Future<void> _editRule(TtLoyaltyRule rule) async {
    final amountCtrl = TextEditingController(text: rule.amountPerPoint.toStringAsFixed(0));
    final minCtrl = TextEditingController(text: rule.minimumInvoice.toStringAsFixed(0));
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cấu hình quy tắc tích điểm'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('100.000đ = 1 điểm', style: TextStyle(fontStyle: FontStyle.italic)),
            const SizedBox(height: 12),
            TextField(controller: amountCtrl, decoration: const InputDecoration(labelText: 'Số tiền / 1 điểm (đ)'), keyboardType: TextInputType.number),
            const SizedBox(height: 8),
            TextField(controller: minCtrl, decoration: const InputDecoration(labelText: 'Hóa đơn tối thiểu (đ)'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    final db = await ref.read(ttIsarServiceProvider).db;
    await db.writeTxn(() async {
      rule.amountPerPoint = double.tryParse(amountCtrl.text.replaceAll(',', '.')) ?? rule.amountPerPoint;
      rule.minimumInvoice = double.tryParse(minCtrl.text.replaceAll(',', '.')) ?? rule.minimumInvoice;
      await db.ttLoyaltyRules.put(rule);
    });
    ref.invalidate(ttLoyaltyRulesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final rulesAsync = ref.watch(ttLoyaltyRulesProvider);
    final txAsync = ref.watch(ttLoyaltyTxProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
        title: const Text('Điểm Thưởng', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Điều chỉnh điểm',
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: _adjustReward,
          ),
        ],
      ),
      body: Column(
        children: [
          rulesAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, st) => Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Lỗi: $e'),
            ),
            data: (rules) {
              final active = rules.where((r) => r.isActive).firstOrNull;
              return Card(
                margin: const EdgeInsets.all(12),
                color: const Color(0xFFF0FDF4),
                child: ListTile(
                  leading: const Icon(Icons.stars, color: Color(0xFFF59E0B), size: 32),
                  title: Text(
                    active != null
                        ? '${formatMoneyTt(active.amountPerPoint)}đ = 1 điểm'
                        : 'Chưa có quy tắc',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    active != null
                        ? 'Hóa đơn tối thiểu ${formatMoneyTt(active.minimumInvoice)}đ được tích điểm'
                        : 'Bấm để cấu hình quy tắc tích điểm',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: 'Cấu hình',
                    onPressed: active != null ? () => _editRule(active) : null,
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: txAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Lỗi: $e')),
              data: (txs) {
                if (txs.isEmpty) {
                  return const Center(child: Text('Lịch sử điểm thưởng xuất hiện sau khi bán hàng cho khách'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  itemCount: txs.length,
                  itemBuilder: (context, i) {
                    final t = txs[i];
                    final positive = t.points >= 0;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: positive ? Colors.green.shade100 : Colors.orange.shade100,
                          child: Icon(
                            t.type == TtLoyaltyType.EARN
                                ? Icons.star
                                : t.type == TtLoyaltyType.REDEEM
                                    ? Icons.card_giftcard
                                    : Icons.tune,
                            color: positive ? Colors.green : Colors.orange,
                          ),
                        ),
                        title: Text(t.customer.value?.name ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${t.type.label} • ${ttDayLoy(t.createdAt)}\n${t.description}'),
                        isThreeLine: true,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${positive ? '+' : ''}${t.points.round()} đ',
                              style: TextStyle(color: positive ? Colors.green : Colors.orange, fontWeight: FontWeight.bold),
                            ),
                            Text('SD: ${t.balanceAfter.round()} đ', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

String ttDayLoy(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} ${d.hour}:${d.minute.toString().padLeft(2, '0')}';

extension _RuleFirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}

String formatMoneyTt(double value) {
  final abs = value.abs().toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < abs.length; i++) {
    if (i > 0 && (abs.length - i) % 3 == 0) buf.write('.');
    buf.write(abs[i]);
  }
  return buf.toString();
}
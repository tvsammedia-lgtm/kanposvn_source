import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/property.dart';
import '../models/transaction.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';
import 'transaction_form_screen.dart';

/// Danh sách giao dịch — lọc trạng thái + chuyển trạng thái theo luồng
/// Đang đàm phán → Đặt cọc → Công chứng → Hoàn thành / Hủy (PRD mục 12).
class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  TransactionStatus? _filter;
  String _query = '';

  static const _statusLabels = {
    TransactionStatus.negotiating: 'Đang đàm phán',
    TransactionStatus.deposited: 'Đặt cọc',
    TransactionStatus.notarized: 'Đã công chứng',
    TransactionStatus.completed: 'Hoàn thành',
    TransactionStatus.cancelled: 'Đã hủy',
  };

  static const _statusColors = {
    TransactionStatus.negotiating: Colors.orange,
    TransactionStatus.deposited: Colors.deepPurple,
    TransactionStatus.notarized: Color(0xFF0284C7),
    TransactionStatus.completed: Colors.green,
    TransactionStatus.cancelled: Colors.red,
  };

  Future<void> _advance(TransactionRecord t, TransactionStatus to) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Chuyển sang "${_statusLabels[to]}"?'),
        content: Text('Giao dịch ${t.transactionCode ?? ''}'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Xác nhận')),
        ],
      ),
    );
    if (confirm != true) return;
    t.status = to;

    // Hoàn thành → đánh dấu BĐS liên quan là ĐÃ BÁN.
    if (to == TransactionStatus.completed) {
      final props = ref.read(propertiesProvider).value ?? [];
      for (final p in props) {
        if (p.propertyCode == t.propertyId || p.remoteId == t.propertyId) {
          p.status = PropertyStatus.sold;
          await ref.read(propertyRepositoryProvider).saveProperty(p);
          ref.invalidate(propertiesProvider);
          break;
        }
      }
    }

    // Hủy → nếu không còn GD đang chạy trên BĐS đó thì trả về ĐANG RAO.
    if (to == TransactionStatus.cancelled) {
      final props = ref.read(propertiesProvider).value ?? [];
      for (final p in props) {
        if ((p.propertyCode == t.propertyId || p.remoteId == t.propertyId) &&
            (p.status == PropertyStatus.negotiating ||
                p.status == PropertyStatus.deposited)) {
          final otherActive = (ref.read(transactionsProvider).value ?? [])
              .where((x) =>
                  x.id != t.id &&
                  x.deletedAt == null &&
                  x.propertyId == t.propertyId &&
                  (x.status == TransactionStatus.negotiating ||
                      x.status == TransactionStatus.deposited))
              .isNotEmpty;
          if (!otherActive) {
            p.status = PropertyStatus.available;
            await ref.read(propertyRepositoryProvider).saveProperty(p);
            ref.invalidate(propertiesProvider);
          }
          break;
        }
      }
    }

    await ref.read(transactionRepositoryProvider).saveTransaction(t);
    ref.invalidate(transactionsProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text('Đã chuyển ${t.transactionCode} → ${_statusLabels[to]}')));
  }

  Future<void> _delete(TransactionRecord t) async {
    await ref.read(transactionRepositoryProvider).deleteTransaction(t.id);
    ref.invalidate(transactionsProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã xóa giao dịch')));
  }

  @override
  Widget build(BuildContext context) {
    final txsAsync = ref.watch(transactionsProvider);
    final propsAsync = ref.watch(propertiesProvider);
    final custsAsync = ref.watch(customersProvider);
    final brksAsync = ref.watch(brokersProvider);
    final df = DateFormat('dd/MM/yyyy');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const TransactionFormScreen()));
          ref.invalidate(transactionsProvider);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm mã giao dịch...',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
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
                    selected: _filter == null,
                    onSelected: (_) => setState(() => _filter = null),
                  ),
                ),
                for (final s in TransactionStatus.values)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ChoiceChip(
                        label: Text(_statusLabels[s]!),
                        selected: _filter == s,
                        selectedColor:
                            (_statusColors[s] ?? Colors.grey).withOpacity(0.3),
                        onSelected: (_) => setState(() => _filter = s),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: txsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (all) {
                var list = all.where((t) {
                  if (_filter != null && t.status != _filter) return false;
                  final q = _query.trim().toLowerCase();
                  if (q.isEmpty) return true;
                  return (t.transactionCode ?? '').toLowerCase().contains(q);
                }).toList();

                if (list.isEmpty) {
                  return const Center(child: Text('Chưa có giao dịch'));
                }

                final resolver = (propsAsync.value != null &&
                        custsAsync.value != null &&
                        brksAsync.value != null)
                    ? BdsNameResolver.build(
                        propsAsync.value!, custsAsync.value!, brksAsync.value!)
                    : null;

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 88),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final t = list[i];
                    final color = _statusColors[t.status] ?? Colors.grey;
                    final prop = resolver?.property(t.propertyId);
                    final propLabel = prop != null
                        ? '[${prop.propertyCode}] ${prop.title ?? ''}'
                        : (t.propertyId ?? '-');
                    final nexts = BdsBusinessLogic.nextStatuses(t.status);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: ListTile(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      TransactionFormScreen(transaction: t)));
                          if (mounted) ref.invalidate(transactionsProvider);
                        },
                        title: Row(children: [
                          Expanded(
                            child: Text(
                                '${t.transactionCode ?? '-'} · '
                                '${BdsBusinessLogic.formatMoney(t.finalPrice)}đ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(_statusLabels[t.status]!,
                                style:
                                    TextStyle(fontSize: 11, color: color)),
                          ),
                        ]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 2),
                            Text(propLabel,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            Text(resolver == null
                                ? ''
                                : 'Mua: ${resolver.customer(t.buyerId)} · '
                                    'Bán: ${resolver.customer(t.sellerId)} · '
                                    'MG: ${resolver.broker(t.brokerId)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12)),
                            Text(
                                '${t.transactionDate != null ? df.format(t.transactionDate!) : '-'} · '
                                'Hoa hồng ${BdsBusinessLogic.formatMoney(t.commission)} · '
                                'Phí sàn ${BdsBusinessLogic.formatMoney(t.floorFee)}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        trailing: PopupMenuButton<String>(
                          itemBuilder: (ctx) => [
                            ...nexts.map((n) => PopupMenuItem(
                                  value: n.name,
                                  enabled: n != TransactionStatus.cancelled,
                                  child: Text(n == TransactionStatus.cancelled
                                      ? 'Hủy giao dịch'
                                      : '→ ${_statusLabels[n]!}'),
                                )),
                            const PopupMenuDivider(),
                            const PopupMenuItem(
                                value: 'delete',
                                child: Text('Xóa giao dịch',
                                    style: TextStyle(color: Colors.red))),
                          ],
                          onSelected: (v) {
                            if (v == 'delete') {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Xác nhận xóa'),
                                  content: Text(
                                      'Xóa ${t.transactionCode ?? 'giao dịch'} ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(ctx),
                                        child: const Text('Hủy')),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        _delete(t);
                                      },
                                      child: const Text('Xóa',
                                          style:
                                              TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              final target = TransactionStatus.values
                                  .firstWhere((s) => s.name == v);
                              _advance(t, target);
                            }
                          },
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

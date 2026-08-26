import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/bida_session.dart';
import '../providers/bida_providers.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: '');
final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

/// Tab "Tìm hóa đơn" — tìm và xem lại lịch sử các buổi đã thanh toán.
class BidaBillSearchScreen extends ConsumerStatefulWidget {
  const BidaBillSearchScreen({super.key});

  @override
  ConsumerState<BidaBillSearchScreen> createState() => _BidaBillSearchScreenState();
}

class _BidaBillSearchScreenState extends ConsumerState<BidaBillSearchScreen> {
  final _searchCtrl = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(bidaSessionsProvider);

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _searchCtrl,
                  decoration: InputDecoration(
                    hintText: 'Tìm theo mã bill, tên khách, bàn...',
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                    suffixIcon: _searchCtrl.text.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => setState(() => _searchCtrl.clear()),
                          ),
                  ),
                  onChanged: (v) => setState(() {}),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    InputChip(
                      avatar: const Icon(Icons.calendar_today, size: 16),
                      label: Text(_fromDate == null ? 'Từ ngày' : 'Từ: ${_dateFmt.format(_fromDate!)}'),
                      onPressed: _pickFrom,
                      visualDensity: VisualDensity.compact,
                    ),
                    InputChip(
                      avatar: const Icon(Icons.calendar_today, size: 16),
                      label: Text(_toDate == null ? 'Đến ngày' : 'Đến: ${_dateFmt.format(_toDate!)}'),
                      onPressed: _pickTo,
                      visualDensity: VisualDensity.compact,
                    ),
                    if (_fromDate != null || _toDate != null)
                      InputChip(
                        label: const Text('Xóa lọc'),
                        onPressed: () => setState(() { _fromDate = null; _toDate = null; }),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: sessionsAsync.when(
              data: (list) {
                final items = _filter(list);
                if (items.isEmpty) {
                  return const Center(child: Text('Chưa có hóa đơn nào'));
                }
                return ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, i) {
                    final s = items[i];
                    final code = s.sessionId.length > 8 ? s.sessionId.substring(0, 8) : s.sessionId;
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFF059669),
                          foregroundColor: Colors.white,
                          child: Icon(Icons.receipt_long, size: 20),
                        ),
                        title: Text(
                          'Buổi #${code.toUpperCase()}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          'Bàn: ${s.table.value?.name ?? "---"}\n'
                          '${s.startTime != null ? _dateFmt.format(s.startTime!) : ""}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        isThreeLine: true,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _currency.format(s.grandTotal),
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF059669)),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: s.status == BidaSessionStatus.PAID ? Colors.green : Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                s.status.label,
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      );
  }

  List<BidaSession> _filter(List<BidaSession> list) {
    final q = _searchCtrl.text.trim().toLowerCase();
    return list.where((s) {
      if (s.status != BidaSessionStatus.PAID) return false;
      if (q.isNotEmpty) {
        final code = s.sessionId.toLowerCase();
        final name = s.customerName.toLowerCase();
        final tbl = (s.table.value?.name ?? '').toLowerCase();
        if (!code.contains(q) && !name.contains(q) && !tbl.contains(q)) return false;
      }
      final t = s.endTime;
      if (t != null) {
        if (_fromDate != null && t.isBefore(_fromDate!)) return false;
        if (_toDate != null && t.isAfter(_toDate!)) return false;
      }
      return true;
    }).toList()
      ..sort((a, b) => (b.endTime ?? DateTime(0)).compareTo(a.endTime ?? DateTime(0)));
  }

  Future<void> _pickFrom() async {
    final picked = await showDatePicker(context: context, initialDate: _fromDate ?? DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _fromDate = picked;
        if (_toDate == null || _toDate!.isBefore(_fromDate!)) _toDate = _fromDate;
      });
    }
  }

  Future<void> _pickTo() async {
    final picked = await showDatePicker(context: context, initialDate: _toDate ?? DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2100));
    if (picked != null) setState(() => _toDate = picked);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }
}

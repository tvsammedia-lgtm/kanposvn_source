import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/bida_reservation.dart';
import '../models/bida_table.dart';
import '../providers/bida_partner_providers.dart';
import '../providers/bida_providers.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: '');
final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

class BidaDatBanScreen extends ConsumerStatefulWidget {
  const BidaDatBanScreen({super.key});

  @override
  ConsumerState<BidaDatBanScreen> createState() => _BidaDatBanScreenState();
}

class _BidaDatBanScreenState extends ConsumerState<BidaDatBanScreen> {
  String _filter = 'all'; // all / pending / checked_in / cancelled

  @override
  Widget build(BuildContext context) {
    final reservationsAsync = ref.watch(bidaReservationsProvider);
    final tablesAsync = ref.watch(bidaTablesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt Bàn'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(
            child: reservationsAsync.when(
              data: (list) {
                final filtered = _filterList(list);
                if (filtered.isEmpty) {
                  return const Center(child: Text('Chưa có đặt bàn nào'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  itemBuilder: (ctx, i) => _ReservationCard(
                    reservation: filtered[i],
                    tablesAsync: tablesAsync,
                    onCheckIn: (r) async {
                      await ref.read(bidaReservationsProvider.notifier).checkInReservation(r);
                    },
                    onCancel: (r) async {
                      await ref.read(bidaReservationsProvider.notifier).cancelReservation(r);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Đặt bàn mới'),
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip('Tất cả', 'all'),
          const SizedBox(width: 6),
          _chip('Chờ đến', 'pending'),
          const SizedBox(width: 6),
          _chip('Đã nhận', 'checked_in'),
          const SizedBox(width: 6),
          _chip('Đã hủy', 'cancelled'),
        ],
      ),
    );
  }

  Widget _chip(String label, String value) {
    final selected = _filter == value;
    return FilterChip(
      label: Text(label, style: TextStyle(fontSize: 12, color: selected ? Colors.white : const Color(0xFF059669))),
      selected: selected,
      onSelected: (_) => setState(() => _filter = value),
      selectedColor: const Color(0xFF059669),
      checkmarkColor: Colors.white,
      visualDensity: VisualDensity.compact,
    );
  }

  List<BidaReservation> _filterList(List<BidaReservation> list) {
    if (_filter == 'all') return list;
    final status = BidaReservationStatus.values.firstWhere(
      (s) => s.name == _filter,
      orElse: () => BidaReservationStatus.PENDING,
    );
    return list.where((r) => r.status == status).toList();
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final guestCtrl = TextEditingController(text: '2');
    final depositCtrl = TextEditingController(text: '0');
    final noteCtrl = TextEditingController();
    DateTime? arrival;
    String? selectedType;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('Đặt bàn mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên khách *', border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại *', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
                const SizedBox(height: 8),
                TextField(controller: guestCtrl, decoration: const InputDecoration(labelText: 'Số người', border: OutlineInputBorder()), keyboardType: TextInputType.number),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedType,
                  hint: const Text('Chọn loại bàn'),
                  items: BidaTableType.values.map((t) => DropdownMenuItem(value: t.name, child: Text(t.label))).toList(),
                  onChanged: (v) => setLocal(() => selectedType = v),
                  decoration: const InputDecoration(labelText: 'Loại bàn', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(arrival != null ? 'Giờ đến: ${_dateFmt.format(arrival!)}' : 'Chọn giờ đến'),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    final date = await showDatePicker(context: ctx, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 30)));
                    if (date != null && ctx.mounted) {
                      final time = await showTimePicker(context: ctx, initialTime: TimeOfDay.now());
                      if (time != null) {
                        setLocal(() => arrival = DateTime(date.year, date.month, date.day, time.hour, time.minute));
                      }
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextField(controller: depositCtrl, decoration: const InputDecoration(labelText: 'Đặt cọc (đ)', border: OutlineInputBorder()), keyboardType: TextInputType.number),
                const SizedBox(height: 8),
                TextField(controller: noteCtrl, decoration: const InputDecoration(labelText: 'Ghi chú', border: OutlineInputBorder())),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty) return;
                await ref.read(bidaReservationsProvider.notifier).addReservation(
                  customerName: nameCtrl.text.trim(),
                  customerPhone: phoneCtrl.text.trim(),
                  guestCount: int.tryParse(guestCtrl.text) ?? 2,
                  tableType: selectedType,
                  expectedArrival: arrival,
                  deposit: double.tryParse(depositCtrl.text) ?? 0,
                  note: noteCtrl.text.trim(),
                );
                if (ctx.mounted) Navigator.pop(ctx);
              },
              child: const Text('LƯU', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReservationCard extends StatelessWidget {
  final BidaReservation reservation;
  final AsyncValue<List<BidaTable>> tablesAsync;
  final Future<void> Function(BidaReservation) onCheckIn;
  final Future<void> Function(BidaReservation) onCancel;

  const _ReservationCard({
    required this.reservation,
    required this.tablesAsync,
    required this.onCheckIn,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final r = reservation;
    final isPending = r.status == BidaReservationStatus.PENDING;
    final Color statusColor;
    switch (r.status) {
      case BidaReservationStatus.PENDING:
        statusColor = Colors.orange;
        break;
      case BidaReservationStatus.CHECKED_IN:
        statusColor = Colors.green;
        break;
      case BidaReservationStatus.CANCELLED:
        statusColor = Colors.grey;
        break;
    }

    String tableName = r.tableId ?? 'Chưa chọn bàn';
    if (r.tableType != null) {
      tableName += ' (${BidaTableType.values.firstWhere((t) => t.name == r.tableType, orElse: () => BidaTableType.LIBRE).label})';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(r.customerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(8)),
                  child: Text(r.status.label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text('SĐT: ${r.customerPhone} · ${r.guestCount} người'),
            if (tableName.isNotEmpty) Text('Bàn: $tableName'),
            if (r.expectedArrival != null) Text('Giờ đến: ${_dateFmt.format(r.expectedArrival!)}'),
            if (r.deposit > 0) Text('Cọc: ${_currency.format(r.deposit)}đ', style: const TextStyle(fontWeight: FontWeight.bold)),
            if (r.note.isNotEmpty) Text('Ghi chú: ${r.note}', style: TextStyle(color: Colors.grey[600])),
            if (isPending) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    label: const Text('Hủy', style: TextStyle(color: Colors.red)),
                    onPressed: () => onCancel(r),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text('Nhận bàn', style: TextStyle(color: Colors.white)),
                    onPressed: () => onCheckIn(r),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

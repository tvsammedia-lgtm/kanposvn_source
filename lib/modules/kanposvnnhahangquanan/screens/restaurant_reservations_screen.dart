import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant_reservation.dart';
import '../models/restaurant_table.dart';
import '../providers/restaurant_providers.dart';

/// VI. Đặt bàn: danh sách đặt bàn + tạo mới + xác nhận khách đến / hủy.
class RestaurantReservationsScreen extends ConsumerStatefulWidget {
  const RestaurantReservationsScreen({super.key});

  @override
  ConsumerState<RestaurantReservationsScreen> createState() =>
      _RestaurantReservationsScreenState();
}

class _RestaurantReservationsScreenState
    extends ConsumerState<RestaurantReservationsScreen> {
  bool _showAll = false;

  Future<void> _addReservation() async {
    final tables = (ref.read(restaurantTablesProvider).value ?? [])
        .where((t) => t.status != RestaurantTableStatus.CLEANING)
        .toList();
    if (tables.isEmpty) return;

    RestaurantTable? picked;
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    DateTime time = DateTime.now().add(const Duration(hours: 1));
    int guests = 2;
    double deposit = 0;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: const Text('ĐẶT BÀN MỚI'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                DropdownButtonFormField<RestaurantTable>(
                  value: picked,
                  isExpanded: true,
                  decoration: const InputDecoration(
                      labelText: 'Bàn *', border: OutlineInputBorder()),
                  items: tables
                      .map((t) => DropdownMenuItem(
                          value: t,
                          child:
                              Text('${t.name} - ${t.zone} (${t.capacity} chỗ)')))
                      .toList(),
                  onChanged: (v) => setD(() => picked = v),
                ),
                const SizedBox(height: 8),
                TextField(
                    controller: nameCtrl,
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'Tên khách *',
                        border: OutlineInputBorder())),
                const SizedBox(height: 8),
                TextField(
                    controller: phoneCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: 'Điện thoại',
                        border: OutlineInputBorder())),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.event),
                  title:
                      Text('Thời gian: ${time.toString().substring(0, 16)}'),
                  onTap: () async {
                    final date = await showDatePicker(
                        context: ctx,
                        initialDate: time,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 60)));
                    if (date != null && ctx.mounted) {
                      final t = await showTimePicker(
                          context: ctx,
                          initialTime: TimeOfDay.fromDateTime(time));
                      if (t != null) {
                        setD(() => time = DateTime(
                            date.year, date.month, date.day, t.hour, t.minute));
                      }
                    }
                  },
                ),
                Row(children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: guests.clamp(1, 20),
                      decoration: const InputDecoration(
                          labelText: 'Số người', border: OutlineInputBorder()),
                      items: List.generate(20, (i) => i + 1)
                          .map((n) => DropdownMenuItem(
                              value: n, child: Text('$n người')))
                          .toList(),
                      onChanged: (v) => guests = v ?? 2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: '',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Đặt cọc (đ)',
                          hintText: '0',
                          helperText:
                              deposit > 0 ? 'Cọc: ${deposit.toStringAsFixed(0)}' : null,
                          border: const OutlineInputBorder()),
                      onChanged: (v) =>
                          deposit = double.tryParse(v.trim()) ?? 0,
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                TextField(
                    controller: noteCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Ghi chú', border: OutlineInputBorder())),
              ]),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: picked == null ||
                        nameCtrl.text.trim().isEmpty
                    ? null
                    : () => Navigator.pop(ctx, true),
                child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true || picked == null || !mounted) return;
    await ref.read(restaurantReservationsProvider.notifier).addReservation(
          table: picked!,
          customerName: nameCtrl.text.trim(),
          phone: phoneCtrl.text.trim(),
          time: time,
          guests: guests,
          deposit: deposit,
          note: noteCtrl.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final resAsync = ref.watch(restaurantReservationsProvider);
    final now = DateTime.now();
    final startToday = DateTime(now.year, now.month, now.day);
    final endToday = startToday.add(const Duration(days: 1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản Lý Đặt Bàn'),
        actions: [
          SwitchListTile(
            title: const Text('Hiện tất cả'),
            value: _showAll,
            dense: true,
            onChanged: (v) => setState(() => _showAll = v),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilledButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Đặt bàn'),
              onPressed: _addReservation,
            ),
          ),
        ],
      ),
      body: resAsync.when(
        data: (reservations) {
          final list = _showAll
              ? reservations
              : reservations
                  .where((r) =>
                      !r.time.isBefore(startToday) &&
                      r.time.isBefore(endToday))
                  .toList();
          if (list.isEmpty) {
            return const Center(child: Text('Không có lịch đặt bàn nào.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) {
              final r = list[i];
              final color = switch (r.status) {
                RestaurantReservationStatus.BOOKED => Colors.blue,
                RestaurantReservationStatus.SEATED => Colors.green,
                RestaurantReservationStatus.CANCELLED => Colors.grey,
                RestaurantReservationStatus.NO_SHOW => Colors.red,
              };
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: color,
                      child: const Icon(Icons.event_seat, color: Colors.white)),
                  title: Text(
                      '${r.customerName} • ${r.tableName} • ${r.guests} người',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      '${r.time.toString().substring(0, 16)} • SĐT: ${r.phone.isEmpty ? "-" : r.phone}'
                      '${r.deposit > 0 ? " • Cọc: ${r.deposit.toStringAsFixed(0)}đ" : ""}'
                      '${r.note.isNotEmpty ? "\nGhi chú: ${r.note}" : ""}\n${r.status.label}'),
                  isThreeLine: true,
                  trailing: r.status == RestaurantReservationStatus.BOOKED
                      ? PopupMenuButton<String>(
                          onSelected: (v) {
                            ref
                                .read(restaurantReservationsProvider.notifier)
                                .setStatus(
                                    r,
                                    v == 'seated'
                                        ? RestaurantReservationStatus.SEATED
                                        : v == 'cancel'
                                            ? RestaurantReservationStatus
                                                .CANCELLED
                                            : RestaurantReservationStatus
                                                .NO_SHOW);
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                                value: 'seated',
                                child: Text('Khách đã đến (vào bàn)')),
                            PopupMenuItem(
                                value: 'noshow',
                                child: Text('Khách không đến')),
                            PopupMenuItem(
                                value: 'cancel', child: Text('Hủy đặt bàn')),
                          ],
                        )
                      : Chip(label: Text(r.status.label)),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_providers.dart';
import '../models/restaurant_table.dart';
import '../models/restaurant_order.dart';
import 'restaurant_pos_screen.dart';

class RestaurantTablesScreen extends ConsumerStatefulWidget {
  const RestaurantTablesScreen({super.key});

  @override
  ConsumerState<RestaurantTablesScreen> createState() => _RestaurantTablesScreenState();
}

class _RestaurantTablesScreenState extends ConsumerState<RestaurantTablesScreen> {
  String _selectedZone = 'Tất cả';

  Color _statusColor(RestaurantTableStatus status) {
    switch (status) {
      case RestaurantTableStatus.EMPTY:
        return Colors.green[400]!;
      case RestaurantTableStatus.SERVING:
        return Colors.red[400]!;
      case RestaurantTableStatus.WAITING_PAYMENT:
        return Colors.orange[400]!;
      case RestaurantTableStatus.RESERVED:
        return Colors.blue[400]!;
      case RestaurantTableStatus.CLEANING:
        return Colors.blueGrey[300]!;
    }
  }

  Future<void> _openPos(RestaurantTable table) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RestaurantPosScreen(table: table)),
    );
  }

  /// XIX. Chuyển / Gộp bàn.
  Future<void> _transferOrMerge(RestaurantTable source,
      {required bool merge}) async {
    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is! AsyncData) return;
    final orders = ordersAsync.value!;
    RestaurantOrder? order;
    for (final o in orders) {
      if (o.status == RestaurantOrderStatus.SERVING && o.table.value?.id == source.id) {
        order = o;
        break;
      }
    }
    if (order == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Bàn ${source.name} không có order đang phục vụ.'),
          backgroundColor: Colors.orange));
      return;
    }
    final targets = (ref.read(restaurantTablesProvider).value ?? [])
        .where((t) =>
            t.id != source.id &&
            t.status != RestaurantTableStatus.RESERVED &&
            t.status != RestaurantTableStatus.CLEANING)
        .toList();

    final picked = await showDialog<RestaurantTable>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(merge ? 'GỘP BÀN - ${source.name}' : 'CHUYỂN BÀN - ${source.name}'),
        content: SizedBox(
          width: 360,
          height: 420,
          child: StatefulBuilder(builder: (ctx, setD) {
            String zone = 'Tất cả';
            return StatefulBuilder(builder: (ctx, setD2) {
              final list = zone == 'Tất cả'
                  ? targets
                  : targets.where((t) => t.zone == zone).toList();
              return Column(children: [
                DropdownButtonFormField<String>(
                  value: zone,
                  decoration: const InputDecoration(
                      labelText: 'Khu vực', border: OutlineInputBorder()),
                  items: ['Tất cả', ...targets.map((t) => t.zone).toSet()]
                      .map((z) => DropdownMenuItem(value: z, child: Text(z)))
                      .toList(),
                  onChanged: (v) => setD2(() => zone = v ?? 'Tất cả'),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, i) {
                      final t = list[i];
                      return ListTile(
                        leading: Icon(Icons.table_restaurant,
                            color: _statusColor(t.status)),
                        title: Text(t.name),
                        subtitle: Text('${t.zone} • ${t.capacity} khách • ${t.status.label}'),
                        onTap: () => Navigator.pop(ctx, t),
                      );
                    },
                  ),
                ),
              ]);
            });
          }),
        ),
      ),
    );
    if (picked == null || !mounted) return;

    final notifier = ref.read(restaurantOrdersProvider.notifier);
    if (merge && picked.status == RestaurantTableStatus.SERVING) {
      // Gộp 2 order đang phục vụ
      final targetOrder = await notifier.findActiveOrderOnTable(picked);
      if (targetOrder == null) return;
      await notifier.mergeOrders(order, targetOrder);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('Đã gộp ${source.name} vào ${picked.name}.'),
            backgroundColor: Colors.green));
      }
    } else {
      final ok = await notifier.transferTable(order, picked);
      if (mounted && !ok) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Bàn ${picked.name} đang có khách!'),
            backgroundColor: Colors.red));
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Đã chuyển sang ${picked.name}.'),
            backgroundColor: Colors.green));
      }
    }
  }

  /// VI. Đặt bàn nhanh từ sơ đồ.
  Future<void> _reserveTable(RestaurantTable table) async {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    DateTime time = DateTime.now().add(const Duration(hours: 1));
    int guests = table.capacity > 0 ? table.capacity ~/ 2 + 1 : 4;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('ĐẶT BÀN - ${table.name}'),
        content: SizedBox(
          width: 380,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
                controller: nameCtrl,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Tên khách *', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'Điện thoại', border: OutlineInputBorder())),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.event),
              title: Text('Thời gian: ${time.toString().substring(0, 16)}'),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final date = await showDatePicker(
                    context: ctx,
                    initialDate: time,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 60)));
                if (date != null && ctx.mounted) {
                  final t = await showTimePicker(
                      context: ctx,
                      initialTime: TimeOfDay.fromDateTime(time));
                  if (t != null) {
                    time = DateTime(date.year, date.month, date.day, t.hour, t.minute);
                  }
                }
              },
            ),
            DropdownButtonFormField<int>(
              value: guests.clamp(1, 30),
              decoration: const InputDecoration(
                  labelText: 'Số người', border: OutlineInputBorder()),
              items: List.generate(20, (i) => i + 1)
                  .map((n) => DropdownMenuItem(value: n, child: Text('$n người')))
                  .toList(),
              onChanged: (v) => guests = v ?? 4,
            ),
            const SizedBox(height: 8),
            TextField(
                controller: noteCtrl,
                decoration: const InputDecoration(
                    labelText: 'Ghi chú', border: OutlineInputBorder())),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true), child: const Text('Đặt bàn')),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    await ref.read(restaurantReservationsProvider.notifier).addReservation(
          table: table,
          customerName: nameCtrl.text.trim(),
          phone: phoneCtrl.text.trim(),
          time: time,
          guests: guests,
          note: noteCtrl.text.trim(),
        );
  }

  Future<void> _showTableMenu(RestaurantTable table) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (table.status == RestaurantTableStatus.SERVING ||
              table.status == RestaurantTableStatus.WAITING_PAYMENT) ...[
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: const Text('Chuyển bàn'),
              onTap: () => Navigator.pop(ctx, 'transfer'),
            ),
            ListTile(
              leading: const Icon(Icons.merge),
              title: const Text('Gộp bàn'),
              onTap: () => Navigator.pop(ctx, 'merge'),
            ),
          ],
          if (table.status == RestaurantTableStatus.EMPTY ||
              table.status == RestaurantTableStatus.RESERVED)
            ListTile(
              leading: const Icon(Icons.event_available),
              title: const Text('Đặt trước bàn này'),
              onTap: () => Navigator.pop(ctx, 'reserve'),
            ),
          if (table.status == RestaurantTableStatus.SERVING)
            ListTile(
              leading: const Icon(Icons.pending_actions),
              title: const Text('Chuyển sang Chờ thanh toán'),
              onTap: () => Navigator.pop(ctx, 'wait_payment'),
            ),
          if (table.status == RestaurantTableStatus.WAITING_PAYMENT)
            ListTile(
              leading: const Icon(Icons.checkroom),
              title: const Text('Về trạng thái Dọn bàn'),
              onTap: () => Navigator.pop(ctx, 'cleaning'),
            ),
          if (table.status == RestaurantTableStatus.CLEANING)
            ListTile(
              leading: const Icon(Icons.cleaning_services),
              title: const Text('Dọn xong - Sẵn sàng đón khách'),
              onTap: () => Navigator.pop(ctx, 'done_cleaning'),
            ),
        ]),
      ),
    );
    if (action == null || !mounted) return;
    final tables = ref.read(restaurantTablesProvider.notifier);
    switch (action) {
      case 'transfer':
        await _transferOrMerge(table, merge: false);
        break;
      case 'merge':
        await _transferOrMerge(table, merge: true);
        break;
      case 'reserve':
        await _reserveTable(table);
        break;
      case 'wait_payment':
        await tables.setTableStatus(table, RestaurantTableStatus.WAITING_PAYMENT);
        break;
      case 'cleaning':
        await tables.setTableStatus(table, RestaurantTableStatus.CLEANING);
        break;
      case 'done_cleaning':
        await tables.setTableStatus(table, RestaurantTableStatus.EMPTY);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tablesAsync = ref.watch(restaurantTablesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Bàn - Nhà Hàng')),
      body: tablesAsync.when(
        data: (tables) {
          if (tables.isEmpty) return const Center(child: Text('Chưa có bàn nào.'));

          final zones = ['Tất cả', ...tables.map((t) => t.zone).toSet()];
          final filteredTables = _selectedZone == 'Tất cả' ? tables : tables.where((t) => t.zone == _selectedZone).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8,
                  children: zones.map((zone) => ChoiceChip(
                    label: Text(zone, style: const TextStyle(fontWeight: FontWeight.bold)),
                    selected: _selectedZone == zone,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedZone = zone);
                    },
                  )).toList(),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: filteredTables.length,
                  itemBuilder: (context, index) {
                    final table = filteredTables[index];
                    final bgColor = _statusColor(table.status);

                    return InkWell(
                      onLongPress: () => _showTableMenu(table),
                      onTap: () {
                        if (table.status == RestaurantTableStatus.CLEANING ||
                            table.status == RestaurantTableStatus.RESERVED) {
                          _showTableMenu(table);
                        } else {
                          _openPos(table);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.table_restaurant, size: 40, color: Colors.white),
                            const SizedBox(height: 8),
                            Text(table.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                            const SizedBox(height: 4),
                            Text('${table.zone} • ${table.capacity} chỗ', style: const TextStyle(color: Colors.white70)),
                            Text(table.status.label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 16,
                  children: [
                    for (final s in RestaurantTableStatus.values)
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(width: 14, height: 14, color: _statusColor(s)),
                        const SizedBox(width: 4),
                        Text(s.label),
                      ]),
                    const Text('(giữ chuột trên bàn để mở menu: chuyển/gộp/đặt bàn...)'),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

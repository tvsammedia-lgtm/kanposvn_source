import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_vehicle.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 7-8: Bán vé + sơ đồ ghế (trống/đã bán/giữ chỗ, không bán trùng).
class VantaiTicketingScreen extends ConsumerStatefulWidget {
  const VantaiTicketingScreen({super.key});

  @override
  ConsumerState<VantaiTicketingScreen> createState() =>
      _VantaiTicketingScreenState();
}

class _VantaiTicketingScreenState extends ConsumerState<VantaiTicketingScreen> {
  VantaiTrip? _selectedTrip;
  bool _showPast = false;

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
  static final _timeFmt = DateFormat('dd/MM HH:mm');

  Future<void> _bookSeat(String seatNumber) async {
    if (_selectedTrip == null) return;
    final route = _selectedTrip!.route.value;
    final vehicle = _selectedTrip!.vehicle.value;
    final basePrice = route?.basePrice ?? 0;
    final price = vehicle?.type == VehicleType.LIMOUSINE
        ? basePrice * 1.4
        : basePrice;

    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    TicketPaymentMethod pay = TicketPaymentMethod.CASH;

    final ok = await showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: Text('BÁN VÉ GHẾ $seatNumber'),
          content: SizedBox(
            width: 380,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Chuyến: ${route?.routeName} - ${_selectedTrip!.departureTime != null ? _timeFmt.format(_selectedTrip!.departureTime!) : ""}'),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Giá vé: ${_money.format(price)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16)),
              ),
              const SizedBox(height: 12),
              TextField(
                  controller: nameCtrl,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: 'Họ tên khách *',
                      border: OutlineInputBorder())),
              const SizedBox(height: 8),
              TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Số điện thoại',
                      border: OutlineInputBorder())),
              const SizedBox(height: 8),
              DropdownButtonFormField<TicketPaymentMethod>(
                value: pay,
                isExpanded: true,
                decoration: const InputDecoration(
                    labelText: 'Thanh toán', border: OutlineInputBorder()),
                items: TicketPaymentMethod.values
                    .map((m) => DropdownMenuItem(value: m, child: Text(m.label)))
                    .toList(),
                onChanged: (v) => setD(() => pay = v ?? pay),
              ),
              if (pay == TicketPaymentMethod.DEBT)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text('Vé công nợ sẽ ghi nợ vào khách hàng.',
                      style: TextStyle(color: Colors.orange)),
                ),
            ]),
          ),
          actions: [
            // Giữ chỗ trước, thu tiền sau
            TextButton(
              onPressed: nameCtrl.text.trim().isEmpty
                  ? null
                  : () => Navigator.pop(ctx, 'reserve'),
              child: const Text('Giữ chỗ'),
            ),
            FilledButton.icon(
              icon: const Icon(Icons.payments),
              label: const Text('Thu & In vé'),
              onPressed: nameCtrl.text.trim().isEmpty
                  ? null
                  : () => Navigator.pop(ctx, 'paid'),
            ),
          ],
        ),
      ),
    );
    if (ok == null || !mounted) return;

    final customer = VantaiCustomer()
      ..customerId = const Uuid().v4()
      ..name = nameCtrl.text.trim()
      ..phone = phoneCtrl.text.trim();

    final ticket = VantaiTicket()
      ..ticketId = const Uuid().v4()
      ..ticketCode = VantaiBusinessLogic.newTicketCode(
          DateTime.now(), DateTime.now().millisecondsSinceEpoch.toRadixString(16))
      ..departureTime = _selectedTrip!.departureTime
      ..seatNumber = seatNumber
      ..price = price
      ..status = ok == 'paid'
          ? TicketStatus.PAID
          : TicketStatus.RESERVED
      ..paymentMethod = pay
      ..bookingDate = DateTime.now()
      ..passengerName = customer.name
      ..passengerPhone = customer.phone;
    ticket.trip.value = _selectedTrip;
    ticket.route.value = route;
    ticket.vehicle.value = vehicle;
    ticket.customer.value = customer;

    await ref.read(vantaiTicketsProvider.notifier).bookTicket(ticket);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(ok == 'paid'
              ? 'Đã bán vé ${ticket.ticketCode}!'
              : 'Đã giữ ghế $seatNumber.'),
          backgroundColor: Colors.green));
    }
  }

  Future<void> _manageTicket(VantaiTicket ticket) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text('${ticket.ticketCode} • Ghế ${ticket.seatNumber}'),
            subtitle: Text(
                '${ticket.passengerName} (${ticket.passengerPhone})\n${_money.format(ticket.price)} • ${ticket.status.label} • ${ticket.paymentMethod.label}'),
            isThreeLine: true,
          ),
          const Divider(height: 1),
          if (ticket.status == TicketStatus.RESERVED)
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: const Text('Xác nhận đã thanh toán'),
              onTap: () => Navigator.pop(ctx, 'pay_cash'),
            ),
          if (ticket.status != TicketStatus.CANCELLED)
            ListTile(
              leading: const Icon(Icons.cancel, color: Colors.red),
              title: const Text('Hủy vé (nhả ghế)'),
              onTap: () => Navigator.pop(ctx, 'cancel'),
            ),
        ]),
      ),
    );
    if (action == null || !mounted) return;
    final notifier = ref.read(vantaiTicketsProvider.notifier);
    if (action == 'cancel') {
      await notifier.cancelTicket(ticket);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đã hủy vé, ghế được bán lại.')));
      }
    } else if (action == 'pay_cash') {
      await notifier.markPaid(ticket, TicketPaymentMethod.CASH);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Đã thu tiền vé!'), backgroundColor: Colors.green));
      }
    }
  }

  Widget _buildSeatMap(List<VantaiTicket> tripTickets, VantaiVehicle vehicle) {
    final seats = VantaiBusinessLogic.generateSeatMap(
        vehicle.type, vehicle.totalSeats);

    Widget seatCell(String seat) {
      final ticket = tripTickets
          .cast<VantaiTicket?>()
          .firstWhere((t) => t!.seatNumber == seat, orElse: () => null);
      final sold = ticket?.status == TicketStatus.PAID;
      final reserved = ticket?.status == TicketStatus.RESERVED;
      Color bg = Colors.green[400]!;
      String label = seat;
      if (sold) bg = Colors.red[400]!;
      if (reserved) bg = Colors.amber[400]!;
      return InkWell(
        onTap: (sold || reserved) ? () => _manageTicket(ticket!) : () => _bookSeat(seat),
        onLongPress: (sold || reserved) ? null : null,
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26),
          ),
          child: Center(
            child: Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ),
        ),
      );
    }

    if (vehicle.type == VehicleType.SLEEPER && seats.isNotEmpty) {
      final lower = seats.where((s) => s.endsWith('D')).toList();
      final upper = seats.where((s) => s.endsWith('T')).toList();
      Widget floor(String title, List<String> list) => Expanded(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal)),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, i) => seatCell(list[i]),
                ),
              ),
            ]),
          );
      return Row(
        children: [
          floor('Tầng Dưới', lower),
          const VerticalDivider(width: 1),
          floor('Tầng Trên', upper),
        ],
      );
    }

    // Ghế ngồi / limousine / xe tải: 4 ghế một hàng
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: seats.length,
      itemBuilder: (_, i) => seatCell(seats[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripsAsync = ref.watch(vantaiTripsProvider);
    final ticketsAsync = ref.watch(vantaiTicketsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bán Vé & Sơ Đồ Ghế')),
      body: Row(
        children: [
          // Left panel: Trip selection
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Chọn Chuyến Xe',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Hiện cả chuyến đã chạy/hủy'),
                    value: _showPast,
                    onChanged: (v) => setState(() => _showPast = v),
                  ),
                  Expanded(
                    child: tripsAsync.when(
                      data: (trips) {
                        final now = DateTime.now();
                        final open = trips.where((t) {
                          if (_showPast) return true;
                          if (t.status == TripStatus.CANCELLED ||
                              t.status == TripStatus.COMPLETED) {
                            return false;
                          }
                          return true;
                        }).toList()
                          ..sort((a, b) => (a.departureTime ?? now)
                              .compareTo(b.departureTime ?? now));
                        return ListView.builder(
                          itemCount: open.length,
                          itemBuilder: (_, i) {
                            final t = open[i];
                            final selected = _selectedTrip?.id == t.id;
                            return Card(
                              color: selected ? Colors.teal[50] : null,
                              child: ListTile(
                                dense: true,
                                selected: selected,
                                leading: Icon(
                                    switch (t.status) {
                                      TripStatus.RUNNING => Icons.directions_bus,
                                      TripStatus.SCHEDULED => Icons.schedule,
                                      TripStatus.COMPLETED =>
                                        Icons.check_circle_outline,
                                      TripStatus.CANCELLED => Icons.cancel,
                                    },
                                    color: switch (t.status) {
                                      TripStatus.RUNNING => Colors.orange,
                                      TripStatus.SCHEDULED => Colors.blue,
                                      TripStatus.COMPLETED => Colors.green,
                                      TripStatus.CANCELLED => Colors.red,
                                    }),
                                title: Text(t.route.value?.routeName ?? '?',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                subtitle: Text(t.departureTime != null
                                    ? '${_timeFmt.format(t.departureTime!)} • Xe ${t.vehicle.value?.plateNumber}'
                                    : 'Chưa có giờ'),
                                onTap: () => setState(() => _selectedTrip = t),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('Lỗi tải chuyến'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.grey[200],
                    child: Column(children: [
                      Row(children: [
                        Container(
                            width: 18,
                            height: 18,
                            color: Colors.green[400]),
                        const SizedBox(width: 8),
                        const Text('Trống'),
                        const SizedBox(width: 12),
                        Container(
                            width: 18,
                            height: 18,
                            color: Colors.amber[400]),
                        const SizedBox(width: 8),
                        const Text('Giữ chỗ'),
                      ]),
                      const SizedBox(height: 6),
                      Row(children: [
                        Container(width: 18, height: 18, color: Colors.red[400]),
                        const SizedBox(width: 8),
                        const Text('Đã bán'),
                        const SizedBox(width: 12),
                        const Text('(chạm vé để quản lý)'),
                      ]),
                    ]),
                  )
                ],
              ),
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Right panel: Seat map
          Expanded(
            flex: 3,
            child: _selectedTrip == null
                ? const Center(
                    child: Text('Vui lòng chọn Chuyến xe để xem Sơ đồ ghế.',
                        style: TextStyle(fontSize: 18, color: Colors.grey)))
                : ticketsAsync.when(
                    data: (tickets) {
                      final tripTickets = tickets
                          .where((t) => t.trip.value?.id == _selectedTrip!.id)
                          .toList();
                      final vehicle = _selectedTrip!.vehicle.value;
                      if (vehicle == null) {
                        return const Center(child: Text('Chưa phân bổ xe'));
                      }
                      final soldCount = tripTickets
                          .where((t) =>
                              t.status == TicketStatus.PAID ||
                              t.status == TicketStatus.RESERVED)
                          .length;
                      return Column(children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          color: Colors.teal[700],
                          child: Text(
                            '${_selectedTrip!.route.value?.routeName} • '
                            '${_selectedTrip!.departureTime != null ? _timeFmt.format(_selectedTrip!.departureTime!) : ""} • '
                            'Xe ${vehicle.plateNumber} • Đã bán $soldCount/${vehicle.totalSeats}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: _buildSeatMap(tripTickets, vehicle)),
                      ]);
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, st) => Center(child: Text('Lỗi: $err')),
                  ),
          )
        ],
      ),
    );
  }
}

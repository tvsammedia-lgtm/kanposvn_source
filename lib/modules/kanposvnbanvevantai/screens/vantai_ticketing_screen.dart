import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_vehicle.dart';

class VantaiTicketingScreen extends ConsumerStatefulWidget {
  const VantaiTicketingScreen({super.key});

  @override
  ConsumerState<VantaiTicketingScreen> createState() => _VantaiTicketingScreenState();
}

class _VantaiTicketingScreenState extends ConsumerState<VantaiTicketingScreen> {
  VantaiTrip? _selectedTrip;

  void _bookSeat(String seatNumber) {
    if (_selectedTrip == null) return;

    final customerNameCtrl = TextEditingController();
    final customerPhoneCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Đặt vé ghế $seatNumber'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Chuyến: ${_selectedTrip!.route.value?.routeName}'),
            Text('Giá vé: ${_selectedTrip!.route.value?.basePrice} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 16),
            TextField(controller: customerNameCtrl, decoration: const InputDecoration(labelText: 'Tên Khách Hàng')),
            TextField(controller: customerPhoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () async {
              final customer = VantaiCustomer()
                ..customerId = const Uuid().v4()
                ..name = customerNameCtrl.text
                ..phone = customerPhoneCtrl.text;

              final ticket = VantaiTicket()
                ..ticketId = const Uuid().v4()
                ..ticketCode = 'TK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
                ..seatNumber = seatNumber
                ..price = _selectedTrip!.route.value?.basePrice ?? 0
                ..status = TicketStatus.PAID
                ..bookingDate = DateTime.now();

              ticket.trip.value = _selectedTrip;
              ticket.route.value = _selectedTrip!.route.value;
              ticket.vehicle.value = _selectedTrip!.vehicle.value;
              ticket.customer.value = customer;

              await ref.read(vantaiTicketsProvider.notifier).bookTicket(ticket);
              if (context.mounted) {
                // ignore: use_build_context_synchronously
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đặt vé thành công!')));
              }
            },
            child: const Text('Thanh Toán'),
          )
        ],
      )
    );
  }

  Widget _buildSleeperSeatMap(List<String> bookedSeats, int totalSeats) {
    // Sleeper bus: 2 floors, 3 rows (A,B,C)
    final seatsPerFloor = totalSeats ~/ 2;
    final seatsPerRow = seatsPerFloor ~/ 3;
    
    return Row(
      children: [
        Expanded(child: _buildFloor('Tầng Dưới', 'D', seatsPerRow, bookedSeats)),
        const VerticalDivider(),
        Expanded(child: _buildFloor('Tầng Trên', 'T', seatsPerRow, bookedSeats)),
      ],
    );
  }

  Widget _buildFloor(String title, String floorSuffix, int seatsPerRow, List<String> bookedSeats) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 rows: A, B, C
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: seatsPerRow * 3,
            itemBuilder: (context, index) {
              final rowIdx = index % 3;
              final colIdx = index ~/ 3;
              final rowName = String.fromCharCode(65 + rowIdx); // A, B, C
              final seatName = '$rowName${(colIdx + 1).toString().padLeft(2, '0')}$floorSuffix';
              final isBooked = bookedSeats.contains(seatName);

              return InkWell(
                onTap: isBooked ? null : () => _bookSeat(seatName),
                child: Container(
                  decoration: BoxDecoration(
                    color: isBooked ? Colors.red[400] : Colors.green[400],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Center(
                    child: Text(
                      seatName,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNormalSeatMap(List<String> bookedSeats, int totalSeats) {
    return GridView.builder(
      padding: const EdgeInsets.all(32),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: totalSeats,
      itemBuilder: (context, index) {
        final row = String.fromCharCode(65 + (index ~/ 4));
        final col = (index % 4) + 1;
        final seatName = '$row${col.toString().padLeft(2, '0')}';
        final isBooked = bookedSeats.contains(seatName);

        return InkWell(
          onTap: isBooked ? null : () => _bookSeat(seatName),
          child: Container(
            decoration: BoxDecoration(
              color: isBooked ? Colors.red[400] : Colors.green[400],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(
                seatName,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        );
      },
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
                  const Text('Chọn Chuyến Xe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  tripsAsync.when(
                    data: (trips) => DropdownButton<VantaiTrip>(
                      isExpanded: true,
                      hint: const Text('Chọn chuyến đang mở bán...'),
                      value: _selectedTrip,
                      items: trips.map((t) => DropdownMenuItem(value: t, child: Text('${t.route.value?.routeName} - ${t.departureTime?.hour}:${t.departureTime?.minute}'))).toList(),
                      onChanged: (val) => setState(() => _selectedTrip = val),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (_, __) => const Text('Lỗi tải chuyến'),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Row(children: [Container(width: 20, height: 20, color: Colors.green), const SizedBox(width: 8), const Text('Ghế trống')]),
                        const SizedBox(height: 8),
                        Row(children: [Container(width: 20, height: 20, color: Colors.red), const SizedBox(width: 8), const Text('Đã bán')]),
                      ],
                    ),
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
                ? const Center(child: Text('Vui lòng chọn Chuyến xe để xem Sơ đồ ghế.', style: TextStyle(fontSize: 18, color: Colors.grey)))
                : ticketsAsync.when(
                    data: (tickets) {
                      final bookedSeats = tickets
                          .where((t) => t.trip.value?.id == _selectedTrip!.id)
                          .map((t) => t.seatNumber)
                          .toList();
                          
                      final vehicle = _selectedTrip!.vehicle.value;
                      if (vehicle == null) return const Center(child: Text('Chưa phân bổ xe'));

                      if (vehicle.type == VehicleType.SLEEPER) {
                        return _buildSleeperSeatMap(bookedSeats, vehicle.totalSeats);
                      } else {
                        return _buildNormalSeatMap(bookedSeats, vehicle.totalSeats);
                      }
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, st) => Center(child: Text('Lỗi: $err')),
                  ),
          )
        ],
      ),
    );
  }
}

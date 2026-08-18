import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/hotel_providers.dart';
import '../models/hotel_booking.dart';
import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_room.dart';

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({super.key});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final bookingsAsyncValue = ref.watch(hotelBookingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lễ tân / Đặt phòng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(hotelBookingsProvider.notifier).loadBookings();
              ref.read(hotelRoomsProvider.notifier).loadRooms();
            },
          )
        ],
      ),
      body: bookingsAsyncValue.when(
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(child: Text('Chưa có lịch đặt phòng nào.\nNhấn + để tạo đặt phòng mới.', textAlign: TextAlign.center));
          }
          return ListView.builder(
            itemCount: bookings.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final booking = bookings[index];
              final isPending = booking.status == ReservationStatus.PENDING;
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: isPending ? Colors.orange : booking.status == ReservationStatus.CHECKED_IN ? Colors.green : Colors.grey,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(booking.customerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text('SĐT: ${booking.customerPhone} • Phòng: ${booking.room.value?.roomName ?? "Chưa chọn"}'),
                                Text('Check-in: ${_formatDate(booking.expectedCheckIn)} → Check-out: ${_formatDate(booking.expectedCheckOut)}'),
                                Text('Nguồn: ${booking.source.label} • ${booking.guestCount} khách • Cọc: ${booking.depositAmount.toStringAsFixed(0)}đ'),
                                if (booking.note.isNotEmpty) Text('Ghi chú: ${booking.note}', style: const TextStyle(fontStyle: FontStyle.italic)),
                                Text('Trạng thái: ${booking.status.label}', style: TextStyle(color: isPending ? Colors.orange : Colors.green, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (isPending) ...[
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              icon: const Icon(Icons.login, color: Colors.white, size: 16),
                              label: const Text('Check-in', style: TextStyle(color: Colors.white)),
                              onPressed: () => _checkInFromBooking(booking),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              icon: const Icon(Icons.cancel, color: Colors.white, size: 16),
                              label: const Text('Hủy', style: TextStyle(color: Colors.white)),
                              onPressed: () => _cancelBooking(booking),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddBookingDialog(context, ref),
        label: const Text('Đặt phòng mới'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Chưa xác định';
    final d = date.toLocal();
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  void _checkInFromBooking(RoomReservation booking) async {
    final room = booking.room.value;
    if (room == null) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chưa chọn phòng cho đặt phòng này')));
      return;
    }
    // Navigate to rooms screen or auto check-in
    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.OCCUPIED);
    await ref.read(hotelCheckInsProvider.notifier).createCheckIn(
      room: room,
      rentalType: RentalType.DAILY,
      customerName: booking.customerName,
      customerPhone: booking.customerPhone,
      prePaid: booking.depositAmount,
      expectedCheckOut: booking.expectedCheckOut,
    );
    // Update booking status
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    await db.writeTxn(() async {
      final b = await db.roomReservations.get(booking.id);
      if (b != null) {
        b.status = ReservationStatus.CHECKED_IN;
        b.updatedAt = DateTime.now();
        await db.roomReservations.put(b);
      }
    });
    ref.read(hotelBookingsProvider.notifier).loadBookings();
    ref.read(hotelCheckInsProvider.notifier).loadCheckIns();
    ref.read(hotelRoomsProvider.notifier).loadRooms();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã nhận phòng ${room.roomName}')));
    }
  }

  void _cancelBooking(RoomReservation booking) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hủy đặt phòng?'),
        content: Text('Hủy đặt phòng của ${booking.customerName}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Hủy đặt phòng', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
    if (confirmed != true) return;
    final isarService = ref.read(hotelIsarServiceProvider);
    final db = await isarService.db;
    await db.writeTxn(() async {
      final b = await db.roomReservations.get(booking.id);
      if (b != null) {
        b.status = ReservationStatus.CANCELLED;
        b.updatedAt = DateTime.now();
        await db.roomReservations.put(b);
      }
    });
    // Release room
    final room = booking.room.value;
    if (room != null) {
      ref.read(hotelRoomsProvider.notifier).updateRoomStatus(room.id, RoomStatus.AVAILABLE);
    }
    ref.read(hotelBookingsProvider.notifier).loadBookings();
  }

  void _showAddBookingDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    final guestCtrl = TextEditingController(text: '1');
    final depositCtrl = TextEditingController();
    HotelRoom? selectedRoom;
    BookingSource source = BookingSource.walkIn;
    DateTime checkInDate = DateTime.now();
    DateTime checkOutDate = DateTime.now().add(const Duration(days: 1));

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            final roomsData = ref.read(hotelRoomsProvider).valueOrNull ?? <HotelRoom>[];
            final availableRooms = roomsData.where((r) => r.status == RoomStatus.AVAILABLE).toList();

            return AlertDialog(
              title: const Text('Tạo Đặt phòng mới'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Tên khách hàng *', border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại *', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
                    const SizedBox(height: 8),
                    TextField(controller: guestCtrl, decoration: const InputDecoration(labelText: 'Số khách', border: OutlineInputBorder()), keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                    const SizedBox(height: 8),
                    TextField(controller: depositCtrl, decoration: const InputDecoration(labelText: 'Tiền cọc (đ)', border: OutlineInputBorder()), keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                    const SizedBox(height: 12),

                    // Room selection
                    DropdownButtonFormField<String>(
                      value: selectedRoom?.roomId,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Chọn phòng *', border: OutlineInputBorder()),
                      items: availableRooms.map((r) => DropdownMenuItem(
                        value: r.roomId,
                        child: Text('${r.roomName} - ${r.roomType.value?.typeName ?? ""}'),
                      )).toList(),
                      onChanged: (v) => setState(() => selectedRoom = availableRooms.firstWhere((r) => r.roomId == v)),
                    ),
                    const SizedBox(height: 12),

                    // Source
                    DropdownButtonFormField<BookingSource>(
                      value: source,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Nguồn đặt', border: OutlineInputBorder()),
                      items: BookingSource.values.map((s) => DropdownMenuItem(value: s, child: Text(s.label))).toList(),
                      onChanged: (v) => setState(() => source = v ?? BookingSource.walkIn),
                    ),
                    const SizedBox(height: 12),

                    // Dates
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Check-in', style: TextStyle(fontSize: 12)),
                            subtitle: Text('${checkInDate.day}/${checkInDate.month}/${checkInDate.year}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            trailing: const Icon(Icons.calendar_today, size: 18),
                            onTap: () async {
                              final picked = await showDatePicker(context: context, initialDate: checkInDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
                              if (picked != null) setState(() => checkInDate = picked);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Check-out', style: TextStyle(fontSize: 12)),
                            subtitle: Text('${checkOutDate.day}/${checkOutDate.month}/${checkOutDate.year}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            trailing: const Icon(Icons.calendar_today, size: 18),
                            onTap: () async {
                              final picked = await showDatePicker(context: context, initialDate: checkOutDate, firstDate: checkInDate, lastDate: DateTime.now().add(const Duration(days: 365)));
                              if (picked != null) setState(() => checkOutDate = picked);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(controller: noteCtrl, decoration: const InputDecoration(labelText: 'Ghi chú', border: OutlineInputBorder()), maxLines: 2),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
                ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty || selectedRoom == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập tên, SĐT và chọn phòng')));
                      return;
                    }
                    final booking = RoomReservation()
                      ..reservationId = const Uuid().v4()
                      ..reservationCode = 'BK-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}'
                      ..customerName = nameCtrl.text.trim()
                      ..customerPhone = phoneCtrl.text.trim()
                      ..expectedCheckIn = checkInDate
                      ..expectedCheckOut = checkOutDate
                      ..guestCount = int.tryParse(guestCtrl.text) ?? 1
                      ..depositAmount = double.tryParse(depositCtrl.text) ?? 0
                      ..source = source
                      ..note = noteCtrl.text.trim()
                      ..status = ReservationStatus.PENDING;
                    booking.room.value = selectedRoom;

                    ref.read(hotelBookingsProvider.notifier).addBooking(booking);
                    ref.read(hotelRoomsProvider.notifier).updateRoomStatus(selectedRoom!.id, RoomStatus.RESERVED);

                    Navigator.pop(ctx);
                  },
                  child: const Text('Tạo Booking'),
                ),
              ],
            );
          }
        );
      }
    );
  }
}

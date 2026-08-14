import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/hotel_providers.dart';
import '../models/hotel_booking.dart';
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
            },
          )
        ],
      ),
      body: bookingsAsyncValue.when(
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(child: Text('Chưa có lịch đặt phòng nào.'));
          }

          return ListView.builder(
            itemCount: bookings.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${booking.customerName} - ${booking.customerPhone}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text('Phòng: ${booking.room.value?.roomName ?? "Chưa chọn"}'),
                            Text('Check-in: ${_formatDate(booking.expectedCheckIn)}'),
                            Text('Trạng thái: ${booking.status.label}'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Check-in action
                        },
                        child: const Text('Check-in'),
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
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  void _showAddBookingDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    HotelRoom? selectedRoom;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Tạo Đặt phòng mới'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(labelText: 'Tên khách hàng'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneCtrl,
                      decoration: const InputDecoration(labelText: 'Số điện thoại'),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    // Room selection placeholder
                    const Text('Phòng (Demo chỉ chọn phòng ngẫu nhiên)'),
                    ElevatedButton(
                      onPressed: () async {
                        final roomsData = ref.read(hotelRoomsProvider).valueOrNull ?? <HotelRoom>[];
                        final availableRooms = roomsData.where((r) => r.status == RoomStatus.AVAILABLE).toList();
                        if (availableRooms.isNotEmpty) {
                          setState(() {
                            selectedRoom = availableRooms.first;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không có phòng trống')));
                        }
                      },
                      child: Text(selectedRoom == null ? 'Chọn phòng' : 'Đã chọn: ${selectedRoom!.roomName}'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Hủy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.isNotEmpty && phoneCtrl.text.isNotEmpty && selectedRoom != null) {
                      final booking = RoomReservation()
                        ..reservationId = const Uuid().v4()
                        ..reservationCode = 'BK-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}'
                        ..customerName = nameCtrl.text
                        ..customerPhone = phoneCtrl.text
                        ..expectedCheckIn = DateTime.now()
                        ..expectedCheckOut = DateTime.now().add(const Duration(days: 1))
                        ..status = ReservationStatus.PENDING;
                      booking.room.value = selectedRoom;
                      
                      ref.read(hotelBookingsProvider.notifier).addBooking(booking);
                      
                      // Cập nhật trạng thái phòng
                      ref.read(hotelRoomsProvider.notifier).updateRoomStatus(selectedRoom!.id, RoomStatus.RESERVED);

                      Navigator.pop(ctx);
                    }
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

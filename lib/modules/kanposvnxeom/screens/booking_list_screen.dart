import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/booking_provider.dart';

class BookingListScreen extends ConsumerWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(xeOmBookingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Điều hành Chuyến (Booking)')),
      body: bookingState.when(
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(child: Text('Chưa có chuyến đi nào.'));
          }
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text('Mã: ${booking.bookingCode ?? "N/A"} - Khách: ${booking.customerName ?? "N/A"}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Từ: ${booking.pickupAddress ?? "N/A"}'),
                      Text('Đến: ${booking.dropoffAddress ?? "N/A"}'),
                      Text('Trạng thái: ${booking.status.name}'),
                    ],
                  ),
                  trailing: const Icon(Icons.local_taxi),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Tạo cuốc xe mới
        },
        icon: const Icon(Icons.add),
        label: const Text('Tạo chuyến'),
      ),
    );
  }
}

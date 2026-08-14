import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ride_booking_provider.dart';
import '../models/ride_booking.dart';
import 'driver_dashboard_screen.dart';

class DriverHomeScreen extends ConsumerWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(rideBookingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài xế KanRide'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverDashboardScreen())),
          ),
          Switch(
            value: true, 
            onChanged: (val) {}, 
            activeColor: Colors.green,
          )
        ],
      ),
      body: bookingState.when(
        data: (bookings) {
          // Lọc các cuốc xe đang chờ nhận
          final pendingBookings = bookings.where((b) => b.status == BookingStatus.findingDriver).toList();
          
          if (pendingBookings.isEmpty) {
            return const Center(child: Text('Đang quét các cuốc xe xung quanh...'));
          }

          return ListView.builder(
            itemCount: pendingBookings.length,
            itemBuilder: (context, index) {
              final b = pendingBookings[index];
              return Card(
                margin: const EdgeInsets.all(8),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${b.estimatedPrice} đ', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                          Text('${b.distanceKm} km', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.my_location, color: Colors.blue),
                        title: Text(b.pickupAddress ?? ''),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.location_on, color: Colors.red),
                        title: Text(b.dropoffAddress ?? ''),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Driver-001 nhận cuốc
                            ref.read(rideBookingProvider.notifier).acceptBooking(b.uuid!, 'DRIVER-001');
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã nhận cuốc! Đang điều hướng...')));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                          child: const Text('NHẬN CUỐC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}

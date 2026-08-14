import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ride_providers.dart';
import '../models/ride_booking.dart';
import 'ride_booking_screen.dart';
import 'ride_map_screen.dart';

class RideDashboardScreen extends ConsumerWidget {
  const RideDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingBookings = ref.watch(rideBookingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KanRide - Dashboard'),
        backgroundColor: const Color(0xFFFACC15), // Yellow
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFACC15)),
              child: Text('KanRide Menu', style: TextStyle(color: Colors.black, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.hail),
              title: const Text('Đặt Xe (Booking)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RideBookingScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Tài Xế'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Bản Đồ Điều Phối'),
              onTap: () {
                Navigator.pop(context);
                if (pendingBookings.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RideMapScreen(booking: pendingBookings.first)));
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsRow(pendingBookings.length),
              const SizedBox(height: 24),
              const Text('Chuyến đang chờ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildPendingBookings(pendingBookings),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const RideBookingScreen()));
        },
        backgroundColor: const Color(0xFFFACC15),
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add_location_alt),
        label: const Text('Tạo Cuốc Xe'),
      ),
    );
  }

  Widget _buildStatsRow(int pendingCount) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.amber[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.hail, color: Colors.amber, size: 32),
                  const SizedBox(height: 8),
                  Text('$pendingCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Cuốc Đang Chờ'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.local_taxi, color: Colors.green, size: 32),
                  const SizedBox(height: 8),
                  const Text('12', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Xe Online'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPendingBookings(List<RideBooking> bookings) {
    if (bookings.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text('Không có cuốc xe nào đang chờ.')),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final b = bookings[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFFACC15),
              child: Icon(Icons.location_on, color: Colors.black),
            ),
            title: Text('${b.pickupAddress} -> ${b.dropoffAddress}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Khoảng cách: ${b.distanceKm} km - Giá: ${b.estimatedPrice}đ'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => RideMapScreen(booking: b)));
            },
          ),
        );
      },
    );
  }
}

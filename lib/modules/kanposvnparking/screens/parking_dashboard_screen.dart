import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/parking_providers.dart';
import 'parking_gate_screen.dart';
import 'parking_monthly_screen.dart';
import 'parking_rental_screen.dart';

class ParkingDashboardScreen extends ConsumerWidget {
  const ParkingDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTickets = ref.watch(parkingActiveTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kan Parking - Quản lý Bãi Xe'),
        backgroundColor: const Color(0xFF0F766E), // Màu Teal đặc trưng bãi xe
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0F766E)),
              child: Text('Kan Parking Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.toll),
              title: const Text('Trạm Gác (Nhận/Trả Xe)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ParkingGateScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_membership),
              title: const Text('Vé Tháng'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ParkingMonthlyScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.car_rental),
              title: const Text('Cho Thuê Xe'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ParkingRentalScreen()));
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
              _buildStatsRow(activeTickets.length),
              const SizedBox(height: 24),
              const Text('Xe đang gửi trong bãi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildActiveVehicles(activeTickets),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ParkingGateScreen()));
        },
        backgroundColor: const Color(0xFF0F766E),
        icon: const Icon(Icons.toll),
        label: const Text('Trạm Gác'),
      ),
    );
  }

  Widget _buildStatsRow(int parkingCount) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.teal[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.directions_car, color: Colors.teal, size: 32),
                  const SizedBox(height: 8),
                  Text('$parkingCount', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Xe đang gửi'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Card(
            color: Colors.orange[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(Icons.local_parking, color: Colors.orange, size: 32),
                  const SizedBox(height: 8),
                  const Text('500', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Chỗ trống'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveVehicles(List<dynamic> tickets) {
    if (tickets.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(child: Text('Bãi xe hiện đang trống.')),
        ),
      );
    }
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tickets.take(10).length,
      itemBuilder: (context, index) {
        final t = tickets[index];
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF0F766E),
              child: Icon(Icons.directions_car, color: Colors.white),
            ),
            title: Text(t.licensePlate, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Text('Vào lúc: ${t.checkInTime.toString().substring(11, 16)}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}

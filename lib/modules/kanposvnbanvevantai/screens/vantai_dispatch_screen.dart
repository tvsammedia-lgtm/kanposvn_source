import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vantai_trip.dart';
import '../providers/vantai_providers.dart';

class VantaiDispatchScreen extends ConsumerWidget {
  const VantaiDispatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(vantaiTripsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Điều Xe & Các Chuyến Trong Ngày')),
      body: tripsAsync.when(
        data: (trips) {
          if (trips.isEmpty) return const Center(child: Text('Chưa có chuyến nào.'));
          return ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.directions_bus, size: 40, color: Colors.blue),
                  title: Text(trip.route.value?.routeName ?? 'Không xác định', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Khởi hành: ${trip.departureTime?.toLocal()}'),
                      Text('Xe: ${trip.vehicle.value?.plateNumber} - Loại: ${trip.vehicle.value?.type.label}'),
                      Text('Tài xế: ${trip.driverName}', style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                  trailing: Chip(
                    label: Text(trip.status.label),
                    backgroundColor: trip.status == TripStatus.RUNNING ? Colors.orange[100] : Colors.grey[200],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

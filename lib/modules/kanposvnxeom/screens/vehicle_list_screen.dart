import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/vehicle_provider.dart';

class VehicleListScreen extends ConsumerWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleState = ref.watch(xeOmVehicleProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Phương tiện')),
      body: vehicleState.when(
        data: (vehicles) {
          if (vehicles.isEmpty) {
            return const Center(child: Text('Chưa có phương tiện nào.'));
          }
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.directions_car)),
                title: Text(vehicle.licensePlate ?? 'Chưa rõ biển số'),
                subtitle: Text('Loại xe: ${vehicle.type.name} - Màu: ${vehicle.color ?? "N/A"}'),
                trailing: const Icon(Icons.chevron_right),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm xe mới
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

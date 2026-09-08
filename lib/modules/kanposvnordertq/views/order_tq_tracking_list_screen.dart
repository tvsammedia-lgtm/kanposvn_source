import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/order_provider.dart';
import 'tracking_map_screen.dart';

/// Danh sách các chuyến xe đang hoạt động, kèm vị trí GPS hiện tại (demo map).
/// Bấm vào 1 chuyến để xem màn hình tracking chi tiết.
class OrderTqTrackingListScreen extends ConsumerWidget {
  const OrderTqTrackingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(orderBucketServiceProvider);
    final tripsAsync = ref.watch(tripListProvider(service));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: tripsAsync.when(
        data: (trips) {
          if (trips.isEmpty) {
            return const Center(child: Text('Chưa có chuyến xe nào.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _statusColor(trip.status),
                    child: const Icon(Icons.local_shipping, color: Colors.white),
                  ),
                  title: Text('${trip.tripCode ?? trip.tripId}'),
                  subtitle: Text(
                    '${trip.origin ?? ''} → ${trip.destination ?? ''}\n'
                    'Trạng thái: ${trip.status ?? ''}',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TrackingMapScreen(
                          tripId: trip.tripId,
                          vehicleId: trip.vehicleId ?? '',
                          vehicleCode: trip.vehicleId ?? 'XE',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Color _statusColor(String? status) {
    switch (status) {
      case 'IN_TRANSIT':
        return Colors.blue;
      case 'PLANNED':
        return Colors.orange;
      case 'ARRIVED':
        return Colors.green;
      case 'COMPLETED':
        return Colors.grey;
      default:
        return Colors.purple;
    }
  }
}

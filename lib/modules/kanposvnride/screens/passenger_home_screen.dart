import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ride_booking_provider.dart';
import '../providers/pricing_provider.dart';
import '../models/ride_driver.dart';
import 'ride_map_screen.dart';
import 'wallet_screen.dart';

class PassengerHomeScreen extends ConsumerStatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  ConsumerState<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends ConsumerState<PassengerHomeScreen> {
  final _pickupCtrl = TextEditingController(text: 'Sân bay Tân Sơn Nhất');
  final _dropoffCtrl = TextEditingController(text: 'Chợ Bến Thành');
  bool _isSharedRide = false;

  void _bookRide() {
    final distance = 8.5;
    final price = ref.read(pricingProvider).calculatePrice(distance, VehicleType.car4Seats, _isSharedRide);
    
    ref.read(rideBookingProvider.notifier).createBooking(
      pickup: _pickupCtrl.text,
      dropoff: _dropoffCtrl.text,
      distance: distance,
      price: price,
      vehicleType: VehicleType.car4Seats,
      isShared: _isSharedRide,
    );
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đang tìm tài xế...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookingState = ref.watch(rideBookingProvider);
    final env = ref.watch(environmentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt xe KanRide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WalletScreen())),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pickupCtrl,
              decoration: const InputDecoration(
                labelText: 'Điểm đón',
                prefixIcon: Icon(Icons.my_location, color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dropoffCtrl,
              decoration: const InputDecoration(
                labelText: 'Điểm đến',
                prefixIcon: Icon(Icons.location_on, color: Colors.red),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Các Option mở rộng
            Row(
              children: [
                Checkbox(
                  value: _isSharedRide,
                  onChanged: (val) => setState(() => _isSharedRide = val ?? false),
                ),
                const Text('Ghép chuyến (-20%)'),
                const Spacer(),
                const Text('Trời mưa (Giá x1.3)', style: TextStyle(color: Colors.blue)),
                Switch(
                  value: env.isRaining,
                  onChanged: (val) {
                    ref.read(environmentProvider.notifier).state = env.copyWith(isRaining: val);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _bookRide,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Consumer(
                  builder: (context, ref, child) {
                    final p = ref.read(pricingProvider).calculatePrice(8.5, VehicleType.car4Seats, _isSharedRide);
                    return Text('ĐẶT XE NGAY - ${p.toStringAsFixed(0)}đ', style: const TextStyle(fontSize: 18, color: Colors.white));
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Align(alignment: Alignment.centerLeft, child: Text('Chuyến đi gần đây:', style: TextStyle(fontWeight: FontWeight.bold))),
            Expanded(
              child: bookingState.when(
                data: (bookings) {
                  if (bookings.isEmpty) return const Center(child: Text('Chưa có chuyến đi nào'));
                  return ListView.builder(
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      final b = bookings[index];
                      return Card(
                        child: ListTile(
                          title: Text('${b.pickupAddress} ➔ ${b.dropoffAddress}'),
                          subtitle: Text('Giá: ${b.estimatedPrice}đ - Trạng thái: ${b.status.name}'),
                          trailing: b.syncStatus.name == 'pending' ? const Icon(Icons.sync, color: Colors.orange) : const Icon(Icons.check_circle, color: Colors.green),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => RideMapScreen(booking: b)));
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Lỗi: $e')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

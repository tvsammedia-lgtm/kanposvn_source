import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ride_providers.dart';
import '../models/ride_booking.dart';

class RideBookingScreen extends ConsumerWidget {
  const RideBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickupCtrl = TextEditingController();
    final dropoffCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo Cuốc Xe'),
        backgroundColor: const Color(0xFFFACC15),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pickupCtrl,
              decoration: const InputDecoration(
                labelText: 'Điểm đón (Pickup)',
                prefixIcon: Icon(Icons.my_location, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dropoffCtrl,
              decoration: const InputDecoration(
                labelText: 'Điểm đến (Drop-off)',
                prefixIcon: Icon(Icons.location_on, color: Colors.red),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final booking = RideBooking()
                    ..uuid = 'BK_${DateTime.now().millisecondsSinceEpoch}'
                    ..pickupAddress = pickupCtrl.text
                    ..dropoffAddress = dropoffCtrl.text
                    ..distanceKm = 5.2 // Giả lập
                    ..estimatedPrice = 52000;
                    
                  ref.read(rideBookingsProvider.notifier).saveBooking(booking);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFACC15),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Đặt Xe Ngay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

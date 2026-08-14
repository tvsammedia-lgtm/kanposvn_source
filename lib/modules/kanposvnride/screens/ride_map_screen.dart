import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/gps_tracking_provider.dart';
import '../models/ride_booking.dart';

class RideMapScreen extends ConsumerStatefulWidget {
  final RideBooking booking;
  const RideMapScreen({super.key, required this.booking});

  @override
  ConsumerState<RideMapScreen> createState() => _RideMapScreenState();
}

class _RideMapScreenState extends ConsumerState<RideMapScreen> {
  @override
  void initState() {
    super.initState();
    // Bắt đầu mô phỏng xe chạy khi mở màn hình
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gpsTrackingProvider.notifier).startSimulatingDriverMovement();
    });
  }

  @override
  Widget build(BuildContext context) {
    final driverGps = ref.watch(gpsTrackingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Theo dõi chuyến đi')),
      body: Stack(
        children: [
          // 1. Bản đồ giả lập (Canvas)
          Container(
            color: Colors.grey.shade200,
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MockMapPainter(driverGps),
            ),
          ),
          
          // 2. Thông tin chuyến đi ở góc dưới
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tài xế Nguyễn Văn A', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('Honda Vision - 59A1-123.45', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
                          child: const Text('⭐ 5.0'),
                        )
                      ],
                    ),
                    const Divider(height: 24),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.location_on, color: Colors.blue),
                      title: Text(widget.booking.pickupAddress ?? 'Điểm đón'),
                      subtitle: const Text('Tài xế đang đến... (Mô phỏng GPS)'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MockMapPainter extends CustomPainter {
  final GpsCoordinate? driverPos;
  
  _MockMapPainter(this.driverPos);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()..color = Colors.blue.withOpacity(0.3)..strokeWidth = 6..style = PaintingStyle.stroke;
    
    // Giả lập vẽ một con đường
    final path = Path();
    path.moveTo(50, 50);
    path.lineTo(size.width - 50, size.height - 300);
    canvas.drawPath(path, paintLine);

    // Vẽ điểm đón (Pickup) ở cuối đường
    final paintPickup = Paint()..color = Colors.green;
    canvas.drawCircle(Offset(size.width - 50, size.height - 300), 12, paintPickup);

    // Vẽ biểu tượng chiếc xe mô phỏng dựa vào state driverPos
    if (driverPos != null) {
      // Map tọa độ lat/lng sang pixel (Giả lập tính toán)
      // Mảng mockRouteToPickup có 5 điểm. Lat từ 10.820 -> 10.816 (giảm dần)
      double progress = (10.820 - driverPos!.lat) / (10.820 - 10.816); 
      // progress chạy từ 0 -> 1
      
      double carX = 50 + (size.width - 100) * progress;
      double carY = 50 + (size.height - 350) * progress;
      
      final paintCar = Paint()..color = Colors.orange;
      canvas.drawCircle(Offset(carX, carY), 16, paintCar);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

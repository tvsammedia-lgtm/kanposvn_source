import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bus_tracking_provider.dart';

class BusTrackingScreen extends ConsumerWidget {
  const BusTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackingState = ref.watch(busTrackingProvider);
    final isNear = trackingState.distanceKm < 1.0; // Dưới 1km thì báo động đỏ

    return Scaffold(
      appBar: AppBar(title: const Text('Định Vị Tuyến Xe'), backgroundColor: Colors.indigo),
      body: Column(
        children: [
          // Bảng Cảnh Báo
          Container(
            padding: const EdgeInsets.all(20),
            color: isNear ? Colors.red.shade600 : Colors.indigo.shade600,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  isNear ? 'XE ĐANG ĐẾN RẤT GẦN!' : 'XE ĐANG DI CHUYỂN', 
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 8),
                Text(
                  'Cách điểm đón: ${trackingState.distanceKm.toStringAsFixed(1)} km',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Dự kiến: ${trackingState.etaMinutes} phút nữa',
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                if (isNear)
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Quý khách vui lòng chuẩn bị hành lý!', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                  )
              ],
            ),
          ),
          
          // Sa bàn 2D Mô phỏng Map
          Expanded(
            child: Container(
              color: Colors.green.shade100, // Màu nền cỏ
              child: Stack(
                children: [
                  // Vẽ con đường (đường thẳng vắt chéo)
                  Positioned.fill(
                    child: CustomPaint(
                      painter: RoadPainter(),
                    ),
                  ),

                  // Điểm Đón (Người dùng) - Cố định ở góc dưới
                  Align(
                    alignment: const Alignment(0.6, 0.6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.emoji_people, size: 40, color: Colors.blue),
                        Text('Điểm đón', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  // Chiếc Xe Khách di chuyển
                  // Tính toán vị trí tương đối của xe
                  // Target ở (0.6, 0.6). Start ở (-0.6, -0.6)
                  // Khoảng cách ban đầu là 5km.
                  Align(
                    alignment: Alignment(
                      0.6 - (trackingState.distanceKm / 5.0) * 1.2,
                      0.6 - (trackingState.distanceKm / 5.0) * 1.2,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)]
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.directions_bus, size: 40, color: Colors.indigo),
                          Text('Xe Khách', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade600
      ..strokeWidth = 40
      ..strokeCap = StrokeCap.round;

    // Vẽ đường từ top-left xuống bottom-right
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.1), 
      Offset(size.width * 0.9, size.height * 0.9), 
      paint
    );
    
    // Vẽ vạch kẻ đường đứt nét
    final dashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
      
    double currentX = size.width * 0.1;
    double currentY = size.height * 0.1;
    final dx = (size.width * 0.9 - size.width * 0.1) / 20;
    final dy = (size.height * 0.9 - size.height * 0.1) / 20;

    for (int i = 0; i < 20; i++) {
      if (i % 2 == 0) {
        canvas.drawLine(
          Offset(currentX, currentY), 
          Offset(currentX + dx, currentY + dy), 
          dashPaint
        );
      }
      currentX += dx;
      currentY += dy;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

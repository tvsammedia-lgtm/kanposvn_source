import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GpsCoordinate {
  final double lat;
  final double lng;
  GpsCoordinate(this.lat, this.lng);
}

// Giả lập quãng đường tài xế chạy đến điểm đón (Sân bay TSN)
final List<GpsCoordinate> mockRouteToPickup = [
  GpsCoordinate(10.820000, 106.660000), // Vị trí tài xế lúc nhận cuốc
  GpsCoordinate(10.819000, 106.662000),
  GpsCoordinate(10.818000, 106.664000),
  GpsCoordinate(10.817000, 106.665000),
  GpsCoordinate(10.816000, 106.667000), // Vị trí điểm đón
];

final gpsTrackingProvider = StateNotifierProvider<GpsTrackingNotifier, GpsCoordinate?>((ref) {
  return GpsTrackingNotifier();
});

class GpsTrackingNotifier extends StateNotifier<GpsCoordinate?> {
  Timer? _timer;
  int _currentIndex = 0;

  GpsTrackingNotifier() : super(null);

  void startSimulatingDriverMovement() {
    _currentIndex = 0;
    state = mockRouteToPickup.first; // Vị trí ban đầu
    
    // Mỗi 2 giây tài xế di chuyển 1 chặng
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentIndex < mockRouteToPickup.length - 1) {
        _currentIndex++;
        state = mockRouteToPickup[_currentIndex];
      } else {
        timer.cancel(); // Đã tới nơi
      }
    });
  }

  void stopSimulating() {
    _timer?.cancel();
  }
  
  @override
  void dispose() {
    stopSimulating();
    super.dispose();
  }
}

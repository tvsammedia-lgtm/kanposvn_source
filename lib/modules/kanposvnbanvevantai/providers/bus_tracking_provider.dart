import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final busTrackingProvider = StateNotifierProvider<BusTrackingNotifier, BusTrackingState>((ref) {
  return BusTrackingNotifier();
});

class BusTrackingState {
  final double currentLat;
  final double currentLng;
  final double destLat;
  final double destLng;
  final double distanceKm;
  final int etaMinutes;

  BusTrackingState({
    required this.currentLat,
    required this.currentLng,
    required this.destLat,
    required this.destLng,
    required this.distanceKm,
    required this.etaMinutes,
  });
}

class BusTrackingNotifier extends StateNotifier<BusTrackingState> {
  Timer? _timer;

  // Giả lập điểm đón (Khách hàng)
  final double _targetLat = 21.028511;
  final double _targetLng = 105.804817;

  BusTrackingNotifier() : super(BusTrackingState(
    currentLat: 21.028511 + 0.05, // Cách điểm đón một chút
    currentLng: 105.804817 + 0.05,
    destLat: 21.028511,
    destLng: 105.804817,
    distanceKm: 5.0,
    etaMinutes: 15,
  )) {
    _startTracking();
  }

  void _startTracking() {
    // Vòng lặp mỗi 1 giây
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Logic nội suy: Kéo xe nhích dần về điểm đón
      double newLat = state.currentLat;
      double newLng = state.currentLng;

      // Nhích Lat
      if ((newLat - _targetLat).abs() > 0.0005) {
        newLat -= (newLat > _targetLat) ? 0.001 : -0.001;
      }
      // Nhích Lng
      if ((newLng - _targetLng).abs() > 0.0005) {
        newLng -= (newLng > _targetLng) ? 0.001 : -0.001;
      }

      // Tính lại khoảng cách
      final dist = _calculateDistance(newLat, newLng, _targetLat, _targetLng);
      // Vận tốc giả định 30km/h => thời gian (phút) = (dist / 30) * 60
      final eta = (dist / 30.0 * 60).round();

      if (dist < 0.1) {
        // Đã tới nơi
        timer.cancel();
      }

      state = BusTrackingState(
        currentLat: newLat,
        currentLng: newLng,
        destLat: _targetLat,
        destLng: _targetLng,
        distanceKm: dist,
        etaMinutes: eta,
      );
    });
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + 
          c(lat1 * p) * c(lat2 * p) * 
          (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

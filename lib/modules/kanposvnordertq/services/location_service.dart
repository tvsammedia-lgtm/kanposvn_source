import 'dart:async';
import 'dart:developer';

abstract class LocationService {
  Future<void> startTracking(String tripId, String vehicleId);
  Future<void> stopTracking();
  Future<Map<String, dynamic>> getCurrentLocation();
  Stream<Map<String, dynamic>> subscribeLocation();
}

class MockLocationServiceImpl implements LocationService {
  Timer? _timer;
  final StreamController<Map<String, dynamic>> _locationController = StreamController.broadcast();
  
  double _currentLat = 10.762622;
  double _currentLng = 106.660172;

  @override
  Future<void> startTracking(String tripId, String vehicleId) async {
    log('Bắt đầu tracking GPS cho chuyến $tripId, xe $vehicleId');
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Mock xe di chuyển 
      _currentLat += 0.0001;
      _currentLng += 0.0001;
      
      final mockData = {
        "latitude": _currentLat,
        "longitude": _currentLng,
        "speed": 40.5,
        "heading": 90.0,
        "timestamp": DateTime.now().toIso8601String()
      };
      
      _locationController.add(mockData);
      log('Đã cập nhật vị trí mới: $_currentLat, $_currentLng');
    });
  }

  @override
  Future<void> stopTracking() async {
    _timer?.cancel();
    log('Đã dừng tracking GPS');
  }

  @override
  Future<Map<String, dynamic>> getCurrentLocation() async {
    return {
      "latitude": _currentLat,
      "longitude": _currentLng,
      "speed": 0.0,
      "heading": 0.0,
    };
  }

  @override
  Stream<Map<String, dynamic>> subscribeLocation() {
    return _locationController.stream;
  }
}

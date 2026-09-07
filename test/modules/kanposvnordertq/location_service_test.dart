import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnordertq/services/location_service.dart';

void main() {
  group('LocationService Tests', () {
    late MockLocationServiceImpl locationService;

    setUp(() {
      locationService = MockLocationServiceImpl();
    });

    tearDown(() {
      locationService.stopTracking();
    });

    test('Initial location is correct', () async {
      final location = await locationService.getCurrentLocation();
      expect(location['latitude'], 10.762622);
      expect(location['longitude'], 106.660172);
      expect(location['speed'], 0.0);
    });

    test('Tracking updates location stream', () async {
      locationService.startTracking('TRIP-123', 'VEH-001');
      
      // Lắng nghe phần tử đầu tiên được emit từ stream
      final firstUpdate = await locationService.subscribeLocation().first;
      
      expect(firstUpdate['latitude'], greaterThan(10.762622));
      expect(firstUpdate['longitude'], greaterThan(106.660172));
      expect(firstUpdate['speed'], 40.5);
    });
  });
}

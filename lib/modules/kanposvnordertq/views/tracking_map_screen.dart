import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/location_service.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  return MockLocationServiceImpl();
});

/// Màn hình bản đồ theo dõi xe. Không phụ thuộc flutter_map — dùng một
/// placeholders bản đồ tô màu + marker tự vẽ, dữ liệu vị trí từ LocationService.
class TrackingMapScreen extends ConsumerStatefulWidget {
  final String tripId;
  final String vehicleId;
  final String vehicleCode;

  const TrackingMapScreen({
    super.key,
    required this.tripId,
    required this.vehicleId,
    this.vehicleCode = 'VEH-001',
  });

  @override
  ConsumerState<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends ConsumerState<TrackingMapScreen> {
  Map<String, dynamic>? _current;
  final TextStyle _dimsStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void initState() {
    super.initState();
    final locationService = ref.read(locationServiceProvider);
    locationService.startTracking(widget.tripId, widget.vehicleId);
    locationService.subscribeLocation().listen((locationData) {
      if (mounted) {
        setState(() => _current = locationData);
      }
    });
  }

  @override
  void dispose() {
    ref.read(locationServiceProvider).stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final latitude = (_current?['latitude'] as num?)?.toDouble() ?? 10.762622;
    final longitude = (_current?['longitude'] as num?)?.toDouble() ?? 106.660172;
    final speed = (_current?['speed'] as num?)?.toDouble() ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theo dõi ${widget.vehicleCode}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Placeholder "bản đồ" — nền lưới + marker xe
          Positioned.fill(
            child: CustomPaint(
              painter: _MapPlaceholderPainter(
                  markerLat: latitude, markerLng: longitude),
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Vị trí xe (demo map)',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('Vĩ độ: ${latitude.toStringAsFixed(6)}'),
                    Text('Kinh độ: ${longitude.toStringAsFixed(6)}'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Xe đang di chuyển',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Tốc độ: ${speed.toStringAsFixed(1)} km/h'),
                    Text('ETA: Khoảng 30 phút nữa', style: _dimsStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholderPainter extends CustomPainter {
  final double markerLat;
  final double markerLng;
  _MapPlaceholderPainter({required this.markerLat, required this.markerLng});

  @override
  void paint(Canvas canvas, Size size) {
    final light = Paint()..color = const Color(0xFFE8F0E9);
    canvas.drawRect(Offset.zero & size, light);

    final grid = Paint()
      ..color = const Color(0xFFC5D5C7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const step = 40.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    // Marker xe ở trung tâm (mock)
    final cx = size.width / 2;
    final cy = size.height / 2;
    final pin = Paint()..color = Colors.red;
    canvas.drawCircle(Offset(cx, cy), 18, pin);
    final white = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(cx, cy), 8, white);
  }

  @override
  bool shouldRepaint(covariant _MapPlaceholderPainter oldDelegate) =>
      oldDelegate.markerLat != markerLat || oldDelegate.markerLng != markerLng;
}

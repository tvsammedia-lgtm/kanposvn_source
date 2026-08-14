import 'package:uuid/uuid.dart';

class DriverLocationModel {
  final String driverUuid;
  final String fullName;
  final double lat;
  final double lng;
  final double distanceKm;
  final String vehicleType;

  DriverLocationModel({
    required this.driverUuid,
    required this.fullName,
    required this.lat,
    required this.lng,
    required this.distanceKm,
    required this.vehicleType,
  });
}

class DriverLocationService {
  static const String baseUrl = 'https://your-vercel-api.app/api';

  /// Tìm các tài xế đang online xung quanh điểm đón (bán kính r km)
  static Future<List<DriverLocationModel>> findNearbyDrivers({
    required double pickupLat,
    required double pickupLng,
    required String requestedVehicleType,
    double radiusKm = 5.0,
  }) async {
    // ----------------------------------------------------------------------
    // CÁCH 1: Gọi qua Vercel Backend (Khuyên dùng khi có backend)
    // ----------------------------------------------------------------------
    /*
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/drivers/nearby?lat=$pickupLat&lng=$pickupLng&type=$requestedVehicleType&radius=$radiusKm'),
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((d) => DriverLocationModel(
          driverUuid: d['driverUuid'],
          fullName: d['fullName'],
          lat: d['lat'],
          lng: d['lng'],
          distanceKm: d['distanceKm'],
          vehicleType: d['vehicleType'],
        )).toList();
      } else {
        throw Exception('Không thể lấy danh sách tài xế từ Server');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối mạng: $e');
    }
    */

    // ----------------------------------------------------------------------
    // CÁCH 2: Giả lập trả về từ Server để test UI (Mock Data)
    // ----------------------------------------------------------------------
    await Future.delayed(const Duration(seconds: 1)); // Giả lập độ trễ mạng
    
    // Tự động tạo 3 tài xế ở gần
    final uuid = const Uuid();
    return [
      DriverLocationModel(
        driverUuid: uuid.v4(),
        fullName: 'Nguyễn Văn A',
        lat: pickupLat + 0.005,
        lng: pickupLng + 0.005,
        distanceKm: 0.8,
        vehicleType: requestedVehicleType,
      ),
      DriverLocationModel(
        driverUuid: uuid.v4(),
        fullName: 'Trần Thị B',
        lat: pickupLat - 0.012,
        lng: pickupLng + 0.003,
        distanceKm: 1.5,
        vehicleType: requestedVehicleType,
      ),
      DriverLocationModel(
        driverUuid: uuid.v4(),
        fullName: 'Lê Văn C',
        lat: pickupLat + 0.02,
        lng: pickupLng - 0.015,
        distanceKm: 3.2,
        vehicleType: requestedVehicleType,
      ),
    ];
  }
}

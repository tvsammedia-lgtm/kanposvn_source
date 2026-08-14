import '../../modules/kanposvnxeom/models/vehicle.dart';

class PricingService {
  // Bảng giá cơ sở (VNĐ / km)
  static const Map<VehicleType, double> baseRates = {
    VehicleType.motorbike: 5000.0,
    VehicleType.taxi4Seats: 12000.0,
    VehicleType.taxi7Seats: 15000.0,
    VehicleType.evTaxi: 13000.0,
    VehicleType.truck: 20000.0,
    VehicleType.delivery: 8000.0,
  };

  // Giá cước tối thiểu cho 2km đầu tiên
  static const Map<VehicleType, double> minimumFares = {
    VehicleType.motorbike: 12000.0,
    VehicleType.taxi4Seats: 25000.0,
    VehicleType.taxi7Seats: 30000.0,
    VehicleType.evTaxi: 28000.0,
    VehicleType.truck: 50000.0,
    VehicleType.delivery: 15000.0,
  };

  /// Tính toán giá cước dự kiến
  /// distanceKm: Khoảng cách tính bằng km
  /// vehicleType: Loại xe khách yêu cầu
  /// isRushHour: Có phải giờ cao điểm không (áp dụng phụ phí)
  static double calculateEstimatedPrice({
    required double distanceKm,
    required VehicleType vehicleType,
    bool isRushHour = false,
  }) {
    if (distanceKm <= 0) return 0.0;

    double baseRate = baseRates[vehicleType] ?? 10000.0;
    double minFare = minimumFares[vehicleType] ?? 20000.0;
    double calculatedPrice = distanceKm * baseRate;

    // Đảm bảo cước phí không thấp hơn giá mở cửa (minFare)
    if (calculatedPrice < minFare) {
      calculatedPrice = minFare;
    }

    // Phụ phí giờ cao điểm (tăng 20%)
    if (isRushHour) {
      calculatedPrice *= 1.2;
    }

    // Làm tròn đến hàng nghìn đồng
    return (calculatedPrice / 1000).round() * 1000.0;
  }
}

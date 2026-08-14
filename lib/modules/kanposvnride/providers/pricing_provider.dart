import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ride_driver.dart';

// State chứa các biến môi trường tác động đến giá
class EnvironmentalFactors {
  final bool isRaining;
  final bool isRushHour;

  EnvironmentalFactors({this.isRaining = false, this.isRushHour = false});
  
  EnvironmentalFactors copyWith({bool? isRaining, bool? isRushHour}) {
    return EnvironmentalFactors(
      isRaining: isRaining ?? this.isRaining,
      isRushHour: isRushHour ?? this.isRushHour,
    );
  }
}

final environmentProvider = StateProvider<EnvironmentalFactors>((ref) {
  return EnvironmentalFactors();
});

final pricingProvider = Provider<PricingService>((ref) {
  final env = ref.watch(environmentProvider);
  return PricingService(env);
});

class PricingService {
  final EnvironmentalFactors env;
  
  PricingService(this.env);

  double calculatePrice(double distanceKm, VehicleType type, bool isSharedRide) {
    double basePricePerKm;
    
    switch (type) {
      case VehicleType.motorBike:
      case VehicleType.evBike:
        basePricePerKm = 6000;
        break;
      case VehicleType.car4Seats:
        basePricePerKm = 12000;
        break;
      case VehicleType.car7Seats:
        basePricePerKm = 15000;
        break;
      default:
        basePricePerKm = 10000;
    }

    double price = distanceKm * basePricePerKm;

    // Dynamic Pricing (Giá động)
    double multiplier = 1.0;
    if (env.isRaining) multiplier += 0.3; // Mưa tăng 30%
    if (env.isRushHour) multiplier += 0.2; // Cao điểm tăng 20%
    
    // Ride Sharing (Đi ghép) giảm giá
    if (isSharedRide) multiplier -= 0.2; // Ghép chuyến giảm 20%

    return price * multiplier;
  }
}

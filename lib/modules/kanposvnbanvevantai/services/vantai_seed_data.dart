import 'vantai_isar_service.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import 'package:uuid/uuid.dart';

class VantaiSeedData {
  static Future<void> seedIfEmpty(VantaiIsarService service) async {
    final db = await service.db;
    final count = await db.vantaiRoutes.count();
    
    if (count == 0) {
      await db.writeTxn(() async {
        final route1 = VantaiRoute()
          ..routeId = const Uuid().v4()
          ..routeName = 'Sài Gòn - Đà Lạt'
          ..startPoint = 'Bến Xe Miền Đông'
          ..endPoint = 'Bến Xe Đà Lạt'
          ..distanceKm = 300
          ..basePrice = 250000
          ..estimatedTime = '8 tiếng';
          
        final route2 = VantaiRoute()
          ..routeId = const Uuid().v4()
          ..routeName = 'Sài Gòn - Cần Thơ'
          ..startPoint = 'Bến Xe Miền Tây'
          ..endPoint = 'Bến Xe Trung Tâm Cần Thơ'
          ..distanceKm = 170
          ..basePrice = 160000
          ..estimatedTime = '4 tiếng';

        await db.vantaiRoutes.putAll([route1, route2]);

        final v1 = VantaiVehicle()
          ..vehicleId = const Uuid().v4()
          ..plateNumber = '51B-123.45'
          ..type = VehicleType.SLEEPER
          ..totalSeats = 40
          ..brand = 'Thaco Mobihome'
          ..manufactureYear = 2021;
          
        final v2 = VantaiVehicle()
          ..vehicleId = const Uuid().v4()
          ..plateNumber = '51B-678.90'
          ..type = VehicleType.LIMOUSINE
          ..totalSeats = 34 // 34 chỗ Limousine
          ..brand = 'Hyundai Universe'
          ..manufactureYear = 2022;

        await db.vantaiVehicles.putAll([v1, v2]);

        final trip1 = VantaiTrip()
          ..tripId = const Uuid().v4()
          ..departureTime = DateTime.now().add(const Duration(hours: 2))
          ..arrivalTime = DateTime.now().add(const Duration(hours: 10))
          ..status = TripStatus.SCHEDULED
          ..driverName = 'Tài xế Nguyễn Văn B';
        trip1.route.value = route1;
        trip1.vehicle.value = v1;

        await db.vantaiTrips.put(trip1);
        await trip1.route.save();
        await trip1.vehicle.save();

        final shipment1 = VantaiShipment()
          ..shipmentId = const Uuid().v4()
          ..shipmentCode = 'SH-1234'
          ..senderName = 'Nguyễn Thị C'
          ..senderPhone = '0901234567'
          ..receiverName = 'Trần Văn D'
          ..receiverPhone = '0987654321'
          ..weightKg = 5.0
          ..shippingFee = 50000
          ..status = ShipmentStatus.PENDING
          ..createdAt = DateTime.now();
        shipment1.route.value = route1;

        await db.vantaiShipments.put(shipment1);
        await shipment1.route.save();

        final expense1 = VantaiExpense()
          ..expenseId = const Uuid().v4()
          ..category = ExpenseCategory.FUEL
          ..amount = 500000
          ..description = 'Đổ dầu trước khi xuất bến'
          ..date = DateTime.now();
        expense1.trip.value = trip1;
        
        await db.vantaiExpenses.put(expense1);
        await expense1.trip.save();
      });
    }
  }
}

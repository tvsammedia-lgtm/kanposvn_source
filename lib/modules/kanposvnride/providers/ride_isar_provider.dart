import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/ride_user.dart';
import '../models/ride_driver.dart';
import '../models/ride_booking.dart';
import '../models/ride_trip.dart';
import '../models/ride_wallet.dart';
import '../models/ride_transaction.dart';
import '../models/ride_vehicle_type.dart';
import '../models/ride_ops_models.dart';

Isar? _rideIsar;

final rideIsarProvider = Provider<Isar>((ref) {
  final isar = _rideIsar;
  if (isar != null) return isar;
  throw UnimplementedError('Isar is not initialized yet');
});

class RideDatabaseSetup {
  static Future<Isar> init() async {
    if (_rideIsar != null && _rideIsar!.isOpen) return _rideIsar!;
    if (Isar.instanceNames.contains('kanposvnride_db')) {
      _rideIsar = Isar.getInstance('kanposvnride_db')!;
      return _rideIsar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        RideUserSchema,
        RideDriverSchema,
        RideBookingSchema,
        KanRideTripSchema,
        KanRideWalletSchema,
        RideTransactionSchema,
        KanRideVehicleTypeSchema,
        KanRidePromotionSchema,
        RideRatingSchema,
        RideChatMessageSchema,
        RideMaskedCallSchema,
        RideNotificationSchema,
        RideGeoFenceSchema,
        RideSupportTicketSchema,
        RideAuditLogSchema,
        RideSelfDriveRentalSchema,
        RideDeliveryOrderSchema,
        RideCorporateAccountSchema,
        RidePartnerApiKeySchema,
      ],
      directory: dir.path,
      name: 'kanposvnride_db',
    );
    _rideIsar = isar;
    return isar;
  }
}

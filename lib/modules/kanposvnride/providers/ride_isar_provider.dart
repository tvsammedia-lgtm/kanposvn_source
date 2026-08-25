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

final rideIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('rideIsarProvider must be overridden');
});

class RideDatabaseSetup {
  static Future<Isar> init() async {
    const name = 'kanposvnride_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
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
      name: name,
    );
  }
}

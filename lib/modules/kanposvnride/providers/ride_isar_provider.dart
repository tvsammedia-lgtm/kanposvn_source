import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/ride_user.dart';
import '../models/ride_driver.dart';
import '../models/ride_booking.dart';

final rideIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('rideIsarProvider must be overridden');
});

class RideDatabaseSetup {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        RideUserSchema,
        RideDriverSchema,
        RideBookingSchema,
      ],
      directory: dir.path,
      name: 'kanposvnride_db',
    );
  }
}

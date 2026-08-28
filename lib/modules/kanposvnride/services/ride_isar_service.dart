import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/ride_driver.dart';
import '../models/ride_booking.dart';
import '../models/ride_vehicle_type.dart';
import '../models/ride_trip.dart';
import '../models/ride_wallet.dart';
import '../models/ride_sync.dart';

class RideIsarService {
  late Future<Isar> db;

  RideIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvnride_db')) {
      return Isar.getInstance('kanposvnride_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/kanposvnride_db.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync('${dir.path}/kanposvnride_db_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [
        RideDriverSchema,
        RideBookingSchema,
        KanRideVehicleTypeSchema,
        KanRideTripSchema,
        KanRideWalletSchema,
        KanRideSyncQueueSchema,
        KanRideSyncConfigSchema,
      ],
      inspector: true,
      directory: dirPath,
      name: 'kanposvnride_db',
    );
  }

  Future<List<RideBooking>> getPendingBookings() async {
    final isar = await db;
    return await isar.rideBookings
        .filter()
        .statusEqualTo(BookingStatus.findingDriver)
        .findAll();
  }

  Future<void> saveBooking(RideBooking booking) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.rideBookings.put(booking);
    });
  }
}

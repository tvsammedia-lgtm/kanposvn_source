import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/vehicle.dart';
import '../models/parking_ticket.dart';
import '../models/parking_area.dart';
import '../models/monthly_ticket.dart';
import '../models/rental.dart';
import '../models/camera.dart';
import '../models/parking_sync.dart';
import '../models/parking_customer.dart';
import '../models/parking_finance.dart';
import '../models/parking_tariff.dart';

class ParkingIsarService {
  late Future<Isar> db;

  ParkingIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('kanposvnparking_db')) {
      return Isar.getInstance('kanposvnparking_db')!;
    }
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        ParkingVehicleSchema,
        ParkingTicketSchema,
        ParkingAreaSchema,
        ParkingMonthlyTicketSchema,
        ParkingRentalSchema,
        ParkingCameraSchema,
        ParkingSyncQueueSchema,
        ParkingSyncConfigSchema,
        ParkingCustomerSchema,
        ParkingFinanceTxSchema,
        ParkingTariffSchema,
      ],
      inspector: true,
      directory: dir.path,
      name: 'kanposvnparking_db',
    );
  }

  Future<List<ParkingTicket>> getActiveTickets() async {
    final isar = await db;
    return await isar.parkingTickets
        .filter()
        .statusEqualTo('parking')
        .sortByCheckInTimeDesc()
        .findAll();
  }

  Future<void> saveTicket(ParkingTicket ticket) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.parkingTickets.put(ticket);
    });
  }
}

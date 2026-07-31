import 'package:isar/isar.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_customer.dart';
import '../models/vantai_ticket.dart';
import '../models/vantai_sync_model.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_expense.dart';
import 'dart:io';

class VantaiIsarService {
  late Future<Isar> db;

  VantaiIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains('vantai_db')) {
      return Isar.getInstance('vantai_db')!;
    }
    
    final dir = Directory.systemTemp.createTempSync('vantai_db');
    
    return await Isar.open(
      [
        VantaiRouteSchema,
        VantaiVehicleSchema,
        VantaiCustomerSchema,
        VantaiTicketSchema,
        VantaiSyncQueueSchema,
        VantaiTripSchema,
        VantaiShipmentSchema,
        VantaiExpenseSchema,
      ],
      directory: dir.path,
      name: 'vantai_db',
    );
  }
}

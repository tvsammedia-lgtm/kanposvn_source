import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/driver.dart';
import '../models/vehicle.dart';
import '../models/customer.dart';
import '../models/booking.dart';
import '../models/payment.dart';

final xeOmIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('xeOmIsarProvider must be overridden');
});

class XeOmDatabaseSetup {
  static Future<Isar> init() async {
    const name = 'kanposvnxeom_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        XeOmDriverSchema,
        XeOmVehicleSchema,
        XeOmCustomerSchema,
        XeOmBookingSchema,
        XeOmPaymentSchema,
      ],
      directory: dir.path,
      name: name,
    );
  }
}

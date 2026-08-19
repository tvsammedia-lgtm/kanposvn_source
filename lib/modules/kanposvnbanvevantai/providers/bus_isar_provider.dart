import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/bus_trip.dart';
import '../models/bus_ticket.dart';

final busIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('busIsarProvider must be overridden in main');
});

class BusDatabaseSetup {
  static Future<Isar> init() async {
    const name = 'kanposvnbanvevantai_db';
    final existing = Isar.getInstance(name);
    if (existing != null && existing.isOpen) return existing;
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        BusTripLocalSchema,
        BusTicketLocalSchema,
      ],
      directory: dir.path,
      name: name,
    );
  }
}

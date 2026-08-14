import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/flight_offer.dart';
import '../models/booking.dart';
import '../models/sync_queue.dart';

final airbookIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('airbookIsarProvider must be overridden in main');
});

class AirbookDatabaseSetup {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        FlightOfferSchema,
        BookingLocalSchema,
        SyncQueueLocalSchema,
      ],
      directory: dir.path,
      name: 'kanposvnairbook_db',
    );
  }
}

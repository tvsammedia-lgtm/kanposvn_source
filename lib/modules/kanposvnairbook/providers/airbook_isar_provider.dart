import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/flight_offer.dart';
import '../models/booking.dart';
import '../models/sync_queue.dart';
import '../models/airbook_ops_models.dart';

Isar? _airbookIsar;

final airbookIsarProvider = Provider<Isar>((ref) {
  final isar = _airbookIsar;
  if (isar != null) return isar;
  throw UnimplementedError('Isar is not initialized yet');
});

class AirbookDatabaseSetup {
  static Future<Isar> init() async {
    if (_airbookIsar != null && _airbookIsar!.isOpen) return _airbookIsar!;
    if (Isar.instanceNames.contains('kanposvnairbook_db')) {
      _airbookIsar = Isar.getInstance('kanposvnairbook_db')!;
      return _airbookIsar!;
    }
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        FlightOfferSchema,
        BookingLocalSchema,
        SyncQueueLocalSchema,
        AirPassengerSchema,
        AirPaymentSchema,
        AirPromotionSchema,
        AirAuditLogSchema,
      ],
      directory: dir.path,
      name: 'kanposvnairbook_db',
    );
    _airbookIsar = isar;
    return isar;
  }
}

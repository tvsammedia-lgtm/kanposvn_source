import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/real_estate.dart';
import '../models/real_estate_comment.dart';
import '../models/real_estate_booking.dart';

final bdsIsarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('bdsIsarProvider must be overridden');
});

class BdsDatabaseSetup {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        RealEstateSchema,
        RealEstateCommentSchema,
        RealEstateBookingSchema,
      ],
      directory: dir.path,
      name: 'kanposvnnbatdongsan_db',
    );
  }
}

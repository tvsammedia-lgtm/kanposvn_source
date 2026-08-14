import 'package:flutter/foundation.dart';
class BarberSyncService {
  final String apiEndpoint;

  BarberSyncService({this.apiEndpoint = 'https://vercel.api/sync'});

  Future<void> syncUp() async {
    // TODO: Thá»±c hiá»‡n láº¥y dá»¯ liá»‡u tá»« Isar (isSynced == false) vÃ  Ä‘áº©y lÃªn Cloud
    debugPrint('Syncing up barber data to cloud...');
  }

  Future<void> syncDown() async {
    // TODO: Láº¥y dá»¯ liá»‡u má»›i tá»« Cloud vá» vÃ  lÆ°u vÃ o Isar
    debugPrint('Syncing down barber data from cloud...');
  }
}


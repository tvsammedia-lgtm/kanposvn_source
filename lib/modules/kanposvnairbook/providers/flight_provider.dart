import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/flight_offer.dart';
import 'airbook_isar_provider.dart';

final flightSearchProvider = StateNotifierProvider<FlightSearchNotifier, AsyncValue<List<FlightOffer>>>((ref) {
  final isar = ref.watch(airbookIsarProvider);
  return FlightSearchNotifier(isar);
});

class FlightSearchNotifier extends StateNotifier<AsyncValue<List<FlightOffer>>> {
  final Isar isar;
  final uuid = const Uuid();

  FlightSearchNotifier(this.isar) : super(const AsyncValue.data([]));

  Future<void> searchFlights(String origin, String destination, DateTime date) async {
    state = const AsyncValue.loading();
    try {
      // Giả lập call API (MockFlightProvider)
      await Future.delayed(const Duration(seconds: 1));
      
      final mockOffers = _generateMockFlights(origin, destination, date);
      
      // Cache lại kết quả tìm kiếm vào Isar (để hoạt động offline)
      await isar.writeTxn(() async {
        await isar.flightOffers.putAll(mockOffers);
      });
      
      state = AsyncValue.data(mockOffers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  List<FlightOffer> _generateMockFlights(String origin, String destination, DateTime date) {
    final random = Random();
    final airlines = ['Vietnam Airlines', 'Vietjet Air', 'Bamboo Airways'];
    final results = <FlightOffer>[];

    for (int i = 0; i < 5; i++) {
      final airline = airlines[random.nextInt(airlines.length)];
      final basePrice = airline == 'Vietjet Air' ? 800000.0 : (airline == 'Bamboo Airways' ? 1200000.0 : 1800000.0);
      final randomOffset = random.nextInt(500000).toDouble();
      final price = basePrice + randomOffset;
      
      final hour = random.nextInt(14) + 6; // 6h - 20h
      final min = random.nextInt(60);
      final depTime = DateTime(date.year, date.month, date.day, hour, min);
      
      final duration = 120 + random.nextInt(30); // ~2 tiếng bay
      final arrTime = depTime.add(Duration(minutes: duration));

      results.add(
        FlightOffer()
          ..uuid = uuid.v4()
          ..airline = airline
          ..flightNumber = '${airline.substring(0, 2).toUpperCase()}${random.nextInt(899) + 100}'
          ..origin = origin
          ..destination = destination
          ..departureTime = depTime
          ..arrivalTime = arrTime
          ..durationMinutes = duration
          ..baseFare = price
          ..taxAndFee = price * 0.1
          ..totalFare = price * 1.1
          ..cabinClass = 'Economy'
          ..createdAt = DateTime.now(),
      );
    }
    
    // Sắp xếp theo giá tăng dần
    results.sort((a, b) => (a.totalFare ?? 0).compareTo(b.totalFare ?? 0));
    return results;
  }
}

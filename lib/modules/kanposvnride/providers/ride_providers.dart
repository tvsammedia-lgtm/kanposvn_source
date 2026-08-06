import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ride_isar_service.dart';
import '../models/ride_booking.dart';

final rideIsarServiceProvider = Provider<RideIsarService>((ref) {
  return RideIsarService();
});

class RideBookingsNotifier extends StateNotifier<List<KanRideBooking>> {
  final RideIsarService _isar;
  bool _isLoading = false;

  RideBookingsNotifier(this._isar) : super([]) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getPendingBookings();
    _isLoading = false;
  }

  Future<void> saveBooking(KanRideBooking booking) async {
    await _isar.saveBooking(booking);
    await loadBookings();
  }
}

final rideBookingsProvider = StateNotifierProvider<RideBookingsNotifier, List<KanRideBooking>>((ref) {
  return RideBookingsNotifier(ref.watch(rideIsarServiceProvider));
});

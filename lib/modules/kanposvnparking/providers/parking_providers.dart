import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/parking_isar_service.dart';
import '../models/parking_ticket.dart';

final parkingIsarServiceProvider = Provider<ParkingIsarService>((ref) {
  return ParkingIsarService();
});

class ParkingTicketsNotifier extends StateNotifier<List<ParkingTicket>> {
  final ParkingIsarService _isar;
  bool _isLoading = false;

  ParkingTicketsNotifier(this._isar) : super([]) {
    loadActiveTickets();
  }

  Future<void> loadActiveTickets() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getActiveTickets();
    _isLoading = false;
  }

  Future<void> saveTicket(ParkingTicket ticket) async {
    await _isar.saveTicket(ticket);
    await loadActiveTickets();
  }
}

final parkingActiveTicketsProvider = StateNotifierProvider<ParkingTicketsNotifier, List<ParkingTicket>>((ref) {
  return ParkingTicketsNotifier(ref.watch(parkingIsarServiceProvider));
});

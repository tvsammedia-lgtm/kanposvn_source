import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/bus_ticket.dart';
import 'bus_isar_provider.dart';

class BusTicketState {
  final List<String> selectedSeats;
  final List<String> bookedSeats; // Ghế đã bị người khác mua
  final BusTicketLocal? currentTicket;

  BusTicketState({this.selectedSeats = const [], this.bookedSeats = const [], this.currentTicket});
}

final busTicketProvider = StateNotifierProvider<BusTicketNotifier, BusTicketState>((ref) {
  final isar = ref.watch(busIsarProvider);
  return BusTicketNotifier(isar);
});

class BusTicketNotifier extends StateNotifier<BusTicketState> {
  final Isar isar;
  final uuid = const Uuid();
  
  // Đơn giá 1 ghế (giả định)
  final double seatPrice = 150000.0;

  BusTicketNotifier(this.isar) : super(BusTicketState()) {
    _loadBookedSeats();
  }

  Future<void> _loadBookedSeats() async {
    final tickets = await isar.busTicketLocals.where().findAll();
    final List<String> allBooked = [];
    for (var t in tickets) {
      if (t.selectedSeats != null) {
        allBooked.addAll(t.selectedSeats!);
      }
    }
    // Giả lập vài ghế đã bị book sẵn để giao diện sinh động
    allBooked.addAll(['A1', 'A2', 'B4', 'B5']);
    state = BusTicketState(selectedSeats: state.selectedSeats, bookedSeats: allBooked, currentTicket: state.currentTicket);
  }

  void toggleSeat(String seat) {
    if (state.bookedSeats.contains(seat)) return; // Không được chọn ghế đã mua

    final currentSelected = List<String>.from(state.selectedSeats);
    
    if (currentSelected.contains(seat)) {
      currentSelected.remove(seat);
    } else {
      if (currentSelected.length >= 5) {
        // Tối đa 5 ghế
        return;
      }
      currentSelected.add(seat);
    }
    
    state = BusTicketState(
      selectedSeats: currentSelected, 
      bookedSeats: state.bookedSeats,
      currentTicket: state.currentTicket
    );
  }

  Future<BusTicketLocal?> buyTicket() async {
    if (state.selectedSeats.isEmpty) return null;

    final totalPrice = state.selectedSeats.length * seatPrice;
    
    final ticket = BusTicketLocal()
      ..ticketCode = 'KAN-BUS-${uuid.v4().substring(0, 6).toUpperCase()}'
      ..selectedSeats = state.selectedSeats
      ..totalPrice = totalPrice
      ..status = BoardingStatus.pending
      ..createdAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.busTicketLocals.put(ticket);
    });

    state = BusTicketState(
      selectedSeats: [], // Clear
      bookedSeats: [...state.bookedSeats, ...state.selectedSeats], // Thêm vào list đã book
      currentTicket: ticket,
    );

    return ticket;
  }

  Future<bool> scanTicket(String code) async {
    final ticket = await isar.busTicketLocals.where().ticketCodeEqualTo(code).findFirst();
    if (ticket != null) {
      ticket.status = BoardingStatus.boarded;
      await isar.writeTxn(() async {
        await isar.busTicketLocals.put(ticket);
      });
      return true;
    }
    return false;
  }
}

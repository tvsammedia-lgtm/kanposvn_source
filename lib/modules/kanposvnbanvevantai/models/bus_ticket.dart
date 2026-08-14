import 'package:isar/isar.dart';

part 'bus_ticket.g.dart';

@collection
class BusTicketLocal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? ticketCode; // Mã vé, VD: KAN-BUS-987

  List<String>? selectedSeats; // VD: ['A1', 'B2']
  
  double? totalPrice;
  
  @enumerated
  BoardingStatus status = BoardingStatus.pending; // Chờ lên xe
  
  DateTime? createdAt;
}

enum BoardingStatus {
  pending,
  boarded, // Đã quét mã lên xe
  cancelled
}

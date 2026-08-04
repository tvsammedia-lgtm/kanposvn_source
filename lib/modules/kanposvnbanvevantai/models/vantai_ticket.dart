import 'package:isar/isar.dart';
import 'vantai_customer.dart';
import 'vantai_route.dart';
import 'vantai_vehicle.dart';
import 'vantai_trip.dart';

part 'vantai_ticket.g.dart';

enum TicketStatus {
  RESERVED('Giữ chỗ'),
  PAID('Đã thanh toán'),
  CANCELLED('Đã hủy');

  final String label;
  const TicketStatus(this.label);
}

@collection
class VantaiTicket {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String ticketId = '';
  
  String ticketCode = '';
  
  DateTime? departureTime; // Giờ khởi hành
  
  String seatNumber = ''; // VD: A01, B02
  
  double price = 0.0;
  
  @enumerated
  TicketStatus status = TicketStatus.RESERVED;
  
  DateTime? bookingDate;

  final customer = IsarLink<VantaiCustomer>();
  final route = IsarLink<VantaiRoute>();
  final vehicle = IsarLink<VantaiVehicle>();
  final trip = IsarLink<VantaiTrip>(); // [NEW] Added Trip link
}

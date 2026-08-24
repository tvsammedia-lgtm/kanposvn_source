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

/// PRD mục 7: Thanh toán - Tiền mặt / Chuyển khoản / QR / Công nợ.
enum TicketPaymentMethod {
  CASH('Tiền mặt'),
  TRANSFER('Chuyển khoản'),
  QR('QR'),
  DEBT('Công nợ');

  final String label;
  const TicketPaymentMethod(this.label);
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

  @Index()
  String ticketCode = '';

  DateTime? departureTime; // Giờ khởi hành

  String seatNumber = ''; // VD: A01, B02

  double price = 0.0;

  @enumerated
  TicketStatus status = TicketStatus.RESERVED;

  @enumerated
  TicketPaymentMethod paymentMethod = TicketPaymentMethod.CASH;

  DateTime? bookingDate;

  // Tên/SĐT khách in trên vé (denormalized để tra nhanh khi quét vé)
  String passengerName = '';
  String passengerPhone = '';

  final customer = IsarLink<VantaiCustomer>();
  final route = IsarLink<VantaiRoute>();
  final vehicle = IsarLink<VantaiVehicle>();
  final trip = IsarLink<VantaiTrip>();
}

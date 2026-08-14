import 'package:isar/isar.dart';

part 'flight_offer.g.dart';

@collection
class FlightOffer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  String? airline;       // VD: Vietnam Airlines, Vietjet Air, Bamboo Airways
  String? flightNumber;  // VD: VN213, VJ111
  
  String? origin;        // Mã sân bay đi: HAN, SGN, DAD
  String? destination;   // Mã sân bay đến: SGN, HAN, PQC
  
  DateTime? departureTime;
  DateTime? arrivalTime;
  
  int? durationMinutes;  // Thời gian bay tính bằng phút
  
  double? baseFare;      // Giá cơ bản
  double? taxAndFee;     // Thuế phí
  double? totalFare;     // Tổng cộng

  String? cabinClass;    // Economy, Business
  
  DateTime? createdAt;
}

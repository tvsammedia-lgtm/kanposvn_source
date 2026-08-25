import 'package:isar/isar.dart';

part 'ops_models.g.dart';

/// §13. Bảng giá cước theo loại xe.
@collection
class XeOmTariff {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  /// Khớp VehicleType của xe: motorbike/taxi4Seats/taxi7Seats/evTaxi/truck/delivery
  @Index()
  String vehicleType = 'motorbike';

  double baseFare = 0; // Cước mở cửa
  double pricePerKm = 0; // §13 Theo km
  double pricePerMinute = 0; // §13 Theo thời gian

  /// §13 Giờ cao điểm: nhân thêm % trên tiền km+phút.
  double peakSurchargePercent = 0;

  /// §13 Phụ phí sân bay (áp dụng khi điểm đón/trả là sân bay).
  double airportSurcharge = 0;

  /// §13 Phụ phí ngày lễ.
  double holidaySurcharge = 0;

  String? notes;
}

/// §14. Khuyến mãi / Voucher.
@collection
class XeOmPromotion {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? code; // Mã voucher

  String? description;

  /// percent | fixedAmount | freeFirstKm
  String type = 'percent';

  /// percent: số % · fixedAmount: số tiền · freeFirstKm: số km miễn phí đầu
  double value = 0;

  double maxDiscount = 0; // Trần giảm tối đa (percent). 0 = không trần.
  double minFare = 0; // Đơn tối thiểu để áp dụng

  DateTime? validFrom;
  DateTime? validTo;
  bool active = true;
  int usageCount = 0;
}

/// §18. Chi phí vận hành hãng xe.
@collection
class XeOmExpense {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  /// FUEL | ELECTRICITY | REPAIR | MAINTENANCE | SALARY | MARKETING |
  /// INTERNET | DEPRECIATION | OTHER
  @Index()
  String category = 'OTHER';

  double amount = 0;
  String note = '';

  /// Gắn với tài xế/xe nếu là chi phí hoạt động (xăng, sửa xe...).
  String? driverUuid;
  String? vehicleUuid;

  @Index()
  DateTime createdAt = DateTime.now();
}

import 'package:isar/isar.dart';

part 'bida_table.g.dart';

enum BidaTableType {
  LO('Bida Lỗ'),
  LIBRE('Bida Libre'),
  BANG_3('Bida 3 Băng');

  final String label;
  const BidaTableType(this.label);
}

enum BidaTimeBlock {
  MINUTE_1(1, 'Thực tế (Từng phút)'),
  MINUTE_15(15, 'Block 15 Phút'),
  MINUTE_30(30, 'Block 30 Phút'),
  MINUTE_60(60, 'Block 60 Phút');

  final int minutes;
  final String label;
  const BidaTimeBlock(this.minutes, this.label);
}

enum BidaTableStatus {
  EMPTY('Trống'),
  PLAYING('Đang chơi'),
  RESERVED('Đã đặt'),
  MAINTENANCE('Bảo trì'),
  CLEANING('Đang vệ sinh');

  final String label;
  const BidaTableStatus(this.label);
}

/// IV. Thiết lập giá theo khung giờ / cuối tuần / loại bàn.
/// VD: ngày thường 08:00-17:00 = 70k, 17:00-23:00 = 90k, cuối tuần = 100k.
@collection
class BidaPricingRule {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String ruleId = '';

  @enumerated
  BidaTableType tableType = BidaTableType.LIBRE;

  /// Phút trong ngày bắt đầu (VD 480 = 08:00).
  int fromMinuteOfDay = 0;

  /// Phút trong ngày kết thúc (VD 1020 = 17:00).
  int toMinuteOfDay = 0;

  /// true = chỉ áp dụng Thứ 7 + Chủ nhật.
  bool weekendOnly = false;

  double pricePerHour = 0.0;

  /// Rule có priority cao hơn được ưu tiên nếu trùng khung.
  int priority = 0;

  String name = '';
}

/// VII. Tính tiền block: "3 giờ đầu 250k, sau đó 80k/giờ" hoặc "Combo 4 giờ 300k".
@collection
class BidaBlockPlan {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String planId = '';

  String name = '';

  @enumerated
  BidaTableType tableType = BidaTableType.LIBRE;

  /// Số giờ của block/combo (VD 3 hoặc 4).
  double blockHours = 0.0;

  /// Giá cố định cho block đầu tiên.
  double blockPrice = 0.0;

  /// Giá mỗi giờ tiếp theo vượt block (80k...). 0 = không tính thêm.
  double extraHourPrice = 0.0;
}

@collection
class BidaTable {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String tableId = '';

  String name = ''; // e.g. Bàn 01
  
  @enumerated
  BidaTableType type = BidaTableType.LIBRE;
  
  @enumerated
  BidaTableStatus status = BidaTableStatus.EMPTY;
  
  @enumerated
  BidaTimeBlock timeBlock = BidaTimeBlock.MINUTE_15;

  // Hourly price based on table type/settings
  double hourlyPrice = 0.0;
}

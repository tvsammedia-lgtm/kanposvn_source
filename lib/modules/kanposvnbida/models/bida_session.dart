import 'package:isar/isar.dart';
import 'bida_table.dart';

part 'bida_session.g.dart';

enum BidaSessionStatus {
  OPEN('Đang chơi'),
  PAID('Đã thanh toán'),
  CANCELLED('Đã hủy');

  final String label;
  const BidaSessionStatus(this.label);
}

@embedded
class BidaOrderLine {
  String itemId = '';
  String itemName = '';
  double price = 0.0;
  int quantity = 0;

  double get total => price * quantity;
}

@collection
class BidaSession {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String sessionId = '';

  final table = IsarLink<BidaTable>();

  DateTime? startTime;
  DateTime? endTime;

  @enumerated
  BidaSessionStatus status = BidaSessionStatus.OPEN;

  // The hourly price recorded when the session started
  double hourlyPrice = 0.0;

  // Total time cost
  double totalTimeCost = 0.0;

  /// VIII. Tiền cọc / thanh toán trước khách đã đưa khi mở bàn.
  double deposit = 0.0;

  /// Giảm giá trên hóa đơn (không tính tiền giờ).
  double discount = 0.0;

  /// XVII. Khách hàng gắn với phiên (nếu có).
  String customerCode = '';
  String customerName = '';

  /// Số điểm tích lũy đã cộng cho khách ở phiên này.
  int earnedPoints = 0;

  // Items ordered
  List<BidaOrderLine> orderLines = [];

  // Total cost for items
  double get totalItemCost {
    return orderLines.fold(0.0, (sum, line) => sum + line.total);
  }

  // Grand total
  double get grandTotal => totalTimeCost + totalItemCost;
}

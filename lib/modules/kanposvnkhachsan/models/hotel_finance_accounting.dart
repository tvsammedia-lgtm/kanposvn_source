import 'package:isar/isar.dart';

part 'hotel_finance_accounting.g.dart';

enum CashTransactionType {
  INCOME('Thu'),
  EXPENSE('Chi');

  final String label;
  const CashTransactionType(this.label);
}

@collection
class HotelCashTransaction {
  Id id = Isar.autoIncrement;
  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String transactionId = '';

  @enumerated
  CashTransactionType type = CashTransactionType.INCOME;

  double amount = 0;
  String category = ''; // Tiền phòng, Minibar, Thanh toán nhà cung cấp...
  String description = '';
  String referenceId = ''; // Liên kết tới CheckIn hoặc Nhập kho
  
  String createdBy = ''; // Tên NV
  DateTime createdAt = DateTime.now();
}

@collection
class HotelShiftReport {
  Id id = Isar.autoIncrement;
  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String reportId = '';

  String shiftName = ''; // Ca sáng, Ca chiều
  String employeeName = '';
  
  DateTime startTime = DateTime.now();
  DateTime? endTime;
  
  double startingCash = 0; // Tiền mặt đầu ca
  double totalCashIncome = 0;
  double totalCashExpense = 0;
  double endingCash = 0; // Tiền mặt thực tế bàn giao
  double difference = 0; // Chênh lệch (nếu có)
  
  String note = '';
  bool isClosed = false;
}

@collection
class HotelAccountingSummary {
  Id id = Isar.autoIncrement;
  bool isSynced = false;
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String summaryDate = ''; // YYYY-MM-DD
  
  double totalRoomRevenue = 0;
  double totalServiceRevenue = 0;
  double totalExpense = 0;
  double netProfit = 0;
  
  DateTime updatedAt = DateTime.now();
}

import 'package:isar/isar.dart';

part 'parking_finance.g.dart';

/// §14. Danh mục chi phí bãi xe.
enum ParkingExpenseCategory {
  ELECTRICITY('Điện'),
  WATER('Nước'),
  RENT('Thuê mặt bằng'),
  CAMERA('Camera'),
  SALARY('Lương'),
  MAINTENANCE('Bảo trì'),
  OTHER('Chi khác');

  final String label;
  const ParkingExpenseCategory(this.label);
}

/// §14. Nguồn thu ngoài lượt (doanh thu vé lẻ/vé tháng/thuê xe đã tính
/// từ ParkingTicket/MonthlyTicket/Rental — không tạo trùng ở đây).
enum ParkingIncomeCategory {
  OTHER_INCOME('Thu khác'),
  DEBT_COLLECTION('Thu công nợ');

  final String label;
  const ParkingIncomeCategory(this.label);
}

/// Phiếu thu / chi thủ công của bãi xe.
@collection
class ParkingFinanceTx {
  Id isarId = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();

  @Index(unique: true, replace: true)
  String financeId = '';

  /// true = PHIẾU THU, false = PHIẾU CHI.
  bool isIncome = false;

  @Index()
  DateTime createdAt = DateTime.now();

  double amount = 0;

  String incomeCategory = '';

  @Index()
  String expenseCategory = '';

  String note = '';
}

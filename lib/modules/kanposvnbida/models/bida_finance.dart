import 'package:isar/isar.dart';

part 'bida_finance.g.dart';

/// XX. Nguồn thu (thu khác ngoài doanh thu bán hàng — doanh thu tính từ session).
enum BidaIncomeCategory {
  DEBT_COLLECTION('Thu công nợ'),
  OTHER_INCOME('Thu khác');

  final String label;
  const BidaIncomeCategory(this.label);
}

/// XXI. Khoản chi.
enum BidaExpenseCategory {
  RENT('Thuê mặt bằng'),
  ELECTRICITY('Điện'),
  WATER('Nước'),
  INTERNET('Internet'),
  SALARY('Lương'),
  GOODS_PURCHASE('Mua hàng'),
  MARKETING('Marketing'),
  DEPRECIATION('Khấu hao'),
  OTHER_EXPENSE('Chi khác');

  final String label;
  const BidaExpenseCategory(this.label);
}

/// Phiếu thu / phiếu chi thủ công.
/// (Doanh thu bàn + nước đã tổng hợp từ BidaSession — KHÔNG tạo trùng ở đây.)
@collection
class BidaFinanceTx {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String financeId = '';

  /// true = PHIẾU THU, false = PHIẾU CHI.
  bool isIncome = false;

  @Index()
  DateTime createdAt = DateTime.now();

  double amount = 0.0;

  @Index()
  String incomeCategory = '';

  @Index()
  String expenseCategory = '';

  String note = '';
}

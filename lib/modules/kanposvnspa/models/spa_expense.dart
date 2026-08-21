import 'package:isar/isar.dart';

part 'spa_expense.g.dart';

enum SpaExpenseType {
  FIXED('Chi phí cố định'),
  VARIABLE('Chi phí biến đổi'),
  REVENUE('Doanh thu khác');

  final String label;
  const SpaExpenseType(this.label);
}

/// Bảng thu chi (spec §18) — gồm cả chi phí cố định/biến đổi (§17).
@collection
class SpaExpense {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String expenseId = '';

  String content = ''; // Nội dung: Thuê mặt bằng, Nhập mỹ phẩm...

  /// amount > 0 = Chi, amount < 0 = Thu (hoặc dùng type REVENUE)
  double amount = 0;

  @enumerated
  SpaExpenseType type = SpaExpenseType.VARIABLE;

  String category = ''; // Thuê nhà, Điện nước, Lương, Marketing, Mỹ phẩm...

  @Index()
  DateTime spentAt = DateTime.now();

  String notes = '';
}

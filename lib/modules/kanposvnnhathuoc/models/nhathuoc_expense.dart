import 'package:isar/isar.dart';

part 'nhathuoc_expense.g.dart';

enum ExpenseType {
  INCOME('Thu'),
  EXPENSE('Chi');

  final String label;
  const ExpenseType(this.label);
}

enum ExpenseCategory {
  // Thu
  SALES('Bán hàng'),
  DEBT_COLLECTION('Thu công nợ'),
  OTHER_INCOME('Thu khác'),
  // Chi
  IMPORT_DRUGS('Nhập thuốc'),
  SALARY('Lương'),
  ELECTRICITY('Điện'),
  WATER('Nước'),
  RENT('Thuê mặt bằng'),
  MARKETING('Marketing'),
  DEPRECIATION('Khấu hao'),
  OTHER_EXPENSE('Chi khác');

  final String label;
  const ExpenseCategory(this.label);
}

@collection
class NhathuocExpense {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String expenseId = '';

  @enumerated
  ExpenseType type = ExpenseType.EXPENSE;

  @enumerated
  ExpenseCategory category = ExpenseCategory.OTHER_EXPENSE;

  double amount = 0.0;
  String description = '';
  DateTime createdAt = DateTime.now();
  String createdBy = ''; // Nhân viên tạo
}

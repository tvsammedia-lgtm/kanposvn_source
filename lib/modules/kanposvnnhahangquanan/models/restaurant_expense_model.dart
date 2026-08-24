import 'package:isar/isar.dart';

part 'restaurant_expense_model.g.dart';

enum RestaurantExpenseCategory {
  INGREDIENT('Nguyên liệu'),
  SALARY('Lương'),
  ELECTRICITY('Điện'),
  WATER('Nước'),
  GAS('Gas'),
  RENT('Thuê mặt bằng'),
  MARKETING('Marketing'),
  DEPRECIATION('Khấu hao'),
  INTERNET('Internet'),
  TAX('Thuế'),
  OTHER('Chi phí khác');

  final String label;
  const RestaurantExpenseCategory(this.label);
}

/// Chi phí vận hành nhà hàng.
@collection
class RestaurantExpense {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String expenseId = '';

  @enumerated
  RestaurantExpenseCategory category = RestaurantExpenseCategory.OTHER;

  double amount = 0;
  String note = '';

  @Index()
  DateTime createdAt = DateTime.now();
}

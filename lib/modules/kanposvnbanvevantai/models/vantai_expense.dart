import 'package:isar/isar.dart';
import 'vantai_trip.dart';

part 'vantai_expense.g.dart';

enum ExpenseCategory {
  FUEL('Tiền Dầu'),
  TOLL('Trạm Thu Phí'),
  SALARY('Lương Tài Xế'),
  MAINTENANCE('Sửa Chữa / Bảo Dưỡng'),
  OTHER('Khác');

  final String label;
  const ExpenseCategory(this.label);
}

@collection
class VantaiExpense {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String expenseId = '';

  @enumerated
  ExpenseCategory category = ExpenseCategory.OTHER;

  double amount = 0.0;
  String description = '';
  
  DateTime? date;

  // Tuỳ chọn: Gắn chi phí này vào một chuyến xe cụ thể (Ví dụ: Tiền dầu chuyến Sài Gòn - Đà Lạt)
  final trip = IsarLink<VantaiTrip>();
}

import 'package:isar/isar.dart';

part 'barber_expense.g.dart';

@collection
class BarberExpense {
  Id id = Isar.autoIncrement;

  String expenseId = '';
  String category = ''; // Thuê mặt bằng, Điện, Nước, Internet, Marketing, Lương, Mỹ phẩm, Thiết bị
  String description = '';
  double amount = 0.0;

  String? supplierId;
  String? supplierName;

  String? paidBy;
  String paymentMethod = 'Tiền mặt';

  DateTime createdAt = DateTime.now();
}

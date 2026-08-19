import 'package:isar/isar.dart';
import 'customer.dart';
import 'supplier.dart';

part 'pawn_cash_transaction.g.dart';

@collection
class PawnCashTransaction {
  Id id = Isar.autoIncrement;

  String? documentCode;

  @enumerated
  TransactionType type = TransactionType.income;

  double? amount;

  String? category;
  String? description;

  final customer = IsarLink<Customer>();
  final supplier = IsarLink<Supplier>();

  String? createdBy;
  DateTime? createdAt;
}

enum TransactionType {
  income,
  expense,
}

class TransactionCategories {
  static const incomeCategories = [
    'Bán hàng',
    'Thu lãi cầm đồ',
    'Thu nợ khách hàng',
    'Thu ký gửi',
    'Thu khác',
  ];

  static const expenseCategories = [
    'Nhập hàng',
    'Lương nhân viên',
    'Điện nước',
    'Thuê mặt bằng',
    'Marketing',
    'Chi khác',
  ];
}

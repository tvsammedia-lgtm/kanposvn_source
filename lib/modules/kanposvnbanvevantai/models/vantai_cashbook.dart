import 'package:isar/isar.dart';

part 'vantai_cashbook.g.dart';

enum CashTxType {
  THU('Phiếu thu'),
  CHI('Phiếu chi');

  final String label;
  const CashTxType(this.label);
}

enum CashAccount {
  CASH('Quỹ tiền mặt'),
  BANK('Ngân hàng');

  final String label;
  const CashAccount(this.label);
}

/// PRD mục 18-19: Quỹ tiền mặt / Ngân hàng, Thu - Chi - Sổ quỹ.
@collection
class VantaiCashTx {
  Id id = Isar.autoIncrement;

  bool isSynced = false;
  DateTime updatedAt = DateTime.now();
  DateTime? deletedAt;
  String deviceId = "";
  int version = 1;

  @Index(unique: true, replace: true)
  String txId = '';

  @enumerated
  CashTxType type = CashTxType.THU;

  @enumerated
  CashAccount account = CashAccount.CASH;

  double amount = 0;
  String note = '';
  String refCode = ''; // Mã tham chiếu (mã vé / mã hàng / phiếu chi...)

  @Index()
  DateTime createdAt = DateTime.now();
}

import 'package:isar/isar.dart';

part 'account_default.g.dart';

/// Tài khoản mặc định theo RefType / Loại chứng từ (từ MISA SME 2023 AccountDefault).
/// Khi tạo bút toán, hệ thống tự động lấy tài khoản Nợ/Có từ đây.
@collection
class AccountDefault {
  Id id = Isar.autoIncrement;

  /// RefType theo MISA (VD: 111=tiền mặt, 112=ngân hàng, 4010=nghiệp vụ khác).
  late int refType;

  /// Tên hiển thị (VD: "Chi phí lương", "BHXH NSDL", "Thuế TNCN").
  late String refTypeName;

  /// Loại chứng từ (VD: "PASalaryExpense", "GLVoucher", "CAPayment").
  String? voucherType;

  /// Tài khoản NỢ mặc định.
  late String defaultDebitAccount;

  /// Tài khoản CÓ mặc định.
  late String defaultCreditAccount;

  /// Tài khoản NỢ đối ứng (cross account).
  String? crossDebitAccount;

  /// Tài khoản CÓ đối ứng (cross account).
  String? crossCreditAccount;

  /// Bộ lọc (VD: "Department='Kế toán'").
  String? filterCondition;

  bool inactive = false;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

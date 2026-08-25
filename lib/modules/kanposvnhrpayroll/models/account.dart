import 'package:isar/isar.dart';

part 'account.g.dart';

/// Loại tài khoản theo TT133.
/// 0 = Bảng cân đối kế toán, 2 = Outside balance sheet.
enum AccountCategoryKind { balanceSheet, offBalanceSheet }

/// Mô hình tài khoản kế toán theo Chart of Accounts TT133/MISA SME 2023.
/// Hỗ trợ phân cấp 3 tầng: Tài khoản cha → Tài khoản con → Tài khoản chi tiết.
@collection
class Account {
  Id id = Isar.autoIncrement;

  /// Số tài khoản (VD: "111", "334", "6422").
  @Index(unique: true)
  late String accountNumber;

  /// Tên tiếng Việt.
  late String accountName;

  /// Tên tiếng Anh (từ MISA TT133).
  String? accountNameEnglish;

  String? description;

  /// Tài khoản cha (null = tài khoản cấp 1).
  int? parentId;

  /// Cấp bậc: 1 = cha, 2 = con, 3 = chi tiết.
  late int grade;

  /// Có phải tài khoản cha (khong ghi sổ trực tiếp).
  late bool isParent;

  /// Loại tài khoản (0 = balance sheet, 2 = off-balance).
  @Enumerated(EnumType.name)
  AccountCategoryKind accountCategoryKind = AccountCategoryKind.balanceSheet;

  // ─── Flags theo dõi chi tiết (DetailBy...) ──────────────────────────────
  bool detailByAccountObject = false;
  bool detailByBankAccount = false;
  bool detailByJob = false;
  bool detailByProjectWork = false;
  bool detailByOrder = false;
  bool detailByContract = false;
  bool detailByExpenseItem = false;
  bool detailByDepartment = false;

  bool inactive = false;

  // Sync
  String? remoteId;
  DateTime? lastSyncAt;
  bool needsSync = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // ─── Computed ──────────────────────────────────────────────────────────
  @ignore
  bool get isDebitNormal =>
      accountNumber.startsWith('1') ||
      accountNumber.startsWith('2') ||
      accountNumber.startsWith('5') ||
      accountNumber.startsWith('6');

  @ignore
  bool get isCreditNormal =>
      accountNumber.startsWith('3') ||
      accountNumber.startsWith('4');
}

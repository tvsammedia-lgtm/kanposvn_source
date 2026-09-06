import 'package:isar/isar.dart';

part 'account.g.dart';

/// Loại tài khoản theo TT133.
/// 0 = Bảng cân đối kế toán, 2 = Ngoài bảng cân đối kế toán.
enum TramXangAccountCategoryKind { balanceSheet, offBalanceSheet }

/// Mô hình tài khoản kế toán cho Trạm Xăng (Chart of Accounts TT133).
/// Hỗ trợ phân cấp 3 tầng: Tài khoản cha → Tài khoản con → Tài khoản chi tiết.
@collection
class TramXangAccount {
  Id id = Isar.autoIncrement;

  /// Số tài khoản (VD: "111", "1561", "5111").
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

  /// Có phải tài khoản cha (không ghi sổ trực tiếp).
  late bool isParent;

  /// Loại tài khoản (balanceSheet / offBalanceSheet).
  @Enumerated(EnumType.name)
  TramXangAccountCategoryKind accountCategoryKind = TramXangAccountCategoryKind.balanceSheet;

  // ─── Flags theo dõi chi tiết (DetailBy...) ──────────────────────────────
  bool detailByAccountObject = false;
  bool detailByBankAccount = false;
  bool detailByJob = false;
  bool detailByExpenseItem = false;

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
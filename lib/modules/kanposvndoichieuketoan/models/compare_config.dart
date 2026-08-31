/// Cấu hình đối chiếu — spec §32 + các tùy chọn nâng cao (§12, §41, §42, §43, §44, §46).
class CompareConfig {
  /// Các cột chuẩn dùng để tạo key (Khóa 1, Khóa 2, ...).
  final List<String> keyColumns;

  /// Các cột chuẩn cần so sánh.
  final List<String> compareColumns;

  final bool ignoreCase;
  final bool trimSpaces;
  final bool normalizeUnicode;
  final bool normalizeNumbers;
  final bool normalizeDates;

  /// Sai số cho phép khi so sánh số (§12).
  final double numberTolerance;

  /// Số chữ số thập phân khi làm tròn trước khi so sánh (§43).
  final int decimalPlaces;

  /// Định dạng âm kiểu kế toán: -100000 == (100000) (§42).
  final bool accountingNegative;

  /// Coi null và empty giống nhau (§41).
  final bool treatEmptyAsSame;

  /// Coi "-" là empty (§41).
  final bool treatDashAsEmpty;

  /// Coi N/A, NA là empty (§41).
  final bool treatNaAsEmpty;

  /// 0 = Exact, 1 = Normalized, 2 = Accounting (§17).
  final int matchMode;

  /// row | aggregate | ignore (§16, §44).
  final String duplicateMode;

  /// Cột chuẩn dùng để tính tổng tiền (§45).
  final String? amountColumn;

  const CompareConfig({
    this.keyColumns = const [],
    this.compareColumns = const [],
    this.ignoreCase = true,
    this.trimSpaces = true,
    this.normalizeUnicode = true,
    this.normalizeNumbers = true,
    this.normalizeDates = true,
    this.numberTolerance = 0,
    this.decimalPlaces = 2,
    this.accountingNegative = true,
    this.treatEmptyAsSame = true,
    this.treatDashAsEmpty = true,
    this.treatNaAsEmpty = false,
    this.matchMode = 1,
    this.duplicateMode = 'row',
    this.amountColumn,
  });

  CompareConfig copyWith({
    List<String>? keyColumns,
    List<String>? compareColumns,
    bool? ignoreCase,
    bool? trimSpaces,
    bool? normalizeUnicode,
    bool? normalizeNumbers,
    bool? normalizeDates,
    double? numberTolerance,
    int? decimalPlaces,
    bool? accountingNegative,
    bool? treatEmptyAsSame,
    bool? treatDashAsEmpty,
    bool? treatNaAsEmpty,
    int? matchMode,
    String? duplicateMode,
    String? amountColumn,
  }) {
    return CompareConfig(
      keyColumns: keyColumns ?? this.keyColumns,
      compareColumns: compareColumns ?? this.compareColumns,
      ignoreCase: ignoreCase ?? this.ignoreCase,
      trimSpaces: trimSpaces ?? this.trimSpaces,
      normalizeUnicode: normalizeUnicode ?? this.normalizeUnicode,
      normalizeNumbers: normalizeNumbers ?? this.normalizeNumbers,
      normalizeDates: normalizeDates ?? this.normalizeDates,
      numberTolerance: numberTolerance ?? this.numberTolerance,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      accountingNegative: accountingNegative ?? this.accountingNegative,
      treatEmptyAsSame: treatEmptyAsSame ?? this.treatEmptyAsSame,
      treatDashAsEmpty: treatDashAsEmpty ?? this.treatDashAsEmpty,
      treatNaAsEmpty: treatNaAsEmpty ?? this.treatNaAsEmpty,
      matchMode: matchMode ?? this.matchMode,
      duplicateMode: duplicateMode ?? this.duplicateMode,
      amountColumn: amountColumn ?? this.amountColumn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'keyColumns': keyColumns,
      'compareColumns': compareColumns,
      'ignoreCase': ignoreCase,
      'trimSpaces': trimSpaces,
      'normalizeUnicode': normalizeUnicode,
      'normalizeNumbers': normalizeNumbers,
      'normalizeDates': normalizeDates,
      'numberTolerance': numberTolerance,
      'decimalPlaces': decimalPlaces,
      'accountingNegative': accountingNegative,
      'treatEmptyAsSame': treatEmptyAsSame,
      'treatDashAsEmpty': treatDashAsEmpty,
      'treatNaAsEmpty': treatNaAsEmpty,
      'matchMode': matchMode,
      'duplicateMode': duplicateMode,
      'amountColumn': amountColumn,
    };
  }

  factory CompareConfig.fromMap(Map<String, dynamic> map) {
    return CompareConfig(
      keyColumns: List<String>.from(map['keyColumns'] ?? const []),
      compareColumns: List<String>.from(map['compareColumns'] ?? const []),
      ignoreCase: map['ignoreCase'] ?? true,
      trimSpaces: map['trimSpaces'] ?? true,
      normalizeUnicode: map['normalizeUnicode'] ?? true,
      normalizeNumbers: map['normalizeNumbers'] ?? true,
      normalizeDates: map['normalizeDates'] ?? true,
      numberTolerance: (map['numberTolerance'] ?? 0).toDouble(),
      decimalPlaces: map['decimalPlaces'] ?? 2,
      accountingNegative: map['accountingNegative'] ?? true,
      treatEmptyAsSame: map['treatEmptyAsSame'] ?? true,
      treatDashAsEmpty: map['treatDashAsEmpty'] ?? true,
      treatNaAsEmpty: map['treatNaAsEmpty'] ?? false,
      matchMode: map['matchMode'] ?? 1,
      duplicateMode: map['duplicateMode'] ?? 'row',
      amountColumn: map['amountColumn'],
    );
  }
}
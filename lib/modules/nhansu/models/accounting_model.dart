class NhanSuAccount {
  final String id;
  final String code;
  final String name;
  final String group;
  final bool isActive;
  final bool isDebit;
  final DateTime updatedAt;

  NhanSuAccount({
    required this.id,
    required this.code,
    required this.name,
    required this.group,
    this.isActive = true,
    this.isDebit = true,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'group': group,
    'isActive': isActive,
    'isDebit': isDebit,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory NhanSuAccount.fromJson(Map<String, dynamic> json) => NhanSuAccount(
    id: json['id'] as String,
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    group: json['group'] as String? ?? '',
    isActive: json['isActive'] as bool? ?? true,
    isDebit: json['isDebit'] as bool? ?? true,
    updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'] as String) : null,
  );

  NhanSuAccount copyWith({
    String? code,
    String? name,
    String? group,
    bool? isActive,
    bool? isDebit,
  }) {
    return NhanSuAccount(
      id: id,
      code: code ?? this.code,
      name: name ?? this.name,
      group: group ?? this.group,
      isActive: isActive ?? this.isActive,
      isDebit: isDebit ?? this.isDebit,
      updatedAt: DateTime.now(),
    );
  }
}

class NhanSuJournalLine {
  final String accountCode;
  final String accountName;
  final double debit;
  final double credit;
  final String description;

  NhanSuJournalLine({
    required this.accountCode,
    this.accountName = '',
    this.debit = 0,
    this.credit = 0,
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
    'accountCode': accountCode,
    'accountName': accountName,
    'debit': debit,
    'credit': credit,
    'description': description,
  };

  factory NhanSuJournalLine.fromJson(Map<String, dynamic> json) => NhanSuJournalLine(
    accountCode: json['accountCode'] as String? ?? '',
    accountName: json['accountName'] as String? ?? '',
    debit: (json['debit'] as num?)?.toDouble() ?? 0,
    credit: (json['credit'] as num?)?.toDouble() ?? 0,
    description: json['description'] as String? ?? '',
  );

  double get amount => debit > 0 ? debit : credit;
  bool get isDebit => debit > 0;

  NhanSuJournalLine copyWith({
    String? accountCode,
    String? accountName,
    double? debit,
    double? credit,
    String? description,
  }) {
    return NhanSuJournalLine(
      accountCode: accountCode ?? this.accountCode,
      accountName: accountName ?? this.accountName,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
      description: description ?? this.description,
    );
  }
}

class NhanSuJournalEntry {
  final String id;
  final String journalID;
  final String entryType;
  final int year;
  final int month;
  final DateTime date;
  final String description;
  final List<NhanSuJournalLine> lines;
  final bool isPosted;
  final bool isReversed;
  final String? sourceRef;
  final bool isSynced;
  final DateTime updatedAt;

  NhanSuJournalEntry({
    required this.id,
    required this.journalID,
    this.entryType = 'GL',
    required this.year,
    required this.month,
    DateTime? date,
    this.description = '',
    this.lines = const [],
    this.isPosted = false,
    this.isReversed = false,
    this.sourceRef,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : date = date ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  double get totalDebit => lines.fold(0, (s, l) => s + l.debit);
  double get totalCredit => lines.fold(0, (s, l) => s + l.credit);
  bool get isBalanced => (totalDebit - totalCredit).abs() < 0.01;

  Map<String, dynamic> toJson() => {
    'id': id,
    'journalID': journalID,
    'entryType': entryType,
    'year': year,
    'month': month,
    'date': date.toIso8601String(),
    'description': description,
    'lines': lines.map((l) => l.toJson()).toList(),
    'isPosted': isPosted,
    'isReversed': isReversed,
    'sourceRef': sourceRef,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory NhanSuJournalEntry.fromJson(Map<String, dynamic> json) => NhanSuJournalEntry(
    id: json['id'] as String,
    journalID: json['journalID'] as String? ?? '',
    entryType: json['entryType'] as String? ?? 'GL',
    year: json['year'] as int? ?? DateTime.now().year,
    month: json['month'] as int? ?? DateTime.now().month,
    date: json['date'] != null ? DateTime.tryParse(json['date'] as String) : null,
    description: json['description'] as String? ?? '',
    lines: (json['lines'] as List<dynamic>?)
            ?.map((l) => NhanSuJournalLine.fromJson(l as Map<String, dynamic>))
            .toList() ??
        const [],
    isPosted: json['isPosted'] as bool? ?? false,
    isReversed: json['isReversed'] as bool? ?? false,
    sourceRef: json['sourceRef'] as String?,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'] as String) : null,
  );

  NhanSuJournalEntry copyWith({
    String? description,
    List<NhanSuJournalLine>? lines,
    bool? isPosted,
    bool? isReversed,
  }) {
    return NhanSuJournalEntry(
      id: id,
      journalID: journalID,
      entryType: entryType,
      year: year,
      month: month,
      date: date,
      description: description ?? this.description,
      lines: lines ?? this.lines,
      isPosted: isPosted ?? this.isPosted,
      isReversed: isReversed ?? this.isReversed,
      sourceRef: sourceRef,
      isSynced: isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

class NhanSuAccountDefault {
  final String id;
  final String refType;
  final String debitAccount;
  final String creditAccount;
  final String description;

  NhanSuAccountDefault({
    required this.id,
    required this.refType,
    required this.debitAccount,
    required this.creditAccount,
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'refType': refType,
    'debitAccount': debitAccount,
    'creditAccount': creditAccount,
    'description': description,
  };

  factory NhanSuAccountDefault.fromJson(Map<String, dynamic> json) => NhanSuAccountDefault(
    id: json['id'] as String,
    refType: json['refType'] as String? ?? '',
    debitAccount: json['debitAccount'] as String? ?? '',
    creditAccount: json['creditAccount'] as String? ?? '',
    description: json['description'] as String? ?? '',
  );
}

enum NhanSuEntryType {
  gl('GL', 'Bút toán tổng hợp'),
  salaryExpense('SALARY', 'Chi phí lương'),
  insurance('INS', 'Bảo hiểm'),
  tax('TAX', 'Thuế TNCN'),
  payment('PAY', 'Thanh toán'),
  bonus('BONUS', 'Thưởng'),
  advance('ADV', 'Tạm ứng');

  final String code;
  final String label;
  const NhanSuEntryType(this.code, this.label);

  static NhanSuEntryType fromCode(String code) {
    return NhanSuEntryType.values.firstWhere(
      (e) => e.code == code,
      orElse: () => NhanSuEntryType.gl,
    );
  }
}

/// Bút toán kế toán (§18) — chứng từ -> bút toán -> sổ cái -> báo cáo (§49).
///
/// Mọi nghiệp vụ tài chính đều được ghi nhận bằng bút toán cân bằng
/// (Tổng Nợ = Tổng Có) trước khi xuất ra sổ kế toán.
library;

class NongSanJournalLine {
  final String accountCode; // VD: '156', '331', '133'...
  final String accountName;
  final double debit; // Số tiền nợ
  final double credit; // Số tiền có
  final String partnerId; // Theo dõi đối tượng (khách hàng/nhà cung cấp)

  NongSanJournalLine({
    required this.accountCode,
    this.accountName = '',
    this.debit = 0,
    this.credit = 0,
    this.partnerId = '',
  });

  Map<String, dynamic> toJson() => {
        'accountCode': accountCode,
        'accountName': accountName,
        'debit': debit,
        'credit': credit,
        'partnerId': partnerId,
      };

  factory NongSanJournalLine.fromJson(Map<String, dynamic> json) =>
      NongSanJournalLine(
        accountCode: json['accountCode'] ?? '',
        accountName: json['accountName'] ?? '',
        debit: (json['debit'] as num?)?.toDouble() ?? 0,
        credit: (json['credit'] as num?)?.toDouble() ?? 0,
        partnerId: json['partnerId'] ?? '',
      );

  NongSanJournalLine copyWith({double? debit, double? credit}) => NongSanJournalLine(
        accountCode: accountCode,
        accountName: accountName,
        debit: debit ?? this.debit,
        credit: credit ?? this.credit,
        partnerId: partnerId,
      );
}

class NongSanJournalEntry {
  static const List<String> defaultAccounts = [
    '111', '112', '131', '133', '156', '331', '333',
    '511', '632', '641', '642', '515', '635', '711', '811', '911', '421',
  ];

  /// Tên tài khoản theo Chế độ kế toán doanh nghiệp (TT133) — dùng cho tab
  /// Kế toán (Hệ thống TK, nhập bút toán, sổ cái).
  static const Map<String, String> accountNames = {
    '111': 'Tiền mặt',
    '112': 'Tiền gửi ngân hàng',
    '131': 'Phải thu khách hàng',
    '133': 'Thuế GTGT được khấu trừ',
    '156': 'Hàng hóa',
    '331': 'Phải trả người bán',
    '333': 'Thuế và các khoản phải nộp Nhà nước',
    '511': 'Doanh thu bán hàng và cung cấp dịch vụ',
    '632': 'Giá vốn hàng bán',
    '641': 'Chi phí bán hàng',
    '642': 'Chi phí quản lý doanh nghiệp',
    '515': 'Doanh thu hoạt động tài chính',
    '635': 'Chi phí tài chính',
    '711': 'Thu nhập khác',
    '811': 'Chi phí khác',
    '911': 'Xác định kết quả kinh doanh',
    '421': 'Lợi nhuận sau thuế chưa phân phối',
  };

  static String accountNameOf(String code) =>
      accountNames[code] ?? (code.isEmpty ? '—' : 'Tài khoản $code');

  final String id;
  final int entryNumber; // Số bút toán tăng dần
  final DateTime entryDate;
  final String refType; // PURCHASE / SALE / COGS / RECEIPT / PAYMENT / EXPENSE / MANUAL / RETURN
  final String refId; // Liên kết chứng từ nghiệp vụ (§49)
  final String narration; // Diễn giải
  final String status; // POSTED / LOCKED (§48)
  final List<NongSanJournalLine> lines;

  NongSanJournalEntry({
    required this.id,
    this.entryNumber = 0,
    DateTime? entryDate,
    this.refType = 'MANUAL',
    this.refId = '',
    this.narration = '',
    this.status = 'POSTED',
    List<NongSanJournalLine>? lines,
  })  : lines = lines ?? [],
        entryDate = entryDate ?? DateTime.now();

  double get totalDebit => lines.fold(0, (s, l) => s + l.debit);
  double get totalCredit => lines.fold(0, (s, l) => s + l.credit);

  /// §18.1: Không cho ghi sổ nếu bút toán không cân.
  bool get isBalanced => (totalDebit - totalCredit).abs() < 0.001;

  Map<String, dynamic> toJson() => {
        'id': id,
        'entryNumber': entryNumber,
        'entryDate': entryDate.toIso8601String(),
        'refType': refType,
        'refId': refId,
        'narration': narration,
        'status': status,
        'lines': lines.map((l) => l.toJson()).toList(),
      };

  factory NongSanJournalEntry.fromJson(Map<String, dynamic> json) =>
      NongSanJournalEntry(
        id: json['id'] ?? '',
        entryNumber: json['entryNumber'] ?? 0,
        entryDate: json['entryDate'] != null
            ? DateTime.parse(json['entryDate'])
            : DateTime.now(),
        refType: json['refType'] ?? 'MANUAL',
        refId: json['refId'] ?? '',
        narration: json['narration'] ?? '',
        status: json['status'] ?? 'POSTED',
        lines: (json['lines'] as List? ?? [])
            .map((l) => NongSanJournalLine.fromJson(l as Map<String, dynamic>))
            .toList(),
      );
}
class PayrollModel {
  final String id;
  final String employeeId;
  final String employeeCode;
  final String employeeName;
  final String department;
  final String position;
  final int year;
  final int month;
  final double baseSalary;
  final double earnedBaseSalary;
  final double overtimePay;
  final Map<String, double> allowances;
  final double bonus;
  final Map<String, double> deductions;
  final double netSalary;
  final String status;
  final bool isSynced;
  final DateTime updatedAt;

  PayrollModel({
    required this.id,
    required this.employeeId,
    required this.employeeCode,
    required this.employeeName,
    this.department = '',
    this.position = '',
    required this.year,
    required this.month,
    this.baseSalary = 0,
    this.earnedBaseSalary = 0,
    this.overtimePay = 0,
    this.allowances = const {},
    this.bonus = 0,
    this.deductions = const {},
    this.netSalary = 0,
    this.status = 'draft',
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'employeeId': employeeId,
    'employeeCode': employeeCode,
    'employeeName': employeeName,
    'department': department,
    'position': position,
    'year': year,
    'month': month,
    'baseSalary': baseSalary,
    'earnedBaseSalary': earnedBaseSalary,
    'overtimePay': overtimePay,
    'allowances': allowances,
    'bonus': bonus,
    'deductions': deductions,
    'netSalary': netSalary,
    'status': status,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory PayrollModel.fromJson(Map<String, dynamic> json) => PayrollModel(
    id: json['id'] as String,
    employeeId: json['employeeId'] as String? ?? '',
    employeeCode: json['employeeCode'] as String? ?? '',
    employeeName: json['employeeName'] as String? ?? '',
    department: json['department'] as String? ?? '',
    position: json['position'] as String? ?? '',
    year: json['year'] as int? ?? DateTime.now().year,
    month: json['month'] as int? ?? DateTime.now().month,
    baseSalary: (json['baseSalary'] as num?)?.toDouble() ?? 0,
    earnedBaseSalary: (json['earnedBaseSalary'] as num?)?.toDouble() ?? 0,
    overtimePay: (json['overtimePay'] as num?)?.toDouble() ?? 0,
    allowances: (json['allowances'] as Map<String, dynamic>?)
            ?.map((k, v) => MapEntry(k, (v as num?)?.toDouble() ?? 0)) ??
        const {},
    bonus: (json['bonus'] as num?)?.toDouble() ?? 0,
    deductions: (json['deductions'] as Map<String, dynamic>?)
            ?.map((k, v) => MapEntry(k, (v as num?)?.toDouble() ?? 0)) ??
        const {},
    netSalary: (json['netSalary'] as num?)?.toDouble() ?? 0,
    status: json['status'] as String? ?? 'draft',
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  PayrollModel copyWith({
    String? id,
    String? employeeId,
    String? employeeCode,
    String? employeeName,
    String? department,
    String? position,
    int? year,
    int? month,
    double? baseSalary,
    double? earnedBaseSalary,
    double? overtimePay,
    Map<String, double>? allowances,
    double? bonus,
    Map<String, double>? deductions,
    double? netSalary,
    String? status,
    bool? isSynced,
  }) {
    return PayrollModel(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      employeeCode: employeeCode ?? this.employeeCode,
      employeeName: employeeName ?? this.employeeName,
      department: department ?? this.department,
      position: position ?? this.position,
      year: year ?? this.year,
      month: month ?? this.month,
      baseSalary: baseSalary ?? this.baseSalary,
      earnedBaseSalary: earnedBaseSalary ?? this.earnedBaseSalary,
      overtimePay: overtimePay ?? this.overtimePay,
      allowances: allowances ?? this.allowances,
      bonus: bonus ?? this.bonus,
      deductions: deductions ?? this.deductions,
      netSalary: netSalary ?? this.netSalary,
      status: status ?? this.status,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

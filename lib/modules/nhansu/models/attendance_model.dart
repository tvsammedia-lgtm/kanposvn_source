class AttendanceModel {
  final String id;
  final String employeeId;
  final String employeeCode;
  final String employeeName;
  final int year;
  final int month;
  final double workingDays;
  final double overtimeHours;
  final double leaveDays;
  final bool isSynced;
  final DateTime updatedAt;

  AttendanceModel({
    required this.id,
    required this.employeeId,
    required this.employeeCode,
    required this.employeeName,
    required this.year,
    required this.month,
    this.workingDays = 0,
    this.overtimeHours = 0,
    this.leaveDays = 0,
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'employeeId': employeeId,
    'employeeCode': employeeCode,
    'employeeName': employeeName,
    'year': year,
    'month': month,
    'workingDays': workingDays,
    'overtimeHours': overtimeHours,
    'leaveDays': leaveDays,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
    id: json['id'] as String,
    employeeId: json['employeeId'] as String? ?? '',
    employeeCode: json['employeeCode'] as String? ?? '',
    employeeName: json['employeeName'] as String? ?? '',
    year: json['year'] as int? ?? DateTime.now().year,
    month: json['month'] as int? ?? DateTime.now().month,
    workingDays: (json['workingDays'] as num?)?.toDouble() ?? 0,
    overtimeHours: (json['overtimeHours'] as num?)?.toDouble() ?? 0,
    leaveDays: (json['leaveDays'] as num?)?.toDouble() ?? 0,
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  AttendanceModel copyWith({
    String? id,
    String? employeeId,
    String? employeeCode,
    String? employeeName,
    int? year,
    int? month,
    double? workingDays,
    double? overtimeHours,
    double? leaveDays,
    bool? isSynced,
  }) {
    return AttendanceModel(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      employeeCode: employeeCode ?? this.employeeCode,
      employeeName: employeeName ?? this.employeeName,
      year: year ?? this.year,
      month: month ?? this.month,
      workingDays: workingDays ?? this.workingDays,
      overtimeHours: overtimeHours ?? this.overtimeHours,
      leaveDays: leaveDays ?? this.leaveDays,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

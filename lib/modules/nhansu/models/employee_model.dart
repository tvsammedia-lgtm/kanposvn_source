class EmployeeModel {
  final String id;
  final String employeeCode;
  final String fullName;
  final DateTime? birthDate;
  final String gender;
  final String phone;
  final String email;
  final String department;
  final String position;
  final DateTime? joinDate;
  final double baseSalary;
  final Map<String, double> allowances;
  final bool isSynced;
  final DateTime updatedAt;

  EmployeeModel({
    required this.id,
    required this.employeeCode,
    required this.fullName,
    this.birthDate,
    this.gender = 'Nam',
    this.phone = '',
    this.email = '',
    this.department = '',
    this.position = '',
    this.joinDate,
    this.baseSalary = 0,
    this.allowances = const {},
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'employeeCode': employeeCode,
    'fullName': fullName,
    'birthDate': birthDate?.toIso8601String(),
    'gender': gender,
    'phone': phone,
    'email': email,
    'department': department,
    'position': position,
    'joinDate': joinDate?.toIso8601String(),
    'baseSalary': baseSalary,
    'allowances': allowances,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json['id'] as String,
    employeeCode: json['employeeCode'] as String? ?? '',
    fullName: json['fullName'] as String? ?? '',
    birthDate: json['birthDate'] != null ? DateTime.tryParse(json['birthDate'] as String) : null,
    gender: json['gender'] as String? ?? 'Nam',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    department: json['department'] as String? ?? '',
    position: json['position'] as String? ?? '',
    joinDate: json['joinDate'] != null ? DateTime.tryParse(json['joinDate'] as String) : null,
    baseSalary: (json['baseSalary'] as num?)?.toDouble() ?? 0,
    allowances: (json['allowances'] as Map<String, dynamic>?)
            ?.map((k, v) => MapEntry(k, (v as num?)?.toDouble() ?? 0)) ??
        const {},
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  EmployeeModel copyWith({
    String? id,
    String? employeeCode,
    String? fullName,
    DateTime? birthDate,
    String? gender,
    String? phone,
    String? email,
    String? department,
    String? position,
    DateTime? joinDate,
    double? baseSalary,
    Map<String, double>? allowances,
    bool? isSynced,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      employeeCode: employeeCode ?? this.employeeCode,
      fullName: fullName ?? this.fullName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      department: department ?? this.department,
      position: position ?? this.position,
      joinDate: joinDate ?? this.joinDate,
      baseSalary: baseSalary ?? this.baseSalary,
      allowances: allowances ?? this.allowances,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

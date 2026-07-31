class PatientModel {
  final String id;
  final String code;
  final String fullName;
  final String gender;
  final DateTime? dateOfBirth;
  final String idCard;
  final String address;
  final String phone;
  final String email;
  final String occupation;
  final String drugAllergies;
  final String underlyingDiseases;
  final String medicalHistory;
  final String insuranceCode;
  final String notes;
  final bool isSynced;
  final DateTime updatedAt;

  PatientModel({
    required this.id,
    required this.code,
    required this.fullName,
    this.gender = 'Nam',
    this.dateOfBirth,
    this.idCard = '',
    this.address = '',
    this.phone = '',
    this.email = '',
    this.occupation = '',
    this.drugAllergies = '',
    this.underlyingDiseases = '',
    this.medicalHistory = '',
    this.insuranceCode = '',
    this.notes = '',
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'fullName': fullName,
    'gender': gender,
    'dateOfBirth': dateOfBirth?.toIso8601String(),
    'idCard': idCard,
    'address': address,
    'phone': phone,
    'email': email,
    'occupation': occupation,
    'drugAllergies': drugAllergies,
    'underlyingDiseases': underlyingDiseases,
    'medicalHistory': medicalHistory,
    'insuranceCode': insuranceCode,
    'notes': notes,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    id: json['id'] as String,
    code: json['code'] as String? ?? '',
    fullName: json['fullName'] as String? ?? '',
    gender: json['gender'] as String? ?? 'Nam',
    dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth'] as String) : null,
    idCard: json['idCard'] as String? ?? '',
    address: json['address'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    occupation: json['occupation'] as String? ?? '',
    drugAllergies: json['drugAllergies'] as String? ?? '',
    underlyingDiseases: json['underlyingDiseases'] as String? ?? '',
    medicalHistory: json['medicalHistory'] as String? ?? '',
    insuranceCode: json['insuranceCode'] as String? ?? '',
    notes: json['notes'] as String? ?? '',
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  PatientModel copyWith({
    String? id,
    String? code,
    String? fullName,
    String? gender,
    DateTime? dateOfBirth,
    String? idCard,
    String? address,
    String? phone,
    String? email,
    String? occupation,
    String? drugAllergies,
    String? underlyingDiseases,
    String? medicalHistory,
    String? insuranceCode,
    String? notes,
    bool? isSynced,
  }) {
    return PatientModel(
      id: id ?? this.id,
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      idCard: idCard ?? this.idCard,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      occupation: occupation ?? this.occupation,
      drugAllergies: drugAllergies ?? this.drugAllergies,
      underlyingDiseases: underlyingDiseases ?? this.underlyingDiseases,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      insuranceCode: insuranceCode ?? this.insuranceCode,
      notes: notes ?? this.notes,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

class WarehouseModel {
  final String id;
  final String code;
  final String name;
  final String location;
  final bool isSynced;
  final DateTime updatedAt;

  WarehouseModel({
    required this.id,
    required this.code,
    required this.name,
    this.location = '',
    this.isSynced = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'location': location,
    'isSynced': isSynced,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
    id: json['id'] as String,
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    location: json['location'] as String? ?? '',
    isSynced: json['isSynced'] as bool? ?? false,
    updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
  );

  WarehouseModel copyWith({
    String? id,
    String? code,
    String? name,
    String? location,
    bool? isSynced,
  }) {
    return WarehouseModel(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      location: location ?? this.location,
      isSynced: isSynced ?? this.isSynced,
      updatedAt: DateTime.now(),
    );
  }
}

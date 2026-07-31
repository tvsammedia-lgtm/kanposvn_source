enum TableStatus { empty, occupied, reserved }

class TableModel {
  final String id;
  final String name;
  final String areaId;
  final int seats;
  final TableStatus status;
  final DateTime? occupiedAt;
  final String? currentOrderId;

  const TableModel({
    required this.id,
    required this.name,
    required this.areaId,
    required this.seats,
    this.status = TableStatus.empty,
    this.occupiedAt,
    this.currentOrderId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'areaId': areaId,
        'seats': seats,
        'status': status.name,
        'occupiedAt': occupiedAt?.toIso8601String(),
        'currentOrderId': currentOrderId,
      };

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        areaId: json['areaId'] ?? '',
        seats: json['seats'] ?? 0,
        status: TableStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => TableStatus.empty,
        ),
        occupiedAt: json['occupiedAt'] != null
            ? DateTime.tryParse(json['occupiedAt'])
            : null,
        currentOrderId: json['currentOrderId'],
      );

  TableModel copyWith({
    String? id,
    String? name,
    String? areaId,
    int? seats,
    TableStatus? status,
    DateTime? occupiedAt,
    String? currentOrderId,
    bool clearOccupied = false,
    bool clearOrder = false,
  }) =>
      TableModel(
        id: id ?? this.id,
        name: name ?? this.name,
        areaId: areaId ?? this.areaId,
        seats: seats ?? this.seats,
        status: status ?? this.status,
        occupiedAt: clearOccupied ? null : (occupiedAt ?? this.occupiedAt),
        currentOrderId:
            clearOrder ? null : (currentOrderId ?? this.currentOrderId),
      );
}

class AreaModel {
  final String id;
  final String name;
  final String description;

  const AreaModel({
    required this.id,
    required this.name,
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
      );

  AreaModel copyWith({String? id, String? name, String? description}) =>
      AreaModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
}

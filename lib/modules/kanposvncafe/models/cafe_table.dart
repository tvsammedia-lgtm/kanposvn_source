enum TableStatus {
  trong('Trống', 0xFF10B981),
  coKhach('Có khách', 0xFFEF4444),
  dangGoiMon('Đang gọi món', 0xFF3B82F6),
  dangPhucVu('Đang phục vụ', 0xFF8B5CF6),
  choThanhToan('Chờ thanh toán', 0xFFF59E0B),
  daThanhToan('Đã thanh toán', 0xFF64748B),
  dangDon('Đang dọn', 0xFF6B7280),
  daDatTruoc('Đã đặt trước', 0xFFEC4899);

  final String label;
  final int colorValue;
  const TableStatus(this.label, this.colorValue);
}

class TableCustomerInfo {
  final String customerName;
  final String phone;
  final int guestCount;
  final DateTime checkInTime;
  final double currentTotal;

  TableCustomerInfo({
    required this.customerName,
    this.phone = '',
    this.guestCount = 1,
    required this.checkInTime,
    this.currentTotal = 0,
  });

  Map<String, dynamic> toJson() => {
    'customerName': customerName,
    'phone': phone,
    'guestCount': guestCount,
    'checkInTime': checkInTime.toIso8601String(),
    'currentTotal': currentTotal,
  };

  factory TableCustomerInfo.fromJson(Map<String, dynamic> json) =>
      TableCustomerInfo(
        customerName: json['customerName'] ?? 'Khách lẻ',
        phone: json['phone'] ?? '',
        guestCount: json['guestCount'] ?? 1,
        checkInTime: json['checkInTime'] != null
            ? DateTime.parse(json['checkInTime'])
            : DateTime.now(),
        currentTotal: (json['currentTotal'] as num?)?.toDouble() ?? 0,
      );
}

class CafeArea {
  final String id;
  final String name;
  final String description;
  final int sortOrder;

  CafeArea({
    required this.id,
    required this.name,
    this.description = '',
    this.sortOrder = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'sortOrder': sortOrder,
  };

  factory CafeArea.fromJson(Map<String, dynamic> json) => CafeArea(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    sortOrder: json['sortOrder'] ?? 0,
  );
}

class CafeTable {
  final String id;
  final String name;
  final String areaId;
  final String areaName;
  final int seatCount;
  final TableStatus status;
  final String note;
  final TableCustomerInfo? customerInfo;
  final String? activeOrderId;
  final DateTime updatedAt;

  CafeTable({
    required this.id,
    required this.name,
    required this.areaId,
    required this.areaName,
    this.seatCount = 4,
    this.status = TableStatus.trong,
    this.note = '',
    this.customerInfo,
    this.activeOrderId,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  CafeTable copyWith({
    String? name,
    String? areaId,
    String? areaName,
    int? seatCount,
    TableStatus? status,
    String? note,
    Object? customerInfo = _sentinel,
    String? activeOrderId,
    DateTime? updatedAt,
  }) {
    return CafeTable(
      id: id,
      name: name ?? this.name,
      areaId: areaId ?? this.areaId,
      areaName: areaName ?? this.areaName,
      seatCount: seatCount ?? this.seatCount,
      status: status ?? this.status,
      note: note ?? this.note,
      customerInfo: customerInfo == _sentinel
          ? this.customerInfo
          : customerInfo as TableCustomerInfo?,
      activeOrderId: activeOrderId ?? this.activeOrderId,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  static const _sentinel = Object();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'areaId': areaId,
    'areaName': areaName,
    'seatCount': seatCount,
    'status': status.name,
    'note': note,
    'customerInfo': customerInfo?.toJson(),
    'activeOrderId': activeOrderId,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory CafeTable.fromJson(Map<String, dynamic> json) => CafeTable(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    areaId: json['areaId'] ?? '',
    areaName: json['areaName'] ?? '',
    seatCount: json['seatCount'] ?? 4,
    status: TableStatus.values.firstWhere(
      (e) => e.name == json['status'],
      orElse: () => TableStatus.trong,
    ),
    note: json['note'] ?? '',
    customerInfo: json['customerInfo'] != null
        ? TableCustomerInfo.fromJson(
            Map<String, dynamic>.from(json['customerInfo']),
          )
        : null,
    activeOrderId: json['activeOrderId'],
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now(),
  );
}

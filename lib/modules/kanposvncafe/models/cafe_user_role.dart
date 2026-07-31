enum CafeRole {
  admin('Admin (Quản trị hệ thống)'),
  chuQuan('Chủ quán'),
  quanLy('Quản lý cửa hàng'),
  thuNgan('Thu ngân'),
  phucVu('Phục vụ'),
  phaChe('Pha chế'),
  keToan('Kế toán');

  final String label;
  const CafeRole(this.label);
}

class CafeUser {
  final String id;
  final String username;
  final String fullName;
  final String phone;
  final CafeRole role;
  final bool isActive;

  CafeUser({
    required this.id,
    required this.username,
    required this.fullName,
    this.phone = '',
    this.role = CafeRole.thuNgan,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'fullName': fullName,
    'phone': phone,
    'role': role.name,
    'isActive': isActive,
  };

  factory CafeUser.fromJson(Map<String, dynamic> json) => CafeUser(
    id: json['id'] ?? '',
    username: json['username'] ?? '',
    fullName: json['fullName'] ?? '',
    phone: json['phone'] ?? '',
    role: CafeRole.values.firstWhere(
      (e) => e.name == json['role'],
      orElse: () => CafeRole.thuNgan,
    ),
    isActive: json['isActive'] ?? true,
  );
}

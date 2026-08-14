import 'dart:convert';
import 'package:isar/isar.dart';
import '../db/database_service.dart';
import '../db/isar_models/data_entity.dart';

/// Các role tài khoản nội bộ (Cấp 2 — do Owner tạo trong cửa hàng).
class EmployeeRoles {
  static const String manager = 'Manager';
  static const String cashier = 'Thu ngân';
  static const String sale = 'Bán hàng';
  static const String warehouse = 'Kho';
  static const String accountant = 'Kế toán';

  static const List<String> all = [
    manager,
    cashier,
    sale,
    warehouse,
    accountant,
  ];
}

/// Tài khoản nhân viên nội bộ — nằm trong database của cửa hàng (Isar),
/// không gọi Cloud mỗi lần đăng nhập.
class EmployeeAccount {
  final String id;
  final String storeId;
  final String username;
  final String password;
  final String fullName;
  final String role;
  final bool status;

  /// Các tab (tab bar) nhân viên được phép sử dụng, theo module.
  ///
  /// `null` = dùng mặc định theo role. Khác `null` = ghi đè chính xác danh sách
  /// tab cho riêng nhân viên này (Owner check/uncheck trong "Quản lý NV").
  final List<String>? allowedTabs;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmployeeAccount({
    required this.id,
    required this.storeId,
    required this.username,
    required this.password,
    required this.fullName,
    required this.role,
    this.status = true,
    this.allowedTabs,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  bool get isActive => status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'storeId': storeId,
        'username': username,
        'password': password,
        'fullName': fullName,
        'role': role,
        'status': status,
        'allowedTabs': allowedTabs,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory EmployeeAccount.fromJson(Map<String, dynamic> json) =>
      EmployeeAccount(
        id: json['id'] as String,
        storeId: json['storeId'] as String? ?? '',
        username: json['username'] as String? ?? '',
        password: json['password'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        role: json['role'] as String? ?? EmployeeRoles.sale,
        status: json['status'] as bool? ?? true,
        allowedTabs: json['allowedTabs'] is List
            ? List<String>.from(json['allowedTabs'] as List)
            : null,
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'] as String)
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.tryParse(json['updatedAt'] as String)
            : null,
      );
}

/// Kết quả đăng nhập nội bộ.
enum EmployeeLoginResult {
  /// Không có tài khoản nội bộ khớp username.
  notFound,

  /// Sai mật khẩu.
  wrongPassword,

  /// Tài khoản đang bị khóa.
  inactive,

  /// Thành công.
  success,
}

/// Quản lý + xác thực tài khoản nhân viên nội bộ.
///
/// Dữ liệu lưu trong Isar của cửa hàng (`isar_store_<storeId>`),
/// collection `employees`, KHÔNG đưa vào SyncQueue (mật khẩu chỉ nằm trên máy).
class EmployeeAuthService {
  static const String collectionName = 'employees';

  /// Lấy instance Isar của cửa hàng (dùng instance đang mở nếu có).
  static Future<Isar> _storeIsar(String storeId) async {
    final name = 'isar_store_$storeId';
    final existing = Isar.getInstance(name);
    if (existing != null) return existing;
    return DatabaseService.openStoreIsar(storeId);
  }

  static Future<List<Map<String, dynamic>>> _readAll({
    required String storeId,
    required String storeAppCode,
  }) async {
    final isar = await _storeIsar(storeId);
    final entities = await isar.dataEntitys
        .where()
        .filter()
        .appCodeEqualTo(storeAppCode)
        .collectionEqualTo(collectionName)
        .findAll();
    final result = <Map<String, dynamic>>[];
    for (final e in entities) {
      try {
        final data = Map<String, dynamic>.from(jsonDecode(e.jsonData));
        data['_id'] = e.id;
        result.add(data);
      } catch (_) {
        // bỏ qua entity lỗi định dạng
      }
    }
    return result;
  }

  /// Danh sách tài khoản nhân viên của cửa hàng.
  static Future<List<EmployeeAccount>> getEmployees({
    required String storeId,
    required String storeAppCode,
  }) async {
    final all = await _readAll(storeId: storeId, storeAppCode: storeAppCode);
    return all.map((e) => EmployeeAccount.fromJson(e)).toList();
  }

  /// Tìm tài khoản theo username (không phân biệt hoa thường).
  static Future<EmployeeAccount?> findByUsername({
    required String storeId,
    required String storeAppCode,
    required String username,
  }) async {
    final all = await _readAll(storeId: storeId, storeAppCode: storeAppCode);
    for (final e in all) {
      if ((e['username'] as String? ?? '')
          .toLowerCase()
          .trim() ==
          username.toLowerCase().trim()) {
        return EmployeeAccount.fromJson(e);
      }
    }
    return null;
  }

  /// Kiểm tra username đã tồn tại hay chưa (dùng khi tạo/sửa tài khoản).
  static Future<bool> usernameExists({
    required String storeId,
    required String storeAppCode,
    required String username,
    String? exceptId,
  }) async {
    final all = await _readAll(storeId: storeId, storeAppCode: storeAppCode);
    final target = username.toLowerCase().trim();
    return all.any((e) =>
        (e['username'] as String? ?? '').toLowerCase().trim() == target &&
        e['id'] != exceptId);
  }

  /// Đăng nhập nội bộ (không gọi Cloud).
  static Future<EmployeeLoginResult> login({
    required String storeId,
    required String storeAppCode,
    required String username,
    required String password,
  }) async {
    final employee = await findByUsername(
      storeId: storeId,
      storeAppCode: storeAppCode,
      username: username,
    );
    if (employee == null) return EmployeeLoginResult.notFound;
    if (!employee.isActive) return EmployeeLoginResult.inactive;
    if (employee.password != password) return EmployeeLoginResult.wrongPassword;
    return EmployeeLoginResult.success;
  }

  /// Tạo mới hoặc cập nhật tài khoản nhân viên.
  ///
  /// Trả về `null` nếu username bị trùng (trừ chính tài khoản đang sửa).
  static Future<String?> saveEmployee({
    required String storeId,
    required String storeAppCode,
    required EmployeeAccount employee,
  }) async {
    final exists = await usernameExists(
      storeId: storeId,
      storeAppCode: storeAppCode,
      username: employee.username,
      exceptId: employee.id,
    );
    if (exists) return 'Tên đăng nhập đã tồn tại';

    final isar = await _storeIsar(storeId);
    final existing = await isar.dataEntitys
        .where()
        .filter()
        .appCodeEqualTo(storeAppCode)
        .collectionEqualTo(collectionName)
        .itemIdEqualTo(employee.id)
        .findFirst();
    final jsonStr = jsonEncode(employee.toJson());
    await isar.writeTxn(() async {
      if (existing != null) {
        existing.jsonData = jsonStr;
        existing.updatedAt = DateTime.now();
        await isar.dataEntitys.put(existing);
      } else {
        final entity = DataEntity()
          ..collection = collectionName
          ..appCode = storeAppCode
          ..itemId = employee.id
          ..jsonData = jsonStr;
        await isar.dataEntitys.put(entity);
      }
    });
    return null;
  }

  /// Xóa tài khoản nhân viên.
  static Future<void> deleteEmployee({
    required String storeId,
    required String storeAppCode,
    required String employeeId,
  }) async {
    final isar = await _storeIsar(storeId);
    final existing = await isar.dataEntitys
        .where()
        .filter()
        .appCodeEqualTo(storeAppCode)
        .collectionEqualTo(collectionName)
        .itemIdEqualTo(employeeId)
        .findFirst();
    if (existing != null) {
      await isar.writeTxn(() async {
        await isar.dataEntitys.delete(existing.id);
      });
    }
  }

  /// Tạo mã nhân viên mới dạng `EMP-xxxxx`.
  static String generateEmployeeId() {
    final n = DateTime.now().millisecondsSinceEpoch % 100000;
    return 'EMP-$n';
  }
}

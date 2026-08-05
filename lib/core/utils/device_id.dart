import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Lấy (hoặc tạo mới) một device_id ổn định cho máy hiện tại.
/// Device_id này được dùng khi kiểm tra license với server.
class DeviceId {
  static const _kKey = 'kanposvn_device_id';
  static String? _cached;

  static Future<String> get() async {
    if (_cached != null) return _cached!;
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_kKey);
    if (id == null || id.isEmpty) {
      id = const Uuid().v4();
      await prefs.setString(_kKey, id);
    }
    _cached = id;
    return id;
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../sync/api_config.dart';
import '../utils/device_id.dart';

class LicenseStatus {
  final bool valid;
  final String plan;
  final int daysLeft;
  final DateTime? expiresAt;
  final String message;
  final int maxDevices;
  final int activeDevices;

  const LicenseStatus({
    this.valid = false,
    this.plan = '',
    this.daysLeft = 0,
    this.expiresAt,
    required this.message,
    this.maxDevices = 2,
    this.activeDevices = 0,
  });

  factory LicenseStatus.fromJson(Map<String, dynamic> json) {
    return LicenseStatus(
      valid: (json['valid'] as bool?) ?? false,
      plan: (json['plan'] as String?) ?? '',
      daysLeft: (json['days_left'] as num?)?.toInt() ?? 0,
      expiresAt: json['expires_at'] != null
          ? DateTime.tryParse(json['expires_at'] as String)
          : null,
      message: (json['message'] as String?) ?? '',
      maxDevices: (json['max_devices'] as num?)?.toInt() ?? 2,
      activeDevices: (json['active_devices'] as num?)?.toInt() ?? 0,
    );
  }
}

/// Kiểm tra license của user với server.
class LicenseService extends ChangeNotifier {
  final http.Client _client = http.Client();

  bool _isChecking = false;
  bool get isChecking => _isChecking;

  LicenseStatus? _status;
  LicenseStatus? get status => _status;

  String? _error;
  String? get error => _error;

  Future<LicenseStatus?> check({
    required String token,
    required String appCode,
    String? branchId,
  }) async {
    if (_isChecking) return _status;
    _isChecking = true;
    _error = null;
    notifyListeners();

    try {
      final deviceId = await DeviceId.get();
      final uri = Uri.parse(ApiConfig.licenseCheckUrl).replace(
        queryParameters: {
          'app_code': appCode,
          'device_id': deviceId,
          if (branchId != null && branchId.isNotEmpty) 'branch_id': branchId,
        },
      );
      final res = await _client
          .get(
            uri,
            headers: {'Authorization': 'Bearer $token'},
          )
          .timeout(const Duration(seconds: 10));

      if (res.statusCode != 200) {
        _error = 'Lỗi ${res.statusCode} khi kiểm tra license';
        return null;
      }

      final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      final status = LicenseStatus.fromJson(json);
      _status = status;
      return status;
    } catch (e) {
      _error = 'Không kết nối được server ($e)';
      return null;
    } finally {
      _isChecking = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }
}

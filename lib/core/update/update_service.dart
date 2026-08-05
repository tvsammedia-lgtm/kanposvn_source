import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../sync/api_config.dart';

class AppRelease {
  final String version;
  final String tagName;
  final String name;
  final String body;
  final String downloadUrl;
  final DateTime? publishedAt;

  const AppRelease({
    required this.version,
    required this.tagName,
    required this.name,
    required this.body,
    required this.downloadUrl,
    this.publishedAt,
  });

  factory AppRelease.fromJson(Map<String, dynamic> json) {
    return AppRelease(
      version: (json['latest_version'] as String?) ?? '',
      tagName: (json['tag_name'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      body: (json['notes'] as String?) ?? '',
      downloadUrl: (json['download_url'] as String?) ?? '',
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'] as String)
          : null,
    );
  }
}

/// So sánh phiên bản dạng "x.y.z". Trả về true nếu [remote] > [local].
bool isVersionNewer(String? remote, String? local) {
  if (remote == null || remote.isEmpty || local == null || local.isEmpty) {
    return false;
  }
  final a = remote.split('.').map(int.tryParse).toList();
  final b = local.split('.').map(int.tryParse).toList();
  for (var i = 0; i < (a.length > b.length ? a.length : b.length); i++) {
    final av = i < a.length ? (a[i] ?? 0) : 0;
    final bv = i < b.length ? (b[i] ?? 0) : 0;
    if (av > bv) return true;
    if (av < bv) return false;
  }
  return false;
}

/// Kiểm tra phiên bản mới nhất từ server (proxy GitHub Release).
class UpdateService extends ChangeNotifier {
  static String currentVersion = '1.0.0';

  final http.Client _client = http.Client();

  bool _isChecking = false;
  bool get isChecking => _isChecking;

  AppRelease? _latest;
  AppRelease? get latest => _latest;

  String? _error;
  String? get error => _error;

  Future<AppRelease?> checkForUpdate({String appCode = 'kanposvn'}) async {
    if (_isChecking) return _latest;
    _isChecking = true;
    _error = null;
    notifyListeners();

    try {
      final uri = Uri.parse(ApiConfig.updateUrl).replace(
        queryParameters: {'app_code': appCode, 'v': currentVersion},
      );
      final res = await _client
          .get(uri)
          .timeout(const Duration(seconds: 10));

      if (res.statusCode != 200) {
        _error = 'Lỗi ${res.statusCode} khi kiểm tra cập nhật';
        return null;
      }

      final json = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      final release = AppRelease.fromJson(json);
      _latest = release;
      return release;
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

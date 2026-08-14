import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Thông số hóa đơn điện tử của đơn vị (Nhà hàng - Quán ăn).
///
/// Gồm thông tin người bán và bộ số/kiểu hóa đơn điện tử theo
/// Nghị định 123/2020/NĐ-CP (mẫu số, ký hiệu, số hóa đơn).
class RestaurantEinvoiceSettings {
  const RestaurantEinvoiceSettings({
    this.companyName = '',
    this.taxCode = '',
    this.address = '',
    this.phone = '',
    this.email = '',
    this.invoicePattern = '',
    this.invoiceSymbol = '',
    this.invoiceNumber = 1,
  });

  final String companyName; // Tên đơn vị / người bán
  final String taxCode; // Mã số thuế
  final String address; // Địa chỉ
  final String phone; // Số điện thoại
  final String email; // Email nhận hóa đơn
  final String invoicePattern; // Mẫu số hóa đơn (VD: 01GTKT0/001)
  final String invoiceSymbol; // Ký hiệu hóa đơn (VD: 1C22AAA)
  final int invoiceNumber; // Số hóa đơn bắt đầu (VD: 1)

  bool get isEmpty =>
      companyName.trim().isEmpty &&
      taxCode.trim().isEmpty &&
      address.trim().isEmpty &&
      phone.trim().isEmpty;

  RestaurantEinvoiceSettings copyWith({
    String? companyName,
    String? taxCode,
    String? address,
    String? phone,
    String? email,
    String? invoicePattern,
    String? invoiceSymbol,
    int? invoiceNumber,
  }) {
    return RestaurantEinvoiceSettings(
      companyName: companyName ?? this.companyName,
      taxCode: taxCode ?? this.taxCode,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      invoicePattern: invoicePattern ?? this.invoicePattern,
      invoiceSymbol: invoiceSymbol ?? this.invoiceSymbol,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    );
  }

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'taxCode': taxCode,
        'address': address,
        'phone': phone,
        'email': email,
        'invoicePattern': invoicePattern,
        'invoiceSymbol': invoiceSymbol,
        'invoiceNumber': invoiceNumber,
      };

  factory RestaurantEinvoiceSettings.fromJson(Map<String, dynamic> json) {
    return RestaurantEinvoiceSettings(
      companyName: json['companyName']?.toString() ?? '',
      taxCode: json['taxCode']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      invoicePattern: json['invoicePattern']?.toString() ?? '',
      invoiceSymbol: json['invoiceSymbol']?.toString() ?? '',
      invoiceNumber: (json['invoiceNumber'] as num?)?.toInt() ?? 1,
    );
  }

  /// Số hóa đơn dạng chuỗi đã canh đủ 7 chữ số (VD: 0000001).
  String get invoiceNumberLabel =>
      invoiceNumber > 0 ? invoiceNumber.toString().padLeft(7, '0') : '';
}

class RestaurantEinvoiceSettingsStore extends ChangeNotifier {
  static const _kPrefKey = 'restaurant_einvoice_settings_v1';

  RestaurantEinvoiceSettings _settings = const RestaurantEinvoiceSettings();
  RestaurantEinvoiceSettings get settings => _settings;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          _settings = RestaurantEinvoiceSettings.fromJson(decoded);
          notifyListeners();
        }
      }
    } catch (_) {}
  }

  Future<void> update(RestaurantEinvoiceSettings settings) async {
    _settings = settings;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kPrefKey, jsonEncode(settings.toJson()));
    } catch (_) {}
  }

  /// Đọc nhanh cấu hình từ SharedPreferences (dùng ngoài widget).
  static Future<RestaurantEinvoiceSettings> loadOnce() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          return RestaurantEinvoiceSettings.fromJson(decoded);
        }
      }
    } catch (_) {}
    return const RestaurantEinvoiceSettings();
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Thông số hóa đơn điện tử của trạm xăng.
///
/// Theo Nghị định 123/2020/NĐ-CP (mẫu số, ký hiệu, số hóa đơn).
/// Được nhập từ tab Cài Đặt và dùng cho header các báo cáo Crystal (.rpt).
class TramXangEinvoiceSettings {
  const TramXangEinvoiceSettings({
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

  TramXangEinvoiceSettings copyWith({
    String? companyName,
    String? taxCode,
    String? address,
    String? phone,
    String? email,
    String? invoicePattern,
    String? invoiceSymbol,
    int? invoiceNumber,
  }) {
    return TramXangEinvoiceSettings(
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

  factory TramXangEinvoiceSettings.fromJson(Map<String, dynamic> json) {
    return TramXangEinvoiceSettings(
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

class TramXangEinvoiceSettingsStore extends ChangeNotifier {
  static const _kPrefKey = 'tramxang_einvoice_settings_v1';

  TramXangEinvoiceSettings _settings = const TramXangEinvoiceSettings();
  TramXangEinvoiceSettings get settings => _settings;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          _settings = TramXangEinvoiceSettings.fromJson(decoded);
          notifyListeners();
        }
      }
    } catch (_) {}
  }

  Future<void> update(TramXangEinvoiceSettings settings) async {
    _settings = settings;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kPrefKey, jsonEncode(settings.toJson()));
    } catch (_) {}
  }

  /// Đọc nhanh cấu hình từ SharedPreferences (dùng ngoài widget).
  static Future<TramXangEinvoiceSettings> loadOnce() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          return TramXangEinvoiceSettings.fromJson(decoded);
        }
      }
    } catch (_) {}
    return const TramXangEinvoiceSettings();
  }
}
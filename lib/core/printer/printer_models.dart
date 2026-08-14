import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

enum PrinterType { wifi, bluetooth, usb }

enum TextEncodingMode { cp1258, ascii }

class PaperSizeOption {
  const PaperSizeOption._(this.label, this.value, this.cols);
  final String label;
  final String value;
  final int cols;

  static const mm58 = PaperSizeOption._('58mm', '58', 32);
  static const mm80 = PaperSizeOption._('80mm', '80', 42);

  static const values = [mm58, mm80];

  static PaperSizeOption fromValue(String? v) =>
      values.firstWhere((p) => p.value == v, orElse: () => mm80);

  PaperSize get escPosPaper =>
      value == '58' ? PaperSize.mm58 : PaperSize.mm80;
}

class PrinterSettings {
  const PrinterSettings({
    this.type = PrinterType.wifi,
    this.paper = PaperSizeOption.mm80,
    this.encoding = TextEncodingMode.cp1258,
    this.name = '',
    this.address = '',
    this.port = 9100,
    this.copies = 1,
  });

  final PrinterType type;
  final PaperSizeOption paper;
  final TextEncodingMode encoding;
  final String name;
  final String address;
  final int port;
  final int copies;

  bool get isConfigured =>
      address.trim().isNotEmpty || type == PrinterType.bluetooth;

  PrinterSettings copyWith({
    PrinterType? type,
    PaperSizeOption? paper,
    TextEncodingMode? encoding,
    String? name,
    String? address,
    int? port,
    int? copies,
  }) {
    return PrinterSettings(
      type: type ?? this.type,
      paper: paper ?? this.paper,
      encoding: encoding ?? this.encoding,
      name: name ?? this.name,
      address: address ?? this.address,
      port: port ?? this.port,
      copies: copies ?? this.copies,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'paper': paper.value,
        'encoding': encoding.name,
        'name': name,
        'address': address,
        'port': port,
        'copies': copies,
      };

  factory PrinterSettings.fromJson(Map<String, dynamic> json) {
    return PrinterSettings(
      type: PrinterType.values
              .where((t) => t.name == json['type'])
              .firstOrNull ??
          PrinterType.wifi,
      paper: PaperSizeOption.fromValue(json['paper']?.toString()),
      encoding: TextEncodingMode.values
              .where((e) => e.name == json['encoding'])
              .firstOrNull ??
          TextEncodingMode.cp1258,
      name: json['name']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      port: (json['port'] as num?)?.toInt() ?? 9100,
      copies: (json['copies'] as num?)?.toInt() ?? 1,
    );
  }
}

extension FirstOrNullX<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class PrinterDevice {
  const PrinterDevice({
    required this.id,
    required this.name,
    required this.address,
    this.type,
  });

  final String id;
  final String name;
  final String address;
  final PrinterType? type;

  String get displayName =>
      name.isEmpty ? (address.isEmpty ? id : address) : name;
}

class PrintResult {
  const PrintResult.success(this.message)
      : success = true,
        error = null;
  const PrintResult.failure(this.error)
      : success = false,
        message = null;

  final bool success;
  final String? message;
  final String? error;
}

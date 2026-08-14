import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/foundation.dart';

import 'printer_models.dart';

/// Máy in Bluetooth (Android/iOS).
/// Trên Windows không hỗ trợ — cần dùng Wi-Fi hoặc In PDF.
class BluetoothPrinter {
  final BlueThermalPrinter _bt = BlueThermalPrinter.instance;

  bool get _supported =>
      !kIsWeb && (defaultTargetPlatform == TargetPlatform.android);

  Future<List<PrinterDevice>> discover() async {
    if (!_supported) return [];
    try {
      final devices = await _bt.getBondedDevices();
      return devices
          .map((d) => PrinterDevice(
                id: d.address ?? '',
                name: d.name ?? 'Máy in Bluetooth',
                address: d.address ?? '',
                type: PrinterType.bluetooth,
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<PrintResult> print(
    PrinterSettings settings,
    Uint8List bytes,
  ) async {
    if (!_supported) {
      return const PrintResult.failure(
          'In Bluetooth chỉ hỗ trợ trên Android. Trên Windows hãy dùng máy in Wi-Fi/LAN hoặc In PDF.');
    }
    final address = settings.address.trim();
    if (address.isEmpty) {
      return const PrintResult.failure(
          'Chưa chọn máy in Bluetooth (Cài đặt → Máy in).');
    }
    try {
      final devices = await _bt.getBondedDevices();
      BluetoothDevice? device;
      for (final d in devices) {
        if (d.address == address) {
          device = d;
          break;
        }
      }
      if (device == null) {
        return const PrintResult.failure(
            'Không tìm thấy máy in Bluetooth đã ghép đôi.');
      }
      final connected = await _bt.isConnected;
      if (connected != true) {
        await _bt.connect(device);
        await Future<void>.delayed(const Duration(seconds: 2));
      }
      final isConnected = await _bt.isConnected;
      if (isConnected != true) {
        return const PrintResult.failure('Kết nối Bluetooth thất bại.');
      }
      for (var i = 0; i < (settings.copies > 0 ? settings.copies : 1); i++) {
        await _bt.writeBytes(bytes);
        await Future<void>.delayed(const Duration(milliseconds: 300));
      }
      await Future<void>.delayed(const Duration(milliseconds: 800));
      await _bt.disconnect();
      return const PrintResult.success('Đã gửi lệnh in qua Bluetooth.');
    } catch (e) {
      return PrintResult.failure('Lỗi in Bluetooth: $e');
    }
  }
}

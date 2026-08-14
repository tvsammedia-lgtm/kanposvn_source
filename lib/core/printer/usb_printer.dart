import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:usb_serial/usb_serial.dart';

import 'printer_models.dart';

/// Máy in kết nối qua cổng USB (Android via USB-OTG / cổng micro-USB).
/// Trên Windows không hỗ trợ trực tiếp — cần dùng Wi-Fi/LAN hoặc In PDF.
class UsbPrinter {
  const UsbPrinter();

  bool get _supported =>
      !kIsWeb && (defaultTargetPlatform == TargetPlatform.android);

  Future<List<PrinterDevice>> discover() async {
    if (!_supported) return [];
    try {
      final devices = await UsbSerial.listDevices();
      return devices
          .map((d) => PrinterDevice(
                id: d.deviceId?.toString() ?? d.deviceName,
                name: d.productName?.isNotEmpty == true
                    ? d.productName!
                    : d.deviceName,
                address: '${d.vid?.toRadixString(16)}:${d.pid?.toRadixString(16)}',
                type: PrinterType.usb,
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
          'In USB chỉ hỗ trợ trên Android. Trên Windows hãy dùng máy in Wi-Fi/LAN hoặc In PDF.');
    }
    final deviceId = int.tryParse(settings.address.trim());
    try {
      final devices = await UsbSerial.listDevices();
      UsbDevice? device;
      for (final d in devices) {
        if (d.deviceId?.toString() == settings.address.trim() ||
            (deviceId != null && d.deviceId == deviceId)) {
          device = d;
          break;
        }
      }
      if (device == null) {
        return const PrintResult.failure(
            'Không tìm thấy máy in USB. Hãy cắm máy in và chọn lại trong Cài đặt.');
      }
      final port = await device.create();
      if (port == null) {
        return const PrintResult.failure('Không mở được cổng USB.');
      }
      final ok = await port.open();
      if (!ok) {
        await port.close();
        return const PrintResult.failure('Không mở được cổng USB (permission).');
      }
      await port.setPortParameters(115200, UsbPort.DATABITS_8,
          UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
      for (var i = 0; i < (settings.copies > 0 ? settings.copies : 1); i++) {
        await port.write(bytes);
        await Future<void>.delayed(const Duration(milliseconds: 300));
      }
      await Future<void>.delayed(const Duration(milliseconds: 800));
      await port.close();
      return const PrintResult.success('Đã gửi lệnh in qua USB.');
    } catch (e) {
      return PrintResult.failure('Lỗi in USB: $e');
    }
  }
}

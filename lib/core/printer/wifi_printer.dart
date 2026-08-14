import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'printer_models.dart';

/// Máy in kết nối qua Wi-Fi/LAN (raw TCP, port mặc định 9100).
/// Hoạt động trên Windows và Android.
class WifiPrinter {
  const WifiPrinter();

  Future<PrintResult> print(
    PrinterSettings settings,
    Uint8List bytes,
  ) async {
    final host = settings.address.trim();
    if (host.isEmpty) {
      return const PrintResult.failure(
          'Chưa nhập địa chỉ IP máy in (Cài đặt → Máy in).');
    }
    Socket? socket;
    try {
      socket = await Socket.connect(
        host,
        settings.port,
        timeout: const Duration(seconds: 8),
      );
      socket.setOption(SocketOption.tcpNoDelay, true);
      for (var i = 0; i < (settings.copies > 0 ? settings.copies : 1); i++) {
        socket.add(bytes);
      }
      await socket.flush();
      await Future<void>.delayed(const Duration(milliseconds: 600));
      await socket.close();
      return const PrintResult.success('Đã gửi lệnh in qua Wi-Fi.');
    } on SocketException catch (e) {
      return PrintResult.failure(
          'Không kết nối được máy in $host:${settings.port} (${e.message}).');
    } catch (e) {
      return PrintResult.failure('Lỗi in Wi-Fi: $e');
    } finally {
      try {
        socket?.destroy();
      } catch (_) {}
    }
  }

  Future<PrintResult> testConnection(PrinterSettings settings) async {
    Socket? socket;
    try {
      socket = await Socket.connect(
        settings.address.trim(),
        settings.port,
        timeout: const Duration(seconds: 6),
      );
      await socket.close();
      return const PrintResult.success('Kết nối Wi-Fi thành công.');
    } catch (e) {
      return PrintResult.failure('Kết nối Wi-Fi thất bại: $e');
    } finally {
      try {
        socket?.destroy();
      } catch (_) {}
    }
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';

/// Cấu hình kết nối phần cứng của trụ bơm
class PumpConfig {
  final String ipAddress;
  final int port;
  final String comPort;
  final int baudRate;
  final String protocol; // TATSUNO, GILBARCO, PECO, MODBUS

  PumpConfig({
    this.ipAddress = '',
    this.port = 0,
    this.comPort = 'COM1',
    this.baudRate = 9600,
    this.protocol = 'TATSUNO',
  });
}

/// Dữ liệu trả về từ trụ bơm
class PumpData {
  final int nozzleId;
  final double volume; // Số lít
  final double amount; // Số tiền
  final double unitPrice; // Đơn giá
  final double totalizer; // Số tổng (lũy kế)

  PumpData({
    required this.nozzleId,
    required this.volume,
    required this.amount,
    required this.unitPrice,
    required this.totalizer,
  });
}

/// Interface tiêu chuẩn để giao tiếp với mọi loại trụ bơm
abstract class PumpAdapter {
  final PumpConfig config;
  bool isConnected = false;

  PumpAdapter(this.config);

  /// Khởi tạo kết nối (TCP, Serial RS232/RS485...)
  Future<bool> connect();

  /// Ngắt kết nối
  Future<void> disconnect();

  /// Đọc dữ liệu hiện tại từ vòi bơm
  Future<PumpData?> readData(int nozzleId);

  /// Cài đặt đơn giá xuống trụ bơm (nếu hỗ trợ)
  Future<bool> setUnitPrice(int nozzleId, double price);
  
  /// Bơm theo số tiền hoặc số lít chỉ định (Preset)
  Future<bool> preset(int nozzleId, {double? volume, double? amount});
  
  /// Dừng khẩn cấp
  Future<bool> stop(int nozzleId);
}

/// ========================================================
/// CÁC IMPLEMENTATION MẪU CHO THỊ TRƯỜNG VIỆT NAM
/// (Cần tích hợp với thư viện Serial Port hoặc TCP Socket thực tế)
/// ========================================================

/// 1. Giao thức TATSUNO (Phổ biến nhất tại VN)
class TatsunoPumpAdapter extends PumpAdapter {
  TatsunoPumpAdapter(super.config);

  @override
  Future<bool> connect() async {
    // TODO: Mở Serial Port hoặc TCP Socket theo Tatsuno Protocol
    debugPrint('Đang kết nối trụ Tatsuno tại ${config.comPort} / ${config.ipAddress}...');
    await Future.delayed(const Duration(milliseconds: 500));
    isConnected = true;
    return true;
  }

  @override
  Future<void> disconnect() async {
    // TODO: Đóng kết nối
    isConnected = false;
  }

  @override
  Future<PumpData?> readData(int nozzleId) async {
    if (!isConnected) return null;
    // TODO: Gửi command request trạng thái (VD: 0x05, 0x02...)
    // Mock data trả về:
    return PumpData(
      nozzleId: nozzleId,
      volume: 2.5,
      amount: 55000,
      unitPrice: 22000,
      totalizer: 15420.5,
    );
  }

  @override
  Future<bool> setUnitPrice(int nozzleId, double price) async {
    // Gửi command đổi giá
    debugPrint('Tatsuno: Đổi giá vòi $nozzleId thành $price');
    return true;
  }

  @override
  Future<bool> preset(int nozzleId, {double? volume, double? amount}) async {
    debugPrint('Tatsuno: Preset vòi $nozzleId - Số lít: $volume, Số tiền: $amount');
    return true;
  }

  @override
  Future<bool> stop(int nozzleId) async {
    debugPrint('Tatsuno: Dừng khẩn cấp vòi $nozzleId');
    return true;
  }
}

/// 2. Giao thức GILBARCO
class GilbarcoPumpAdapter extends PumpAdapter {
  GilbarcoPumpAdapter(super.config);

  @override
  Future<bool> connect() async {
    debugPrint('Đang kết nối trụ Gilbarco 2-wire...');
    isConnected = true;
    return true;
  }

  @override
  Future<void> disconnect() async {
    isConnected = false;
  }

  @override
  Future<PumpData?> readData(int nozzleId) async {
    if (!isConnected) return null;
    return PumpData(
      nozzleId: nozzleId,
      volume: 1.0,
      amount: 22000,
      unitPrice: 22000,
      totalizer: 9995.0,
    );
  }

  @override
  Future<bool> setUnitPrice(int nozzleId, double price) async {
    return true;
  }

  @override
  Future<bool> preset(int nozzleId, {double? volume, double? amount}) async {
    return true;
  }

  @override
  Future<bool> stop(int nozzleId) async {
    return true;
  }
}

/// Factory để tạo Adapter dựa trên cấu hình
class PumpAdapterFactory {
  static PumpAdapter createAdapter(PumpConfig config) {
    switch (config.protocol.toUpperCase()) {
      case 'TATSUNO':
        return TatsunoPumpAdapter(config);
      case 'GILBARCO':
        return GilbarcoPumpAdapter(config);
      default:
        // Fallback or Generic
        return TatsunoPumpAdapter(config);
    }
  }
}

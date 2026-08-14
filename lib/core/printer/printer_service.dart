import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bluetooth_printer.dart';
import 'printer_models.dart';
import 'printer_settings.dart';
import 'receipt_builder.dart';
import 'receipt_data.dart';
import 'usb_printer.dart';
import 'wifi_printer.dart';

final printerSettingsProvider =
    ChangeNotifierProvider<PrinterSettingsStore>((ref) {
  final store = PrinterSettingsStore();
  store.load();
  return store;
});

final printerServiceProvider = Provider<PrinterService>((ref) {
  return PrinterService(ref.watch(printerSettingsProvider));
});

class PrinterService {
  PrinterService(this.store);

  final PrinterSettingsStore store;

  static const _wifi = WifiPrinter();
  static const _usb = UsbPrinter();
  static final _bluetooth = BluetoothPrinter();

  Future<PrintResult> print(
    ReceiptData receipt, {
    PrinterSettings? settings,
  }) async {
    final s = settings ?? store.settings;
    if (!s.isConfigured && s.type != PrinterType.usb) {
      return const PrintResult.failure(
          'Chưa cấu hình máy in. Vào Cài đặt → Máy in để chọn máy in trước.');
    }
    try {
      final bytes = await ReceiptBuilder(s).buildBytes(receipt);
      switch (s.type) {
        case PrinterType.wifi:
          return await _wifi.print(s, bytes);
        case PrinterType.bluetooth:
          return await _bluetooth.print(s, bytes);
        case PrinterType.usb:
          return await _usb.print(s, bytes);
      }
    } catch (e) {
      return PrintResult.failure('Lỗi tạo lệnh in: $e');
    }
  }

  Future<PrintResult> testPrint() {
    final receipt = ReceiptData(
      shopName: 'KANPOSVN',
      title: 'BILL TEST IN',
      orderCode: 'TEST-${DateTime.now().millisecondsSinceEpoch}',
      items: const [
        ReceiptItem(
          name: 'In thử máy in 80mm',
          quantity: 1,
          unitPrice: 10000,
          total: 10000,
        ),
      ],
      subtotal: 10000,
      grandTotal: 10000,
      paymentMethod: 'Tiền mặt',
      footer: 'Nếu bạn thấy nội dung này là máy in hoạt động tốt!',
    );
    return print(receipt);
  }

  Future<List<PrinterDevice>> discoverDevices(PrinterType type) async {
    switch (type) {
      case PrinterType.bluetooth:
        return _bluetooth.discover();
      case PrinterType.usb:
        return _usb.discover();
      case PrinterType.wifi:
        return const [];
    }
  }
}

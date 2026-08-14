import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'printer_service.dart';
import 'receipt_data.dart';
import 'receipt_pdf.dart';
import 'receipt_print_mode.dart';

/// In hóa đơn qua máy in 80mm và hiển thị kết quả.
Future<bool> printReceipt80(
  BuildContext context,
  WidgetRef ref,
  ReceiptData receipt, {
  void Function()? onSuccess,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  try {
    final result = await ref
        .read(printerServiceProvider)
        .print(receipt);
    if (messenger != null && context.mounted) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(result.success
              ? (result.message ?? 'Đã gửi lệnh in.')
              : 'In bill 80mm thất bại: ${result.error ?? 'Lỗi không xác định'}'),
          backgroundColor:
              result.success ? Colors.green.shade700 : Colors.red.shade700,
        ),
      );
    }
    if (result.success) {
      onSuccess?.call();
      return true;
    }
    return false;
  } catch (e) {
    if (messenger != null && context.mounted) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('In bill 80mm lỗi: $e'),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
    return false;
  }
}

/// In hóa đơn theo [mode] sau khi hoàn tất thanh toán:
/// - [ReceiptPrintMode.auto]: in 80mm nếu đã cấu hình máy in, ngược lại in PDF.
/// - [ReceiptPrintMode.thermal80]: luôn in qua máy in 80mm (nhắc cấu hình nếu chưa).
/// - [ReceiptPrintMode.pdf]: luôn in ra PDF.
Future<bool> printReceiptByMode(
  BuildContext context,
  WidgetRef ref,
  ReceiptData receipt,
  ReceiptPrintMode mode, {
  String? pdfFilename,
}) async {
  final printer = ref.read(printerSettingsProvider).settings;
  switch (mode) {
    case ReceiptPrintMode.auto:
      if (printer.isConfigured) {
        return printReceipt80(context, ref, receipt);
      }
      await printReceiptPdf(receipt, filename: pdfFilename);
      return true;
    case ReceiptPrintMode.thermal80:
      if (!printer.isConfigured) {
        final messenger = ScaffoldMessenger.maybeOf(context);
        if (messenger != null && context.mounted) {
          messenger.showSnackBar(
            SnackBar(
              content: Text(
                  'Chưa cấu hình máy in 80mm. Vào Cài đặt → Máy in để chọn máy in.'),
              backgroundColor: Colors.red.shade700,
            ),
          );
        }
        return false;
      }
      return printReceipt80(context, ref, receipt);
    case ReceiptPrintMode.pdf:
      await printReceiptPdf(receipt, filename: pdfFilename);
      return true;
  }
}

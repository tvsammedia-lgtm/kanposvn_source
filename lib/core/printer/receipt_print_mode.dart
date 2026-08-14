/// Chế độ in khi hoàn tất thanh toán — dùng chung cho các màn POS.
enum ReceiptPrintMode {
  /// Mặc định: in qua máy in 80mm nếu đã cấu hình, ngược lại in PDF.
  auto,

  /// Luôn in qua máy in 80mm đã cấu hình.
  thermal80,

  /// Luôn in ra PDF.
  pdf,
}

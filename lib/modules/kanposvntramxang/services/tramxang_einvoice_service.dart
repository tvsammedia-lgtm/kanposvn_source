// ignore_for_file: avoid_print

import 'dart:convert';
import '../models/sale.dart';

/// Dịch vụ quản lý Hóa đơn điện tử (E-Invoice) cho trạm xăng
/// Theo Nghị định 123/2020/NĐ-CP và Thông tư 78/2021/TT-BTC,
/// trạm xăng phải xuất HĐĐT theo từng lần bán.
class TramXangEInvoiceService {
  /// placeholder cho môi trường tích hợp thật (Viettel, VNPT, MISA...):
  /// apiUrl, token, taxCode được cấu hình riêng theo nhà cung cấp.
  TramXangEInvoiceService();

  /// Tạo payload chuẩn theo định dạng XML hoặc JSON của nhà cung cấp
  Map<String, dynamic> _buildInvoicePayload(TramXangSale sale, List<TramXangSaleLine> lines) {
    // Thông tin cơ bản (Mock payload mapping)
    final invoiceData = {
      "khachHang": {
        "tenKhachHang": sale.customer.value?.name ?? "Khách lẻ",
        "maSoThue": sale.customer.value?.taxCode ?? "",
        "diaChi": sale.customer.value?.address ?? "",
      },
      "thongTinChung": {
        "mauSo": "1/001",
        "kyHieu": "C23TAA", // C: Có mã CQ Thuế, 23: Năm 2023, T: Trạm xăng...
        "hinhThucThanhToan": sale.paymentMethod == 'CASH' ? 'TM' : 'CK',
        "tongTienThanhToan": sale.total,
        "tongTienChuaThue": sale.subtotal,
        "tongTienThue": sale.tax,
      },
      "chiTietHangHoa": lines.map((line) => {
        "tenHangHoa": line.product.value?.name ?? 'Xăng dầu',
        "donViTinh": line.unit,
        "soLuong": line.quantity,
        "donGia": line.unitPrice,
        "thueSuat": line.taxRate,
        "thanhTien": line.amount,
        "tienThue": line.taxAmount,
      }).toList(),
    };

    return invoiceData;
  }

  /// Phát hành hóa đơn lên hệ thống CQT / Nhà cung cấp
  Future<bool> issueInvoice(TramXangSale sale, List<TramXangSaleLine> lines) async {
    try {
      final payload = _buildInvoicePayload(sale, lines);
      
      print('Chuẩn bị phát hành HĐĐT cho giao dịch: ${sale.saleNo}');
      print('Payload: ${jsonEncode(payload)}');

      // // Gọi API thực tế
      // final response = await http.post(
      //   Uri.parse('$_apiUrl/api/invoice/issue'),
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $_token',
      //   },
      //   body: jsonEncode(payload),
      // );
      
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   final resData = jsonDecode(response.body);
      //   // Lưu lại Mã cơ quan thuế cấp, số hóa đơn vào sale model
      //   return true;
      // }

      // Mock success
      await Future.delayed(const Duration(seconds: 1));
      print('Phát hành HĐĐT thành công!');
      return true;

    } catch (e) {
      print('Lỗi phát hành HĐĐT: $e');
      return false;
    }
  }

  /// Phát hành HĐĐT hàng loạt (đối với các giao dịch bán lẻ chưa cấp mã)
  /// Thường dùng chạy ngầm hoặc cuối ngày với các hóa đơn khách không lấy.
  Future<int> issueBatchInvoices(List<Map<String, dynamic>> salesData) async {
    int successCount = 0;
    for (var data in salesData) {
      TramXangSale sale = data['sale'];
      List<TramXangSaleLine> lines = data['lines'];
      
      bool success = await issueInvoice(sale, lines);
      if (success) successCount++;
    }
    return successCount;
  }
}

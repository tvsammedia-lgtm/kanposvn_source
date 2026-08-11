import '../../../core/db/database_service.dart';

/// Dịch vụ HĐĐT cho kanposvncafe.
///
/// Tab "Hóa đơn điện tử" sẵn sàng nhận dữ liệu từ nhà cung cấp HĐĐT
/// (Viettel, M-Invoice, VNPT,...). Khi tích hợp nhà cung cấp, lưu cấu hình
/// vào collection `cafe_einvoice_config` và cập nhật service này để pull
/// hóa đơn + phát hành. Cấu hình lưu cục bộ trên máy (KHÔNG đưa vào SyncQueue).
class CafeEinvoiceService {
  static const String collectionName = 'cafe_einvoice_config';
  static const String configId = 'einvoice_config';

  static Set<String> get collectionNames => {collectionName};

  Future<CafeEinvoiceStatus> loadStatus() async {
    final db = DatabaseService.instance;
    try {
      final items = db.getCollection(collectionName);
      for (final item in items) {
        if (item['id'] != configId) continue;
        final configured = item['configured'] == true;
        final providerKey = (item['provider'] ?? '') as String;
        final invoiceCount = (item['invoice_count'] as num?)?.toInt() ?? 0;
        return CafeEinvoiceStatus(
          configured: configured,
          providerKey: providerKey,
          invoiceCount: invoiceCount,
        );
      }
    } catch (_) {
      // trả về trạng thái mặc định khi chưa có dữ liệu
    }
    return CafeEinvoiceStatus(
      configured: false,
      providerKey: '',
      invoiceCount: 0,
    );
  }
}

class CafeEinvoiceStatus {
  final bool configured;
  final String providerKey;
  final int invoiceCount;

  const CafeEinvoiceStatus({
    required this.configured,
    required this.providerKey,
    required this.invoiceCount,
  });

  String get providerLabel {
    if (!configured) return 'Chưa cấu hình';
    switch (providerKey.toLowerCase()) {
      case 'viettel':
        return 'Viettel Hóa đơn điện tử';
      case 'vnpt':
        return 'VNPT hoadon';
      case 'minvoice':
        return 'M-Invoice';
      default:
        return providerKey.isEmpty ? 'Chưa rõ' : providerKey;
    }
  }
}

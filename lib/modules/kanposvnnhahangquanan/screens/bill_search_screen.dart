import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../providers/restaurant_providers.dart';
import '../models/restaurant_order.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/printer_service.dart';
import '../../../core/printer/receipt_data.dart';

class BillSearchScreen extends ConsumerStatefulWidget {
  const BillSearchScreen({super.key});

  @override
  ConsumerState<BillSearchScreen> createState() => _BillSearchScreenState();
}

class _BillSearchScreenState extends ConsumerState<BillSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isScanning = false;
  RestaurantOrder? _foundOrder;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchOrder() {
    final searchId = _searchController.text.trim();
    if (searchId.isEmpty) return;

    final ordersAsync = ref.read(restaurantOrdersProvider);
    if (ordersAsync is AsyncData) {
      final orders = ordersAsync.value ?? [];
      RestaurantOrder? found;
      try {
        found = orders.firstWhere(
          (o) => o.orderId.toLowerCase().contains(searchId.toLowerCase()),
        );
      } catch (e) {
        found = null;
      }

      setState(() {
        _foundOrder = found;
      });

      if (_foundOrder == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không tìm thấy hóa đơn'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _onBarcodeDetected(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    if (barcode.rawValue != null) {
      setState(() {
        _isScanning = false;
        _searchController.text = barcode.rawValue!;
      });
      _searchOrder();
    }
  }

  Future<void> _printReceipt(RestaurantOrder order) async {
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  storeName ?? 'NHÀ HÀNG QUÁN ĂN',
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
              ),
              if (ownerName != null && ownerName.isNotEmpty && ownerName != storeName)
                pw.Center(
                  child: pw.Text(
                    ownerName,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
                  ),
                ),
              if (storePhone != null && storePhone.isNotEmpty)
                pw.Center(
                  child: pw.Text(
                    'ĐT: $storePhone',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 10),
                  ),
                ),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 5),
              pw.Text('Mã hóa đơn: ${order.orderId.substring(0, 8)}'),
              pw.Text('Bàn: ${order.table.value?.name ?? "N/A"} (${order.table.value?.zone ?? "N/A"})'),
              pw.Text('Giờ vào: ${order.createdAt != null ? order.createdAt.toString().substring(0, 16) : ''}'),
              pw.Text('Giờ ra: ${order.closedAt != null ? order.closedAt.toString().substring(0, 16) : ''}'),
              pw.Text('Trạng thái: ${order.status.label}'),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 5),
              pw.Text('CHI TIẾT MÓN', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              ...order.details.map((detail) => pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 5),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text('${detail.itemName} x${detail.quantity}'),
                    ),
                    pw.Text('${(detail.price * detail.quantity).toStringAsFixed(0)} đ'),
                  ],
                ),
              )),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 5),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('TỔNG CỘNG:', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  pw.Text('${order.totalAmount.toStringAsFixed(0)} đ', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Text(
                  'Cảm ơn quý khách!',
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'HoaDon_${order.orderId.substring(0, 8)}.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm Kiếm Hóa Đơn'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Nhập mã hóa đơn hoặc quét QR',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onSubmitted: (_) => _searchOrder(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () {
                    setState(() {
                      _isScanning = true;
                    });
                  },
                  tooltip: 'Quét QR Code',
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchOrder,
                  tooltip: 'Tìm kiếm',
                ),
              ],
            ),
          ),

          // QR Scanner
          if (_isScanning)
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: MobileScanner(
                      onDetect: _onBarcodeDetected,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isScanning = false;
                        });
                      },
                      child: const Text('Đóng quét QR'),
                    ),
                  ),
                ],
              ),
            ),

          // Search results
          if (!_isScanning)
            Expanded(
              child: _foundOrder == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Nhập mã hóa đơn hoặc quét QR để tìm kiếm',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hóa Đơn #${_foundOrder!.orderId.substring(0, 8)}',
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: _foundOrder!.status == RestaurantOrderStatus.COMPLETED
                                          ? Colors.green
                                          : Colors.orange,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      _foundOrder!.status.label,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 24),
                              _buildInfoRow('Bàn', '${_foundOrder!.table.value?.name ?? "N/A"} (${_foundOrder!.table.value?.zone ?? "N/A"})'),
                              _buildInfoRow('Giờ vào', _foundOrder!.createdAt != null ? _foundOrder!.createdAt.toString().substring(0, 16) : 'N/A'),
                              _buildInfoRow('Giờ ra', _foundOrder!.closedAt != null ? _foundOrder!.closedAt.toString().substring(0, 16) : 'Chưa thanh toán'),
                              const Divider(height: 24),
                              const Text(
                                'Chi tiết món',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              ..._foundOrder!.details.map((detail) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('${detail.itemName} x${detail.quantity}'),
                                    ),
                                    Text('${(detail.price * detail.quantity).toStringAsFixed(0)} đ'),
                                  ],
                                ),
                              )),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TỔNG CỘNG',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${_foundOrder!.totalAmount.toStringAsFixed(0)} đ',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    final printer =
                                        ref.read(printerSettingsProvider).settings;
                                    if (!printer.isConfigured) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Chưa cấu hình máy in 80mm. Vào Cài đặt → Máy in để cấu hình.'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                      return;
                                    }
                                    final storeName = await AuthService
                                        .loadSavedStoreName();
                                    final ownerName = await AuthService
                                        .loadSavedOwnerName();
                                    final storePhone = await AuthService
                                        .loadSavedStorePhone();
                                    final order = _foundOrder!;
                                    await printReceipt80(
                                      context,
                                      ref,
                                      ReceiptData(
                                        shopName:
                                            storeName ?? 'NHÀ HÀNG QUÁN ĂN',
                                        shopOwnerName: ownerName,
                                        shopPhone: storePhone,
                                        title: 'HÓA ĐƠN THANH TOÁN',
                                        orderCode: order.orderId.length > 8
                                            ? order.orderId.substring(0, 8)
                                            : order.orderId,
                                        date: order.closedAt ?? DateTime.now(),
                                        table:
                                            '${order.table.value?.name ?? ''} (${order.table.value?.zone ?? ''})',
                                        qrData: order.orderId,
                                        items: order.details
                                            .map((d) => ReceiptItem(
                                                  name: d.itemName,
                                                  quantity:
                                                      d.quantity.toDouble(),
                                                  unitPrice: d.price,
                                                  total: d.price * d.quantity,
                                                ))
                                            .toList(),
                                        subtotal: order.totalAmount,
                                        grandTotal: order.totalAmount,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.print_outlined),
                                  label: const Text('IN HÓA ĐƠN 80mm',
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () => _printReceipt(_foundOrder!),
                                  icon: const Icon(Icons.print),
                                  label: const Text('IN HÓA ĐƠN', style: TextStyle(fontSize: 16)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(value),
        ],
      ),
    );
  }
}

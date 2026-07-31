import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';

class QrScanScreen extends ConsumerStatefulWidget {
  const QrScanScreen({super.key});

  @override
  ConsumerState<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends ConsumerState<QrScanScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // QR Scanner state
  MobileScannerController? _cameraController;
  bool _isProcessing = false;
  String? _scannedCode;
  OrderModel? _foundOrder;
  bool _showResult = false;

  // Order list filter state
  String _filterStatus = 'ALL'; // ALL, UNPAID, PAID
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  // QR Scanner
  void _onDetect(BarcodeCapture capture) {
    if (_isProcessing) return;
    for (final barcode in capture.barcodes) {
      final code = barcode.rawValue;
      if (code != null && code.isNotEmpty) {
        setState(() => _isProcessing = true);
        _lookupOrder(code);
        break;
      }
    }
  }

  void _lookupOrder(String code) {
    final db = ref.read(dbProvider);
    final order = db.findOrderByCode(code);
    setState(() {
      _scannedCode = code;
      _foundOrder = order;
      _showResult = true;
    });
  }

  void _resetScanner() {
    setState(() {
      _isProcessing = false;
      _scannedCode = null;
      _foundOrder = null;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2C2A),
        foregroundColor: Colors.white,
        title: const Text('Tra Cứu Hóa Đơn'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.amber,
          tabs: const [
            Tab(icon: Icon(Icons.qr_code_scanner), text: 'Quét QR'),
            Tab(icon: Icon(Icons.receipt_long), text: 'Tìm theo trạng thái'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildQrTab(),
          _buildOrderListTab(),
        ],
      ),
    );
  }

  // ===================== TAB 1: QR SCANNER =====================

  Widget _buildQrTab() {
    if (_showResult) return _buildResultView();
    return _buildScannerView();
  }

  Widget _buildScannerView() {
    return Stack(
      children: [
        MobileScanner(controller: _cameraController, onDetect: _onDetect),
        Center(
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
              child: const Text('Đặt mã QR trên hóa đơn vào khung', style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ),
        if (_isProcessing) const Center(child: CircularProgressIndicator(color: Colors.amber)),
      ],
    );
  }

  Widget _buildResultView() {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final dateTime = DateFormat('dd/MM/yyyy HH:mm');

    return Container(
      color: const Color(0xFFF9F6F0),
      child: Column(
        children: [
          // Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: _foundOrder != null ? Colors.green[50] : Colors.red[50],
            child: Row(
              children: [
                Icon(_foundOrder != null ? Icons.check_circle : Icons.error, color: _foundOrder != null ? Colors.green : Colors.red, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_foundOrder != null ? 'Tìm thấy hóa đơn!' : 'Không tìm thấy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _foundOrder != null ? Colors.green[800] : Colors.red[800])),
                      Text('Mã QR: $_scannedCode', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (_foundOrder != null)
            Expanded(child: SingleChildScrollView(padding: const EdgeInsets.all(16), child: _buildOrderDetailCard(_foundOrder!, currency, dateTime)))
          else
            const Expanded(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.search_off, size: 80, color: Colors.grey),
              SizedBox(height: 16),
              Text('Không tìm thấy hóa đơn', style: TextStyle(fontSize: 18, color: Colors.grey)),
            ]))),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity, height: 48,
              child: ElevatedButton.icon(
                onPressed: _resetScanner,
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Quét lại'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A2C2A), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== TAB 2: ORDER LIST =====================

  Widget _buildOrderListTab() {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final dateTime = DateFormat('dd/MM/yyyy HH:mm');
    final db = ref.watch(dbProvider);

    List<OrderModel> filteredOrders = db.orders.where((o) {
      bool statusMatch = true;
      if (_filterStatus == 'UNPAID') statusMatch = o.paymentStatus == 'UNPAID';
      if (_filterStatus == 'PAID') statusMatch = o.paymentStatus == 'PAID';

      bool searchMatch = _searchQuery.isEmpty ||
          o.orderCode.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (o.customerName?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false) ||
          (o.tableName?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);

      return statusMatch && searchMatch;
    }).toList();

    filteredOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final unpaidCount = db.orders.where((o) => o.paymentStatus == 'UNPAID').length;
    final paidCount = db.orders.where((o) => o.paymentStatus == 'PAID').length;

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onChanged: (val) => setState(() => _searchQuery = val),
            decoration: InputDecoration(
              hintText: 'Tìm mã HD, tên khách, bàn...',
              prefixIcon: const Icon(Icons.search),
              filled: true, fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ),

        // Filter chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _buildFilterChip('Tất cả (${db.orders.length})', 'ALL'),
              const SizedBox(width: 8),
              _buildFilterChip('Chưa thanh toán ($unpaidCount)', 'UNPAID'),
              const SizedBox(width: 8),
              _buildFilterChip('Đã thanh toán ($paidCount)', 'PAID'),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Order list
        Expanded(
          child: filteredOrders.isEmpty
              ? const Center(child: Text('Không có hóa đơn nào', style: TextStyle(color: Colors.grey, fontSize: 16)))
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: filteredOrders.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (ctx, i) {
                    final order = filteredOrders[i];
                    final isPaid = order.paymentStatus == 'PAID';
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundColor: isPaid ? Colors.green[100] : Colors.orange[100],
                          child: Icon(isPaid ? Icons.check_circle : Icons.access_time, color: isPaid ? Colors.green : Colors.orange, size: 22),
                        ),
                        title: Row(
                          children: [
                            Text(order.orderCode, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isPaid ? Colors.green[100] : Colors.orange[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(isPaid ? 'Đã TT' : 'Chưa TT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isPaid ? Colors.green[800] : Colors.orange[800])),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text('${dateTime.format(order.createdAt)} • ${order.tableName ?? order.type.label}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            if (order.customerName != null && order.customerName!.isNotEmpty)
                              Text('Khách: ${order.customerName}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        trailing: Text(currency.format(order.totalAmount), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isPaid ? Colors.green[800] : Colors.red)),
                        onTap: () => _showOrderDetailDialog(order, currency, dateTime),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _filterStatus == value;
    return FilterChip(
      label: Text(label, style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black)),
      selected: isSelected,
      selectedColor: const Color(0xFF4A2C2A),
      checkmarkColor: Colors.amber,
      onSelected: (_) => setState(() => _filterStatus = value),
    );
  }

  // ===================== SHARED WIDGETS =====================

  void _showOrderDetailDialog(OrderModel order, NumberFormat currency, DateFormat dateTime) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Hóa đơn ${order.orderCode}'),
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(child: _buildOrderDetailCard(order, currency, dateTime)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đóng')),
        ],
      ),
    );
  }

  Widget _buildOrderDetailCard(OrderModel order, NumberFormat currency, DateFormat dateTime) {
    final isPaid = order.paymentStatus == 'PAID';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.receipt_long, color: Color(0xFF4A2C2A), size: 28),
            const SizedBox(width: 10),
            Text(order.orderCode, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: isPaid ? Colors.green[100] : Colors.orange[100], borderRadius: BorderRadius.circular(20)),
              child: Text(isPaid ? 'Đã thanh toán' : 'Chưa thanh toán', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isPaid ? Colors.green[800] : Colors.orange[800])),
            ),
          ]),
          const Divider(height: 24),
          _infoRow('Ngày tạo:', dateTime.format(order.createdAt)),
          _infoRow('Loại đơn:', order.type.label),
          if (order.tableName != null) _infoRow('Bàn:', order.tableName!),
          if (order.areaName != null) _infoRow('Khu vực:', order.areaName!),
          if (order.customerName != null && order.customerName!.isNotEmpty) _infoRow('Khách hàng:', order.customerName!),
          _infoRow('Thu ngân:', order.createdBy),
          _infoRow('Thanh toán:', _getPaymentLabel(order.paymentMethod)),
          const Divider(height: 24),
          const Text('Chi tiết món:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          ...order.items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${item.productName} (${item.sizeName})', style: const TextStyle(fontWeight: FontWeight.bold)),
                if (item.selectedToppings.isNotEmpty)
                  Text('Topping: ${item.selectedToppings.map((t) => t.name).join(", ")}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                Text('${item.quantity} x ${currency.format(item.itemUnitPrice)}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ])),
              Text(currency.format(item.totalPrice), style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
          )),
          const Divider(height: 24),
          _summaryRow('Tạm tính:', currency.format(order.subtotal)),
          if (order.discountAmount > 0) _summaryRow('Giảm giá:', '-${currency.format(order.discountAmount)}', isRed: true),
          if (order.deliveryFee > 0) _summaryRow('Phí ship:', currency.format(order.deliveryFee)),
          const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('TỔNG TIỀN:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A))),
            Text(currency.format(order.totalAmount), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
          ]),
        ]),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        SizedBox(width: 110, child: Text(label, style: TextStyle(color: Colors.grey[600]))),
        Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))),
      ]),
    );
  }

  Widget _summaryRow(String label, String value, {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isRed ? Colors.red : null)),
      ]),
    );
  }

  String _getPaymentLabel(String method) {
    switch (method) {
      case 'CASH': return 'Tiền mặt';
      case 'VIETQR': return 'VietQR';
      case 'BANK_TRANSFER': return 'Chuyển khoản';
      case 'CARD': return 'Thẻ';
      case 'E_WALLET': return 'Ví điện tử';
      default: return method;
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../models/cafe_order.dart';
import '../providers/cafe_providers.dart';
import '../services/bill_printer.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/printer_service.dart';
import '../../../core/printer/receipt_data.dart';

enum _DateBasis { created, printed }

class OrderHistoryScreen extends ConsumerStatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  ConsumerState<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends ConsumerState<OrderHistoryScreen> {
  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();
  List<CafeOrder> _filteredOrders = [];
  final _searchController = TextEditingController();
  _DateBasis _dateBasis = _DateBasis.created;

  final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _applyFilter());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilter() {
    final from = DateTime(_fromDate.year, _fromDate.month, _fromDate.day);
    final endOfDay = DateTime(_toDate.year, _toDate.month, _toDate.day, 23, 59, 59);
    final keyword = _searchController.text.trim().toLowerCase();
    final all = ref.read(cafeOrdersProvider);
    setState(() {
      _filteredOrders = all.where((o) {
        final t = _dateBasis == _DateBasis.printed ? o.printedAt : o.createdAt;
        if (t == null || !t.isAfter(from) || !t.isBefore(endOfDay)) return false;
        if (keyword.isNotEmpty && !o.orderCode.toLowerCase().contains(keyword)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom ? _fromDate : _toDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      locale: const Locale('vi', 'VN'),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
          if (_fromDate.isAfter(_toDate)) _toDate = _fromDate;
        } else {
          _toDate = picked;
          if (_toDate.isBefore(_fromDate)) _fromDate = _toDate;
        }
      });
      _applyFilter();
    }
  }

  void _showOrderDetail(CafeOrder order) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Đơn ${order.orderCode}'),
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt)}'),
                if (order.printedAt != null)
                  Text('In lúc: ${DateFormat('dd/MM/yyyy HH:mm').format(order.printedAt!)}'),
                if (order.tableName != null && order.tableName!.isNotEmpty)
                  Text('Bàn: ${order.tableName}'),
                if (order.customerName.isNotEmpty && order.customerName != 'Khách lẻ')
                  Text('Khách: ${order.customerName}'),
                Text('Thanh toán: ${order.paymentMethod.label}'),
                Text('Trạng thái: ${order.status.label}'),
                const Divider(),
                ...order.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${item.menuItemName} (${item.selectedSize.name}) x${item.quantity}',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        Text(
                          _currency.format(item.totalPrice),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tổng cộng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(_currency.format(order.grandTotal), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFFD97706))),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đóng')),
          OutlinedButton.icon(
            icon: const Icon(Icons.print_outlined, size: 18),
            label: const Text('In 80mm'),
            onPressed: () async {
              Navigator.pop(ctx);
              await _printReceipt80(order);
            },
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD97706)),
            icon: const Icon(Icons.print, color: Colors.white, size: 18),
            label: const Text('In lại', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(cafeOrdersProvider.notifier).markPrinted(order);
              printBillPdf(order);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _printReceipt80(CafeOrder order) async {
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();
    final receipt = ReceiptData(
      shopName: storeName ?? 'KANPOSVN',
      shopOwnerName: ownerName,
      shopPhone: storePhone,
      title: 'HÓA ĐƠN THANH TOÁN',
      orderCode: order.orderCode,
      date: order.paidAt ?? order.createdAt,
      table: order.tableName ?? '',
      customer: order.customerName,
      paymentMethod: order.paymentMethod.label,
      qrData: order.orderCode,
      items: order.items.map((item) {
        final unitPrice = item.unitPrice + item.selectedSize.extraPrice;
        final toppings = item.selectedToppings
            .map((t) => '${t.name} ${_currency.format(t.price)}')
            .join(', ');
        return ReceiptItem(
          name: '${item.menuItemName} (${item.selectedSize.name})',
          quantity: item.quantity.toDouble(),
          unitPrice: unitPrice,
          total: item.totalPrice,
          extra: toppings.isNotEmpty
              ? toppings
              : (item.note.isNotEmpty ? item.note : ''),
        );
      }).toList(),
      subtotal: order.subtotal,
      discount: order.totalDiscount,
      grandTotal: order.grandTotal,
    );
    final printer = ref.read(printerSettingsProvider).settings;
    if (!printer.isConfigured) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa cấu hình máy in 80mm. Vào Cài đặt → Máy in để cấu hình.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    await printReceipt80(context, ref, receipt);
  }

  void _openQrScanner() {
    if (!Platform.isAndroid && !Platform.isIOS) {
      _openManualEntry();
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _QrScannerPage(
          onScan: (code) {
            Navigator.pop(context);
            _handleQrResult(code);
          },
        ),
      ),
    );
  }

  void _openManualEntry() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nhập mã hóa đơn'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Ví dụ: HD-20260731-0001',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            Navigator.pop(ctx);
            final code = value.trim();
            if (code.isNotEmpty) _handleQrResult(code);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD97706),
            ),
            icon: const Icon(Icons.search, size: 18, color: Colors.white),
            label: const Text('Tra cứu', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(ctx);
              final code = controller.text.trim();
              if (code.isNotEmpty) _handleQrResult(code);
            },
          ),
        ],
      ),
    );
  }

  void _handleQrResult(String code) {
    final order = ref.read(cafeOrdersProvider.notifier).getOrderByCode(code);
    if (order != null) {
      _showOrderDetail(order);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không tìm thấy hóa đơn: $code'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final allOrders = ref.watch(cafeOrdersProvider);
    ref.listen(cafeOrdersProvider, (prev, next) {
      if (prev != next) _applyFilter();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        foregroundColor: Colors.white,
        title: const Text('Tra cứu hóa đơn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Quét mã QR',
            onPressed: _openQrScanner,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Tìm theo mã hóa đơn...',
                    hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFFD97706)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              _applyFilter();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onChanged: (_) => _applyFilter(),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 20, color: Color(0xFFD97706)),
                    const SizedBox(width: 8),
                    _dateChip(_fromDate, () => _pickDate(isFrom: true)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('→', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    _dateChip(_toDate, () => _pickDate(isFrom: false)),
                    const Spacer(),
                    Text('${_filteredOrders.length} đơn', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _filterChip(_DateBasis.created, 'Theo ngày tạo'),
                    const SizedBox(width: 8),
                    _filterChip(_DateBasis.printed, 'Theo ngày in'),
                    const Spacer(),
                    if (_dateBasis == _DateBasis.printed)
                      Text(
                        'Khoảng ngày lọc theo thời điểm in',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredOrders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Text(
                          allOrders.isEmpty
                              ? 'Chưa có hóa đơn nào'
                              : 'Không có hóa đơn trong khoảng ngày này',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                        ),
                        if (allOrders.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Tổng số hóa đơn: ${allOrders.length}',
                            style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                          ),
                        ],
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: _filteredOrders.length,
                    itemBuilder: (ctx, i) {
                      final order = _filteredOrders[i];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: ListTile(
                          leading: Icon(
                            order.status == OrderStatus.daThanhToan
                                ? Icons.check_circle
                                : Icons.pending,
                            color: order.status == OrderStatus.daThanhToan
                                ? Colors.green
                                : Colors.orange,
                          ),
                          title: Text(
                            '${order.orderCode} - ${order.tableName ?? order.orderType.label}',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          subtitle: Text(
                            order.printedAt != null
                                ? '${DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt)}  •  ${_currency.format(order.grandTotal)}\nIn lúc: ${DateFormat('dd/MM/yyyy HH:mm').format(order.printedAt!)}'
                                : '${DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt)}  •  ${_currency.format(order.grandTotal)}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                order.status.label,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: order.status == OrderStatus.daThanhToan
                                      ? Colors.green
                                      : Colors.orange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(Icons.print, size: 20, color: Color(0xFFD97706)),
                                tooltip: 'In lại',
                                onPressed: () {
                                  ref.read(cafeOrdersProvider.notifier).markPrinted(order);
                                  printBillPdf(order);
                                },
                              ),
                            ],
                          ),
                          onTap: () => _showOrderDetail(order),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(_DateBasis basis, String label) {
    final selected = _dateBasis == basis;
    return InkWell(
      onTap: () {
        if (selected) return;
        setState(() => _dateBasis = basis);
        _applyFilter();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD97706) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: selected ? const Color(0xFFD97706) : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  Widget _dateChip(DateTime date, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          DateFormat('dd/MM/yyyy').format(date),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}

class _QrScannerPage extends StatefulWidget {
  final void Function(String code) onScan;
  const _QrScannerPage({required this.onScan});

  @override
  State<_QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<_QrScannerPage> {
  MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        foregroundColor: Colors.white,
        title: const Text('Quét mã QR hóa đơn'),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final barcode = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
          if (barcode == null || barcode.rawValue == null) return;
          widget.onScan(barcode.rawValue!.trim());
        },
      ),
    );
  }
}

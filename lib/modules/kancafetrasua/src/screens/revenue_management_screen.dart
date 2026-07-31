import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/app_providers.dart';
import '../models/isar_models.dart';
import '../services/pdf_generator_service.dart';

class RevenueManagementScreen extends ConsumerStatefulWidget {
  const RevenueManagementScreen({super.key});

  @override
  ConsumerState<RevenueManagementScreen> createState() => _RevenueManagementScreenState();
}

class _RevenueManagementScreenState extends ConsumerState<RevenueManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedStatus;
  String? _selectedPaymentMethod;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<OrderModel> _getFilteredOrders(List<OrderModel> orders) {
    // Create a modifiable copy of the list
    var filtered = List<OrderModel>.from(orders);

    // Filter by search query (order code, customer name, phone, table name)
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((order) {
        return order.orderCode.toLowerCase().contains(query) ||
            (order.customerName?.toLowerCase().contains(query) ?? false) ||
            (order.customerPhone?.contains(query) ?? false) ||
            (order.tableName?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    // Filter by date range
    if (_startDate != null) {
      filtered = filtered.where((order) => order.createdAt.isAfter(_startDate!)).toList();
    }
    if (_endDate != null) {
      final endDate = _endDate!.add(const Duration(days: 1));
      filtered = filtered.where((order) => order.createdAt.isBefore(endDate)).toList();
    }

    // Filter by status
    if (_selectedStatus != null) {
      filtered = filtered.where((order) => order.status == _selectedStatus).toList();
    }

    // Filter by payment method
    if (_selectedPaymentMethod != null) {
      filtered = filtered.where((order) => order.paymentMethod == _selectedPaymentMethod).toList();
    }

    // Sort by date descending (newest first)
    filtered = List.from(filtered)..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return filtered;
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Bộ lọc'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Range
                const Text('Khoảng thời gian:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _startDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setDialogState(() => _startDate = picked);
                          }
                        },
                        icon: const Icon(Icons.calendar_today, size: 16),
                        label: Text(_startDate != null ? DateFormat('dd/MM/yyyy').format(_startDate!) : 'Từ ngày'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _endDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setDialogState(() => _endDate = picked);
                          }
                        },
                        icon: const Icon(Icons.calendar_today, size: 16),
                        label: Text(_endDate != null ? DateFormat('dd/MM/yyyy').format(_endDate!) : 'Đến ngày'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Status Filter
                const Text('Trạng thái đơn:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Tất cả')),
                    DropdownMenuItem(value: 'DRAFT', child: Text('Nháp')),
                    DropdownMenuItem(value: 'SERVED', child: Text('Đã phục vụ')),
                    DropdownMenuItem(value: 'PENDING_PAYMENT', child: Text('Chờ thanh toán')),
                    DropdownMenuItem(value: 'COMPLETED', child: Text('Hoàn thành')),
                    DropdownMenuItem(value: 'CANCELLED', child: Text('Đã hủy')),
                  ],
                  onChanged: (value) => setDialogState(() => _selectedStatus = value),
                ),
                const SizedBox(height: 16),

                // Payment Method Filter
                const Text('Phương thức thanh toán:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedPaymentMethod,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Tất cả')),
                    DropdownMenuItem(value: 'CASH', child: Text('Tiền mặt')),
                    DropdownMenuItem(value: 'VIETQR', child: Text('VietQR')),
                    DropdownMenuItem(value: 'BANK_TRANSFER', child: Text('Chuyển khoản')),
                    DropdownMenuItem(value: 'CARD', child: Text('Thẻ')),
                    DropdownMenuItem(value: 'E_WALLET', child: Text('Ví điện tử')),
                    DropdownMenuItem(value: 'MULTI', child: Text('Hỗn hợp')),
                  ],
                  onChanged: (value) => setDialogState(() => _selectedPaymentMethod = value),
                ),
                const SizedBox(height: 16),

                // Clear Filters
                TextButton.icon(
                  onPressed: () {
                    setDialogState(() {
                      _startDate = null;
                      _endDate = null;
                      _selectedStatus = null;
                      _selectedPaymentMethod = null;
                    });
                  },
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Xóa bộ lọc'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Áp dụng'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBillDetails(OrderModel order) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 420, maxHeight: 700),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header - Paper Bill Style
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF4A2C2A),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.receipt_long, color: Colors.amberAccent, size: 24),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'HÓA ĐƠN',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.orderCode,
                          style: const TextStyle(color: Colors.amberAccent, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: order.paymentStatus == 'PAID' ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: order.paymentStatus == 'PAID' ? Colors.greenAccent : Colors.orangeAccent,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                order.paymentStatus == 'PAID' ? Icons.check_circle : Icons.pending,
                                size: 14,
                                color: order.paymentStatus == 'PAID' ? Colors.greenAccent : Colors.orangeAccent,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                order.paymentStatus == 'PAID' ? 'Đã thanh toán' : 'Chưa thanh toán',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: order.paymentStatus == 'PAID' ? Colors.greenAccent : Colors.orangeAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Content - Paper Bill Style
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order Info - Bill Style
                        _buildBillSection('Thông tin đơn hàng', [
                          _buildBillDetailRow('Mã HD', order.orderCode),
                          _buildBillDetailRow('Ngày tạo', DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt)),
                          if (order.paidAt != null) _buildBillDetailRow('Thanh toán', DateFormat('dd/MM/yyyy HH:mm').format(order.paidAt!)),
                          if (order.tableName != null) _buildBillDetailRow('Bàn', '${order.tableName} ${order.areaName != null ? '(${order.areaName})' : ''}'),
                          if (order.type == OrderType.delivery && order.deliveryPartner != null) 
                            _buildBillDetailRow('Đơn vị giao', order.deliveryPartner!),
                          if (order.customerName != null) _buildBillDetailRow('Khách hàng', order.customerName!),
                          if (order.customerPhone != null) _buildBillDetailRow('SĐT', order.customerPhone!),
                          _buildBillDetailRow('Loại đơn', order.type.label),
                          _buildBillDetailRow('PT thanh toán', _getPaymentMethodLabel(order.paymentMethod)),
                          if (order.note.isNotEmpty) _buildBillDetailRow('Ghi chú', order.note),
                        ]),
                        
                        const SizedBox(height: 16),
                        
                        // Items - Bill Style
                        _buildBillSection('Danh sách món', [
                          ...order.items.asMap().entries.map((entry) {
                            final index = entry.key + 1;
                            final item = entry.value;
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF4A2C2A),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '$index',
                                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                item.productName,
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        currency.format(item.totalPrice),
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF4A2C2A)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          '${item.quantity} x ${currency.format(item.itemUnitPrice)}',
                                          style: const TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      if (item.sizeName != 'M') ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.amber.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            'Size ${item.sizeName}',
                                            style: const TextStyle(fontSize: 11, color: Colors.amber, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  if (item.selectedToppings.isNotEmpty) ...[
                                    const SizedBox(height: 6),
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 4,
                                      children: item.selectedToppings.map((topping) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          '+${topping.name}',
                                          style: const TextStyle(fontSize: 11, color: Colors.green),
                                        ),
                                      )).toList(),
                                    ),
                                  ],
                                  if (item.note.isNotEmpty) ...[
                                    const SizedBox(height: 6),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.edit_note, size: 14, color: Colors.orange),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              item.note,
                                              style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.orange),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }).toList(),
                        ]),
                        
                        const SizedBox(height: 16),
                        
                        // Summary - Bill Style
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A2C2A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBillSummaryRow('Tạm tính', currency.format(order.subtotal), Colors.white70),
                              if (order.discountPercent > 0 || order.discountAmount > 0)
                                _buildBillSummaryRow('Giảm giá', '-${currency.format(order.discountAmount > 0 ? order.discountAmount : order.subtotal * order.discountPercent / 100)}', Colors.redAccent),
                              if (order.deliveryFee > 0)
                                _buildBillSummaryRow('Phí giao hàng', currency.format(order.deliveryFee), Colors.white70),
                              const Divider(color: Colors.white24, thickness: 1),
                              _buildBillSummaryRow('TỔNG TIỀN', currency.format(order.totalAmount), Colors.amberAccent, true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Actions - Prominent Print Button
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          PdfGeneratorService.printBill(order);
                        },
                        icon: const Icon(Icons.print, size: 22),
                        label: const Text('IN BILL GIẤY', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A2C2A),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, size: 20),
                      label: const Text('Đóng'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4A2C2A)),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildBillDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillSummaryRow(String label, String value, Color color, [bool isBold = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 16 : 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 18 : 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, [Color? color, bool isBold = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 15 : 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 15 : 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  String _getPaymentMethodLabel(String method) {
    switch (method) {
      case 'CASH':
        return 'Tiền mặt';
      case 'VIETQR':
        return 'VietQR';
      case 'BANK_TRANSFER':
        return 'Chuyển khoản';
      case 'CARD':
        return 'Thẻ';
      case 'E_WALLET':
        return 'Ví điện tử';
      case 'MULTI':
        return 'Hỗn hợp';
      default:
        return method;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    final db = ref.watch(dbProvider);
    final filteredOrders = _getFilteredOrders(db.orders);
    
    // Calculate totals
    final totalRevenue = filteredOrders.where((o) => o.paymentStatus == 'PAID').fold(0.0, (sum, o) => sum + o.totalAmount);
    final totalPending = filteredOrders.where((o) => o.paymentStatus == 'UNPAID').fold(0.0, (sum, o) => sum + o.totalAmount);
    final totalOrders = filteredOrders.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Quản lý Doanh thu & Hóa đơn',
          style: TextStyle(color: Color(0xFF4A2C2A), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
            tooltip: 'Bộ lọc',
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary Cards
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'Tổng doanh thu',
                    currency.format(totalRevenue),
                    Icons.attach_money,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    'Chưa thanh toán',
                    currency.format(totalPending),
                    Icons.pending,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    'Tổng đơn hàng',
                    totalOrders.toString(),
                    Icons.receipt_long,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          
          // Search Bar
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm theo mã HD, tên khách, SĐT, bàn...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          
          // Active Filters
          if (_startDate != null || _endDate != null || _selectedStatus != null || _selectedPaymentMethod != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.blue.withOpacity(0.1),
              child: Wrap(
                spacing: 8,
                children: [
                  if (_startDate != null)
                    Chip(
                      label: Text('Từ: ${DateFormat('dd/MM/yyyy').format(_startDate!)}'),
                      onDeleted: () => setState(() => _startDate = null),
                      backgroundColor: Colors.white,
                    ),
                  if (_endDate != null)
                    Chip(
                      label: Text('Đến: ${DateFormat('dd/MM/yyyy').format(_endDate!)}'),
                      onDeleted: () => setState(() => _endDate = null),
                      backgroundColor: Colors.white,
                    ),
                  if (_selectedStatus != null)
                    Chip(
                      label: Text('Trạng thái: $_selectedStatus'),
                      onDeleted: () => setState(() => _selectedStatus = null),
                      backgroundColor: Colors.white,
                    ),
                  if (_selectedPaymentMethod != null)
                    Chip(
                      label: Text('PTTT: $_selectedPaymentMethod'),
                      onDeleted: () => setState(() => _selectedPaymentMethod = null),
                      backgroundColor: Colors.white,
                    ),
                ],
              ),
            ),
          
          // Orders List
          Expanded(
            child: filteredOrders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        Text(
                          'Không tìm thấy hóa đơn nào',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      final order = filteredOrders[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => _showBillDetails(order),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      order.orderCode,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4A2C2A),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: order.paymentStatus == 'PAID' 
                                            ? Colors.green.withOpacity(0.1) 
                                            : Colors.orange.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: order.paymentStatus == 'PAID' ? Colors.green : Colors.orange,
                                        ),
                                      ),
                                      child: Text(
                                        order.paymentStatus == 'PAID' ? 'Đã thanh toán' : 'Chưa thanh toán',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: order.paymentStatus == 'PAID' ? Colors.green : Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
                                    const SizedBox(width: 4),
                                    Text(
                                      DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt),
                                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.person, size: 14, color: Colors.grey.shade600),
                                    const SizedBox(width: 4),
                                    Text(
                                      order.createdBy,
                                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (order.tableName != null)
                                  Row(
                                    children: [
                                      Icon(Icons.table_restaurant, size: 14, color: Colors.grey.shade600),
                                      const SizedBox(width: 4),
                                      Text(
                                        order.tableName!,
                                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                      ),
                                      if (order.areaName != null) ...[
                                        const SizedBox(width: 8),
                                        Text(
                                          '(${order.areaName})',
                                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                        ),
                                      ],
                                    ],
                                  ),
                                if (order.customerName != null) ...[
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.person_outline, size: 14, color: Colors.grey.shade600),
                                      const SizedBox(width: 4),
                                      Text(
                                        order.customerName!,
                                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${order.items.length} món',
                                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                    ),
                                    Text(
                                      currency.format(order.totalAmount),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4A2C2A),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

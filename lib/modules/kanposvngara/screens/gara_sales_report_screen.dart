import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/gara_providers.dart';
import '../models/gara_repair_order.dart';

class GaraSalesReportScreen extends ConsumerStatefulWidget {
  const GaraSalesReportScreen({super.key});

  @override
  ConsumerState<GaraSalesReportScreen> createState() => _GaraSalesReportScreenState();
}

class _GaraSalesReportScreenState extends ConsumerState<GaraSalesReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Tháng này';

  @override
  void initState() {
    super.initState();
    _setMonthFilter();
  }

  void _setTodayFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, now.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Hôm nay';
    });
  }

  void _setWeekFilter() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    setState(() {
      _startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
      _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
      _filterPeriod = 'Tuần này';
    });
  }

  void _setMonthFilter() {
    final now = DateTime.now();
    setState(() {
      _startDate = DateTime(now.year, now.month, 1);
      _endDate = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
      _filterPeriod = 'Tháng này';
    });
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(start: _startDate!, end: DateTime(_endDate!.year, _endDate!.month, _endDate!.day))
          : null,
    );

    if (picked != null) {
      setState(() {
        _startDate = DateTime(picked.start.year, picked.start.month, picked.start.day);
        _endDate = DateTime(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
        _filterPeriod = 'Tùy chỉnh';
      });
    }
  }

  List<GaraRepairOrder> _getFilteredOrders(List<GaraRepairOrder> orders) {
    if (_startDate == null || _endDate == null) return orders;

    return orders.where((order) {
      if (order.orderDate == null) return false;
      final orderDate = order.orderDate!;
      return orderDate.isAfter(_startDate!) && orderDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<GaraRepairOrder> orders) {
    final completedOrders = orders.where((o) => o.status == GaraOrderStatus.COMPLETED || o.status == GaraOrderStatus.DELIVERED).toList();
    
    double totalRevenue = completedOrders.fold(0, (sum, order) => sum + order.totalAmount);
    double totalPaid = completedOrders.fold(0, (sum, order) => sum + order.paidAmount);
    int orderCount = completedOrders.length;
    double avgOrderValue = orderCount > 0 ? totalRevenue / orderCount : 0;
    double totalDebt = totalRevenue - totalPaid;

    return {
      'totalRevenue': totalRevenue,
      'totalPaid': totalPaid,
      'totalDebt': totalDebt,
      'orderCount': orderCount,
      'avgOrderValue': avgOrderValue,
    };
  }

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(garaOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Sửa Chữa Gara'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(garaOrdersProvider.notifier).loadOrders();
            },
          ),
        ],
      ),
      body: ordersAsync.when(
        data: (orders) {
          final filteredOrders = _getFilteredOrders(orders);
          final summary = _calculateSummary(filteredOrders);

          return Column(
            children: [
              _buildFilterSection(),
              _buildSummarySection(summary),
              Expanded(
                child: _buildDetailsSection(filteredOrders),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          Row(
            children: [
              _buildFilterChip('Hôm nay', _filterPeriod == 'Hôm nay', _setTodayFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tuần này', _filterPeriod == 'Tuần này', _setWeekFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tháng này', _filterPeriod == 'Tháng này', _setMonthFilter),
              const SizedBox(width: 8),
              _buildFilterChip('Tùy chỉnh', _filterPeriod == 'Tùy chỉnh', _selectDateRange),
            ],
          ),
          if (_filterPeriod == 'Tùy chỉnh' && _startDate != null && _endDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Từ ${DateFormat('dd/MM/yyyy').format(_startDate!)} đến ${DateFormat('dd/MM/yyyy').format(_endDate!)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: Colors.red,
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildSummarySection(Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Doanh Thu',
                  currencyFormat.format(summary['totalRevenue']),
                  Icons.attach_money,
                  Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Đơn',
                  '${summary['orderCount']}',
                  Icons.receipt_long,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Đã Thu',
                  currencyFormat.format(summary['totalPaid']),
                  Icons.account_balance_wallet,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Công Nợ',
                  currencyFormat.format(summary['totalDebt']),
                  Icons.warning,
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            'Trung Bình/Đơn',
            currencyFormat.format(summary['avgOrderValue']),
            Icons.trending_up,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(List<GaraRepairOrder> orders) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (orders.isEmpty) {
      return const Center(child: Text('Không có đơn sửa chữa nào trong khoảng thời gian này'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text('Đơn #${order.orderCode}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Khách: ${order.customer.value?.name ?? "N/A"}'),
                Text('Xe: ${order.vehicle.value?.licensePlate ?? "N/A"}'),
                if (order.orderDate != null)
                  Text('Ngày: ${DateFormat('dd/MM/yyyy').format(order.orderDate!)}'),
                if (order.currentKm > 0)
                  Text('KM: ${order.currentKm}'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(order.totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: order.status == GaraOrderStatus.DELIVERED ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status.label,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

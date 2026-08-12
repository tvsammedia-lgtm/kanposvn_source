import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/vlxd_providers.dart';
import '../models/vlxd_order.dart';

class VlxdSalesReportScreen extends ConsumerStatefulWidget {
  const VlxdSalesReportScreen({super.key});

  @override
  ConsumerState<VlxdSalesReportScreen> createState() => _VlxdSalesReportScreenState();
}

class _VlxdSalesReportScreenState extends ConsumerState<VlxdSalesReportScreen> {
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
    final now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: now,
      initialDateRange: _startDate != null && _endDate != null
          ? DateTimeRange(
              start: _startDate!,
              end: _endDate!.isAfter(now) ? now : _endDate!,
            )
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

  List<VlxdOrder> _getFilteredOrders(List<VlxdOrder> orders) {
    if (_startDate == null || _endDate == null) return orders;

    return orders.where((order) {
      final orderDate = order.orderDate;
      return orderDate.isAfter(_startDate!) && orderDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<VlxdOrder> orders) {
    final completedOrders = orders.where((o) => o.status == OrderStatus.COMPLETED).toList();
    
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
    final ordersAsync = ref.watch(vlxdOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Bán Hàng VLXD'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(vlxdOrdersProvider.notifier).loadOrders();
            },
          ),
        ],
      ),
      body: ordersAsync.when(
        data: (orders) {
          final filteredOrders = _getFilteredOrders(orders);
          final summary = _calculateSummary(filteredOrders);

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildFilterSection()),
                SliverToBoxAdapter(child: _buildSummarySection(summary)),
                if (filteredOrders.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('Không có đơn hàng nào trong khoảng thời gian này')),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final order = filteredOrders[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _buildOrderCard(order),
                          );
                        },
                        childCount: filteredOrders.length,
                      ),
                    ),
                  ),
              ],
            ),
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
      selectedColor: Colors.indigo,
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
                  Colors.indigo,
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
                  Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            'Trung Bình/Đơn',
            currencyFormat.format(summary['avgOrderValue']),
            Icons.trending_up,
            Colors.orange,
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

  Widget _buildOrderCard(VlxdOrder order) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return Card(
      child: ListTile(
        title: Text('Đơn #${order.orderCode}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Khách: ${order.customer.value?.name ?? "N/A"}'),
            Text('Ngày: ${DateFormat('dd/MM/yyyy').format(order.orderDate)}'),
            if (order.isWholesaleContract)
              const Text('Hợp đồng sỉ', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currencyFormat.format(order.totalAmount),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: order.status == OrderStatus.COMPLETED ? Colors.green : Colors.orange,
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
  }
}

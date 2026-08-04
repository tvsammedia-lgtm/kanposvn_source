import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/restaurant_providers.dart';
import '../models/restaurant_order.dart';

class SalesReportScreen extends ConsumerStatefulWidget {
  const SalesReportScreen({super.key});

  @override
  ConsumerState<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends ConsumerState<SalesReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Hôm nay'; // Hôm nay, Tuần này, Tháng này, Tùy chỉnh

  @override
  void initState() {
    super.initState();
    _setTodayFilter();
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

  List<RestaurantOrder> _getFilteredOrders(List<RestaurantOrder> orders) {
    if (_startDate == null || _endDate == null) return orders;

    return orders.where((order) {
      if (order.createdAt == null) return false;
      final orderDate = order.createdAt!;
      return orderDate.isAfter(_startDate!) && orderDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<RestaurantOrder> orders) {
    final completedOrders = orders.where((o) => o.status == RestaurantOrderStatus.COMPLETED).toList();
    
    double totalRevenue = completedOrders.fold(0, (sum, order) => sum + order.totalAmount);
    int orderCount = completedOrders.length;
    double avgOrderValue = orderCount > 0 ? totalRevenue / orderCount : 0;

    // Calculate best selling items
    Map<String, int> itemSales = {};
    Map<String, double> itemRevenue = {};
    
    for (var order in completedOrders) {
      for (var detail in order.details) {
        itemSales[detail.itemName] = (itemSales[detail.itemName] ?? 0) + detail.quantity;
        itemRevenue[detail.itemName] = (itemRevenue[detail.itemName] ?? 0) + (detail.price * detail.quantity);
      }
    }

    final sortedItems = itemSales.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'totalRevenue': totalRevenue,
      'orderCount': orderCount,
      'avgOrderValue': avgOrderValue,
      'bestSellingItems': sortedItems.take(5).toList(),
      'itemRevenue': itemRevenue,
    };
  }

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(restaurantOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Bán Hàng'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(restaurantOrdersProvider.notifier).loadOrders();
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
              // Filter section
              _buildFilterSection(),
              
              // Summary cards
              _buildSummarySection(summary),
              
              // Details section
              Expanded(
                child: _buildDetailsSection(filteredOrders, summary),
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
      selectedColor: Colors.green,
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
                  Colors.green,
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
          _buildSummaryCard(
            'Trung Bình/Đơn',
            currencyFormat.format(summary['avgOrderValue']),
              Icons.trending_up,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Món Bán Chạy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          _buildBestSellingItems(summary['bestSellingItems'], summary['itemRevenue'], currencyFormat),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSellingItems(List<dynamic> items, Map<String, double> itemRevenue, NumberFormat currencyFormat) {
    if (items.isEmpty) {
      return const Text('Chưa có dữ liệu', style: TextStyle(color: Colors.grey));
    }

    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index] as MapEntry<String, int>;
          final itemName = item.key;
          final quantity = item.value;
          final revenue = itemRevenue[itemName] ?? 0;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('x$quantity'),
            trailing: Text(
              currencyFormat.format(revenue),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsSection(List<RestaurantOrder> orders, Map<String, dynamic> summary) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Chi Tiết Đơn Hàng'),
              Tab(text: 'Chi Tiết Món'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildOrdersList(orders),
                _buildItemsDetails(summary['itemRevenue'], summary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<RestaurantOrder> orders) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (orders.isEmpty) {
      return const Center(child: Text('Không có đơn hàng nào trong khoảng thời gian này'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            title: Text('Đơn #${order.orderId.substring(0, 8)}'),
            subtitle: Text(
              '${order.table.value?.name ?? 'N/A'} - ${DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt ?? DateTime.now())}',
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(order.totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: order.status == RestaurantOrderStatus.COMPLETED ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status.label,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...order.details.map((detail) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${detail.itemName} x${detail.quantity}'),
                          Text(currencyFormat.format(detail.price * detail.quantity)),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemsDetails(Map<String, double> itemRevenue, Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (itemRevenue.isEmpty) {
      return const Center(child: Text('Chưa có dữ liệu món'));
    }

    final sortedItems = itemRevenue.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedItems.length,
      itemBuilder: (context, index) {
        final item = sortedItems[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(item.key, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(
              currencyFormat.format(item.value),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
        );
      },
    );
  }
}

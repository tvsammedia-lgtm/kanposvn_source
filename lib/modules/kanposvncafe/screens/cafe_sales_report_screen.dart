import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/cafe_providers.dart';
import '../models/cafe_order.dart';

class CafeSalesReportScreen extends ConsumerStatefulWidget {
  const CafeSalesReportScreen({super.key});

  @override
  ConsumerState<CafeSalesReportScreen> createState() =>
      _CafeSalesReportScreenState();
}

class _CafeSalesReportScreenState extends ConsumerState<CafeSalesReportScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _filterPeriod = 'Hôm nay';

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
      _startDate = DateTime(
        startOfWeek.year,
        startOfWeek.month,
        startOfWeek.day,
      );
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
    final lastDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final initialRange = _startDate != null && _endDate != null
        ? DateTimeRange(
            start: _startDate!,
            end: _endDate!.isAfter(lastDate)
                ? lastDate
                : DateTime(_endDate!.year, _endDate!.month, _endDate!.day),
          )
        : null;

    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: lastDate,
      initialDateRange: initialRange,
    );

    if (picked != null) {
      setState(() {
        _startDate = DateTime(
          picked.start.year,
          picked.start.month,
          picked.start.day,
        );
        _endDate = DateTime(
          picked.end.year,
          picked.end.month,
          picked.end.day,
          23,
          59,
          59,
        );
        _filterPeriod = 'Tùy chỉnh';
      });
    }
  }

  List<CafeOrder> _getFilteredOrders(List<CafeOrder> orders) {
    if (_startDate == null || _endDate == null) return orders;

    return orders.where((order) {
      final orderDate = order.createdAt;
      return orderDate.isAfter(_startDate!) && orderDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<CafeOrder> orders) {
    final paidOrders = orders
        .where((o) => o.status == OrderStatus.daThanhToan)
        .toList();

    double totalRevenue = paidOrders.fold(
      0,
      (sum, order) => sum + order.grandTotal,
    );
    int orderCount = paidOrders.length;
    double avgOrderValue = orderCount > 0 ? totalRevenue / orderCount : 0;

    Map<String, int> itemSales = {};
    Map<String, double> itemRevenue = {};

    // Payment method breakdown
    Map<String, double> paymentRevenue = {};
    Map<String, int> paymentCounts = {};

    for (var order in paidOrders) {
      // items
      for (var item in order.items) {
        itemSales[item.menuItemName] =
            (itemSales[item.menuItemName] ?? 0) + item.quantity;
        itemRevenue[item.menuItemName] =
            (itemRevenue[item.menuItemName] ?? 0) + item.totalPrice;
      }

      // payment method
      final pmLabel = order.paymentMethod.label;
      paymentRevenue[pmLabel] = (paymentRevenue[pmLabel] ?? 0) + order.grandTotal;
      paymentCounts[pmLabel] = (paymentCounts[pmLabel] ?? 0) + 1;
    }

    final sortedItems = itemSales.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'totalRevenue': totalRevenue,
      'orderCount': orderCount,
      'avgOrderValue': avgOrderValue,
      'bestSellingItems': sortedItems.take(5).toList(),
      'itemRevenue': itemRevenue,
      'byPaymentMethod': paymentRevenue,
      'paymentCounts': paymentCounts,
    };
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(cafeOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Bán Hàng Cafe'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(cafeOrdersProvider.notifier).loadOrders();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildFilterSection(),
                    _buildSummarySection(_calculateSummary(orders)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _buildDetailsSection(
                _getFilteredOrders(orders),
                _calculateSummary(orders),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFilterChip(
                'Hôm nay',
                _filterPeriod == 'Hôm nay',
                _setTodayFilter,
              ),
              _buildFilterChip(
                'Tuần này',
                _filterPeriod == 'Tuần này',
                _setWeekFilter,
              ),
              _buildFilterChip(
                'Tháng này',
                _filterPeriod == 'Tháng này',
                _setMonthFilter,
              ),
              _buildFilterChip(
                'Tùy chỉnh',
                _filterPeriod == 'Tùy chỉnh',
                _selectDateRange,
              ),
            ],
          ),
          if (_filterPeriod == 'Tùy chỉnh' &&
              _startDate != null &&
              _endDate != null)
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
      selectedColor: Colors.brown,
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildSummarySection(Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Doanh Thu',
                  currencyFormat.format(summary['totalRevenue']),
                  Icons.attach_money,
                  Colors.brown,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Đơn',
                  '${summary['orderCount']}',
                  Icons.receipt_long,
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
            Colors.amber,
          ),
          const SizedBox(height: 16),
          const Text(
            'Món Bán Chạy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: _buildBestSellingItems(
              summary['bestSellingItems'],
              summary['itemRevenue'],
              currencyFormat,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Doanh thu theo phương thức thanh toán',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildPaymentMethodBreakdown(
            summary['byPaymentMethod'] as Map<String, double>? ?? {},
            summary['paymentCounts'] as Map<String, int>? ?? {},
            currencyFormat,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSellingItems(
    List<dynamic> items,
    Map<String, double> itemRevenue,
    NumberFormat currencyFormat,
  ) {
    if (items.isEmpty) {
      return const Text(
        'Chưa có dữ liệu',
        style: TextStyle(color: Colors.grey),
      );
    }

    return Card(
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index] as MapEntry<String, int>;
          final itemName = item.key;
          final quantity = item.value;
          final revenue = itemRevenue[itemName] ?? 0;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              itemName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('x$quantity'),
            trailing: Text(
              currencyFormat.format(revenue),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentMethodBreakdown(
   Map<String, double> paymentRevenue,
   Map<String, int> paymentCounts,
   NumberFormat currencyFormat,
  ) {
   if (paymentRevenue.isEmpty) {
     return const Text(
       'Chưa có dữ liệu thanh toán',
       style: TextStyle(color: Colors.grey),
     );
   }

   // create sorted list by revenue desc
   final entries = paymentRevenue.entries.toList()
     ..sort((a, b) => b.value.compareTo(a.value));

   return Card(
     child: ListView.separated(
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
       itemCount: entries.length,
       separatorBuilder: (_, __) => const Divider(height: 1),
       itemBuilder: (context, index) {
         final e = entries[index];
         final label = e.key;
         final amount = e.value;
         final count = paymentCounts[label] ?? 0;
         return ListTile(
           title: Text(label),
           subtitle: Text('$count đơn'),
           trailing: Text(
             currencyFormat.format(amount),
             style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
           ),
         );
       },
     ),
   );
  }

  Widget _buildDetailsSection(
    List<CafeOrder> orders,
    Map<String, dynamic> summary,
  ) {
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

  Widget _buildOrdersList(List<CafeOrder> orders) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (orders.isEmpty) {
      return const Center(
        child: Text('Không có đơn hàng nào trong khoảng thời gian này'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            title: Text('Đơn #${order.orderCode}'),
            subtitle: Text(
              '${order.tableName ?? 'N/A'} - ${DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt)}',
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(order.grandTotal),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: order.status == OrderStatus.daThanhToan
                        ? Colors.green
                        : Colors.orange,
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
                    ...order.items.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item.menuItemName} x${item.quantity}'),
                            Text(currencyFormat.format(item.totalPrice)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemsDetails(
    Map<String, double> itemRevenue,
    Map<String, dynamic> summary,
  ) {
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
              backgroundColor: Colors.orange,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              item.key,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              currencyFormat.format(item.value),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/bida_providers.dart';
import '../models/bida_session.dart';

class BidaSalesReportScreen extends ConsumerStatefulWidget {
  const BidaSalesReportScreen({super.key});

  @override
  ConsumerState<BidaSalesReportScreen> createState() => _BidaSalesReportScreenState();
}

class _BidaSalesReportScreenState extends ConsumerState<BidaSalesReportScreen> {
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

  List<BidaSession> _getFilteredSessions(List<BidaSession> sessions) {
    if (_startDate == null || _endDate == null) return sessions;

    return sessions.where((session) {
      if (session.startTime == null) return false;
      final sessionDate = session.startTime!;
      return sessionDate.isAfter(_startDate!) && sessionDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<BidaSession> sessions) {
    final paidSessions = sessions.where((s) => s.status == BidaSessionStatus.PAID).toList();
    
    double totalRevenue = paidSessions.fold(0, (sum, session) => sum + session.grandTotal);
    double totalTableRevenue = paidSessions.fold(0, (sum, session) => sum + session.totalTimeCost);
    double totalItemRevenue = paidSessions.fold(0, (sum, session) => sum + session.totalItemCost);
    int sessionCount = paidSessions.length;
    double avgSessionValue = sessionCount > 0 ? totalRevenue / sessionCount : 0;

    Map<String, int> itemSales = {};
    Map<String, double> itemRevenue = {};
    
    for (var session in paidSessions) {
      for (var line in session.orderLines) {
        itemSales[line.itemName] = (itemSales[line.itemName] ?? 0) + line.quantity;
        itemRevenue[line.itemName] = (itemRevenue[line.itemName] ?? 0) + line.total;
      }
    }

    final sortedItems = itemSales.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'totalRevenue': totalRevenue,
      'totalTableRevenue': totalTableRevenue,
      'totalItemRevenue': totalItemRevenue,
      'sessionCount': sessionCount,
      'avgSessionValue': avgSessionValue,
      'bestSellingItems': sortedItems.take(5).toList(),
      'itemRevenue': itemRevenue,
    };
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(bidaSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Bán Hàng Bida'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(bidaSessionsProvider.notifier).loadSessions();
            },
          ),
        ],
      ),
      body: sessionsAsync.when(
        data: (sessions) {
          final filteredSessions = _getFilteredSessions(sessions);
          final summary = _calculateSummary(filteredSessions);

          return Column(
            children: [
              _buildFilterSection(),
              _buildSummarySection(summary),
              Expanded(
                child: _buildDetailsSection(filteredSessions, summary),
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
      selectedColor: Colors.cyan,
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
                  Colors.cyan,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Buổi',
                  '${summary['sessionCount']}',
                  Icons.sports_bar,
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
                  'Tiền Bàn',
                  currencyFormat.format(summary['totalTableRevenue']),
                  Icons.table_bar,
                  Colors.indigo,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Tiền Đồ',
                  currencyFormat.format(summary['totalItemRevenue']),
                  Icons.restaurant,
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            'Trung Bình/Buổi',
            currencyFormat.format(summary['avgSessionValue']),
            Icons.trending_up,
            Colors.purple,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Đồ Bán Chạy',
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
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
              backgroundColor: Colors.cyan,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('x$quantity'),
            trailing: Text(
              currencyFormat.format(revenue),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsSection(List<BidaSession> sessions, Map<String, dynamic> summary) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Chi Tiết Buổi'),
              Tab(text: 'Chi Tiết Đồ'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildSessionsList(sessions),
                _buildItemsDetails(summary['itemRevenue'], summary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionsList(List<BidaSession> sessions) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (sessions.isEmpty) {
      return const Center(child: Text('Không có buổi nào trong khoảng thời gian này'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text('Buổi #${session.sessionId.substring(0, 8)}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bàn: ${session.table.value?.name ?? "N/A"}'),
                if (session.startTime != null)
                  Text('Bắt đầu: ${DateFormat('dd/MM/yyyy HH:mm').format(session.startTime!)}'),
                if (session.endTime != null)
                  Text('Kết thúc: ${DateFormat('dd/MM/yyyy HH:mm').format(session.endTime!)}'),
                Text('Tiền bàn: ${currencyFormat.format(session.totalTimeCost)}'),
                Text('Tiền đồ: ${currencyFormat.format(session.totalItemCost)}'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(session.grandTotal),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: session.status == BidaSessionStatus.PAID ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    session.status.label,
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

  Widget _buildItemsDetails(Map<String, double> itemRevenue, Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (itemRevenue.isEmpty) {
      return const Center(child: Text('Chưa có dữ liệu đồ'));
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
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(item.key, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(
              currencyFormat.format(item.value),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan),
            ),
          ),
        );
      },
    );
  }
}

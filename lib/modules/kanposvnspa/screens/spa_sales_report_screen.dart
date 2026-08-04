import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/spa_providers.dart';
import '../models/spa_session.dart';

class SpaSalesReportScreen extends ConsumerStatefulWidget {
  const SpaSalesReportScreen({super.key});

  @override
  ConsumerState<SpaSalesReportScreen> createState() => _SpaSalesReportScreenState();
}

class _SpaSalesReportScreenState extends ConsumerState<SpaSalesReportScreen> {
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

  List<SpaSession> _getFilteredSessions(List<SpaSession> sessions) {
    if (_startDate == null || _endDate == null) return sessions;

    return sessions.where((session) {
      if (session.startTime == null) return false;
      final sessionDate = session.startTime!;
      return sessionDate.isAfter(_startDate!) && sessionDate.isBefore(_endDate!);
    }).toList();
  }

  Map<String, dynamic> _calculateSummary(List<SpaSession> sessions) {
    final completedSessions = sessions.where((s) => s.status == SpaSessionStatus.COMPLETED).toList();
    
    double totalRevenue = completedSessions.fold(0, (sum, session) => sum + session.totalAmount);
    int sessionCount = completedSessions.length;
    double avgSessionValue = sessionCount > 0 ? totalRevenue / sessionCount : 0;

    Map<String, int> serviceSales = {};
    Map<String, double> serviceRevenue = {};
    
    for (var session in completedSessions) {
      if (session.service.value != null) {
        final serviceName = session.service.value!.name;
        serviceSales[serviceName] = (serviceSales[serviceName] ?? 0) + 1;
        serviceRevenue[serviceName] = (serviceRevenue[serviceName] ?? 0) + session.totalAmount;
      }
    }

    final sortedServices = serviceSales.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'totalRevenue': totalRevenue,
      'sessionCount': sessionCount,
      'avgSessionValue': avgSessionValue,
      'bestSellingServices': sortedServices.take(5).toList(),
      'serviceRevenue': serviceRevenue,
    };
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(spaSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo Cáo Bán Hàng Spa'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(spaSessionsProvider.notifier).loadSessions();
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
      selectedColor: Colors.purple,
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
                  Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Số Buổi',
                  '${summary['sessionCount']}',
                  Icons.spa,
                  Colors.pink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            'Trung Bình/Buổi',
            currencyFormat.format(summary['avgSessionValue']),
            Icons.trending_up,
            Colors.indigo,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dịch Vụ Phổ Biến',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          _buildBestSellingServices(summary['bestSellingServices'], summary['serviceRevenue'], currencyFormat),
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

  Widget _buildBestSellingServices(List<dynamic> services, Map<String, double> serviceRevenue, NumberFormat currencyFormat) {
    if (services.isEmpty) {
      return const Text('Chưa có dữ liệu', style: TextStyle(color: Colors.grey));
    }

    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final service = services[index] as MapEntry<String, int>;
          final serviceName = service.key;
          final count = service.value;
          final revenue = serviceRevenue[serviceName] ?? 0;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(serviceName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$count buổi'),
            trailing: Text(
              currencyFormat.format(revenue),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsSection(List<SpaSession> sessions, Map<String, dynamic> summary) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Chi Tiết Buổi'),
              Tab(text: 'Chi Tiết Dịch Vụ'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildSessionsList(sessions),
                _buildServicesDetails(summary['serviceRevenue'], summary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionsList(List<SpaSession> sessions) {
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
                Text('Giường: ${session.bed.value?.name ?? 'N/A'}'),
                Text('Dịch vụ: ${session.service.value?.name ?? 'N/A'}'),
                Text('KTV: ${session.technician.value?.name ?? 'N/A'}'),
                if (session.startTime != null)
                  Text('Bắt đầu: ${DateFormat('dd/MM/yyyy HH:mm').format(session.startTime!)}'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyFormat.format(session.totalAmount),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: session.status == SpaSessionStatus.COMPLETED ? Colors.green : Colors.orange,
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

  Widget _buildServicesDetails(Map<String, double> serviceRevenue, Map<String, dynamic> summary) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    if (serviceRevenue.isEmpty) {
      return const Center(child: Text('Chưa có dữ liệu dịch vụ'));
    }

    final sortedServices = serviceRevenue.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedServices.length,
      itemBuilder: (context, index) {
        final service = sortedServices[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(service.key, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(
              currencyFormat.format(service.value),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
          ),
        );
      },
    );
  }
}
